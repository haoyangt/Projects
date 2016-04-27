package com.szfore.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jodd.io.FileUtil;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szfore.action.company.CompanyAction;
import com.szfore.action.company.vo.CompanyIndexData;
import com.szfore.cache.CacheManager;
import com.szfore.cache.RedisCache;
import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.EducationExperienceMapper;
import com.szfore.mapper.FriendProposalsMapper;
import com.szfore.mapper.InternMapper;
import com.szfore.mapper.ItSkillMapper;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.RelevanceMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.mapper.VocationalSkillsMapper;
import com.szfore.model.AccessToken;
import com.szfore.model.CompanyInfo;
import com.szfore.model.EducationExperience;
import com.szfore.model.FriendProposals;
import com.szfore.model.Intern;
import com.szfore.model.ItSkill;
import com.szfore.model.Login;
import com.szfore.model.OAuthVO;
import com.szfore.model.RecordChart;
import com.szfore.model.Relevance;
import com.szfore.model.UserBasicInfo;
import com.szfore.model.VocationalSkills;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.RequestBean;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;
import com.szfore.service.JobService;
import com.szfore.service.UserService;
import com.szfore.util.ActionUtil;
import com.szfore.util.DateUtil;
import com.szfore.util.ImageCut;
import com.szfore.util.JsonUtil;
import com.szfore.utils.EmailUtils;
import com.szfore.utils.EnumMethod;
import com.szfore.utils.HttpRequestUtil;
import com.szfore.utils.PropertyUtils;


@Controller
public class ViewAction {
	
	@Autowired
	JobService jobService; 
	@Autowired
	private UserService userService;
	@Autowired
	CacheManager cacheManager;
	@Autowired
	CompanyMapper companyMapper;
	@Autowired
	UserJobMapper userJobMapper;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	@Autowired
	private RelevanceMapper relevanceMapper;
	@Autowired
	private InternMapper internMapper;
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private EducationExperienceMapper educationExperienceMapper;
	@Autowired
	private FriendProposalsMapper friendProposalsMapper;
	@Autowired
	private ItSkillMapper itSkillMapper;
	@Autowired
	private VocationalSkillsMapper vocationalSkillsMapper;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/requestView")
	public String requestView(){ 
		String code = request.getParameter("code");
		System.out.println("code===="+code);
		System.out.println("getAccessToken(code)=="+getAccessToken(code));
		String userBase[] = getAccessToken(code).split(",openid:");
		System.out.println("userBase[1]=="+userBase[1]);
		String access_token = userBase[0];
		String openid = userBase[1];
		System.out.println("access_token====="+access_token);
		System.out.println("openid====="+openid);
		String userUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
		userUrl.replace("ACCESS_TOKEN", access_token).replace("OPENID", openid);
		JSONObject jsonObject = HttpRequestUtil.httpRequest(userUrl, EnumMethod.GET.name(), null);
		System.out.println("用户信息====="+jsonObject);
		return "index";
	}
	
	
	public  String getAccessToken(String code) {
		String access_token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		//String refUrl = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
		String appid = "wx332c52fcf25c99e9";
		String appsecret = "d57ccf9ca1b8a8c3ab57ffd973960dd6";
		String access_token = "";
		String openid = "";
		List<AccessToken> list = userService.getAccesstoin(appid);
		if(list.size()<1){
			String requestUrl = access_token_url.replace("CODE", code).replace("APPID", appid).replace("SECRET", appsecret);
			System.err.println(requestUrl);
			JSONObject jsonObject22 = HttpRequestUtil.httpRequest(requestUrl, EnumMethod.GET.name(), null);
			System.out.println("jsonObject22==="+jsonObject22);
			access_token = jsonObject22.getString("access_token");
			openid = jsonObject22.getString("openid");
			List<AccessToken> lists = userService.getAccesstoinByCorpId(appid);
			if(lists.size() >= 1){
				userService.updateAccesstion(access_token,new Date(),appid);
			}else{
				userService.addAccesstion(access_token,new Date(), appid);
			}
		}else if(list.get(0).getCorpId().isEmpty()){
			String requestUrl = access_token_url.replace("CODE", code).replace("APPID", appid).replace("SECRET", appsecret);
			System.err.println(requestUrl);
			JSONObject jsonObject22 = HttpRequestUtil.httpRequest(requestUrl, EnumMethod.GET.name(), null);
			System.out.println("jsonObject22==="+jsonObject22);
			access_token = jsonObject22.getString("access_token");
			openid = jsonObject22.getString("openid");
			List<AccessToken> lists = userService.getAccesstoinByCorpId(appid);
			if(lists.size() >= 1){
				userService.updateAccesstion(access_token,new Date(),appid);
			}else{
				userService.addAccesstion(access_token,new Date(), appid);
			}
		}else{
			access_token = list.get(0).getToken();
			openid = list.get(0).getCorpId();
		}
		return access_token+",openid:"+openid;
	}
	
	@RequestMapping("/topCompany")
	public String topCompany(Map<String,Object> data) {
		//List <Map <String,Object>> list = new ArrayList <Map <String,Object>>();
		List<Map<String, Object>> companys = companyMapper.getTopCompanys();
		/*for(int i=0;i<companys.size();i++){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", companys.get(i).get("id"));
			map.put("companyName", companys.get(i).get("companyName"));
			map.put("companyLogo", companys.get(i).get("companyLogo"));
			String companyShortName = "";
			if(companys.get(i).get("companyShortName").toString().length()>5){
				companyShortName = companys.get(i).get("companyShortName").toString().substring(0, 5);
			}else{
				companyShortName = companys.get(i).get("companyShortName").toString();
			}
			map.put("companyShortName", companyShortName);
			String companyDesc = "";
			if(companys.get(i).get("companyDesc").toString().length()>16){
				companyDesc = companys.get(i).get("companyDesc").toString().substring(0, 16);
			}else{
				companyDesc = companys.get(i).get("companyDesc").toString();
			}
			map.put("companyDesc", companyDesc);
			map.put("companySlogan", companys.get(i).get("companyLogo"));
			list.add(map);
		}*/
		data.put("companys", companys);
		return "topCompany";
	}
	
