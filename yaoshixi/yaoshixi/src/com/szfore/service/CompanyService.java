package com.szfore.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.szfore.action.company.vo.CertificateInfo;
import com.szfore.action.company.vo.CompanyIndexData;
import com.szfore.action.company.vo.CompanyJob;
import com.szfore.mapper.CertificateInfoMapper;
import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.TagCompanyMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.Job;
import com.szfore.model.TagCompany;
import com.szfore.plugin.Page;
import com.szfore.utils.PropertyUtils;
import com.szfore.utils.SendCloudEmail;

@Service
public class CompanyService {

	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private UserJobMapper userJobMapper;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	@Autowired
	private CertificateInfoMapper certificateInfoMapper;
	@Autowired
	private TagService tagService;
	@Autowired
	private TagCompanyMapper tagCompanyMapper;
	
	public CompanyIndexData load(Integer companyId){
		CompanyInfo companyInfo = companyMapper.getCompanyInfoByCompanyId(companyId);
		
		List<CompanyJob> jobPage = listJobsPhone(companyId, Job.STATUS_ONLINE);
		
		List<TagCompany> tagCompanyPage = tagService.getTagCompanyByCompanyId(companyId);
		
		return CompanyIndexData.create(companyInfo, jobPage, tagCompanyPage);
	}
	
	/**
	 * 招聘信息列表(分页）
	 */
	public Page<CompanyJob> listJobs(Integer companyId, Integer status,Page<CompanyJob> page){
		List<CompanyJob> jobs = jobMapper.list(companyId, status,page);
		page.setResults(jobs);
		return page;
	}
	
	public List<CompanyJob> listJobsPhone(Integer companyId, Integer status){
		List<CompanyJob> jobs = jobMapper.listPhone(companyId, status);
		return jobs;
	}
	
