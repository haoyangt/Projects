package com.szfore.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.tidy.Configuration;
import org.w3c.tidy.Tidy;

import com.szfore.cache.CacheManager;
import com.szfore.lucene.LuceneManager;
import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.SearchKeywordMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.Job;
import com.szfore.model.SearchKeyword;
import com.szfore.model.UserBasicInfo;
import com.szfore.plugin.Page;
/**
 * 职位相关的service
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 2, 2013
 */
@Service
@Transactional(propagation=Propagation.REQUIRED)
public class JobService {

	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private UserJobMapper userJobMapper;
	@Autowired
	private SearchKeywordMapper searchKeywordMapper;
	@Autowired
	CacheManager cacheManager;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	/**
	 * 
	 * @param keyword
	 *     若keyword传空，相当于查找所有的实习职位。 
	 * @param page
	 * @return
	 */
	//@RedisCache(name="searhJobsByKeyword")
	public List<Map<String,Object>> searhJobsByKeyword(String keyword,Page<Map<String,Object>> page) {
		List<Integer> ids = saveKeyword(keyword);
		if(keyword != null && !keyword.equals("") && ids == null) {
			return new ArrayList<Map<String,Object>>();
		}
		StringBuffer sb = new StringBuffer();
		if(ids != null && !ids.isEmpty()) {
			for(int i=0; i<ids.size(); i++) {
				sb.append(ids.get(i));
				if(i != ids.size()-1)
					sb.append(",");
			}
		}
		return jobMapper.findAllJobs(sb.toString(), page);
	}
	
	
	public Page<Map<String,Object>> searhJobsByKeyword(Integer userId,String keyword,Page<Map<String,Object>> page) {
		List<Integer> ids = saveKeyword(keyword);
		if(keyword != null && !keyword.equals("") && ids == null) {
			return new Page<Map<String,Object>>();
		}
		StringBuffer sb = new StringBuffer();
		if(ids != null && !ids.isEmpty()) {
			
			for(int i=0; i<ids.size(); i++) {
				sb.append(ids.get(i));
				if(i != ids.size()-1)
					sb.append(",");
			}
			
		}
		System.out.println("sb===="+sb.toString());
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<Map<String,Object>> jobs = jobMapper.findAllJobs(sb.toString(), page);
		System.out.println("jobs.size()==="+jobs.size());
		CompanyInfo companyInfos = new CompanyInfo();
		for(int n=0;n<jobs.size();n++){
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put(new String("id"), jobs.get(n).get("id"));
			map2.put(new String("jobName"), jobs.get(n).get("jobName"));
			System.out.println("jobName===="+jobs.get(n).get("jobName"));
			map2.put(new String("payment"), jobs.get(n).get("payment"));
			map2.put(new String("publishTime"), jobs.get(n).get("publishTime"));
			map2.put(new String("educationalReq"), jobs.get(n).get("educationalReq"));
			map2.put(new String("temptation"), jobs.get(n).get("temptation"));
			map2.put(new String("city"), jobs.get(n).get("city"));
			map2.put(new String("employ"), jobs.get(n).get("employ"));
			map2.put(new String("area"), jobs.get(n).get("area"));
			map2.put(new String("workTime"), jobs.get(n).get("workTime"));
			int num = userJobMapper.getUserJobNumBy(userId, Integer.valueOf(jobs.get(n).get("id").toString()));
			map2.put(new String("status"), num);
			companyInfos = companyMapper.getCompanyInfoByCompanyId(Integer.valueOf(jobs.get(n).get("companyId").toString()));
			map2.put(new String("companyId"), companyInfos.getId());      
			map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
			map2.put(new String("field"), companyInfos.getFiledes());
			map2.put(new String("growthStage"), companyInfos.getGrowthStage());
			map2.put(new String("scale"), companyInfos.getScale());
			map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
			list.add(map2);
		}
		
		page.setResults(jobs);
		return page;
	}
	private List<Integer> saveKeyword(String keyword) {
		List<Integer> ids = null;
		if(keyword == null || keyword.equals("")) {
			return ids;
		}
		SearchKeyword searchKeyword = searchKeywordMapper.findKeyword(keyword);
		if(searchKeyword == null) {
			searchKeywordMapper.insertKeyword(keyword);
		} else {
			searchKeywordMapper.updateKeywordCount(searchKeyword.getkId());
		}
		ids = LuceneManager.getInstance().indexSearch(new Job(), genKeyword(keyword));
		return ids;
	}
	
	private String genKeyword(String keyword) {
		String[] keywords = keyword.split("#");
		if(keywords.length<=1) {
			return keyword;
		}
		String key1 = keywords[0];
		String keyCity = keywords[1];
		StringBuffer sb = new StringBuffer();
		if(!"".equals(key1.trim())) {
			sb.append("(");
			sb.append("jobName:"+key1);
			sb.append(" OR nature:"+key1);
			sb.append(" OR city:"+key1);
			sb.append(" OR scale:"+key1);
			sb.append(")");
			
			if(keywords.length>=2) {
				sb.append(" AND city:"+keyCity);
			}
		} else {
			return keyCity;
		}
		
		System.out.println("keyword:"+sb.toString());
		return sb.toString();
		
	}
	
	/**
	 * 根据工作id查询工作信息
	 * @param jobId
	 * @return
	 */
//	@RedisCache(name="findJobDetailById")
	public Map<String,Object> findJobDetailById(int jobId) {
		return jobMapper.findJobsById(jobId);
	}
	
