package com.szfore.cache;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szfore.mapper.JobMapper;
import com.szfore.plugin.Page;

/**
 * 缓存管理器
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 10, 2013
 */
@Service
public class CacheManager {

	@Autowired
	private JobMapper jobMapper;
	
	@RedisCache
	public void doJob() {
		System.out.println("************************Redis*****COME*****************");
		Page<Map<String,Object>> page = new Page<Map<String,Object>>();
		page.setNumPerPage(1000);
		List<Map<String,Object>> list = jobMapper.findAllJobs("", page);
		RedisManager.getInstance().cacheJobs(list,page);
		
	/*	List<CompanyInfo> companys = companyMapper.searchCompany(null, new Page());
		for(int i=0; i<companys.size(); i++) {
			LuceneManager.getInstance().createIndex(companys.get(i));
		}*/
	}
	
}
