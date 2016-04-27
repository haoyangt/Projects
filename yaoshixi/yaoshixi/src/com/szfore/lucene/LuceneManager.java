package com.szfore.lucene;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.szfore.model.CompanyInfo;
import com.szfore.model.Job;
import com.szfore.utils.PropertyUtils;

public class LuceneManager {

	private static PaodingAnalyzer analyzer = null;
	
	private static final String BASE_LUCENE_PATH = PropertyUtils.getProperty("lucene_index_dir");
	private static final String INDEX_JOB_FILE = BASE_LUCENE_PATH+"indexJobFile";
	private static final String INDEX_COMPANY_FILE = BASE_LUCENE_PATH + "indexCompanyFile";
	
	private String[] fields = null;
	
	private static LuceneManager instance = null;
	
	public LuceneManager() {}
	
	public static LuceneManager getInstance() {
		if(instance == null) {
			synchronized (LuceneManager.class) {
				instance = new LuceneManager();
				init();
			}
		}
		return instance;
	}
	
	private static  void init() {
		File jobIndexDir = new File(INDEX_JOB_FILE);
		File companyIndexDir = new File(INDEX_COMPANY_FILE);
		if(!jobIndexDir.exists()) {
			jobIndexDir.mkdirs();
		}
		if(!companyIndexDir.exists()) {
			companyIndexDir.mkdirs();
		}
		analyzer = new PaodingAnalyzer(); 
	}
	
	
	public void createIndex(Object obj) {
		String indexFile = getIndexFile(obj);
		Directory directory = null;
		IndexWriter indexWriter = null;
		try {
			directory = FSDirectory.open(new File(indexFile));
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_40, analyzer);
			indexWriter = new IndexWriter(directory, config);
			Document doc = getDocument(obj);
			indexWriter.addDocument(doc);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				indexWriter.close();
				directory.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	private String getIndexFile(Object obj) {
		String indexFile = "";
		if(obj instanceof Job) {
			indexFile = INDEX_JOB_FILE;
			fields = new String[]{"id","jobName","jobDesc","jobRequest","city"};
		} else if(obj instanceof CompanyInfo) {
			indexFile = INDEX_COMPANY_FILE;
			fields = new String[]{"id","city","field","nature","scale"};
		}
		return indexFile;
	}
	
	public List<Integer> indexSearch(Object obj,String keyword) {
		String indexFile = getIndexFile(obj);
		Set<Integer> ids = null;
		List<Integer> list = null;
		Directory directory = null;
		DirectoryReader iReader = null;
		try {
			directory = FSDirectory.open(new File(indexFile));
		    iReader = DirectoryReader.open(directory);
			IndexSearcher iSearcher = new IndexSearcher(iReader);
		//多域查询
			MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_40, fields, analyzer); 
		//单域查询
		//	QueryParser parser = new QueryParser(Version.LUCENE_40,"jobDesc", analyzer); 
			System.out.println("keyword:"+keyword);
			Query query = parser.parse(keyword);
			ScoreDoc[] hits = iSearcher.search(query, null, 1000).scoreDocs;
			if(hits.length > 0) {
				ids = new HashSet<Integer>();
			}
			for(int i=0; i<hits.length; i++) {
				Document hitDoc = iSearcher.doc(hits[i].doc);
				ids.add(Integer.parseInt(hitDoc.get("id")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				iReader.close();
				directory.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("ids:"+ids);
		if(ids != null) {
			list = new ArrayList<Integer>();
			list.addAll(ids);
		}
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	private Document getDocument(Object obj) {
		Document doc = new Document();
		Class clazz = obj.getClass();
		try {
			for (int i = 0; i < fields.length; i++) {
				String name = fields[i];
				java.lang.reflect.Field _field = clazz.getDeclaredField(name);
				_field.setAccessible(true);
				String value = _field.get(obj) == null ? "":_field.get(obj).toString();
				Field field = new Field(name, value, TextField.TYPE_STORED);
				doc.add(field);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return doc;
	} 
	
	public static void main(String[] args) {
		
	}
}