	@RequestMapping("/topCompanyPhone")
	public String topCompanyPhone(Map<String,Object> data) {
		List<Map<String, Object>> companys = companyMapper.getTopCompanysPhone();
		data.put("companys", companys);
		return "m/topCompany";
	}
	/**
	 * <p>首页全部职位<br/>
	 * @title indexModel<br/>
	 * @date 2014-8-8 上午10:32:30<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param page
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/indexModel")
	public String indexModel(@SessionValue("userId")Integer userId,
			@ModelAttribute("page")Page page) {
		jobService.searhJobSan(userId,page);
		return "indexModel";
	}
	/**
	 * <p>手机云适配首页全部职位<br/>
	 * @title indexModel<br/>
	 * @date 2014-8-8 上午10:32:30<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param page
	 * @return
	 */
	@RequestMapping("/indexModelSanPhone")
	public String indexModelSanPhone(
			Map<String,Object> data) {
		Integer userId = (Integer) session.getAttribute("userId");
		data.put("jobs", jobService.allJobsSanPhone(userId));
		return "m/allJobs";
	}
	
	@RequestMapping("/indexModelPhone/{num}")
	public String indexModelPhone(@SessionValue("userId")Integer userId,
			String CjName,
			String city,
			String xueli,
			String jobCategory,
			String releaseTime,
			String scope, 
			@PathVariable("num")int num,Map<String,Object> data) {
		System.out.println(releaseTime);
		List <Map <String,Object>> jobList = jobService.allJobsPhone(userId,num,CjName,city,xueli,jobCategory,releaseTime,scope);
		data.put("jobs", jobList);
		data.put("num", num);
		data.put("CjName", CjName);
		data.put("jobsCount", jobList.size());
		return "m/hotJobs";
	}
	
	@RequestMapping("/hotJobIndexPhone/{num}")
	public String hotJobIndexPhone(
			String CjName,
			String city,
			String xueli,
			String jobCategory,
			String releaseTime,
			String scope, 
			@PathVariable("num")int num,Map<String,Object> data){
		Integer userId = (Integer) session.getAttribute("userId");
		List <Map <String,Object>> jobList = jobService.hotJobsPhone(userId,num,CjName,city,xueli,jobCategory,releaseTime,scope);
		data.put("jobs", jobList);
		data.put("num", num);
		data.put("CjName", CjName);
		data.put("jobsCount", jobList.size());
		return "m/hotJobs";
	}
	
	@RequestMapping("/indexModelall")
	public String indexModelall(HttpServletRequest request,@SessionValue("userId")Integer userId,
			String jobName,String xueli,String jobCategory,String releaseTime,
			String scope,String jobAttrValue,String jobAreaValue,
			@ModelAttribute("page")Page<Map<String,Object>> page){
		System.out.println("jobName==="+jobName);
		System.out.println("xueli==="+xueli);
		System.out.println("jobCategory==="+jobCategory);
		System.out.println("releaseTime==="+releaseTime);
		System.out.println("scope==="+scope);
		System.out.println("jobAttrValue==="+jobAttrValue);
		System.out.println("jobAreaValue==="+jobAreaValue);
		//jobService.searhJobsByTerm(userId,jobName,xueli,jobCategory,releaseTime,scope,jobAttrValue, jobAreaValue, page);
		jobService.searhJobsByKeyword(userId,jobName,page);
		return "indexModelall";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		/*boolean b = HttpRequestDeviceUtils.isMobileDevice(request);
		if(b){
			return "indexPc";
		}else{*/
			return "indexPc";
		//}
	}
	
	@RequestMapping("/jobDetail/{jobId}")
	public String jobDetail(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")int jobId,Map<String,Object> data) {
		if(userId != null) {
		   int num = userJobMapper.getUserJobNumBy(userId, jobId);
		   if(num > 0) {
			   data.put("diliverStatus", 1);
		   }
		}
		jobMapper.updatePageView(jobId);
		data.putAll(jobService.findJobDetailById(jobId));
		return "job/jobDetail";
	}
	
	
	@RequestMapping("/jobDetailPhone/{jobId}")
	public String jobDetailPhone(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")int jobId,Map<String,Object> data) {
		if(userId != null) {
		   int num = userJobMapper.getUserJobNumBy(userId, jobId);
		   if(num > 0) {
			   data.put("diliverStatus", 1);
		   }
		}
		jobMapper.updatePageView(jobId);
		data.putAll(jobService.findJobDetailById(jobId));
		return "m/jobDetails";
	}
	
	//新增2014-03-24
	@RequestMapping("/jobDetailOnWx/{jobId}/{userId}")
	public String jobDetailOnWx(HttpSession session,HttpServletRequest request,@PathVariable("jobId")int jobId,Map<String,Object> data,@PathVariable("userId")Integer userId) {
		/*session.setAttribute("userId", userId);*/
		
		if(userId == 0) {
			session.setAttribute("requestURL", request.getRequestURL());
			session.setAttribute("userId", userId);
		} else {
			/*Integer roleId=loginMapper.findLoginByUserId(userId).getRoleId();
			session.setAttribute("roleId", roleId);*/
			Login login=loginMapper.findLoginByUserId(userId);
			setSessionValue(login);
		   int num = userJobMapper.getUserJobNumBy(userId, jobId);
		   if(num > 0) {
			   data.put("diliverStatus", 1);
		   }
		}
		jobMapper.updatePageView(jobId);	//更新浏览量
		data.putAll(jobService.findJobDetailById(jobId));
		return "openLogin/jobDetailOnWx";
	}
	