	public void saveJob(Job job) {
		jobMapper.save(job);
		/*LuceneManager.getInstance().createIndex(job);
		cacheManager.doJob();*/
	}
	
	public List<Job> findJobByCId(Integer companyId,Integer id){
		List<Job> jobs = jobMapper.findJobByCid(companyId, id) ;
		return jobs;
	}
	/**
	 * excel导入添加工作信息
	 * @param job
	 */
	public void saveExcel(Job job) {
		jobMapper.saveExcel(job);
		LuceneManager.getInstance().createIndex(job);
		cacheManager.doJob();
	}
	public void modifyJob(Job job) {
		jobMapper.modify(job);
		//LuceneManager.getInstance().createIndex(job);
		//cacheManager.doJob();
	}
	/**
	 * 首页的加载和职位各种条件的搜索
	 * @param userId
	 * @param jobName 职位名称
	 * @param city 城市
	 * @param xueli 学历
	 * @param jobCategory 工作性质
	 * @param releaseTime 发布时间
	 * @param scope  薪资
	 * @param page
	 * @return
	 */
	public Page<Map<String,Object>> searhJobsByTerm(Integer userId,String jobName,String xueli,
			String jobCategory,String releaseTime,String scope,String jobAttrValue,
			String jobAreaValue,Page<Map<String,Object>> page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		if((jobName != "" && jobName != null) || (xueli != "" && xueli != null) || 
			(jobCategory!= "" && jobCategory != null) || (releaseTime!= "" && releaseTime != null) || 
			(scope!= "" && scope !=null) || (jobAttrValue!= "" && jobAttrValue !=null) || 
			(jobAreaValue!= "" && jobAreaValue !=null) ) {
				StringBuffer attrValue = new StringBuffer();
				if(!"".equals(jobAttrValue) & jobAttrValue != null & !"null".equals(jobAttrValue)) {
					if(jobAttrValue.indexOf(",") != 1){
						String[] jobAttrStringArray = jobAttrValue.split(",");
						for (int i = 0; i < jobAttrStringArray.length; i++) {
							attrValue.append("'");
							attrValue.append(jobAttrStringArray[i]);
							attrValue.append("'");
							if(i != jobAttrStringArray.length-1){
								attrValue.append(",");
							}
						}
					}else{
						attrValue.append(jobAttrValue);
					}
				}
				StringBuffer areaValue =new StringBuffer();
				if(!"".equals(jobAreaValue) & jobAreaValue != null & !"null".equals(jobAreaValue)) {
					if(jobAreaValue.indexOf(",") != -1){
						String[] jobAreaStringArray = jobAreaValue.split(",");
						for (int i = 0; i < jobAreaStringArray.length; i++) {
							areaValue.append("'");
							areaValue.append(jobAreaStringArray[i]);
							areaValue.append("'");
							if(i != jobAreaStringArray.length-1){
								areaValue.append(",");
							}
						}
					}else{
						areaValue.append(jobAreaValue);
					}
				}
			/*System.out.println("attrValue======"+attrValue.toString());
			System.out.println("areaValue======"+areaValue.toString());	*/
			List<Job> jobs = jobMapper.getJobByTerm(jobName,xueli,jobCategory,releaseTime,scope, attrValue.toString(), areaValue.toString(), page);
			CompanyInfo companyInfos = new CompanyInfo();
			for(int n=0;n<jobs.size();n++){
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put(new String("id"), jobs.get(n).getId());
				map2.put(new String("jobName"), jobs.get(n).getJobName());
				map2.put(new String("payment"), jobs.get(n).getPayment());
				map2.put(new String("publishTime"), jobs.get(n).getPublishTime());
				map2.put(new String("educationalReq"), jobs.get(n).getEducationalReq());
				map2.put(new String("temptation"), jobs.get(n).getTemptation());
				map2.put(new String("city"), jobs.get(n).getCity());
				map2.put(new String("employ"), jobs.get(n).getEmploy());
				map2.put(new String("area"), jobs.get(n).getArea());
				map2.put(new String("workTime"), jobs.get(n).getWorkTime());
				int num = userJobMapper.getUserJobNumBy(userId, jobs.get(n).getId());
				map2.put(new String("status"), num);
				companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(n).getCompanyId());
				map2.put(new String("companyId"), companyInfos.getId());      
				map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
				map2.put(new String("field"), companyInfos.getFiledes());
				map2.put(new String("growthStage"), companyInfos.getGrowthStage());
				map2.put(new String("scale"), companyInfos.getScale());
				map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
				list.add(map2);
			}
		}else{
			List<CompanyInfo> infos = companyMapper.findAll(page);
			for (int i=0;i<infos.size();i++) {
				List<Job> jobList = jobMapper.getJobByCid(infos.get(i).getId());
				if(jobList.size()>0){
					Map<String, Object> map1 = new HashMap<String, Object>();
					for(int j=0;j<jobList.size();j++){
						if(j==0){
							map1.put(new String("id"), jobList.get(j).getId());
							map1.put(new String("jobName"), jobList.get(j).getJobName());
							map1.put(new String("payment"), jobList.get(j).getPayment());
							map1.put(new String("publishTime"), jobList.get(j).getPublishTime());
							map1.put(new String("educationalReq"), jobList.get(j).getEducationalReq());
							map1.put(new String("temptation"), jobList.get(j).getTemptation());
							map1.put(new String("city"), jobList.get(j).getCity());
							map1.put(new String("employ"), jobList.get(j).getEmploy());
							map1.put(new String("area"), jobList.get(j).getArea());
							map1.put(new String("workTime"), jobList.get(j).getWorkTime());
							int num = userJobMapper.getUserJobNumBy(userId, jobList.get(0).getId());
							map1.put(new String("status"), num);
						}else{
							map1.put(new String("id"+j), jobList.get(j).getId());
							map1.put(new String("jobName"+j), jobList.get(j).getJobName());
							map1.put(new String("payment"+j), jobList.get(j).getPayment());
							map1.put(new String("publishTime"+j), jobList.get(j).getPublishTime());
							map1.put(new String("educationalReq"+j), jobList.get(j).getEducationalReq());
							map1.put(new String("temptation"+j), jobList.get(j).getTemptation());
							map1.put(new String("city"+j), jobList.get(j).getCity());
							map1.put(new String("employ"+j), jobList.get(j).getEmploy());
							map1.put(new String("area"+j), jobList.get(j).getArea());
							map1.put(new String("workTime"+j), jobList.get(j).getWorkTime());
							int num = userJobMapper.getUserJobNumBy(userId, jobList.get(j).getId());
							map1.put(new String("status"+j), num);
						}
					}
					/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(infos.get(i).getId());
					StringBuffer tags = new StringBuffer();
					for(int t=0;t<tagCompanies.size();t++){
						tags.append(tagCompanies.get(t).getTagName());
						if(t<tagCompanies.size()-1){
							tags.append(",");
						}
					}
					map1.put(new String("tags"), tags);*/
					map1.put(new String("companyId"), infos.get(i).getId());      
					map1.put(new String("companyShortName"), infos.get(i).getCompanyShortName());
					map1.put(new String("field"), infos.get(i).getFiledes());
					map1.put(new String("growthStage"), infos.get(i).getGrowthStage());
					map1.put(new String("scale"), infos.get(i).getScale());
					map1.put(new String("companyLogo"), infos.get(i).getCompanyLogo());
					map1.put(new String("famous"), infos.get(i).getFamous());
					list.add(map1);
				}
			}
		}
		page.setResults(list);
		return page;
	}
	/**
	 * <p>首页只显示三个公司的招聘信息<br/>
	 * @title searhJobSan<br/>
	 * @date 2014-5-26 下午6:12:32<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param page
	 * @param userId
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" }) 
	public Page searhJobSan(Integer userId,Page page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<CompanyInfo> infos = companyMapper.findAllSan();
		for (int i=0;i<infos.size();i++) {
			List<Job> jobList = jobMapper.getJobByCid(infos.get(i).getId());
			if(jobList.size()>0){
				Map<String, Object> map1 = new HashMap<String, Object>();
				for(int j=0;j<jobList.size();j++){
					if(j==0){
						map1.put(new String("id"), jobList.get(j).getId());
						map1.put(new String("jobName"), jobList.get(j).getJobName());
						map1.put(new String("payment"), jobList.get(j).getPayment());
						map1.put(new String("publishTime"), jobList.get(j).getPublishTime());
						map1.put(new String("educationalReq"), jobList.get(j).getEducationalReq());
						map1.put(new String("temptation"), jobList.get(j).getTemptation());
						map1.put(new String("city"), jobList.get(j).getCity());
						map1.put(new String("employ"), jobList.get(j).getEmploy());
						map1.put(new String("area"), jobList.get(j).getArea());
						map1.put(new String("workTime"), jobList.get(j).getWorkTime());
						int num = userJobMapper.getUserJobNumBy(userId, jobList.get(0).getId());
						map1.put(new String("status"), num);
					}else{
						map1.put(new String("id"+j), jobList.get(j).getId());
						map1.put(new String("jobName"+j), jobList.get(j).getJobName());
						map1.put(new String("payment"+j), jobList.get(j).getPayment());
						map1.put(new String("publishTime"+j), jobList.get(j).getPublishTime());
						map1.put(new String("educationalReq"+j), jobList.get(j).getEducationalReq());
						map1.put(new String("temptation"+j), jobList.get(j).getTemptation());
						map1.put(new String("city"+j), jobList.get(j).getCity());
						map1.put(new String("employ"+j), jobList.get(j).getEmploy());
						map1.put(new String("area"+j), jobList.get(j).getArea());
						map1.put(new String("workTime"+j), jobList.get(j).getWorkTime());
						int num = userJobMapper.getUserJobNumBy(userId, jobList.get(j).getId());
						map1.put(new String("status"+j), num);
					}
				}
				/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(infos.get(i).getId());
				StringBuffer tags = new StringBuffer();
				for(int t=0;t<tagCompanies.size();t++){
					tags.append(tagCompanies.get(t).getTagName());
					if(t<tagCompanies.size()-1){
						tags.append(",");
					}
				}
				map1.put(new String("tags"), tags);*/
				map1.put(new String("companyId"), infos.get(i).getId());      
				map1.put(new String("companyShortName"), infos.get(i).getCompanyShortName());
				map1.put(new String("filedes"), infos.get(i).getFiledes());
				map1.put(new String("growthStage"), infos.get(i).getGrowthStage());
				map1.put(new String("scale"), infos.get(i).getScale());
				map1.put(new String("companyLogo"), infos.get(i).getCompanyLogo());
				map1.put(new String("famous"), infos.get(i).getFamous());
				list.add(map1);
			}
		}
	page.setResults(list);
	return page;
	}
	
	public List<Map<String,Object>> hotJobsSan(Integer userId){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<Job> jobs = jobMapper.findHotJobsSan(userId);
		CompanyInfo companyInfos = new CompanyInfo();
		for(int i=0;i<jobs.size();i++){
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put(new String("id"), jobs.get(i).getId());
			map2.put(new String("jobName"), jobs.get(i).getJobName());
			map2.put(new String("payment"), jobs.get(i).getPayment());
			map2.put(new String("publishTime"), jobs.get(i).getPublishTime());
			map2.put(new String("educationalReq"), jobs.get(i).getEducationalReq());
			map2.put(new String("temptation"), jobs.get(i).getTemptation());
			map2.put(new String("city"), jobs.get(i).getCity());
			map2.put(new String("area"), jobs.get(i).getArea());
			map2.put(new String("employ"), jobs.get(i).getEmploy());
			map2.put(new String("workTime"), jobs.get(i).getWorkTime());
			int num = userJobMapper.getUserJobNumBy(userId, jobs.get(i).getId());
			map2.put(new String("status"), num);
			companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(i).getCompanyId());
			/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
			StringBuffer tags = new StringBuffer();
			for(int t=0;t<tagCompanies.size();t++){
				tags.append(tagCompanies.get(t).getTagName());
				if(t<tagCompanies.size()-1){
					tags.append(",");
				}
			}
			map2.put(new String("tags"), tags);*/
			map2.put(new String("companyId"), companyInfos.getId());      
			map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
			map2.put(new String("filedes"), companyInfos.getFiledes());
			map2.put(new String("growthStage"), companyInfos.getGrowthStage());
			map2.put(new String("scale"), companyInfos.getScale());
			map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
			list.add(map2);
		}
		return list;
	}
	
	
	public List<Map<String,Object>> hotJobs(Integer userId,Page<Map<String,Object>> page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<Job> jobs = jobMapper.findHotJobs(userId,page);
		CompanyInfo companyInfos = new CompanyInfo();
		for(int i=0;i<jobs.size();i++){
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put(new String("id"), jobs.get(i).getId());
			map2.put(new String("jobName"), jobs.get(i).getJobName());
			map2.put(new String("payment"), jobs.get(i).getPayment());
			map2.put(new String("publishTime"), jobs.get(i).getPublishTime());
			map2.put(new String("educationalReq"), jobs.get(i).getEducationalReq());
			map2.put(new String("temptation"), jobs.get(i).getTemptation());
			map2.put(new String("city"), jobs.get(i).getCity());
			map2.put(new String("area"), jobs.get(i).getArea());
			map2.put(new String("employ"), jobs.get(i).getEmploy());
			map2.put(new String("workTime"), jobs.get(i).getWorkTime());
			int num = userJobMapper.getUserJobNumBy(userId, jobs.get(i).getId());
			map2.put(new String("status"), num);
			companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(i).getCompanyId());
			/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
			StringBuffer tags = new StringBuffer();
			for(int t=0;t<tagCompanies.size();t++){
				tags.append(tagCompanies.get(t).getTagName());
				if(t<tagCompanies.size()-1){
					tags.append(",");
				}
			}
			map2.put(new String("tags"), tags);*/
			map2.put(new String("companyId"), companyInfos.getId());      
			map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
			map2.put(new String("filedes"), companyInfos.getFiledes());
			map2.put(new String("growthStage"), companyInfos.getGrowthStage());
			map2.put(new String("scale"), companyInfos.getScale());
			map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
			list.add(map2);
		}
		return list;
	}
	
	public List <Map <String,Object>> hotJobsSanPhone(Integer userId){
		List <Map <String,Object>> jobList = jobMapper.findHotJobsSanPhone(userId);
		return jobList;
	}
	
	public List <Map <String,Object>> allJobsSanPhone(Integer userId){
		List <Map <String,Object>> jobList = jobMapper.findAllJobsSanPhone(userId);
		return jobList;
	}
	public List <Map <String,Object>> allJobsPhone(Integer userId,Integer num,String CjName,
			String city,
			String xueli,
			String jobCategory,
			String releaseTime,
			String scope){
		List <Map <String,Object>> jobList = jobMapper.findAllJobsPhone(userId,num,CjName,city,xueli,jobCategory,releaseTime,scope);
		return jobList;
	}
	public List <Map <String,Object>> hotJobsPhone(Integer userId,Integer num,String CjName,
			String city,
			String xueli,
			String jobCategory,
			String releaseTime,
			String scope){
		List <Map <String,Object>> jobList = jobMapper.findhotJobsPhone(userId,num,CjName,city,xueli,jobCategory,releaseTime,scope);
		return jobList;
	}
	/**
	 * wlq新增
	 * 首页的加载和职位各种条件的搜索
	 * @param userId
	 * @param jobName 职位名称
	 * @param city 城市
	 * @param area 区域
	 * @param xueli 学历
	 * @param jobCategory 工作性质
	 * @param releaseTime 发布时间
	 * @param scope  薪资
	 * @param page
	 * @return
	 */
	public Page<Map<String,Object>> searhJobsByLoctionForWx(Integer userId,
			String jobName,String city,String area,String xueli,
			String jobCategory,String releaseTime,String scope,
			String jobAttrValue,Page<Map<String,Object>> page) {
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		if((!"".equals(jobName) && jobName != null) || (!"".equals(city) && city != null) || 
				(!"".equals(area) && area != null) || (!"".equals(xueli) && xueli != null) || 
				(!"".equals(jobCategory) && jobCategory != null) || (!"".equals(releaseTime) && releaseTime != null) || 
				(!"".equals(scope) && scope !=null) || (!"".equals(jobAttrValue) && jobAttrValue !=null)) {
			
			ArrayList<String> jobAttrList = null;
			if(!"".equals(jobAttrValue) && jobAttrValue != null) {
				jobAttrList = new ArrayList<String>();
				String[] jobAttrStringArray = jobAttrValue.split(",");
				for (int i = 0; i < jobAttrStringArray.length; i++) {
					jobAttrList.add(jobAttrStringArray[i]);
				}
			}
			List<Job> jobs=jobMapper.getJobByLocationForWx(jobName, city, area, xueli, jobCategory, releaseTime, scope, jobAttrList, page);
			CompanyInfo companyInfos = new CompanyInfo();
			for(int n=0;n<jobs.size();n++){
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put(new String("id"), jobs.get(n).getId());
				map2.put(new String("jobName"), jobs.get(n).getJobName());
				map2.put(new String("payment"), jobs.get(n).getPayment());
				map2.put(new String("publishTime"), jobs.get(n).getPublishTime());
				map2.put(new String("educationalReq"), jobs.get(n).getEducationalReq());
				map2.put(new String("temptation"), jobs.get(n).getTemptation());
				map2.put(new String("city"), jobs.get(n).getCity());
				map2.put(new String("area"), jobs.get(n).getArea());
				map2.put(new String("employ"), jobs.get(n).getEmploy());
				map2.put(new String("workTime"), jobs.get(n).getWorkTime());
				int num = userJobMapper.getUserJobNumBy(userId, jobs.get(n).getId());
				map2.put(new String("status"), num);
				companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(n).getCompanyId());
				/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
				StringBuffer tags = new StringBuffer();
				for(int i=0;i<tagCompanies.size();i++){
					tags.append(tagCompanies.get(i).getTagName());
					if(i<tagCompanies.size()-1){
						tags.append(",");
					}
				}
				map2.put(new String("tags"), tags);*/
				map2.put(new String("companyId"), companyInfos.getId());      
				map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
				map2.put(new String("field"), companyInfos.getFiledes());
				map2.put(new String("growthStage"), companyInfos.getGrowthStage());
				map2.put(new String("scale"), companyInfos.getScale());
				map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
				list.add(map2);
			}
		}else{
			List<CompanyInfo> infos = companyMapper.findAll(page);
			for (int i=0;i<infos.size();i++) {
				List<Job> jobList = jobMapper.getJobByCid(infos.get(i).getId());
				if(jobList.size()>0){
					Map<String, Object> map1 = new HashMap<String, Object>();
					for(int j=0;j<jobList.size();j++){
						if(j==0){
							map1.put(new String("id"), jobList.get(j).getId());
							map1.put(new String("jobName"), jobList.get(j).getJobName());
							map1.put(new String("payment"), jobList.get(j).getPayment());
							map1.put(new String("publishTime"), jobList.get(j).getPublishTime());
							map1.put(new String("educationalReq"), jobList.get(j).getEducationalReq());
							map1.put(new String("temptation"), jobList.get(j).getTemptation());
							map1.put(new String("city"), jobList.get(j).getCity());
							map1.put(new String("area"), jobList.get(j).getArea());
							map1.put(new String("employ"), jobList.get(j).getEmploy());
							map1.put(new String("workTime"), jobList.get(j).getWorkTime());
							int num = userJobMapper.getUserJobNumBy(userId, jobList.get(0).getId());
							map1.put(new String("status"), num);
						}else{
							map1.put(new String("id"+j), jobList.get(j).getId());
							map1.put(new String("jobName"+j), jobList.get(j).getJobName());
							map1.put(new String("payment"+j), jobList.get(j).getPayment());
							map1.put(new String("publishTime"+j), jobList.get(j).getPublishTime());
							map1.put(new String("educationalReq"+j), jobList.get(j).getEducationalReq());
							map1.put(new String("temptation"+j), jobList.get(j).getTemptation());
							map1.put(new String("city"+j), jobList.get(j).getCity());
							map1.put(new String("employ"+j), jobList.get(j).getEmploy());
							map1.put(new String("area"+j), jobList.get(j).getArea());
							map1.put(new String("workTime"+j), jobList.get(j).getWorkTime());
							int num = userJobMapper.getUserJobNumBy(userId, jobList.get(j).getId());
							map1.put(new String("status"+j), num);
						}
					}
					/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(infos.get(i).getId());
					StringBuffer tags = new StringBuffer();
					for(int t=0;t<tagCompanies.size();t++){
						tags.append(tagCompanies.get(t).getTagName());
						if(t<tagCompanies.size()-1){
							tags.append(",");
						}
					}
					map1.put(new String("tags"), tags);*/
					map1.put(new String("companyId"), infos.get(i).getId());      
					map1.put(new String("companyShortName"), infos.get(i).getCompanyShortName());
					map1.put(new String("field"), infos.get(i).getFiledes());
					map1.put(new String("growthStage"), infos.get(i).getGrowthStage());
					map1.put(new String("scale"), infos.get(i).getScale());
					map1.put(new String("companyLogo"), infos.get(i).getCompanyLogo());
					list.add(map1);
				}
			}
		}
		page.setResults(list);
		return page;
	}
	/**
	 * 微信端获取热门职位
	 */
	public List<Map<String, Object>> getPopularJobsForWx(Integer userId,Page<Map<String,Object>> page){
		return jobMapper.getPopularJobsForWx(userId,page);
	}
	/**
	 * <p>根据用户所在城市、学历匹配工作进行推荐<br/>
	 * @title JobsRecommend<br/>
	 * @date 2014-3-21 上午10:02:52<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param city
	 * @param education
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> JobsRecommend(Integer userId,String city,String education,Page<Map<String,Object>> page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		if((!"".equals(city)&&city != null) || (!"".equals(education)&&education !=null)){
			List<Job> jobs = jobMapper.getJobsRecommend(city,education, page);
			CompanyInfo companyInfos = new CompanyInfo();
			for(int i=0;i<jobs.size();i++){
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put(new String("id"), jobs.get(i).getId());
				map2.put(new String("jobName"), jobs.get(i).getJobName());
				map2.put(new String("payment"), jobs.get(i).getPayment());
				map2.put(new String("publishTime"), jobs.get(i).getPublishTime());
				map2.put(new String("educationalReq"), jobs.get(i).getEducationalReq());
				map2.put(new String("temptation"), jobs.get(i).getTemptation());
				map2.put(new String("city"), jobs.get(i).getCity());
				map2.put(new String("area"), jobs.get(i).getArea());
				map2.put(new String("employ"), jobs.get(i).getEmploy());
				map2.put(new String("workTime"), jobs.get(i).getWorkTime());
				int num = userJobMapper.getUserJobNumBy(userId, jobs.get(i).getId());
				map2.put(new String("status"), num);
				companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(i).getCompanyId());
				/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
				StringBuffer tags = new StringBuffer();
				for(int t=0;t<tagCompanies.size();t++){
					tags.append(tagCompanies.get(t).getTagName());
					if(t<tagCompanies.size()-1){
						tags.append(",");
					}
				}
				map2.put(new String("tags"), tags);*/
				map2.put(new String("companyId"), companyInfos.getId());      
				map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
				map2.put(new String("field"), companyInfos.getFiledes());
				map2.put(new String("growthStage"), companyInfos.getGrowthStage());
				map2.put(new String("scale"), companyInfos.getScale());
				map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
				list.add(map2);
			}
		}
		return list;
	}
	
	public List<Map<String,Object>> RecommendedToMe(Integer userId,Page<Map<String,Object>> page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		if(userId != null){
			UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
			StringBuffer category = new StringBuffer();
			if(!"".equals(userBasicInfo.getCategory()) && !"".equals(userBasicInfo.getJobCity()) && !"".equals(userBasicInfo.getCategory()) && userBasicInfo.getCategory() != null) {
				String[] jobAreaStringArray = userBasicInfo.getCategory().split(",");
				for (int i = 0; i < jobAreaStringArray.length; i++) {
					category.append("'");
					category.append(jobAreaStringArray[i]);
					category.append("'");
					if(i != jobAreaStringArray.length-1){
						category.append(",");
					}
				}
			List<Job> jobs = jobMapper.getJobsRed(userBasicInfo,category.toString(), page);
			CompanyInfo companyInfos = new CompanyInfo();
			for(int i=0;i<jobs.size();i++){
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put(new String("id"), jobs.get(i).getId());
				map2.put(new String("jobName"), jobs.get(i).getJobName());
				map2.put(new String("payment"), jobs.get(i).getPayment());
				map2.put(new String("publishTime"), jobs.get(i).getPublishTime());
				map2.put(new String("educationalReq"), jobs.get(i).getEducationalReq());
				map2.put(new String("temptation"), jobs.get(i).getTemptation());
				map2.put(new String("city"), jobs.get(i).getCity());
				map2.put(new String("area"), jobs.get(i).getArea());
				map2.put(new String("employ"), jobs.get(i).getEmploy());
				map2.put(new String("workTime"), jobs.get(i).getWorkTime());
				int num = userJobMapper.getUserJobNumBy(userId, jobs.get(i).getId());
				map2.put(new String("status"), num);
				companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(i).getCompanyId());
				/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
				StringBuffer tags = new StringBuffer();
				for(int t=0;t<tagCompanies.size();t++){
					tags.append(tagCompanies.get(t).getTagName());
					if(t<tagCompanies.size()-1){
						tags.append(",");
					}
				}
				map2.put(new String("tags"), tags);*/
				map2.put(new String("companyId"), companyInfos.getId());      
				map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
				map2.put(new String("field"), companyInfos.getFiledes());
				map2.put(new String("growthStage"), companyInfos.getGrowthStage());
				map2.put(new String("scale"), companyInfos.getScale());
				map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
				list.add(map2);
			}
		}
		}	
		return list;
	}
	/**
	 * <p>根据用户希望工作城市和希望职位类别和学历向用户推荐职位<br/>
	 * @title JobsRecd<br/>
	 * @date 2014-5-20 下午2:16:15<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param userBasicInfo
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> JobsRecd(Integer userId,UserBasicInfo userBasicInfo,Page<Map<String,Object>> page){
		List <Map<String,Object>> list = new ArrayList <Map<String,Object>>();
		StringBuffer category = new StringBuffer();
		if(!"".equals(userBasicInfo.getCategory()) && userBasicInfo.getCategory() != null) {
			String[] jobAreaStringArray = userBasicInfo.getCategory().split(",");
			for (int i = 0; i < jobAreaStringArray.length; i++) {
				category.append("'");
				category.append(jobAreaStringArray[i]);
				category.append("'");
				if(i != jobAreaStringArray.length-1){
					category.append(",");
				}
			}
		}	
		List<Job> jobs = jobMapper.getJobsRed(userBasicInfo, category.toString(), page);
		CompanyInfo companyInfos = new CompanyInfo();
		for(int i=0;i<jobs.size();i++){
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put(new String("id"), jobs.get(i).getId());
			map2.put(new String("jobName"), jobs.get(i).getJobName());
			map2.put(new String("payment"), jobs.get(i).getPayment());
			map2.put(new String("publishTime"), jobs.get(i).getPublishTime());
			map2.put(new String("educationalReq"), jobs.get(i).getEducationalReq());
			map2.put(new String("temptation"), jobs.get(i).getTemptation());
			map2.put(new String("city"), jobs.get(i).getCity());
			map2.put(new String("area"), jobs.get(i).getArea());
			map2.put(new String("employ"), jobs.get(i).getEmploy());
			map2.put(new String("workTime"), jobs.get(i).getWorkTime());
			int num = userJobMapper.getUserJobNumBy(userId, jobs.get(i).getId());
			map2.put(new String("status"), num);
			companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(i).getCompanyId());
			/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
			StringBuffer tags = new StringBuffer();
			for(int t=0;t<tagCompanies.size();t++){
				tags.append(tagCompanies.get(t).getTagName());
				if(t<tagCompanies.size()-1){
					tags.append(",");
				}
			}
			map2.put(new String("tags"), tags);*/
			map2.put(new String("companyId"), companyInfos.getId());      
			map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
			map2.put(new String("field"), companyInfos.getFiledes());
			map2.put(new String("growthStage"), companyInfos.getGrowthStage());
			map2.put(new String("scale"), companyInfos.getScale());
			map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
			list.add(map2);
		}
		return list;
	}
	
	public List<Map<String,Object>> JobsRecdSan(Integer userId,UserBasicInfo userBasicInfo){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		StringBuffer category = new StringBuffer();
		if(!"".equals(userBasicInfo.getCategory()) && userBasicInfo.getCategory() != null) {
			String[] jobAreaStringArray = userBasicInfo.getCategory().split(",");
			for (int i = 0; i < jobAreaStringArray.length; i++) {
				category.append("'");
				category.append(jobAreaStringArray[i]);
				category.append("'");
				if(i != jobAreaStringArray.length-1){
					category.append(",");
				}
			}
		}	
		List<Job> jobs = jobMapper.getJobsRedSan(userBasicInfo, category.toString());
		CompanyInfo companyInfos = new CompanyInfo();
		for(int i=0;i<jobs.size();i++){
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put(new String("id"), jobs.get(i).getId());
			map2.put(new String("jobName"), jobs.get(i).getJobName());
			map2.put(new String("payment"), jobs.get(i).getPayment());
			map2.put(new String("publishTime"), jobs.get(i).getPublishTime());
			map2.put(new String("educationalReq"), jobs.get(i).getEducationalReq());
			map2.put(new String("temptation"), jobs.get(i).getTemptation());
			map2.put(new String("city"), jobs.get(i).getCity());
			map2.put(new String("area"), jobs.get(i).getArea());
			map2.put(new String("employ"), jobs.get(i).getEmploy());
			map2.put(new String("workTime"), jobs.get(i).getWorkTime());
			int num = userJobMapper.getUserJobNumBy(userId, jobs.get(i).getId());
			map2.put(new String("status"), num);
			companyInfos = companyMapper.getCompanyInfoByCompanyId(jobs.get(i).getCompanyId());
			/*List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(companyInfos.getId());
			StringBuffer tags = new StringBuffer();
			for(int t=0;t<tagCompanies.size();t++){
				tags.append(tagCompanies.get(t).getTagName());
				if(t<tagCompanies.size()-1){
					tags.append(",");
				}
			}
			map2.put(new String("tags"), tags);*/
			map2.put(new String("companyId"), companyInfos.getId());      
			map2.put(new String("companyShortName"), companyInfos.getCompanyShortName());
			map2.put(new String("filedes"), companyInfos.getFiledes());
			map2.put(new String("growthStage"), companyInfos.getGrowthStage());
			map2.put(new String("scale"), companyInfos.getScale());
			map2.put(new String("companyLogo"), companyInfos.getCompanyLogo());
			list.add(map2);
		}
		return list;
	}
	
	
	public List<Map<String,Object>> JobsRecdSanPhone(Integer userId,UserBasicInfo userBasicInfo){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		StringBuffer category = new StringBuffer();
		if(!"".equals(userBasicInfo.getCategory()) && userBasicInfo.getCategory() != null) {
			String[] jobAreaStringArray = userBasicInfo.getCategory().split(",");
			for (int i = 0; i < jobAreaStringArray.length; i++) {
				category.append("'");
				category.append(jobAreaStringArray[i]);
				category.append("'");
				if(i != jobAreaStringArray.length-1){
					category.append(",");
				}
			}
		}	
		System.out.println("category==="+category);
		list = jobMapper.getJobsRedSanPhone(userBasicInfo, category.toString());
		return list;
	}
	/**
	 * <p>根据传的num参数返回num条最新的职位信息<br/>
	 * @title newestJob<br/>
	 * @date 2014-3-28 上午9:53:11<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param num
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> newestJob(Integer num,Page<Map<String,Object>> page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		list = jobMapper.getNewestJob(num, page);
		for(int i=0;i<list.size();i++){
			list.get(i).get("companyId");
		}
		return list;
	}
	
	public List <Map <String,Object>> postRecord(String startTime,String endTime,String companyName,Page<Map<String, Object>> page){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		list = jobMapper.getJobByTime(startTime, endTime,companyName,page);
		List <Map <String,Object>> list2 = new ArrayList <Map <String,Object>>();
		for(int i=0;i<list.size();i++){
			Integer count = userJobMapper.getUjobConByJid(Integer.valueOf(list.get(i).get("id").toString()));
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("publishTime", list.get(i).get("publishTime"));
			map2.put("city", list.get(i).get("city"));
			map2.put("area", list.get(i).get("area"));
			map2.put("companyName", list.get(i).get("companyName"));
			map2.put("companyDesc", list.get(i).get("companyDesc"));
			map2.put("phone", list.get(i).get("phone"));
			map2.put("email", list.get(i).get("email"));
			map2.put("jobName", list.get(i).get("jobName"));
			map2.put(new String("count"), count);
			map2.put("cdkey", list.get(i).get("cdkey"));
			map2.put("cdkeyStatus", list.get(i).get("cdkeyStatus"));
			map2.put("pageView", list.get(i).get("pageView"));
			list2.add(map2);
		}
		return list2;
	}
	public List <Map <String,Object>> postRecordExcel(String startTime,String endTime){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		list = jobMapper.getJobByTimeExcel(startTime, endTime);
		List <Map <String,Object>> list2 = new ArrayList <Map <String,Object>>();
		for(int i=0;i<list.size();i++){
			Integer count = userJobMapper.getUjobConByJid(Integer.valueOf(list.get(i).get("id").toString()));
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("publishTime", list.get(i).get("publishTime"));
			map2.put("city", list.get(i).get("city"));
			map2.put("companyName", list.get(i).get("companyName"));
			map2.put("companyDesc", list.get(i).get("companyDesc"));
			map2.put("phone", list.get(i).get("phone"));
			map2.put("email", list.get(i).get("email"));
			map2.put("jobName", list.get(i).get("jobName"));
			map2.put(new String("count"), count);
			map2.put("cdkey", list.get(i).get("cdkey"));
			map2.put("cdkeyStatus", list.get(i).get("cdkeyStatus"));
			map2.put("pageView", list.get(i).get("pageView"));
			list2.add(map2);
		}
		return list2;
	}
	public static String convertHtmlToStr(String urlStr) throws Exception {
		URL url;
		
		//String sessionId = request.getSession().getId();
			if (urlStr.indexOf("?") != -1) {
				urlStr = urlStr + "&locale="
						+ LocaleContextHolder.getLocale().toString();
			} else {
				urlStr = urlStr + "?locale="
						+ LocaleContextHolder.getLocale().toString();
			}
			url = new URL(urlStr);
			
			URLConnection uc = url.openConnection();
			//uc.setRequestProperty("Cookie", "JSESSIONID="+sessionId);
			
			InputStream is = uc.getInputStream();
		//	InputStream is = new FileInputStream(urlStr);
			
			Tidy tidy = new Tidy();
		
			OutputStream os2 = new ByteArrayOutputStream();
			tidy.setXHTML(true); // 设定输出为xhtml(还可以输出为xml)
			tidy.setCharEncoding(Configuration.UTF8); // 设定编码以正常转换中文
			tidy.setTidyMark(false); // 不设置它会在输出的文件中给加条meta信息
			tidy.setXmlPi(true); // 让它加上<?xml version="1.0"?>
			tidy.setIndentContent(true); // 缩进，可以省略，只是让格式看起来漂亮一些
			tidy.parse(is, os2);
			is.close();
			// 解决乱码 --将转换后的输出流重新读取改变编码
			String temp;
			StringBuffer sb = new StringBuffer();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					new ByteArrayInputStream(
							((ByteArrayOutputStream) os2).toByteArray()),
					"utf-8"));
			while ((temp = in.readLine()) != null) {
				sb.append(temp);
			}
			return sb.toString();
		}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page invitation(Integer companyId,Page page){
		page.setResults(userBasicInfoMapper.findInvitation(companyId,page));
		return page;
	}
	/**
	 * <p>每周一8:00自动执行方法，提醒HR发布的职位上一周的浏览次数，有多少简历待处理<br/>
	 * @title jobDetailsByEmail<br/>
	 * @date 2015-3-16 下午2:04:47<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	public List<Map<String, Object>> findJobDetails(){
		List<Map<String, Object>> list = jobMapper.findJobDetails();
		return list;
	}
	/**
	 * <p>查询我发的职位和收到的简历数<br/>
	 * @title findJobReunm<br/>
	 * @date 2015-3-17 下午12:20:18<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> findJobReunm(Integer userId){
		List<Map<String, Object>> list = jobMapper.findJobReunm(userId);
		return list;
	}
	
	public void updateJobById(Job job){
		jobMapper.modify(job);
	}
}
