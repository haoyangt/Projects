package com.szfore.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import jodd.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.EducationExperienceMapper;
import com.szfore.mapper.ExperienceMapper;
import com.szfore.mapper.FriendProposalsMapper;
import com.szfore.mapper.InterviewNoticeMapper;
import com.szfore.mapper.ItSkillMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.RecordChartMapper;
import com.szfore.mapper.SchoolRewardsMapper;
import com.szfore.mapper.SocialPracticeMapper;
import com.szfore.mapper.TagUserMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.mapper.VocationalSkillsMapper;
import com.szfore.model.AccessToken;
import com.szfore.model.CompanyInfo;
import com.szfore.model.EducationExperience;
import com.szfore.model.ItSkill;
import com.szfore.model.Job;
import com.szfore.model.Login;
import com.szfore.model.OAuthVO;
import com.szfore.model.TagUser;
import com.szfore.model.UserBasicInfo;
import com.szfore.model.UserJob;
import com.szfore.model.RecordChart;
import com.szfore.plugin.Page;
import com.szfore.utils.EmailSmtpSend;
import com.szfore.utils.PropertyUtils;
import com.szfore.utils.SendCloudEmail;
/**
 * 跟用户相关操作
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
@Service
@Transactional(propagation=Propagation.REQUIRED)
public class UserService {

	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private UserJobMapper userJobMapper;
	@Autowired
	private TagUserMapper tagUserMapper;
	@Autowired
	private CompanyMapper companyMapper;//add 2014-03-24
	@Autowired
	private RecordChartMapper recordChartMapper;
	@Autowired
	private SocialPracticeMapper socialPracticeMapper;
	@Autowired
	private ExperienceMapper experienceMapper;
	@Autowired
	private SchoolRewardsMapper schoolRewardsMapper;
	@Autowired
	private VocationalSkillsMapper vocationalSkillsMapper;
	@Autowired
	private EducationExperienceMapper educationExperienceMapper;
	@Autowired
	private ItSkillMapper itSkillMapper;
	@Autowired
	private FriendProposalsMapper friendProposalsMapper;
	
	@Autowired
	private InterviewNoticeMapper interviewNoticeMapper;
	/**
	 * 注册
	 * @param userBasicInfo
	 * @param login
	 */
	public void regist(Login login,String registId,String companyName) {
		login.setRegistId(registId);
		if(login.getRoleId()==2){
			login.setActiveStatus(1);
		}
		loginMapper.insertUser(login);
		//插入基本信息表
		UserBasicInfo userBasicInfo = new UserBasicInfo();
		if(!"".equals(companyName) && companyName!=null){
			userBasicInfo.setUserName(companyName);
		}
		userBasicInfo.setUserId(login.getId());
		userBasicInfo.setEmail(login.getEmail());
		userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);
		/*//插入简历表
		Resume resume = new Resume();
		resume.setUserId(login.getId());
		resume.setTimeAvailable(1);
		resumeMapper.insertResume(resume);*/
		//判断是否是企业用户
		if(login.getRoleId()==1){
			CompanyInfo companyInfo = new CompanyInfo();
			companyInfo.setCompanyName(companyName);
			companyInfo.setUserId(login.getId());
			companyInfo.setCertifyStatus(0);
			companyInfo.setFamous(10);
			companyMapper.addCompany(companyInfo);
		}
	}
	
	public void companyRegist(Login login,String registId,Integer companyId) {
		login.setRegistId(registId);
		login.setActiveStatus(1);
		loginMapper.insertUser(login);
		//插入基本信息表
		UserBasicInfo userBasicInfo = new UserBasicInfo();
		CompanyInfo companyInfo = companyMapper.getCompanyInfoByCompanyId(companyId);
		if(companyInfo!=null){
			userBasicInfo.setUserName(companyInfo.getCompanyName());
		}
		userBasicInfo.setUserId(login.getId());
		userBasicInfo.setEmail(login.getEmail());
		userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);
		companyMapper.updateUserIdById(companyId,login.getId());
	}
	
	public void sendEmail(String registId,String email,String html) {
		/*EmailSmtpSend ess = new EmailSmtpSend(PropertyUtils.getProperty("smtpUrl"), PropertyUtils.getProperty("username"), PropertyUtils.getProperty("password"));
	//	ess.sendPlaintTextMail(PropertyUtils.getProperty("emailSubject"), genContent(registId, email),email);
		ess.sendHtmlMail(PropertyUtils.getProperty("emailSubject"), html, email);*/
		SendCloudEmail cloudEmail = new SendCloudEmail();
		try {
			cloudEmail.SendCloudEmailHtml(PropertyUtils.getProperty("emailSubject"), html, email);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sendPassEmail(String registId,String email,String html) {
		EmailSmtpSend ess = new EmailSmtpSend(PropertyUtils.getProperty("smtpUrl"), PropertyUtils.getProperty("username"), PropertyUtils.getProperty("password"));
		ess.sendHtmlMail("要实习-找回密码", html, email);
	}
	
	public void sendActivationEmail(String registId,String email,String html) {
		/*EmailSmtpSend ess = new EmailSmtpSend(PropertyUtils.getProperty("smtpUrl"), PropertyUtils.getProperty("serviceuser"), PropertyUtils.getProperty("password"));
		ess.sendHtmlMail("要实习-激活公司邮箱", html, email);*/
		SendCloudEmail cloudEmail = new SendCloudEmail();
		try {
			cloudEmail.SendCloudEmailHtml("要实习-激活公司邮箱", html, email);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void sendWelEmail(String email,String html) {
		/*EmailSmtpSend ess = new EmailSmtpSend(PropertyUtils.getProperty("smtpUrl"), PropertyUtils.getProperty("username"), PropertyUtils.getProperty("password"));
		ess.sendHtmlMail("要实习-欢迎您的加入", html, email);*/
		SendCloudEmail cloudEmail = new SendCloudEmail();
		try {
			cloudEmail.SendCloudEmailHtml("要实习-欢迎您的加入", html, email);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 激活注册账户
	 * @param registId
	 * @param userId
	 */
	public void activeRegist(String registId,String email) {
		Login login = loginMapper.findUserByEmail(email);
		Date registTime = login.getRegistTime();
		long now = new Date().getTime();
		long timeDiff = now -registTime.getTime();
		if(timeDiff > 24*60*60*1000) {
			throw new RuntimeException("链接已经过期");
		}
		loginMapper.activeUserAccount(registId, login.getId());
	}
	
	
	/**
	 * 给用户添加标签
	 * @param userId
	 * @param tagName
	 * @param mark
	 */
	public void addTagToUser(int userId,String tagName,String mark) {
		TagUser tagUser = new TagUser();
		tagUser.setUserId(userId);
		tagUser.setTagName(tagName);
		tagUser.setMark(mark);
		tagUserMapper.insertTagUser(tagUser);
	}
	
	/**
	 * 根据标签id删除用户的标签
	 * @param tagId
	 */
	public void deleteTagUserById(int tagId) {
		tagUserMapper.deleteTagUserById(tagId);
	}
	
	/**
	 * 查找用户id的完全简历
	 * @param userId
	 * @return
	 */
	public Map<String,Object> findResumeByUserId(Integer userId,Map<String, Object> data) {
		UserBasicInfo basicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
		data.put("userBasicInfo", basicInfo);
		List<EducationExperience> education= educationExperienceMapper.getByUserId(userId);
		if(education.size()>0){
			data.put("education", education);
		}else{
			data.put("education", null);
		}
		List<Map<String, Object>> social = socialPracticeMapper.findByUserId(userId);
		if(social.size()>0){
			data.put("social", social);
		}else{
			data.put("social", null);
		}
		List<Map<String, Object>> experience = experienceMapper.findByUserId(userId);
		if(experience.size()>0){
			data.put("experience", experience);
		}else{
			data.put("experience", null);
		}
		List<Map<String, Object>> award = schoolRewardsMapper.findByUserId(userId);
		if(award.size()>0){
			data.put("award", award);
		}else{
			data.put("award", null);
		}
		List<Map<String, Object>> vocational = vocationalSkillsMapper.findByUserId(userId);
		if(vocational.size()>0){
			data.put("vocational",vocational);
		}else{
			data.put("vocational",null);
		}
		List<ItSkill> itSkillJt = itSkillMapper.findByUserId(userId,1);
		if(itSkillJt.size()>0){
			data.put("itSkillJt", itSkillJt);
		}else{
			data.put("itSkillJt", null);
		}
		List<ItSkill> itSkillPt = itSkillMapper.findByUserId(userId,2);
		if(itSkillPt.size()>0){
			data.put("itSkillPt", itSkillPt);
		}else{
			data.put("itSkillPt", null);
		}
		/*if(basicInfo.getAccessory()!=null && !"".equals(basicInfo.getAccessory())){
			data.put("adjunct", (basicInfo.getAccessory()).split("_")[1]);
		}
		data.put("accessory", basicInfo.getAccessory());*/
		return data;
	} 
	
	public Map<String,Object> findByUserId(Integer userId,String num) {
		Map<String, Object> data = new HashMap<String, Object>();
		UserBasicInfo basicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
		if(basicInfo != null){
			if(basicInfo.getCategory()!=null){
				if(basicInfo.getCategory().indexOf(",") != -1){
					byte[] temp = basicInfo.getCategory().getBytes();//使用平台默认的字符集将此 String 解码为字节序列，并将结果存储到一个新的字节数组中。
					int count = 0;
					//遍历数组的每一个元素，也就是字符串中的每一个字母
					for(int i=0;i<temp.length; i++){
					//如果字母等于c
						if(",".equals(temp[i])){
						//计数器加一
							count ++;
						}
					}
					String category0 = "";
					String category1 = "";
					String category2 = "";
					if(count==1){
						category0 = basicInfo.getCategory().split(",")[0];
						category1 = basicInfo.getCategory().split(",")[1];
					}
					if(count==2){
						category2 = basicInfo.getCategory().split(",")[2];
					}
					
					data.put("category0", category0);
					data.put("category1", category1);
					data.put("category2", category2);
				}
			}
		}
		data.put("userBasicInfo", basicInfo);
		if("1".equals(num)){
			EducationExperience education= educationExperienceMapper.getMaxByUid(userId);
			data.put("education", education);
			List<TagUser> tagUsers = tagUserMapper.findTagUser(userId);
			data.put("tagUsers", tagUsers);
		}
		return data;
	}
	
	public List<Map<String, Object>> findCompanyByUid(Integer userId){
		List<Map<String, Object>> login = loginMapper.findCompanyByUid(userId);
		return login;
	}
	
	
	public Map<String,Object> findByUserIdGzr(Integer userId,String num) {
		Map<String, Object> data = new HashMap<String, Object>();
		UserBasicInfo basicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
		/*if(basicInfo.getWorkReady()!=null){
			if(basicInfo.getWorkReady().indexOf(",") != -1){
				byte[] temp = basicInfo.getWorkReady().getBytes();//使用平台默认的字符集将此 String 解码为字节序列，并将结果存储到一个新的字节数组中。
				int count = 0;
				//遍历数组的每一个元素，也就是字符串中的每一个字母
				for(int i=0;i<temp.length; i++){
				//如果字母等于c
					if(temp[i] == 44){
					//计数器加一
						count++;
					}
				}
				data.put("days", count);
			}
		}
		if(basicInfo.getMonthReady()!=null){
			if(basicInfo.getMonthReady().indexOf(",") != -1){
				byte[] temp2 = basicInfo.getMonthReady().getBytes();//使用平台默认的字符集将此 String 解码为字节序列，并将结果存储到一个新的字节数组中。
				int count2 = 0;
				//遍历数组的每一个元素，也就是字符串中的每一个字母
				for(int i=0;i<temp2.length; i++){
				//如果字母等于c
					if(temp2[i] == 44){
					//计数器加一
						count2++;
					}
				}
				data.put("months", count2);
			}
		}*/
		data.put("userBasicInfo", basicInfo);
		if("1".equals(num)){
			EducationExperience education= educationExperienceMapper.getMaxByUid(userId);
			data.put("education", education);
			List<TagUser> tagUsers = tagUserMapper.findTagUser(userId);
			data.put("tagUsers", tagUsers);
		}
		return data;
	}
	
	/**
	 * 查找指定用户投了指定公司哪些职位的简历
	 * @param userId
	 * @param companyId
	 * @return
	 */
	public List<Map<String,Object>> getUserJobCompanyBy(Integer userId, Integer companyId) {		
		List<Map<String, Object>>  jobList = userJobMapper.getUserJobCompanyBy(new Page<Map<String, Object>>(), userId, companyId);
		return jobList;
	}
	/**
	 * 查找用户投递的职位
	 * @param userId
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> getUserJobs(Integer userId,Page<Map<String, Object>> page) {
		List<Map<String, Object>>  jobList = userJobMapper.getUserJobs(page, userId);
		return jobList;
	}
	
	public List<Map<String,Object>> findDeliverJob(Integer userId){
		List<Map<String, Object>>  jobList = userJobMapper.getDeliverJob(userId);
		return jobList;
	}
	
	
	public List<Map<String,Object>> findInterByUserId(Integer userId){
		List<Map<String, Object>>  list = interviewNoticeMapper.findIntervBywx(userId);
		return list;
	}
	
	public Map<String,Object> findInterById(Integer id){
		Map<String, Object>  map = interviewNoticeMapper.findInterviewNoticeById(id);
		return map;
	}
	/**
	 * 更新简历，简历可能设计到基本信息的更新
	 * @param userBasicInfo
	 * @param resume
	 *//*
	public void updateResume(Resume resume,int userId) {
		Resume r = resumeMapper.findResumeByUserId(userId);
		if(r == null){
			resumeMapper.insertResume(resume);
		}else{
			resumeMapper.updateResume(resume);
		}	
	}*/
/*	public void addResume(Resume resume,int userId) {
		resumeMapper.insertResume(resume);
	}*/
	/**
	 * 投递简历
	 * @param userId
	 * @param jobId
	 */
	public void diliverResume(UserJob userJob) {
		userJobMapper.insertUserJob(userJob);
	}
	
	public void uploadImg(File file) {
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("D://img/"+file.getName());
			fis = new FileInputStream(file);
			int len = 0;
			byte[] buffer = new byte[1024 * 512];
			while((len = fis.read(buffer, 0, len)) != -1) {
				fos.write(buffer);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}



	public Login login(String username) {
		if(StringUtil.isBlank(username)){
			return null;
		}
		return loginMapper.login(username);
	}
	
	/*
	 * 根据微信账号查询绑定的用户信息2014-03-24
	 * 
	 */
	public Login findUserByWxId(String joinId){
		return loginMapper.findLoginByJoinId(joinId);
	}
	
	public UserBasicInfo findUserBasicInfoByUserId(int loginId){
		return userBasicInfoMapper.findUserBasicInfoByUserId(loginId);
	}

	public CompanyInfo getCompanyInfoOf(int userId) {
		return companyMapper.getCompanyInfoOf(userId);
	}
	 /**
     * <p>查询所有注册用户信息<br/>
     * @title findUserAll<br/>
     * @date 2014-3-27 下午2:57:38<br/>
     * @author yejian<br/>
     * @version v1.0.0
     * @return
     */
	public Page<Map<String, Object>> findUserAll(Page<Map<String, Object>> page){
		page.setResults(userBasicInfoMapper.findUserAll(page));
		return page;
	}
	
	public void updateImge(Integer userId,String imge){
		userBasicInfoMapper.updateImge(userId, imge);
	}
	
	public Page<Map<String, Object>> findProposalsAll(Page<Map<String, Object>> page,int id){
		page.setResults(friendProposalsMapper.findProposalsAll(page,id));
		return page;
	}
	
	public Page<Map<String,Object>> findDeliveryRecord(Page<Map<String, Object>> page){
		page.setResults(userBasicInfoMapper.findDeliveryRecord(page));
		return page;
	}
	/**
	 * <p>查询统计用户数量<br/>
	 * @title findUserCount<br/>
	 * @date 2014-4-9 下午5:11:34<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param page
	 * @return
	 */
	public Page<Map<String, Object>> findUserCount(String responseTime,Page<Map<String, Object>> page){
		page.setResults(recordChartMapper.findUserCount(responseTime,page));
		return page;
	}
	
	public List<RecordChart> findByTime(String responseTime){
		List<RecordChart> list = recordChartMapper.findByTime(responseTime);
		return list;
	}
	public List<Map<String, Object>> recommendUser(Job job){
		List<Map<String, Object>> list = userBasicInfoMapper.findTuijUser(job);
		return list;
	}
	/**
	 * <p>记录用户登录信息<br/>
	 * @title insertRecordChart<br/>
	 * @date 2014-4-10 上午10:46:26<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param recordChart
	 */
	public void insertRecordChart(RecordChart recordChart){
		recordChartMapper.insertRecordChart(recordChart);
	}
	
	public void updateRecordChart(String responseTime,RecordChart recordChart){
		recordChartMapper.updateRecordChart(responseTime, recordChart);
	}
	
	public void insertWxUser(Login login,String nickname,String city,String headimgurl){
		loginMapper.insertUser(login);
		OAuthVO oauth = loginMapper.selectOAuthUser(login.getRegistId());
		if(oauth == null){
			loginMapper.insertOAuthUser(login.getRegistId(), login.getId(), nickname,
					"weixin login",1);
		}else{
			loginMapper.updateOAuthUser(login.getRegistId(), login.getId());
		}
//		List<UserBasicInfo> basicInfo = userBasicInfoMapper.findByUserId(login.getId());
//		if(basicInfo.size()<=1){
			UserBasicInfo userBasicInfo = new UserBasicInfo();
			userBasicInfo.setUserId(login.getId());
			userBasicInfo.setUserName(nickname);
			userBasicInfo.setGender(login.getNum());
			userBasicInfo.setCity(city);
			userBasicInfo.setHeadImg(headimgurl);
			userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);
		}
	/*}*/
	
	public List<AccessToken> getAccesstoin(String corpId){
		List<AccessToken> list = loginMapper.getAccessToken(corpId);
		return list;
	}
	
	public List<Map<String,Object>> getTicket(String corpId){
		List<Map<String,Object>> list = loginMapper.getTicket(corpId);
		return list;
	}
	
	public List<AccessToken> getAccesstoinByCorpId(String corpId){
		List<AccessToken> list = loginMapper.getAccesstoinByCorpId(corpId);
		return list;
	}
	public void addAccesstion(String access_token,Date expires_in,String corpId){
		loginMapper.addAccesstion(access_token, expires_in,corpId);
	}
	public void updateAccesstion(String access_token,Date expires_in,String corpId){
		loginMapper.updateAccesstion(access_token, expires_in,corpId);
	}
	
	public void updateTicket(String ticket,Date expires_in,String corpId){
		loginMapper.updateTicket(ticket, expires_in,corpId);
	}
	
	public void addtagUser(String tagName,Integer userId){
		TagUser tagUser = new TagUser();
		tagUser.setTagName(tagName);
		tagUser.setUserId(userId);
		tagUserMapper.insertTagUser(tagUser);
	}
	public void deltagUser(String tagName,Integer userId){
		TagUser tagUser = new TagUser();
		tagUser.setTagName(tagName);
		tagUser.setUserId(userId);
		tagUserMapper.deltagUser(tagUser);
	}
	/**
	 * <p>查询我收到的简历<br/>
	 * @title getReceiveResume<br/>
	 * @date 2015-1-23 下午12:26:20<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	public List<Map<String,Object>> getReceiveResume(int userId){
		List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<Map<String,Object>> userList = userBasicInfoMapper.findReceiveResume(userId);
		for(int i=0;i<userList.size();i++){
			Map<String, Object> map = new HashMap<String, Object>();
			if(userList.get(i).get("userId") != null){
				EducationExperience education= educationExperienceMapper.getMaxByUid((Integer) userList.get(i).get("userId"));
				map.put("university", education.getUniversity());
			}
			map.put(new String("userId"), userList.get(i).get("userId"));
			map.put(new String("userName"), userList.get(i).get("userName"));
			map.put(new String("jobId"), userList.get(i).get("jobId"));
			map.put(new String("jobName"), userList.get(i).get("jobName"));
			map.put(new String("status"), userList.get(i).get("status"));
			String workReady = userList.get(i).get("workReady").toString();
			String monthReady = userList.get(i).get("monthReady").toString();
			int t = 0;
			for (int j = 0; j <workReady.length(); j++) {
				String b = workReady.substring(j,j+1);
				if("周".equals(b)){
					t++;
				}
			}
			map.put(new String("workReady"), t);
			int n = 0;
			for (int m = 0; m <monthReady.length(); m++) {
				String f = monthReady.substring(m,m+1);
				if("月".equals(f)){
					n++;
				}
			}
			map.put(new String("monthReady"), n);
			list.add(map);
		}
		return list;
	}
}