	//新增针对微信后台推送
	@RequestMapping("/jobDetailOnWxSend/{jobId}")
	public String jobDetailOnWxSend(HttpSession session,HttpServletRequest request,@PathVariable("jobId")int jobId,Map<String,Object> data,@SessionValue("userId")Integer userId) {
		System.out.println(userId);
		if(userId == null) {
			System.out.println("hello");
			session.setAttribute("requestURL", request.getRequestURL().toString());
		} else {
		   int num = userJobMapper.getUserJobNumBy(userId, jobId);
		   if(num > 0) {
			   data.put("diliverStatus", 1);
		   }
		}
		jobMapper.updatePageView(jobId);	//更新浏览量
		data.putAll(jobService.findJobDetailById(jobId));
		return "openLogin/wxsend/jobDetailOnWxSend";
	}
		
		
	/**
	 * 用户找回密码
	 * @param request
	 * @param email
	 * @param password
	 * @param roleId
	 * @param data
	 * @return
	 */
	@RequestMapping("/updatepasses")
	public String updatepass(HttpServletRequest request,String email,Map<String,Object> data) {
		Login l = loginMapper.findUserByEmail(email);
	    if(l == null) {  //只有非法操作才会出现这种情况
	    	data.put("msg", "该账号不存在，请重新输入");
			return "user/upadtePass";
	    }
		String registId = EmailUtils.genRegistId();
		String urlStr = PropertyUtils.getProperty("projectUrl")+"loginEmail/"+email+"/"+registId;
		System.out.println("--------urlStr:"+urlStr);
		String html = null;
		try {
			//if(roleId!=1){
				html = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendPassEmail(registId, email, html);
			//}
		} catch (Exception e) {
			e.printStackTrace();
			data.put("msg", "重置失败");
			return "user/regist";
		}
		//userService.regist(login,registId,html);
		data.put("email", email);
		String a[] = email.split("@");
		data.put("domain", a[1]);
		return "user/findPass";
	}
	
	/**
	 * 发邮箱提示，点击链接进行修改密码
	 * @param email
	 * @param registId
	 * @param data
	 * @return
	 */
	@RequestMapping("/loginEmail/{email}/{registId}")
	public String resetPass(@PathVariable("email")String email,@PathVariable("registId")String registId,Map<String,Object> data) {
		String validateUrl = EmailUtils.genValidateUrlPass(registId, email);
		data.put("email", email);
		data.put("validateUrl", validateUrl);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "user/loginEmail";
	}
	
	@RequestMapping("/activeEmailPass")
	public String activeEmailPass(String email,String registId,Map<String,Object> data) {
		data.put("email", email);
		return "user/resetPass";
	}
	
	@RequestMapping("/resetPassWord")
	public String resetPassWord(HttpServletRequest request,String email,String password,Map<String,Object> data){
		if(!"".equals(password) && password != null){
			loginMapper.updateByEmail(email, password);
			data.put("msg", "密码重置成功");
			Login login = loginMapper.login(email);
			loginMapper.updateUserLoginInfo(login.getId());//更新登录时间
			//if(login.getRoleId()==1){
			setSessionValue(login);
			//}
			return "indexPc";
		}else{
			return "login";
		}
	}
	private void setSessionValue(Login login){
		session.setAttribute("userId", login.getId());
		session.setAttribute("email", login.getEmail());
		session.setAttribute("roleId", login.getRoleId());
		session.setAttribute("num", login.getNum());
		UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(login.getId());
		if (userBasicInfo != null) {
			session.setAttribute("userName", userBasicInfo.getUserName());
			session.setAttribute("userEmail",userBasicInfo.getEmail());
			session.setAttribute("quantityHH", userBasicInfoMapper.findQuantity(login.getId()));
			session.setAttribute("quantity", userBasicInfo.getQuantity());
		}
		List<EducationExperience> list = educationExperienceMapper.getByUserId(login.getId());
		if(list.size()>0){
			session.setAttribute("university", list.get(0).getUniversity().toString());
		}
		/*OAuthVO oAuthVO = loginMapper.oAuthAccessToken(login.getId(),"sina microblog");
		if(oAuthVO!=null){
			session.setAttribute("accessToken", oAuthVO.getAccessToken());
		}*/
		if (login.getRoleId() == 1) {
			CompanyInfo companyInfo = companyMapper.getCompanyInfoOf(login.getId());
			if (companyInfo != null) {
				session.setAttribute("companyId", companyInfo.getId());
				session.setAttribute("certifyStatus",companyInfo.getCertifyStatus());
			}
		}
	}
	
	/**
	 * <p>激活公司邮箱<br/>
	 * @title activationCode<br/>
	 * @date 2014-4-1 上午10:40:40<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping("/activationCode")
	public String activationCode(HttpServletRequest request,String cdkey,String email,String password,Map<String,Object> data) {
		List<CompanyInfo> list = companyMapper.getCompanyBycdkey(cdkey);
	    if(list.size()<1) {  //只有非法操作才会出现这种情况
	    	data.put("msg", "该激活码不存在或已使用，请重新输入!");
			return "company/activate";
	    }
	    List<CompanyInfo> list2 = companyMapper.getCompanyByEmail(email);
	    if(list2.size()>=1) {  //只有非法操作才会出现这种情况
	    	data.put("msg", "该用户已开通招聘，请重新输入用户!");
			return "company/activate";
	    }
	    session.setAttribute("cdkey", cdkey);
	    session.setAttribute("passWord", password);
	    session.setAttribute("companyName", list.get(0).getCompanyName());
		String registId = EmailUtils.genRegistId();
		String urlStr = PropertyUtils.getProperty("projectUrl")+"activateEmail/"+email+"/"+registId;
		String html = null;
		try {
			html = EmailUtils.convertHtmlToStr(request, urlStr);
			userService.sendActivationEmail(registId, email, html);
		} catch (Exception e) {
			e.printStackTrace();
			data.put("msg", "激活失败");
			return "company/activate";
		}
		data.put("email", email);
		String a[] = email.split("@");
		data.put("domain", a[1]);
		return "company/findCompany";
	}
	
	/**
	 * <p>发邮件提示，点击链接激活公司邮箱<br/>
	 * @title activate<br/>
	 * @date 2014-4-1 上午11:05:53<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param registId
	 * @param data
	 * @return
	 */
	@RequestMapping("/activateEmail/{email}/{registId}")
	public String activate(@PathVariable("email")String email,@PathVariable("registId")String registId,Map<String,Object> data) {
		String cdkey = (String) session.getAttribute("cdkey");
		String password = (String) session.getAttribute("passWord");
		String companyName = (String) session.getAttribute("companyName");
		session.removeAttribute("cdkey");
		session.removeAttribute("passWord");
		session.removeAttribute("companyName");
		String validateUrl = EmailUtils.genValidateUrlActivate(registId, email,cdkey,password,companyName);
		data.put("email", email);
		data.put("validateUrl", validateUrl);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "company/activateCompany";
	}
	