	public List<CompanyJob> listWeixJobs(Integer companyId, Integer status, Page<CompanyJob> page){
		List<CompanyJob> jobs = jobMapper.list(companyId, status, page);
		return jobs;
	}
	/**
	 * 查询收到的简历
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page resumeUser(Integer userId,Integer companyId, Integer status, @ModelAttribute("page")Page page) {
		page.setResults(userBasicInfoMapper.resumeUser(userId,companyId, status, page));
		return page;
	}
	/**
	 * 招聘信息列表（限制查询条数）
	 */
	public List<CompanyJob> listJobs(Integer companyId, Integer status, Integer size) 
	{
		List<CompanyJob> jobs = jobMapper.listBySize(companyId, status, size);
		return jobs;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page receivedResumes(Integer companyId, Page page) 
	{
		List<Integer> jobIds = jobMapper.getJobIdsOf(companyId);
		
		if(jobIds == null || jobIds.size() <= 0)
		{
			return page;
		}
		
		page.putParam("jobIds", StringUtils.collectionToCommaDelimitedString(jobIds));
		
		List results = userJobMapper.getUserJobOf(page);
		page.setResults(results);
		return page;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page receivedResumesBy(Integer jobId, Page page) 
	{
		page.putParam("jobIds", jobId.toString());		
		List results = userJobMapper.getUserJobOf(page);
		page.setResults(results);
		return page;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page receivedResumesBystatus(Integer jobId,  Integer status,Page page) {
		List results = userJobMapper.getUserJobByStatus(status,jobId,page);
		page.setResults(results);
		return page;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page TalentResumesBystatus(Integer companyId,  Integer status,Page page) {
		List results = userJobMapper.TalentJobByStatus(status,companyId,page);
		page.setResults(results);
		return page;
	}
	/**
	 * 查询公司，返回公司列表
	 * @param page
	 * @param city
	 * @param field
	 * @param nature
	 * @param scale
	 * @param companyName
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Page searchCompany(Page page,String city,String companyScale, 
			String companyNature,String companyIndustry,String companyName,
			String major,Integer authentication){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		StringBuffer majorList = new StringBuffer();
		if(!"".equals(major) && major != null) {
			System.out.println("java==major==" + major);
			String[] jobAttrStringArray = major.split(",");
			for (int i = 0; i < jobAttrStringArray.length; i++) {
				majorList.append("'");
				majorList.append(jobAttrStringArray[i]);
				majorList.append("'");
				if(i != jobAttrStringArray.length-1){
					majorList.append(",");
				}
			}
			page.setNumPerPage(20);	
		} else {
			page.setNumPerPage(20);
		}
		List<CompanyInfo> infos = companyMapper.getCompanyByTerm(city, companyScale, companyNature, companyIndustry, companyName, majorList.toString(),authentication,page);
		for(int i=0;i<infos.size();i++){
			List<Job> jobList = jobMapper.getJobByCid(infos.get(i).getId());
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("jobs", jobList);
			map1.put("jobsNum", jobList.size());
			List<TagCompany> tagCompanies = tagCompanyMapper.selectTagCompanyByCompanyId(infos.get(i).getId());
			StringBuffer tags = new StringBuffer();
			for(int t=0;t<tagCompanies.size();t++){
				tags.append(tagCompanies.get(t).getTagName());
				if(t<tagCompanies.size()-1){
					tags.append(",");
				}
			}
			map1.put(new String("tags"), tags);
			map1.put(new String("companyId"), infos.get(i).getId());      
			map1.put(new String("companyName"), infos.get(i).getCompanyName());
			map1.put(new String("field"), infos.get(i).getFiledes());
			map1.put(new String("growthStage"), infos.get(i).getGrowthStage());
			map1.put(new String("scale"), infos.get(i).getScale());
			map1.put(new String("companyLogo"), infos.get(i).getCompanyLogo());
			map1.put(new String("famous"), infos.get(i).getFamous());
			list.add(map1);
		}
		page.setResults(list);		
		return page;
	}
	
	public List <Map <String,Object>> searchCompanyPhone(
			String city,String companyScale,String companyNature, 
			String companyField,String companyName,Integer authentication,Integer num) {
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<CompanyInfo> infos = companyMapper.getCompanyByTermPhone(city, companyScale, companyNature, companyField, companyName,authentication,num);
		for(int i=0;i<infos.size();i++){
			List<Job> jobList = jobMapper.getJobByCid(infos.get(i).getId());
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("jobs", jobList);
			map1.put("jobsNum", jobList.size());
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
			map1.put(new String("companyName"), infos.get(i).getCompanyName());
			map1.put(new String("field"), infos.get(i).getFiledes());
			map1.put(new String("growthStage"), infos.get(i).getGrowthStage());
			map1.put(new String("scale"), infos.get(i).getScale());
			map1.put(new String("companyLogo"), infos.get(i).getCompanyLogo());
			map1.put(new String("famous"), infos.get(i).getFamous());
			list.add(map1);
		}
		return list;
	}
	
	
	
	public List <Map <String,Object>> tuigCompanyPhone(
			String city,String companyScale,String companyNature, 
			String companyField,String companyName,Integer authentication,Integer num) {
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<CompanyInfo> infos = companyMapper.getTuigCompanyByPhone(city, companyScale, companyNature, companyField, companyName,authentication,num);
		for(int i=0;i<infos.size();i++){
			List<Job> jobList = jobMapper.getJobByCid(infos.get(i).getId());
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("jobs", jobList);
			map1.put("jobsNum", jobList.size());
			map1.put(new String("companyId"), infos.get(i).getId());      
			map1.put(new String("companyName"), infos.get(i).getCompanyName());
			map1.put(new String("field"), infos.get(i).getFiledes());
			map1.put(new String("growthStage"), infos.get(i).getGrowthStage());
			map1.put(new String("scale"), infos.get(i).getScale());
			map1.put(new String("companyLogo"), infos.get(i).getCompanyLogo());
			map1.put(new String("famous"), infos.get(i).getFamous());
			list.add(map1);
		}
		return list;
	}
	/**
	 * 查询企业用户的公司信息
	 * @param userId
	 * @return
	 */
	public CompanyInfo getCompanyInfoByUserId(Integer userId){
		return companyMapper.getCompanyInfoOf(userId);
	}
	
	private String getKeyword(String city, String field, String nature,
			String scale, String companyName) {
		
		HashMap<String,String> keywordsMap = genKeywordsMap(city, field, nature, scale);
		Set<String> keys = keywordsMap.keySet();
		StringBuilder sb = new StringBuilder();
		sb.append("(");
	    for (Iterator<String> iterator = keys.iterator(); iterator.hasNext();) {
			String key = iterator.next();
			sb.append(key+":"+keywordsMap.get(key));
			if(iterator.hasNext()) {
				sb.append(" AND ");
			}
		}
		sb.append(")");
		
		 if(sb.toString().equals("()")) {
			  sb.delete(0, sb.length());
		  } else if (keyIsNotNull(companyName)){
			  sb.append(" OR ");
		  }
		  if(keyIsNotNull(companyName)) {
			  sb.append("companyName:"+companyName);
		  }
		String keyword = sb.toString();
		System.out.println("keyword:"+keyword);
		return keyword;
	}

	private boolean keyIsNotNull(String key) {
		return key != null && !"".equals(key);
	}

	private HashMap<String, String> genKeywordsMap(String city, String field,
			String nature, String scale) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(keyIsNotNull(city)) {
			map.put("city", city);
		}
		
		if(keyIsNotNull(field)) {
			map.put("field", field);
		}
		
		if(keyIsNotNull(nature)) {
			map.put("nature", nature);
		}
		
		if(keyIsNotNull(scale)) {
			map.put("scale", scale);
		}
		
		return map;
	}


	/**
	 * 实习证明信息
	 */
	public CertificateInfo getCertificateInfo(Integer userId, Integer jobId,
			Integer companyId) throws Exception 
	{
		Integer userJobNum = userJobMapper.getUserJobNumBy(userId, jobId);
		Integer companyJobNum = jobMapper.getJobNumBy(companyId, jobId);
		
		CertificateInfo.validate(userJobNum, companyJobNum);
		
		return certificateInfoMapper.loadCertificateInfo(userId, jobId, companyId);
	}
	/**
	 * 查找公司发布的职位
	 * @param companyId
	 * @param status
	 * @return
	 */
	/*@SuppressWarnings("unchecked")
	private Page<CompanyJob> getJobsByCompanyId(int companyId, int status) {
		Page<CompanyJob> page = new Page<CompanyJob>()
				.putParam("companyId", companyId)
				.putParam("status", status);
		return page;
	}*/
	/**
	 * addCompanyExcel
	 * excel导入添加
	 * @param companyInfo
	 */
	public void addCompanyExcel(CompanyInfo companyInfo) {
		companyMapper.addExcel(companyInfo);
		//LuceneManager.getInstance().createIndex(companyInfo);
	}
	/**
	 * 公司发邮件
	 * @param email
	 * @param html
	 */
	public void sendEmail(String theme,String email,String html) {
		/*EmailSmtpSend ess = new EmailSmtpSend(PropertyUtils.getProperty("smtpUrl"), PropertyUtils.getProperty("username"), PropertyUtils.getProperty("password"));
		if(!"".equals(theme) && theme != null){
			ess.sendHtmlMail(theme, html, email);
		}else{
			ess.sendHtmlMail(PropertyUtils.getProperty("emailSubject"), html, email);
		}*/
		SendCloudEmail cloudEmail = new SendCloudEmail();
		try {
			if(!"".equals(theme) && theme != null){
				cloudEmail.SendCloudEmailHtml(theme, html, email);
			}else{
				cloudEmail.SendCloudEmailHtml(PropertyUtils.getProperty("emailSubject"), html, email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Page<Map<String, Object>> reviewPage(Page<Map<String, Object>> page) {
		if(page == null){
			return page;
		}
		List<Map<String, Object>> results = companyMapper.reviewPage(page);
		page.setResults(results);
		return page;
	}
	public Page<Map<String, Object>> authentication(Page<Map<String, Object>> page) {
		if(page == null){
			return page;
		}
		List<Map<String, Object>> results = companyMapper.authentication(page);
		page.setResults(results);
		return page;
	}
	public CompanyInfo getCompanyInfoByCompanyId(Integer companyId) {
		return companyMapper.getCompanyInfoByCompanyId(companyId);
	}

	public CompanyInfo getByCompName(String companyName) {
		return companyMapper.getByCompName(companyName);
	}
	
	public boolean reviewPass(Integer companyId) {
		return companyMapper.reviewPass(companyId) != 0;
	}

	public boolean authenticationPass(Integer companyId) {
		return companyMapper.authenticationPass(companyId) != 0;
	}
	
	public Page<Map<String, Object>> companyPage(Page<Map<String, Object>> page) {
		if(page == null){
			return page;
		}
		List<Map<String, Object>> results = companyMapper.companyPage(page);
		page.setResults(results);
		return page;
	}

	public List<Map<String, Object>> legalJobCount(List<Integer> ids) {
		if(ids == null || ids.isEmpty()){
			return new ArrayList<Map<String,Object>>();
		}
		return companyMapper.jobCount(1,ids);
	}

	public List<Map<String, Object>> illegalJobCount(List<Integer> ids) {
		if(ids == null || ids.isEmpty()){
			return new ArrayList<Map<String,Object>>();
		}
		return companyMapper.jobCount(2,ids);
	}

	public List<Map<String, Object>> allJobCount(List<Integer> ids) {
		if(ids == null || ids.isEmpty()){
			return new ArrayList<Map<String,Object>>();
		}
		return companyMapper.jobCount(0,ids);
	}

	public boolean addTag(Integer companyId, String tagName) 
	{
		Integer tagNum = tagCompanyMapper.tagNumOf(companyId, tagName);
		if(tagNum > 0 || tagName == null || "".equals(tagName.trim()))
		{
			return false;
		}
		tagCompanyMapper.insertTagCompany(new TagCompany(companyId, tagName));
		return true;
	}

	public boolean removeTag(Integer companyId, String tagName) 
	{
		/*Integer tagNum = tagCompanyMapper.tagNumOf(companyId, tagName);
		if(tagNum > 0 || tagName == null || "".equals(tagName.trim()))
		{
			return false;
		}*/
		tagCompanyMapper.deleteTagCompany(new TagCompany(companyId, tagName));
		return true;
	}
	
	public void addCompanyList(List<CompanyInfo> companyInfoList) {
		if(companyInfoList== null || companyInfoList.isEmpty()){
			return;
		}
		companyMapper.addCompanyList(companyInfoList);
	}

	public List<Map<String, Object>> getCompanyByName(
			List<String> comanyNameList) {
		if(comanyNameList== null || comanyNameList.isEmpty()){
			return new ArrayList<Map<String,Object>>();
		}
		return companyMapper.getCompanyByName(comanyNameList);
	}

	public List<Job> findJobByCid(Integer companyId){
		List<Job> list = jobMapper.getJobByCid(companyId);
		return list;
	}
}