	@RequestMapping("/activeEmailCompany")
	public String activeEmailCompang(HttpServletRequest request,String email,
			String registId,String cdkey,String password,
			String companyName,Map<String,Object> data) {
		int userId;
		Login l = loginMapper.findUserByEmail(email);//查询该email是否注册过要实习
		if(l == null){
			Login login = new Login();
			login.setEmail(email);
			login.setPassword(password);
			login.setRoleId(1);
			login.setRegistId(registId);
			login.setActiveStatus(1);
			loginMapper.insertUser(login);
			userId = login.getId();
			//插入基本信息表
			UserBasicInfo userBasicInfo = new UserBasicInfo();
			userBasicInfo.setUserId(userId);
			userBasicInfo.setEmail(login.getEmail());
			userBasicInfo.setUserName(companyName);
			userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);
			/*//插入简历表
			Resume resume = new Resume();
			resume.setUserId(userId);
			resume.setTimeAvailable(1);
			resumeMapper.insertResume(resume);*/
		}else{
			userId = l.getId();
			loginMapper.updateRoleId(userId);
		}
		companyMapper.updateByCdkey(cdkey, email,userId);
		// 记录激活用户量
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		recordChart.setCompanyUser(1);
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
				"yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);
		}
		// 记录激活用户量
		String urlStr = PropertyUtils.getProperty("projectUrl")+"welCompanyEmail/"+email+"/"+userId;
		String html = null;
		try {
			html = EmailUtils.convertHtmlToStr(request, urlStr);
			userService.sendWelEmail(email, html);
		} catch (Exception e) {
			e.printStackTrace();
			data.put("msg", "发送失败");
		}
		data.put("companyName", companyName);
		data.put("email", email);
		data.put("passWord", password);
		return "company/activationSuccess";
	}
	
	/**
	 * <p>用户激活和发送欢迎的邮件<br/>
	 * @title activeEmail<br/>
	 * @date 2014-4-3 下午1:59:24<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param email
	 * @param registId
	 * @param data
	 * @return
	 */
	@RequestMapping("/activeEmail")
	public String activeEmail(HttpServletRequest request,String email,String registId,Map<String,Object> data) {
		userService.activeRegist(registId, email);
		Login login = loginMapper.findUserByEmail(email);
		setSessionValue(login);
		if(login.getRoleId()!=1){
			String urlStr = PropertyUtils.getProperty("projectUrl")+"welEmail/"+email;
			String html = null;
			try {
				html = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendWelEmail(email, html);
			} catch (Exception e) {
				e.printStackTrace();
				data.put("msg", "发送失败");
			}
			data.put("email", email);
			return "user/addUserBasicInfo";
		}else{
			/*String urlStr = PropertyUtils.getProperty("projectUrl")+"welCompanyEmail/"+email+"/"+login.getId();
			String html = null;
			try {
				html = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendWelEmail(email, html);
			} catch (Exception e) {
				e.printStackTrace();
				data.put("msg", "发送失败");
			}*/
			data.put("company", companyMapper.getCompanyInfoOf(login.getId()));
			data.put("email", email);
			return "company/companyRegist";
		}
	}
	@RequestMapping("/welCompanyH")
	public String welCompanyH(HttpServletRequest request,String email,String registId,Map<String,Object> data){
		userService.activeRegist(registId, email);
		Login login = loginMapper.findUserByEmail(email);
		setSessionValue(login);
		CompanyInfo companyInfo = companyMapper.getCompanyInfoOf(login.getId());
		CompanyIndexData companyIndexData = companyService.load(companyInfo.getId()); 
		data.put("company", companyIndexData);
		data.put("isCompany", true);
		data.put("email", email);
		return "company/index";
	}
	/**
	 * <p>用户激活后发邮件的欢迎页面<br/>
	 * @title welEmailHtml<br/>
	 * @date 2014-4-3 下午1:49:23<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping("/welEmail/{email}")
	public String welEmailHtml(@PathVariable("email")String email,Map<String,Object> data) {
		data.put("email", email);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "user/welRegister";
	}
	
	@RequestMapping("/welCompanyEmail/{email}/{userId}")
	public String welCompanyEmail(@PathVariable("email")String email,@PathVariable("userId")Integer userId,Map<String,Object> data) {
		String registId = EmailUtils.genRegistId();
		String validateUrl = EmailUtils.welValidateUrl(registId, email,userId);
		data.put("validateUrl", validateUrl);
		data.put("email", email);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "company/welCompanyRegister";
	}
	/**
	 * <p>用户评论公司判断是否被录用而决定调用的页面<br/>
	 * @title companyRelevance<br/>
	 * @date 2014-4-3 上午9:53:38<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId 用户id
	 * @param companyId 公司id
	 * @param jobId 职位id
	 * @param data
	 * @return
	 */
	@RequestMapping("/commentCompany/{userId}/{companyId}/{jobId}")
	public String userRelevance(@PathVariable("userId")int userId,@PathVariable("companyId")int companyId ,@PathVariable("jobId")int jobId ,Map<String,Object> data) {
		Relevance relevance = relevanceMapper.getUserRelevance(userId, companyId,2,jobId);
		/*System.out.println("companyId="+companyId);
		System.out.println("userId="+userId);
		System.out.println("jobId="+jobId);*/
		List<Intern> list = internMapper.findEntry(companyId, userId, jobId);
		if(list.size()>0){
			if(relevance!=null){
				data.put("content", relevance.getContent());
			}
			data.put("uId", userId);
			data.put("cId", companyId);
			data.put("jobId", jobId);
		}else{
			data.put("msg", "您还未被该企业录用");
		}
		return "company/commentCompany";
	}
	@RequestMapping("/businessLicense")
	@ResponseBody
	public String saveBusinessLicense(HttpServletRequest request, 
			@SessionValue("companyId")Integer companyId, 
			String photoName, 
			Integer x, 
			Integer y, 
			Integer width, 
			Integer height){
		if(x==null || y==null || width==null || height==null){
			x=0;
			y=0;
			width=3500;
			height=3500;
		}
		String srcPhotoPath = getContextPath(request) + CompanyAction.UPLOAD_LOGO_DIR + photoName;
		ImageCut.abscut(srcPhotoPath, srcPhotoPath, x, y, width, height);
		
		String headTmpImgPath = PropertyUtils.getProperty("headImg");
		try {
			FileUtil.move(srcPhotoPath, headTmpImgPath + photoName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("statusCode", 1);
		result.put("path", "user/getHeadPhoto?ImgPath="+photoName);
		return JsonUtil.toJson(result); 
	}
	@RequestMapping("/organizationCode")
	@ResponseBody
	public String saveOrganizationCode(HttpServletRequest request, 
			@SessionValue("companyId")Integer companyId, 
			String photoName, 
			Integer x, 
			Integer y, 
			Integer width, 
			Integer height){
		if(x==null || y==null || width==null || height==null){
			x=0;
			y=0;
			width=3500;
			height=3500;
		}
		String srcPhotoPath = getContextPath(request) + CompanyAction.UPLOAD_LOGO_DIR + photoName;
		ImageCut.abscut(srcPhotoPath, srcPhotoPath, x, y, width, height);
		String headTmpImgPath = PropertyUtils.getProperty("headImg");
		try {
			FileUtil.move(srcPhotoPath, headTmpImgPath + photoName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("statusCode", 1);
		result.put("path", "user/getHeadPhoto?ImgPath="+photoName);
		return JsonUtil.toJson(result); 
	}
	private String getContextPath(HttpServletRequest request) 
	{
		return request.getServletContext().getRealPath("/");
	}
	
	@RequestMapping("/regiset/{num}")
	public String regiset(@PathVariable("num")Integer num,Map<String,Object> data){
		data.put("num", num);
		return "user/regiset";
	}
	
	/**
	 * <p>每日10:30向hr的邮箱发有多少封简历未处理的提醒信息<br/>
	 * @title resumeUnprocessed<br/>
	 * @date 2014-8-5 下午3:45:19<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @throws UnsupportedEncodingException 
	 */
	@RedisCache
	public void resumeUnprocessed() throws UnsupportedEncodingException{
		List<Map<String, Object>> list = jobMapper.findResumeUnprocessed();
		System.out.println("简历未处理list.size()===="+list.size());
		if(list.size()>0){
			String email = "";
			String cdkey = "";
			String cName = "";
			String companyName = "";
			String num = "";
			String urlStr = "";
			String html = "";
			for(int i=0;i<list.size();i++){
				if(list.get(i).get("email") != null && !"".equals(list.get(i).get("email"))){
					email = list.get(i).get("email").toString();
					System.out.println("简历未处理email==="+email);
					cdkey = list.get(i).get("cdkey").toString();
					cName = list.get(i).get("companyName").toString();
					companyName = URLEncoder.encode(cName, "utf-8");
					num = list.get(i).get("num").toString();
					urlStr = PropertyUtils.getProperty("projectUrl")+"resumeRemind/"+num+"/"+cdkey+"/"+companyName;
					try {
						html =  JobService.convertHtmlToStr(urlStr);
						companyService.sendEmail("要实习-简历未处理提醒",email, html);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}	
		}
	}
	
	@RequestMapping("resumeRemind/{num}/{cdkey}/{companyName}")
	public String resumeRemind(@PathVariable("num")Integer num,@PathVariable("cdkey")String cdkey,
			@PathVariable("companyName")String companyName,Map<String,Object> data){
		data.put("num", num);
		data.put("companyName", companyName);
		data.put("cdkey", cdkey);
		return "company/job/resumeRemind";
	}
	/**
	 * <p>每周一8:00自动执行方法，提醒HR发布的职位上一周的浏览次数，有多少简历待处理<br/>
	 * @title jobDetailsByEmails<br/>
	 * @date 2015-3-16 下午2:04:47<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @throws UnsupportedEncodingException 
	 */
	public void jobDetailsByEmails() throws UnsupportedEncodingException{
		List<Map<String, Object>> list = jobService.findJobDetails();
		if(list.size()>0){
			String email = "";
			String jobName = "";
			String html = null;
			String urlStr = "";
			String jobCont="";
			String pageView = "";
			for(int i=0;i<list.size();i++){
				if(list.get(i).get("email") !=null && !"".equals(list.get(i).get("email"))){
					email = list.get(i).get("email").toString();
					System.out.println("下线通知email===="+email);
					jobName = URLEncoder.encode(list.get(i).get("jobName").toString(), "utf-8");
					System.out.println("下线通知职位===="+jobName);
					pageView = list.get(i).get("pageView").toString();
					jobCont = list.get(i).get("jobCont").toString();
					urlStr = PropertyUtils.getProperty("projectUrl")+"jobDetailsEmail/"+email+"/"+jobName+"/"+pageView+"/"+jobCont;
					try {
						html =  JobService.convertHtmlToStr(urlStr);
						if("cv@yaoshixi.com".equals(email)){
							companyService.sendEmail("要实习-职位状态提醒","yaoshixi@szfore.com", html);
						}else{
							companyService.sendEmail("要实习-职位状态提醒",email, html);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	@RequestMapping("/jobDetailsEmail/{email}/{jobName}/{pageView}/{jobCont}")
	public String jobDetailsEmail(@PathVariable("email")String email,
			@PathVariable("jobName")String jobName,@PathVariable("pageView")String pageView,
			@PathVariable("jobCont")String jobCont,Map<String,Object> data){
		data.put("email", email);
		data.put("jobName", jobName);
		data.put("pageView", pageView);
		data.put("jobCont", jobCont);
		return "company/job/jobDetailsByEmail";
	}
	
	/**
	 * <p>每天10:15自动执行的方法（企业HR在5天内没有点击浏览简历，更改简历状态；职位超过10天自动下线）<br/>
	 * @title deleteByTime<br/>
	 * @date 2014-4-8 下午4:55:25<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @throws UnsupportedEncodingException 
	 */
	@RedisCache
	public void deleteByTime() throws UnsupportedEncodingException{
		List<Map<String, Object>> list = jobMapper.findByTime();
		System.out.println("职位下线通知list.size()===="+list.size());
		if(list.size()>0){
			String email = "";
			String jobName = "";
			Integer companyId = null;
			String urlStr = "";
			String html = null;
			for(int i=0;i<list.size();i++){
				if(list.get(i).get("email") !=null && !"".equals(list.get(i).get("email"))){
					email = list.get(i).get("email").toString();
					System.out.println("下线通知email===="+email);
					jobName = URLEncoder.encode(list.get(i).get("jobName").toString(), "utf-8");
					System.out.println("下线通知职位===="+jobName);
					companyId = Integer.valueOf(list.get(i).get("companyId").toString());
					urlStr = PropertyUtils.getProperty("projectUrl")+"jobReferrals/"+companyId+"/"+email+"/"+jobName;
					try {
						html =  JobService.convertHtmlToStr(urlStr);
						if("cv@yaoshixi.com".equals(email)){
							companyService.sendEmail("要实习-职位下线通知","yaoshixi@szfore.com", html);
						}else{
							companyService.sendEmail("要实习-职位下线通知",email, html);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			jobMapper.deleteByTime();
		}
		List<Map<String, Object>> lists = userJobMapper.findUserJobByTime();
		System.out.println("简历未处理lists.size()===="+lists.size());
		if(lists.size()>0){
			String userEmail = "";
			String userJobName = "";
			String userUrl = "";
			String htmls = "";
			for(int j=0;j<lists.size();j++){
				if(lists.get(j).get("email") !=null && !"".equals(lists.get(j).get("email"))){
					userEmail = lists.get(j).get("email").toString();
					System.out.println("emial简历未处理===="+userEmail);
					userJobName = URLEncoder.encode(lists.get(j).get("jobName").toString(), "utf-8");
					System.out.println("jobName简历未处理===="+userJobName);
					userUrl = PropertyUtils.getProperty("projectUrl")+"stonyUserOut/"+userEmail+"/"+userJobName;
					try {
						htmls =  JobService.convertHtmlToStr(userUrl);
						companyService.sendEmail("要实习-您的简历未处理，去看看吧！",userEmail, htmls);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			userJobMapper.updateStar(5);
		}
	}
	/**
	 * <p>提醒职位下线的邮件<br/>
	 * @title jobReferrals<br/>
	 * @date 2014-4-19 上午10:17:47<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param jobName
	 * @param data
	 * @return
	 */
	@RequestMapping("/jobReferrals/{companyId}/{email}/{jobName}")
	public String jobReferrals(@PathVariable("companyId")Integer companyId,
			@PathVariable("email")String email,
			@PathVariable("jobName")String jobName,Map<String,Object> data) {
		//System.out.println("TapeOutEmail==="+email);
		//System.out.println("TapeOutJobName==="+jobName);
		/*String email = job.getEmail();
		String jobName = job.getJobName();*/
		data.put("email", email);
		data.put("jobName", jobName);
		/*String registId = EmailUtils.genRegistId();
		String validateUrl = EmailUtils.genValidateUrljobReferrals(registId, email,companyId);
		data.put("validateUrl", validateUrl);*/
		return "company/job/jobReferrals"; 
	} 
	/**
	 * <p>链接跳转到该公司发布的职位页面<br/>
	 * @title genValidateUrljobReferrals<br/>
	 * @date 2014-4-19 上午10:17:57<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping("/activeEmailjobReferrals")
	public String genValidateUrljobReferrals(HttpServletRequest request,String email,Integer companyId,Map<String,Object> data) {
		Login login = loginMapper.findUserByEmail(email);
		if(login!=null){
			if(login.getRoleId()==1){
				setSessionValue(login);
			}else{
				loginMapper.updateRoleId(login.getId());
				companyMapper.updateUserIdById(companyId,login.getId());
			}
			return "company/job/index";
		}else{
			data.put("email", email);
			data.put("companyId", companyId);
			return "user/CompanyRegist";
		}
	}
	
	@RequestMapping("/stonyUserOut/{userEmail}/{userJobName}")
	public String stonyUserOut(@PathVariable("userEmail")String userEmail,
			@PathVariable("userJobName")String userJobName,Map<String,Object> data) {
		//System.out.println("userJobName==="+userJobName);
		data.put("email", userEmail);
		data.put("jobName", userJobName);
		return "user/stonyGround"; 
	} 
	/**
	 * <p>简历附件的下载<br/>
	 * @title getFileDown<br/>
	 * @date 2014-5-13 上午11:12:41<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param response
	 * @param filePath
	 */
	@RequestMapping("/getFileDown")
	public void getFileDown(HttpServletRequest request,
			HttpServletResponse response, String filePath) {
		if (filePath != null & !"".equals(filePath)) {
			String basePath = PropertyUtils.getProperty("headImg");
			File f = new File(basePath);
			if (!f.exists()) {
				f.mkdirs();
			}
			File file = new File(basePath+filePath);
			ActionUtil.downloadFile(request, response, file);
		}
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/hotJobs")
	public String hotJobs(@SessionValue("userId")Integer userId,
			@ModelAttribute("page")Page page){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = jobService.hotJobs(userId,page);
		page.setResults(list);
		return "indexModelHost";
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/hotJobsSan")
	public String hotJobsSan(@SessionValue("userId")Integer userId,
			@ModelAttribute("page")Page page){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		System.out.println("userId===="+userId);
		list = jobService.hotJobsSan(userId);
		page.setResults(list);
		return "indexModel";
	}
	
	@RequestMapping("/hotJobPhone")
	public String hotJobPhone(Map<String,Object> data){
		Integer userId = (Integer) session.getAttribute("userId");
		data.put("jobs", jobService.hotJobsSanPhone(userId));
		return "m/hotJobs";
	}
	
	
	
	@RequestMapping("/inviteRegister/{userId}")
	public String inviteRegister(@PathVariable("userId")String userId, Map<String,Object> data){
		data.put("userId", userId);
		return "user/regist";
	}
	/**
	 * <p>首页向我推荐<br/>
	 * @title indRecommendSan<br/>
	 * @date 2014-8-8 上午10:23:08<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param page
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/indRecommendSan")
	public String indRecommendSan(@SessionValue("userId") Integer userId,
			@ModelAttribute("page") Page page) {
		if(userId==null){
			return "ogInFirst";
		}else{
			UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			if ((!"".equals(userBasicInfo.getCity()) && userBasicInfo.getCity() != null)) {
				list = jobService.JobsRecdSan(userId, userBasicInfo);
				if (list.size() > 0) {
					page.setResults(list);
					return "indexModel";
				} else {
					return "reminder";
				}
			} else {
				return "recommend";
			}
		}
	}
	/**
	 * <p>手机云适配首页向我推荐<br/>
	 * @title indRecommendSan<br/>
	 * @date 2014-8-8 上午10:23:08<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param page
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/indRecommendSanPhone")
	public String indRecommendSanPhone(
			@ModelAttribute("page") Page page) {
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId==null){
			return "m/ogInFirst";
		}else{
			UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			if ((!"".equals(userBasicInfo.getCity()) && userBasicInfo.getCity() != null)) {
				list = jobService.JobsRecdSanPhone(userId, userBasicInfo);
				if (list.size() > 0) {
					page.setResults(list);
					return "m/tuijJobs";
				} else {
					return "reminder";
				}
			} else {
				return "m/recommend";
			}
		}
	}
	@RequestMapping("/saveFriendProposals")
	public String saveFriendProposals(HttpServletRequest request,
			@RequestBean("friendProposals") FriendProposals friendProposals,Map<String, Object> data){
		/*FriendProposals proposals = friendProposalsMapper.findFriendByName(friendProposals.getUserName());
		if(proposals != null){
			data.put("flag", 10);
			return "openLogin/wxBdingSuccess";
		}else{*/
			if (friendProposals != null) {
				String newjobInterview ="";
				String newdesignGoal = "";
				String newinterviewForm = "";
				String newdescriptionInterview = "";
				String newreferenceIdeas = "";
				if(!"".equals(friendProposals.getJobInterview()) && friendProposals.getJobInterview() != null){
					newjobInterview= friendProposals.getJobInterview().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					friendProposals.setJobInterview(newjobInterview);
				}
				if(!"".equals(friendProposals.getDesignGoal()) && friendProposals.getDesignGoal() != null){
					newdesignGoal= friendProposals.getDesignGoal().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					friendProposals.setDesignGoal(newdesignGoal);
				}
				if(!"".equals(friendProposals.getInterviewForm()) && friendProposals.getInterviewForm() != null){
					newinterviewForm= friendProposals.getInterviewForm().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					friendProposals.setInterviewForm(newinterviewForm);
				}
				if(!"".equals(friendProposals.getDescriptionInterview()) && friendProposals.getDescriptionInterview() != null){
					newdescriptionInterview= friendProposals.getDescriptionInterview().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					friendProposals.setDescriptionInterview(newdescriptionInterview);
				}
				if(!"".equals(friendProposals.getReferenceIdeas()) && friendProposals.getReferenceIdeas() != null){
					newreferenceIdeas= friendProposals.getReferenceIdeas().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					friendProposals.setReferenceIdeas(newreferenceIdeas);
				}
				friendProposalsMapper.saveFriendProp(friendProposals);
			}
			data.put("flag", 9);
			return "openLogin/wxBdingSuccess";
		//}
	}
	
	@RequestMapping("/findFriendProposals")
	public String findFriendProposals(Page<Map<String, Object>> page,
			Map<String, Object> data){
		page = userService.findProposalsAll(page,0);
		data.put("page", page);
		return "admin/findFriendProposals";
	}
	
	@RequestMapping("/friendLieb")
	public String friendLieb(Page<Map<String, Object>> page,
			Map<String, Object> data){
		page = userService.findProposalsAll(page,0);
		data.put("page", page);
		return "openLogin/user/friendLieb";
	}
	@RequestMapping("/friendById/{id}")
	public String friendById(@PathVariable("id")int id,
			Map<String, Object> data){
		//System.out.println("Id==="+id);
		data.put("friend", friendProposalsMapper.findFriendById(id));
		return "openLogin/user/friendXq";
	}
	
	/**
	 * <p>获取ip地址<br/>
	 * @title getIpAddr<br/>
	 * @date 2014-7-28 上午10:51:12<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	@RequestMapping("huoDtouPiao")
	public String huoDtouPiao(HttpServletRequest request,int id,Page<Map<String, Object>> page,Map<String, Object> data){
		/*System.out.println("id===="+id);
		if(id != 0){
			String ip = getIpAddr(request);
			System.out.println("ip===="+ip);
			IpLogged ipLogged = friendProposalsMapper.findLoggedByIp(ip);
			if(ipLogged != null){
				data.put("msg", "该IP已投过票，不可重复投票！");
			}else{
				IpLogged logged = new IpLogged();
				logged.setIpLocation(ip);
				logged.setTime(new Date());
				friendProposalsMapper.insertLogged(logged);
				friendProposalsMapper.updateFriendById(id);
			}
		}*/
		data.put("msg", "对不起，该投票活动已结束。");
		page = userService.findProposalsAll(page,id);
		data.put("page", page);
		data.put("id", id);
		return "seajs/userDetail";
	}
	
	@RequestMapping("huoDtouPiaoWeb")
	public String huoDtouPiaoWeb(HttpServletRequest request,int id,Page<Map<String, Object>> page,Map<String, Object> data){
		/*System.out.println("id===="+id);
		if(id != 0){
			String ip = getIpAddr(request);
			System.out.println("ip===="+ip);
			IpLogged ipLogged = friendProposalsMapper.findLoggedByIp(ip);
			if(ipLogged != null){
				data.put("msg", "该IP已投过票，不可重复投票！");
			}else{
				IpLogged logged = new IpLogged();
				logged.setIpLocation(ip);
				logged.setTime(new Date());
				friendProposalsMapper.insertLogged(logged);
				friendProposalsMapper.updateFriendById(id);
			}
		}*/
		data.put("msg", "对不起，该投票活动已结束。");
		page = userService.findProposalsAll(page,id);
		data.put("page", page);
		data.put("id", id);
		return "seajs/userDetailWeb";
	}
	
	@RequestMapping("/addVocationalSkillsPhone/{userId}")
	public String addVocationalSkillsPhone(@RequestBean("vocationalSkills")VocationalSkills vocationalSkills,
			@PathVariable("userId") int userId, Map<String, Object> data) {
		//System.out.println("userId==="+userId);
		vocationalSkills.setUserId(userId);
		//System.out.println(vocationalSkills.getLanguage());
		vocationalSkillsMapper.insertVocational(vocationalSkills);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		data.put("userId", userId);
		return "openLogin/user/vocationalSkills";
	}
	
	@RequestMapping("/addJtSkillsPhone/{userId}")
	public String addJtSkillsPhone(@RequestBean("itSkill")ItSkill itSkill,
			@PathVariable("userId") int userId, Map<String, Object> data) {
		itSkill.setUserId(userId);
		itSkill.setFamiliarity(1);
		itSkillMapper.insertItSkill(itSkill);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		data.put("userId", userId);
		return "openLogin/user/vocationalSkills";
	}
	
	@RequestMapping("/addPtSkillsPhone/{userId}")
	public String addPtSkillsPhone(@RequestBean("itSkill")ItSkill itSkill,
			@PathVariable("userId") int userId, Map<String, Object> data) {
		itSkill.setUserId(userId);
		itSkill.setFamiliarity(2);
		itSkillMapper.insertItSkill(itSkill);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		data.put("userId", userId);
		return "openLogin/user/vocationalSkills";
	}
	
	@RequestMapping("/deleteVocationalPhone")
	public String deleteVocationalPhone(int id, int userId, Map<String, Object> data) {
		vocationalSkillsMapper.deleteById(id);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		data.put("userId", userId);
		return "openLogin/user/vocationalSkills";
	}
	
	@RequestMapping("/deleteJtSkillsPhone")
	public String deleteJtSkillsPhone(int id,int userId, Map<String, Object> data){
		itSkillMapper.deleteById(id);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		data.put("userId", userId);
		return "openLogin/user/vocationalSkills";
	}
	
	@RequestMapping("/statisticsData")
	@ResponseBody
	public String statisticsData(){
		int userNum = userBasicInfoMapper.findAllUserNum();
		int jobNum = jobMapper.findAllJobNum();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("userNum",userNum);
		result.put("jobNum", jobNum);
		return JsonUtil.toJson(result); 
	}
	
	@RequestMapping("/deliveryStatus/{userId}/{wxId}")
	public String deliveryStatus(@PathVariable("userId") Integer userId,
			@PathVariable("wxId")String wxId,Map<String, Object> data){
		Login login = loginMapper.findLoginByJoinId(wxId);
		if(login != null){
			if(userId==login.getId()){
				List<Map<String,Object>> list = userService.findDeliverJob(userId);
				data.put("jobList", list);
				return "weixin/deliverLb";
			}else{
				data.put("flag", 13);
				return "openLogin/wxBdingSuccess";
			}
		}else{
			data.put("flag", 13);
			return "openLogin/wxBdingSuccess";
		}
		
	}
	
	
	@RequestMapping("/interviewNoticeById/{id}")
	public String interviewNoticeById(@PathVariable("id") Integer id,Map<String, Object> data){
		Map<String,Object> map = userService.findInterById(id);
		data.putAll(map);
		return "weixin/interview";
	}
	
	
	@RequestMapping("/reumerStop/{userId}/{num}")
	public String reumerStop(@PathVariable("userId") Integer userId,
			@PathVariable("num") Integer num,Map<String, Object> data){
		userBasicInfoMapper.updateExpose(userId, num);
		data.put("flag", 5);
		return "openLogin/wxBdingSuccess";
	}
}
