package com.szfore.action.user;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jodd.io.FileUtil;
import jodd.util.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szfore.action.company.CompanyAction;
import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.EducationExperienceMapper;
import com.szfore.mapper.ExperienceMapper;
import com.szfore.mapper.InternMapper;
import com.szfore.mapper.InterviewNoticeMapper;
import com.szfore.mapper.ItSkillMapper;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.ReplyMapper;
import com.szfore.mapper.SchoolRewardsMapper;
import com.szfore.mapper.SocialPracticeMapper;
import com.szfore.mapper.TopicMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.mapper.VocationalSkillsMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.EducationExperience;
import com.szfore.model.Experience;
import com.szfore.model.ItSkill;
import com.szfore.model.Job;
import com.szfore.model.Login;
import com.szfore.model.OAuthVO;
import com.szfore.model.Reply;
import com.szfore.model.SchoolRewards;
import com.szfore.model.SocialPractice;
import com.szfore.model.Topic;
import com.szfore.model.UserBasicInfo;
import com.szfore.model.RecordChart;
import com.szfore.model.UserJob;
import com.szfore.model.VocationalSkills;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.FileVariable;
import com.szfore.plugin.mvc.RequestBean;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;
import com.szfore.service.JobService;
import com.szfore.service.UserService;
import com.szfore.util.ActionUtil;
import com.szfore.util.DateUtil;
import com.szfore.util.HttpUtil;
import com.szfore.util.ImageCut;
import com.szfore.util.JsonUtil;
import com.szfore.utils.EmailSmtpSend;
import com.szfore.utils.EmailUtils;
import com.szfore.utils.JsonUtils;
import com.szfore.utils.PropertyUtils;
import com.szfore.utils.SendCloudEmail;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Autowired
	private UserService userService;
	@Autowired
	JobService jobService;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private UserJobMapper userJobMapper;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private HttpSession session;
	@Autowired
	private TopicMapper topicMapper;
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private InterviewNoticeMapper interviewNoticeMapper;
	@Autowired
	private InternMapper internMapper;
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
	private CompanyService companyService;
	
	@RequestMapping("/login")
	public String login(String email, String password,Map<String, Object> data,
			@SessionValue("requestURL") String requestURL) throws Exception {
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			if(login.getPassword().equals(password)){
				if (login.getActiveStatus() == 1) {
					loginMapper.updateUserLoginInfo(login.getId());
					if(login.getRoleId()==1){
						List<Map<String, Object>> jobs = jobMapper.findReceiveResumeMsg(login.getId());
						login.setNum(jobs.size());
					}else if(login.getRoleId()==2){
						List<Map<String, Object>> maps = interviewNoticeMapper.findInterviewNotice(login.getId());
						login.setNum(maps.size());
					}
					setSessionValue(login);
					//记录用户登陆量
					RecordChart recordChart = new RecordChart();
					if(login.getRoleId()==2){//学生用户
						recordChart.setUserLogin(1);
					}else if(login.getRoleId()==1){//企业用户
						recordChart.setCompanyLogin(1);
					}
					recordChart.setResponseTime(new Date());
					List<RecordChart> list = userService.findByTime(DateUtil
							.dateFormat("yyyy-MM-dd", new Date()));
					if (list.size() > 0) {
						userService.updateRecordChart(
								DateUtil.dateFormat("yyyy-MM-dd", new Date()),
								recordChart);
					} else {
						userService.insertRecordChart(recordChart);// 记录用户登录量
					}
					//记录用户登陆量
					/*data.put("roleId", login.getRoleId());*/
					return "indexPc";
				} else {
					data.put("msg", "请到邮箱激活账号!");
				}
			}else{
				data.put("msg", "密码错误!");
			}
		} else {
			data.put("msg", "用户名错误!");
		}
		data.put("email", email);
		return "login";
	}
	
	@RequestMapping("/loginFind/{userId}")
	public String loginFind(@PathVariable("userId") Integer userId){
		Login login = loginMapper.findLoginByUserId(userId);
		if (login != null) { // 账号存在并且已经激活
			if (login.getActiveStatus() == 1) {
				loginMapper.updateUserLoginInfo(login.getId());
				if(login.getRoleId()==1){
					List<Map<String, Object>> jobs = jobMapper.findReceiveResumeMsg(login.getId());
					login.setNum(jobs.size());
				}else if(login.getRoleId()==2){
					List<Map<String, Object>> maps = interviewNoticeMapper.findInterviewNotice(login.getId());
					login.setNum(maps.size());
				}
				setSessionValue(login);
			}
		}
		return "m/jobIndex";
	}
	/**
	 * <p>手机端登录<br/>
	 * @title loginPhone<br/>
	 * @date 2014-7-23 下午3:02:10<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param password
	 * @param data
	 * @param requestURL
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/loginPhone")
	public String loginPhone(String email, String password,Map<String, Object> data) throws Exception {
		String requestURL = session.getAttribute("requestURLs").toString();
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			if(login.getPassword().equals(password)){
				if (login.getActiveStatus() == 1) {
					loginMapper.updateUserLoginInfo(login.getId());
					if(login.getRoleId()==1){
						List<Map<String, Object>> jobs = jobMapper.findReceiveResumeMsg(login.getId());
						login.setNum(jobs.size());
					}else if(login.getRoleId()==2){
						List<Map<String, Object>> maps = interviewNoticeMapper.findInterviewNotice(login.getId());
						login.setNum(maps.size());
					}
					setSessionValue(login);
					//记录用户登陆量
					RecordChart recordChart = new RecordChart();
					if(login.getRoleId()==2){//学生用户
						recordChart.setUserLogin(1);
					}else if(login.getRoleId()==1){//企业用户
						recordChart.setCompanyLogin(1);
					}
					recordChart.setResponseTime(new Date());
					List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
					if (list.size() > 0) {
						userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()),recordChart);
					} else {
						userService.insertRecordChart(recordChart);// 记录用户登录量
					}
					//记录用户登陆量
					if(!"".equals(requestURL) && !requestURL.isEmpty()){
						System.out.println("requestURL======="+requestURL);
						return "redirect:"+requestURL;
					}else{
						return "m/index";
					}
				} else {
					data.put("msg", "请到邮箱激活账号!");
				}
			}else{
				data.put("msg", "密码错误!");
			}
		} else {
			data.put("msg", "用户名错误!");
		}
		data.put("email", email);
		return "m/login";
	}
	/**
	 * <p>只有普通用户可以登录，企业用户不可以登录<br/>
	 * @title loginWeixin<br/>
	 * @date 2015-3-19 下午12:03:51<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param password
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/loginUser")
	public String loginUser(String email, String password,
			@SessionValue("requestURLs") String requestURLs,Map<String, Object> data) throws Exception {
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			System.out.println(login.getPassword()+"=========="+password);
			if(login.getPassword().equals(password)){
				/*if(login.getRoleId()==2){*/
					if (login.getActiveStatus() == 1) {
						loginMapper.updateUserLoginInfo(login.getId());
						setSessionValue(login);
						//记录用户登陆量
						RecordChart recordChart = new RecordChart();
						recordChart.setUserLogin(1);
						recordChart.setResponseTime(new Date());
						List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
						if (list.size() > 0) {
							userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()),recordChart);
						} else {
							userService.insertRecordChart(recordChart);// 记录用户登录量
						}
						//记录用户登陆量
						Map<String, Object> map = userService.findByUserId(login.getId(),"1");
						System.out.println(map);
						System.out.println("========="+map.get("education"));
						if("".equals(map.get("education")) || map.get("education") == null){
							data.put("requestURLs", requestURLs);
							data.putAll(map);
							return "openLogin/user/resumeWx";
						}else{
							if(!"".equals(requestURLs) && requestURLs!=null){
								return "redirect:"+requestURLs;
							}else{
								return "m/index";
							}
						}
					} else {
						data.put("msg", "请到邮箱激活账号");
					}
				/*}else{
					data.put("msg", "您是企业用户，暂不支持投递简历登录!");
				}*/
			}else{
				data.put("msg", "密码错误！");
			}
		} else {
			data.put("msg", "用户名错误！");
		}
		data.put("email", email);
		return "weixin/login";
	}
	
	
	/**
	 * <p>只有普通用户可以登录，企业用户不可以登录<br/>
	 * @title loginWeixin<br/>
	 * @date 2015-3-19 下午12:03:51<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param password
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/loginCompany")
	public String loginCompany(String email, String password,Map<String, Object> data) throws Exception {
		String requestURL = session.getAttribute("requestURLt").toString();
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			if(login.getPassword().equals(password)){
				if(login.getRoleId()==1){
					if (login.getActiveStatus() == 1) {
						loginMapper.updateUserLoginInfo(login.getId());
						setSessionValue(login);
						//记录用户登陆量
						RecordChart recordChart = new RecordChart();
						recordChart.setCompanyLogin(1);
						recordChart.setResponseTime(new Date());
						List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
						if (list.size() > 0) {
							userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()),recordChart);
						} else {
							userService.insertRecordChart(recordChart);// 记录用户登录量
						}
						//记录用户登陆量
						if(!"".equals(requestURL) && !requestURL.isEmpty()){
							return "redirect:"+requestURL;
						}else{
							return "m/index";
						}
					} else {
						data.put("msg", "请到邮箱激活账号");
					}
				}else{
					data.put("msg", "您不是企业用户，暂不支持邀请用户登录！");
				}
			}else{
				data.put("msg", "密码错误！");
			}
		} else {
			data.put("msg", "用户名错误！");
		}
		data.put("email", email);
		return "openLogin/user/login";
	}
	
	
	
	
	@RequestMapping("/registryEditor")
	public String registryEditor(String email, String password,Map<String, Object> data) throws Exception {
		String requestURL = session.getAttribute("requestURLs").toString();
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			if(login.getPassword().equals(password)){
				if (login.getActiveStatus() == 1) {
					loginMapper.updateUserLoginInfo(login.getId());
					if(login.getRoleId()==1){
						List<Map<String, Object>> jobs = jobMapper.findReceiveResumeMsg(login.getId());
						login.setNum(jobs.size());
					}else if(login.getRoleId()==2){
						List<Map<String, Object>> maps = interviewNoticeMapper.findInterviewNotice(login.getId());
						login.setNum(maps.size());
					}
					setSessionValue(login);
					//记录用户登陆量
					RecordChart recordChart = new RecordChart();
					if(login.getRoleId()==2){//学生用户
						recordChart.setUserLogin(1);
					}else if(login.getRoleId()==1){//企业用户
						recordChart.setCompanyLogin(1);
					}
					recordChart.setResponseTime(new Date());
					List<RecordChart> list = userService.findByTime(DateUtil
							.dateFormat("yyyy-MM-dd", new Date()));
					if (list.size() > 0) {
						userService.updateRecordChart(
								DateUtil.dateFormat("yyyy-MM-dd", new Date()),
								recordChart);
					} else {
						userService.insertRecordChart(recordChart);// 记录用户登录量
					}
					//记录用户登陆量
					if(!"".equals(requestURL) && !requestURL.isEmpty()){
						System.out.println("requestURL======="+requestURL+login.getId());
						return "redirect:"+requestURL+login.getId();
					}else{
						return "m/index";
					}
				} else {
					data.put("msg", "请到邮箱激活账号!");
				}
			}else{
				data.put("msg", "密码错误!");
			}
		} else {
			data.put("msg", "用户名错误!");
		}
		data.put("email", email);
		return "weixin/loginRegistry";
	}
	
	/*@RequestMapping("/loginRelease")
	public String loginRelease(String email, String password,Map<String, Object> data){
		Login login = loginMapper.loginByCom(email, password);
		if (login != null) { // 账号存在并且已经激活
			if (login.getActiveStatus() == 1) {
				CompanyInfo info = companyMapper.getCompanyInfoOf(login.getId());
				setSessionValue(login);
				if(info != null){
					data.put("companyId", info.getId());
					return "weixin/flashHire";
				}else{
					data.put("userId", login.getId());
					return "weixin/flashHireCom";
				}
			} else {
				data.put("msg", "请到邮箱激活账号");
			}
		} else {
			data.put("msg", "用户名或密码错误或您不是企业用户！");
		}
		data.put("email", email);
		return "weixin/loginRelease";
	}*/
	
	
	@RequestMapping("/jobDetailWeix/{jobId}")
	public String jobDetailWeix(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")int jobId,Map<String,Object> data) {
		session.setAttribute("requestURLs","/user/jobDetailWeix/"+jobId);
		if(userId != null) {
		   int num = userJobMapper.getUserJobNumBy(userId, jobId);
		   if(num > 0) {
			   data.put("diliverStatus", 1);
		   }else{
			   data.put("diliverStatus", 0);
		   }
		}
		jobMapper.updatePageView(jobId);
		data.putAll(jobService.findJobDetailById(jobId));
		return "weixin/preview";
	}
	
	/**
	 * <p>预览发布的职位并给修改的接口<br/>
	 * @title jobDetailWeix<br/>
	 * @date 2015-3-18 下午12:28:54<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param jobId
	 * @param data
	 * @return
	 */
	@RequestMapping("/jobDetailWeixYl/{jobId}/{wxId}")
	public String jobDetailWeixYl(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")Integer jobId,@PathVariable("wxId")String wxId,Map<String,Object> data) {
		OAuthVO authVO = loginMapper.findOAuthByJobId(jobId);
		if(authVO != null){
			if(wxId.equals(authVO.getJoinId())){
				data.putAll(jobService.findJobDetailById(jobId));
				return "weixin/flashHire";
			}else{
				data.put("flag", 12);
				return "openLogin/wxBdingSuccess";
			}
		}else{
			data.put("flag", 12);
			return "openLogin/wxBdingSuccess";
		}
	}
	
	
	@RequestMapping("/jobToudWeix/{jobId}")
	public String jobToudWeix(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")int jobId,Map<String,Object> data) {
		if(userId != null) {
		   int num = userJobMapper.getUserJobNumBy(userId, jobId);
		   if(num > 0) {
			   data.put("diliverStatus", 1);
		   }
		}
		data.putAll(jobService.findJobDetailById(jobId));
		return "weixin/prevWay";
	}
	
	
	@RequestMapping("/wJlLogin")
	public String wJlLogin(String email, String password,Map<String, Object> data){
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			if(login.getPassword().equals(password)){
				if (login.getActiveStatus() == 1) {
					setSessionValue(login);
					Map<String, Object> map = userService.findByUserIdGzr(login.getId(),"1");
					data.putAll(map);
					return "openLogin/user/weixResume";
				}else {
					data.put("msg", "请到邮箱激活账号!");
				}
			}else{
				data.put("msg", "密码错误!");
			}
		}else{
			data.put("msg", "用户名错误!");
		}
		data.put("email", email);
		return "m/weixLogin";
	}
	
	
	@RequestMapping("/loginException/{email}")
	public String loginException(@PathVariable("email") String email,
			Map<String, Object> data,
			@SessionValue("requestURL") String requestURL) throws Exception {
		Login login = loginMapper.findUserByEmail(email);
		if (login != null) { // 账号存在并且已经激活
			if (login.getActiveStatus() == 1) {
				loginMapper.updateUserLoginInfo(login.getId());
				setSessionValue(login);
				RecordChart recordChart = new RecordChart();
				recordChart.setNewUsers(0);
				recordChart.setUserLogin(1);
				recordChart.setResumeSum(0);
				recordChart.setResponseTime(new Date());
				List<RecordChart> list = userService.findByTime(DateUtil
						.dateFormat("yyyy-MM-dd", new Date()));
				if (list.size() > 0) {
					userService.updateRecordChart(
							DateUtil.dateFormat("yyyy-MM-dd", new Date()),
							recordChart);
				} else {
					userService.insertRecordChart(recordChart);// 记录用户登录量
				}
				data.put("roleId", login.getRoleId());
				return "indexPc";
			} else {
				data.put("msg", "请到邮箱激活账号");
			}
		} else {
			data.put("msg", "用户名或密码错误");
		}
		data.put("email", email);
		return "login";
	}
	/**
	 * 关联用户账号
	 * 
	 * @param request
	 * @param email
	 * @param password
	 * @param fromUserName
	 * @param pw
	 * @param data
	 * @param requestURL
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/wxLogin")
	public String wxLogin(String email,
			String password, String fromUserName,
			Map<String, Object> data) throws Exception {
		try {
			int msg=0;		
			Login login = loginMapper.login(email); // 查询用户
			if (login != null){ 
				if(login.getPassword().equals(password)){
					if (login.getActiveStatus() == 1) {// 账号存在并且已经激活
						//loginMapper.updateUserLoginInfo(login.getId());// 更新用户登录信息
						setSessionValue(login);
						int userId = login.getId(); // 获取用户id
						if(bindWXCount(fromUserName, userId, data)) {
							//记录用户登陆量
							RecordChart recordChart = new RecordChart();
							if(login.getRoleId()==1){
								recordChart.setCompanyWeixinNum(1);
							}else if(login.getRoleId()==2){
								recordChart.setUserWeixinNum(1);
							}
							recordChart.setResponseTime(new Date());
							List<RecordChart> list = userService.findByTime(DateUtil
									.dateFormat("yyyy-MM-dd", new Date()));
							if (list.size() > 0) {
								userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()),recordChart);
							} else {
								userService.insertRecordChart(recordChart);// 记录用户登录量
							}
							//记录用户登陆量
							return "openLogin/wxBdingSuccess";
						}
					}else {
						 msg=1;  //"请到邮箱激活账号";
	//				data.put("msg", "请到邮箱激活账号");
					}
				}else{
					msg=3;//"密码错误";
				}
			}else {
				msg=2 ;//"用户名错误";
			}
			return "redirect:/openLogin/wxLogin.jsp?fromUserName="+fromUserName+"&msg="+msg;// 登录失败跳转到登录页面
		} catch (Exception e) {
			return "openLogin/wxException";
		}
		
	}
	@RequestMapping("/wxRelevance/{wxId}")
	public String wxRelevance(@PathVariable("wxId") String wxId,
			Map<String, Object> data){
		
		return "";
	}
	private boolean bindWXCount(String fromUserName, int userId, Map<String, Object> data) {
		OAuthVO authVO = loginMapper.selectOAuthUser(fromUserName); // 查看微信号有无绑定
		OAuthVO authVO1 = loginMapper.selectOAuthUserByUser(userId); // 查看用户有无绑定
		if (!"null".equals(fromUserName)){// 微信账号存在
			if (authVO == null && authVO1 == null){// 微信号和用户都未被绑定
				loginMapper.insertOAuthUser(fromUserName, userId, "","",1);// 关联微信账号和用户id
				data.put("flag", 0);
			}else if (authVO == null && authVO1 != null){// 用户已被绑定
				if(authVO1.getType()==1){
					data.put("flag", 1);
					loginMapper.deleteOAuthUserByUser(userId);
					loginMapper.insertOAuthUser(fromUserName, userId, "","",1);// 关联微信账号和用户id	//新的微信号重新绑定用户
					//userBasicInfoMapper.updateQuaWx(authVO.getUserId(), 0);
				}
			}else if(authVO != null && authVO1 == null){// 微信号已被绑定
				if(authVO.getType()==1){
					data.put("flag", 2);
					loginMapper.deleteOAuthUserByJoinId(fromUserName);
					loginMapper.insertOAuthUser(fromUserName,userId,"","",1);// 关联微信账号和用户id	//微信号重新绑定用户
					userBasicInfoMapper.updateQuaWx(authVO.getUserId(), 0);
				}
			} else {
				if(authVO.getUserId()==authVO1.getUserId() && authVO.getType()==1){
					data.put("flag", 4);//该微信号已绑定该账号
				}else{
					loginMapper.deleteOAuthUserByJoinId(fromUserName);
					loginMapper.deleteOAuthUserByUser(userId);
					loginMapper.insertOAuthUser(fromUserName,userId,"","",1);// 关联微信账号和用户id
					userBasicInfoMapper.updateQuaWx(authVO.getUserId(), 0);
					data.put("flag", 3);//该微信号和该用户都已被绑定
				}
			}
			// 提示是否关联成功
			return true;
		}
		else{
			return false;
		}
	}
	//微信端要实习账号登陆
	@RequestMapping("/wxLoginFor")
	public String wxLoginFor(String email,String password,@SessionValue("requestURL") String requestURL,
			Map<String, Object> data) throws Exception {
		Login login = loginMapper.login(email);
		if (login != null) { // 账号存在并且已经激活
			if(login.getPassword().equals(password)){
				if (login.getActiveStatus() == 1) {
					loginMapper.updateUserLoginInfo(login.getId());
					setSessionValue(login);
					return "redirect:"+requestURL;	//登陆成功
				} else {
					data.put("msg", "请到邮箱激活账号!");
				}
			}else{
				data.put("msg", "密码错误!");
			}
		}else{
			data.put("msg", "用户名错误!");
		}
		data.put("email", email);
		return "openLogin/wxsend/wxLogin";
	}
	
	
	
	private void setSessionValue(Login login) {
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

	@RequestMapping("/regist")
	public String regist(HttpServletRequest request, String email,String companyName,
			String password, int roleId,Integer userId, Map<String, Object> data) {
		if(userId!=null){
			userBasicInfoMapper.updateQuantity(userId);
		}
		Login l = loginMapper.findUserByEmail(email);
		if (l != null) { // 只有非法操作才会出现这种情况
			throw new RuntimeException("邮箱已经存在");
		}
		System.out.println("roleId=="+roleId);
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		login.setRoleId(roleId);
		String registId = EmailUtils.genRegistId();
		userService.regist(login, registId,companyName);
		String html = null;
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		if(roleId == 1){
			recordChart.setCompanyRegist(1);
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);// 记录注册用户量
			}
			String urlStr = PropertyUtils.getProperty("projectUrl")
					+ "user/genEmailRegist/" + email + "/" + registId+"/"+login.getId();
			try {
				html = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendEmail(registId,email,html);
			} catch (Exception e) {
				e.printStackTrace();
				data.put("msg", "注册失败");
				return "user/regist";
			}
			data.put("userId", login.getId());
			data.put("email", email);
			String a[] = email.split("@");
			data.put("domain", a[1]);
			data.put("registId", registId);
			return "user/verify";
		}else{
			recordChart.setNewUsers(1);
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);// 记录注册用户量
			}
			String urlStr = PropertyUtils.getProperty("projectUrl")+"welEmail/"+email;
			String html2 = null;
			System.out.println("email="+email);
			try {
				html2 = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendWelEmail(email, html2);
			} catch (Exception e) {
				e.printStackTrace();
				data.put("msg", "发送失败");
			}
			//data.put("email", email);
			setSessionValue(login);
			return "user/resume";
		}
	}
	
	
	@RequestMapping("/registPhone")
	public String registPhone(HttpServletRequest request, String email,String companyName,
			String password, int roleId,Integer userId,@SessionValue("requestURLs") String requestURLs, 
			Map<String, Object> data) {
		if(userId!=null){
			userBasicInfoMapper.updateQuantity(userId);
		}
		Login l = loginMapper.findUserByEmail(email);
		if (l != null) { // 只有非法操作才会出现这种情况
			data.put("msg","邮箱已经存在");
			data.put("email", email);
			return "m/regist";
		}
		System.out.println("roleId=="+roleId);
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		login.setRoleId(roleId);
		String registId = EmailUtils.genRegistId();
		userService.regist(login, registId,companyName);
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		recordChart.setNewUsers(1);
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录注册用户量
		}
		Map<String, Object> map = userService.findByUserId(login.getId(),"1");
		data.putAll(map);
		data.put("requestURLs", requestURLs);
		/*if("".equals(map.get("userName").toString())){
			return "openLogin/user/resumeWx";
		}else{*/
		/*if(!"".equals(requestURLs) && !requestURLs.isEmpty()){
			System.out.println("requestURL======="+requestURLs);
			return "redirect:"+requestURLs;
		}else{*/
		return "openLogin/user/resumeWx";
			/*}
		}*/
	}
	
	@RequestMapping("/registCompany")
	public String registCompany(HttpServletRequest request, String email,String companyName,
			String companyShortName,String password, int roleId,Integer userId,
			@SessionValue("requestURLs") String requestURLs,Map<String, Object> data) {
		if(userId!=null){
			userBasicInfoMapper.updateQuantity(userId);
		}
		Login l = loginMapper.findUserByEmail(email);
		if (l != null) { // 只有非法操作才会出现这种情况
			data.put("msg","邮箱已经存在");
			data.put("email", email);
			data.put("companyName", companyName);
			data.put("companyShortName", companyShortName);
			return "openLogin/user/regist";
		}
		System.out.println("roleId=="+roleId);
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		login.setRoleId(roleId);
		String registId = EmailUtils.genRegistId();
		userService.regist(login, registId,companyName);
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		recordChart.setNewUsers(1);
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录注册用户量
		}
		/*setSessionValue(login);
		Map<String, Object> map = userService.findByUserId(login.getId(),"1");
		data.putAll(map);*/
		data.put("requestURLs", requestURLs);
		/*if("".equals(map.get("userName").toString())){
			return "openLogin/user/resumeWx";
		}else{*/
		/*if(!"".equals(requestURLs) && !requestURLs.isEmpty()){
			System.out.println("requestURL======="+requestURLs);
			return "redirect:"+requestURLs;
		}else{*/
			return "redirect:/user/flashHire/"+login.getId();
		/*}*/
		
	}
	
	
	
	@RequestMapping("/registUser")
	public String registUser(HttpServletRequest request, String email,String companyName,
			String password, int roleId,Integer userId,
			@SessionValue("requestURLs") String requestURLs,Map<String, Object> data) {
		if(userId!=null){
			userBasicInfoMapper.updateQuantity(userId);
		}
		Login l = loginMapper.findUserByEmail(email);
		if (l != null) { // 只有非法操作才会出现这种情况
			data.put("msg","邮箱已经存在");
			data.put("email", email);
			return "openLogin/user/regist";
		}
		System.out.println("roleId=="+roleId);
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		login.setRoleId(roleId);
		String registId = EmailUtils.genRegistId();
		userService.regist(login, registId,companyName);
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		recordChart.setNewUsers(1);
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录注册用户量
		}
		/*setSessionValue(login);
		Map<String, Object> map = userService.findByUserId(login.getId(),"1");
		data.putAll(map);*/
		data.put("requestURLs", requestURLs);
		/*if("".equals(map.get("userName").toString())){
			return "openLogin/user/resumeWx";
		}else{*/
		/*if(!"".equals(requestURLs) && !requestURLs.isEmpty()){
			System.out.println("requestURL======="+requestURLs);
			return "redirect:"+requestURLs;
		}else{*/
			return "redirect:/user/flashHire/"+login.getId();
		/*}*/
		
	}
	/**
	 * <p><br/>
	 * @title companyRegist<br/>
	 * @date 2014-7-21 下午2:22:12<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param email
	 * @param password
	 * @param roleId
	 * @param companyId
	 * @param data
	 * @return
	 */
	@RequestMapping("/companyRegist")
	public String companyRegist(HttpServletRequest request, String email,
			String password, int roleId,Integer companyId, Map<String, Object> data){
		Login l = loginMapper.findUserByEmail(email);
		if (l != null) { // 只有非法操作才会出现这种情况
			throw new RuntimeException("邮箱已经存在");
		}
		System.out.println("roleId=="+roleId);
		System.out.println("companyId=="+companyId);
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		login.setRoleId(roleId);
		String registId = EmailUtils.genRegistId();
		userService.companyRegist(login, registId,companyId);
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		recordChart.setCompanyRegist(1);
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
				"yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录注册用户量
		}
		setSessionValue(login);
		return "company/job/index";
	}
	
	/*@RequestMapping("/remindRegist")
	public String remindRegist(HttpServletRequest request, String email,
			String password, int roleId,Integer userId, Map<String, Object> data) {
		if(userId!=null){
			userBasicInfoMapper.updateQuantity(userId);
		}
		Login l = loginMapper.findUserByEmail(email);
		if (l != null) { // 只有非法操作才会出现这种情况
			throw new RuntimeException("邮箱已经存在");
		}
		System.out.println("roleId=="+roleId);
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		login.setRoleId(roleId);
		String registId = EmailUtils.genRegistId();
		userService.regist(login, registId);
		String html = null;
		RecordChart recordChart = new RecordChart();
		recordChart.setResponseTime(new Date());
		if(roleId == 1){
			recordChart.setCompanyUser(1);
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);// 记录注册用户量
			}
			String urlStr = PropertyUtils.getProperty("projectUrl")
					+ "user/genEmailRegist/" + email + "/" + registId+"/"+login.getId();
			System.out.println("urlStr:" + urlStr);
			try {
				html = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendEmail(registId,email,html);
			} catch (Exception e) {
				e.printStackTrace();
				data.put("msg", "注册失败");
				return "user/regist";
			}
			data.put("email", email);
			String a[] = email.split("@");
			data.put("domain", a[1]);
			data.put("registId", registId);
			return "user/remindVerify";
		}else{
			recordChart.setNewUsers(1);
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);// 记录注册用户量
			}
			String urlStr = PropertyUtils.getProperty("projectUrl")+"welEmail/"+email;
			String html2 = null;
			System.out.println("email="+email);
			try {
				html2 = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendWelEmail(email, html2);
			} catch (Exception e) {
				e.printStackTrace();
				data.put("msg", "发送失败");
			}
			//data.put("email", email);
			setSessionValue(login);
			return "user/remindVerify";
		}
	}*/
	
	@RequestMapping("/resendEmail/{email}/{registId}/{userId}")
	public String resendEmail(HttpServletRequest request,
			@PathVariable("email") String email,@PathVariable("userId")Integer userId,
			@PathVariable("registId") String registId, Map<String, Object> data) {
		String urlStr = PropertyUtils.getProperty("projectUrl")
				+ "user/genEmailRegist/" + email + "/" + registId + "/"+userId;
		String html = null;
		try {
			html = EmailUtils.convertHtmlToStr(request, urlStr);
			userService.sendEmail(registId, email, html);
		} catch (Exception e) {
			e.printStackTrace();
			data.put("msg", "发送失败");
		}
		data.put("userId", userId);
		data.put("msg", "验证邮件已发到您的邮箱");
		data.put("email", email);
		String a[] = email.split("@");
		data.put("domain", a[1]);
		data.put("registId", registId);
		return "user/verify";
	}

	/**
	 * <p>用户注册发至邮箱的验证页面<br/>
	 * @title genEmailHtml<br/>
	 * @date 2014-4-16 上午9:44:58<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param registId
	 * @param data
	 * @return
	 */
	@RequestMapping("/genEmailRegist/{email}/{registId}/{userId}")
	public String genEmailHtml(@PathVariable("email") String email,
			@PathVariable("registId") String registId,@PathVariable("userId")Integer userId, Map<String, Object> data) {
		String validateUrl = EmailUtils.genValidateUrl(registId, email,userId);
		data.put("email", email);
		data.put("validateUrl", validateUrl);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "user/sendmail";
	}

	@RequestMapping("/validateEmail")
	public void validateEmail(HttpServletResponse response, String email,String companyName) {
		Login login = loginMapper.findUserByEmail(email);
		CompanyInfo companyInfo = companyService.getByCompName(companyName);
		if (login != null) {
			JsonUtils.toJson(response, false, "您申请的邮箱已注册");
		}else if(companyInfo != null){
			JsonUtils.toJson(response, false, "您申请的公司已经被导入，请通过邮箱cs@yaoshixi.com联系我们询问激活码");
		}else{
			JsonUtils.toJson(response, true, "");
		}
	}

	@RequestMapping("/uploadImg")
	@ResponseBody
	public String saveHeadImg(HttpServletRequest request,
			@SessionValue("userId") Integer userId, String photoName,
			Integer x, Integer y, Integer width, Integer height) {
		if (x == null || y == null || width == null || height == null) {
			x = 0;
			y = 0;
			width = 168;
			height = 168;
		}
		String srcPhotoPath = getContextPath(request)
				+ CompanyAction.UPLOAD_LOGO_DIR + photoName;
		ImageCut.abscut(srcPhotoPath, srcPhotoPath, x, y, width, height);

		String headTmpImgPath = PropertyUtils.getProperty("headImg");
		try {
			FileUtil.move(srcPhotoPath, headTmpImgPath + photoName);
		} catch (IOException e) {
			e.printStackTrace();
		}

		UserBasicInfo userBasicInfo = userBasicInfoMapper
				.findUserBasicInfoByUserId(userId);
		userBasicInfo.setHeadImg(photoName);
		userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("statusCode", 1);
		result.put("path", "user/getHeadPhoto?ImgPath=" + photoName);
		return JsonUtil.toJson(result);

	}
	@RequestMapping("/fileResume")
	public String saveFileResume(HttpServletRequest request,@SessionValue("userId") Integer userId,
			@FileVariable("accessory")File accessory,Map<String, Object> data) throws Exception {
		
		String headTmpImgPath = PropertyUtils.getProperty("headImg");
		FileUtil.move(accessory.getAbsolutePath(), headTmpImgPath + accessory.getName());
		userBasicInfoMapper.updateAccessory(userId, accessory.getName());
		Map<String, Object> map = userService.findResumeByUserId(userId,data);
		data.putAll(map);
		if (map != null && !map.isEmpty()) {
			Set<String> keys = map.keySet();
			int size = map.size();
			int i = 0;
			for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
				String key = (String) iterator.next();
				if (map.get(key) != null
						&& !"".equals(map.get(key).toString())) {
					i++;
				}
			}
			int ratio = i*100/size;
			data.put("finish", ratio+"%");
			if(0<=ratio && ratio<=25){
				data.put("ratio", "什么都不填，臣妾帮不了你啊！");
			}else if(25<ratio && ratio<=50){
				data.put("ratio", "再填多点资料，成功几率暴涨哦！");
			}else if(50<ratio && ratio<=75){
				data.put("ratio", "填多点再填多点，成功就在眼前了！");
			}else if(75<ratio && ratio<99){
				data.put("ratio", "填多点再填多点，成功就在眼前了！");
			}else if(99<=ratio && ratio<=100){
				data.put("ratio", "你这么勤奋，继续保持哦，有空来更新一下自己的简历吧！");
			}
		} else {
			data.put("finish", "0%");
		}
		UserBasicInfo userBasicInfo = (UserBasicInfo) map.get("userBasicInfo");
		if(userBasicInfo.getAccessory()!=null && !"".equals(userBasicInfo.getAccessory())){
		data.put("adjunct", (userBasicInfo.getAccessory()).split("_")[1]);
		}
		data.put("accessory", userBasicInfo.getAccessory());
		return "user/resume";
		//return "{\"adjunct\":"+fileName+", \"accessory\": "+accessory.getName()+"}";
	}
	
	@RequestMapping("/delfileResume")
	public String delfileResume(@SessionValue("userId") Integer userId,Map<String, Object> data){
		UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
		String basePath = PropertyUtils.getProperty("headImg");
		File file = new File(basePath+userBasicInfo.getAccessory());//根据路径找到文件
		if(!file.exists()){
			file.delete();//删除文件
		}
		userBasicInfoMapper.updateAccessory(userId, "");
		data.put("adjunct", "");
		data.put("accessory","");
		return "user/fileResume";
	}
	
	
	private String getContextPath(HttpServletRequest request) {
		return request.getServletContext().getRealPath("/");
	}


	@RequestMapping("/getHeadPhoto")
	public void getHeadPhoto(HttpServletRequest request,
			HttpServletResponse response, String ImgPath) {
		if (ImgPath != null & !"".equals(ImgPath)) {
			String basePath = PropertyUtils.getProperty("headImg");
			File f = new File(basePath);
			if (!f.exists()) {
				f.mkdirs();
			}
			File file = new File(basePath + ImgPath);
			ActionUtil.downloadFile(request, response, file);
		}
	}

	/*
	 * @RequestMapping("/getUploadFile") public void
	 * getUploadFile(HttpServletRequest request,HttpServletResponse
	 * response,String ImgPath) { if(ImgPath != null & !"".equals(ImgPath)){
	 * String basePath = PropertyUtils.getProperty("headImg"); File f = new
	 * File(basePath); if(!f.exists()) { f.mkdirs(); } MultipartFile file = new
	 * MultipartFile(basePath+ImgPath); ActionUtil.upload(request,file); } }
	 */

	/*@SuppressWarnings("rawtypes")*/
	@RequestMapping("/resume")
	public String resume(Map<String, Object> data,
			@SessionValue("userId") Integer userId) {
		Map<String, Object> map = userService.findResumeByUserId(userId,data);
		data.putAll(map);
		if (map != null && !map.isEmpty()) {
			Set<String> keys = map.keySet();
			int size = map.size();
			int i = 0;
			for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
				String key = (String) iterator.next();
				if (map.get(key) != null && !"".equals(map.get(key).toString())) {
					i++;
				}
			}
			int ratio = i*100/size;
			data.put("finish", ratio+"%");
			if(0<=ratio && ratio<=25){
				data.put("ratio", "什么都不填，臣妾帮不了你啊！");
			}else if(25<ratio && ratio<=50){
				data.put("ratio", "再填多点资料，成功几率暴涨哦！");
			}else if(50<ratio && ratio<=75){
				data.put("ratio", "填多点再填多点，成功就在眼前了！");
			}else if(75<ratio && ratio<99){
				data.put("ratio", "填多点再填多点，成功就在眼前了！");
			}else if(99<=ratio && ratio<=100){
				data.put("ratio", "你这么勤奋，继续保持哦，有空来更新一下自己的简历吧！");
			}
		} else {
			data.put("finish", "0%");
		}
		UserBasicInfo userBasicInfo = (UserBasicInfo) map.get("userBasicInfo");
		if(userBasicInfo.getAccessory()!=null && !"".equals(userBasicInfo.getAccessory())){
			data.put("adjunct", (userBasicInfo.getAccessory()).split("_")[1]);
		}
		data.put("accessory", userBasicInfo.getAccessory());
		return "user/resume";
	}

	/**
	 * 预览自己的简历
	 * 
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/preview/{declaration}")
	public String preview(@SessionValue("userId")Integer userId,
			@PathVariable("declaration")String declaration,
			Map<String, Object> data) {
		Map<String, Object> map = userService.findResumeByUserId(userId,data);
		data.putAll(map);
		declaration = URLDecoder.decode(declaration, "utf-8");
		data.put("declaration", declaration);
		return "user/preview";
	}

	@RequestMapping("/deliveryResume/{jobId}")
	public String deliveryResume(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")Integer jobId,Map<String, Object> data) {
		Map<String, Object> map = userService.findResumeByUserId(userId,data);
		data.putAll(map);
		Job job = jobMapper.getJobOf(jobId);
		String declaration = (String) session.getAttribute("declaration");
		String daAnOne = (String) session.getAttribute("daAnOne");
		String daAnTwo = (String) session.getAttribute("daAnTwo");
		String daAnThree = (String) session.getAttribute("daAnThree");
		String daAnFour = (String) session.getAttribute("daAnFour");
		String daAnFive = (String) session.getAttribute("daAnFive");
		data.put("declaration", declaration);
		data.put("wenTiOne", job.getInterQuestionsOne());
		data.put("wenTiTwo", job.getInterQuestionsTwo());
		data.put("wenTiThree", job.getInterQuestionsThree());
		data.put("wenTiFour", job.getInterQuestionsFour());
		data.put("wenTiFive", job.getInterQuestionsFive());
		data.put("daAnOne", daAnOne);
		data.put("daAnTwo", daAnTwo);
		data.put("daAnThree", daAnThree);
		data.put("daAnFour", daAnFour);
		data.put("daAnFive", daAnFive);
		return "user/preview";
	}
	
	@RequestMapping("/deliveryResumeWxWjl/{jobId}")
	public String deliveryResumeWxWjl(@SessionValue("userId")Integer userId,
			@PathVariable("jobId")Integer jobId,Map<String, Object> data) {
		Map<String, Object> map = userService.findByUserIdGzr(userId,"1");
		data.putAll(map);
		return "openLogin/user/yXResume";
	}
	
	@RequestMapping("/previewByuId/{userId}")
	public String previewByuId(@PathVariable("userId")Integer userId,
			Map<String, Object> data) {
		Map<String, Object> map = userService.findResumeByUserId(userId,data);
		data.putAll(map);
		return "user/preview";
	}
	
	/**
	 * <p>查看用户简历并发送邮件通知该用户简历已被公司HR查看<br/>
	 * @title resumes<br/>
	 * @date 2014-4-16 下午2:30:35<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param userIds
	 * @param jobId
	 * @param email
	 * @param data
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/examine/{userIds}/{jobId}")
	public String examine(HttpServletRequest request,
			@PathVariable("userIds") Integer userIds,
			@PathVariable("jobId") Integer jobId,
			Map<String, Object> data) throws UnsupportedEncodingException {
		UserJob userJob = userJobMapper.findStatus(userIds, jobId);
		List<Map<String, Object>> list = jobMapper.findCompanyByJid(jobId);
		String jobName = list.get(0).get("jobName").toString();
		String companyId = list.get(0).get("companyId").toString();
		if(userJob.getStatus()==0){
			UserBasicInfo basicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userIds);
			userJobMapper.updateStatusOf(userIds, jobId, 1);
			String html = null;
			String companyName = list.get(0).get("companyName").toString();
			companyName = URLEncoder.encode(companyName, "utf-8");
			jobName = URLEncoder.encode(jobName, "utf-8");
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/checkEmail/"
			+basicInfo.getEmail()+"/"+companyName+"/"+jobName;
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			companyService.sendEmail("要实习-简历状态通知",basicInfo.getEmail(), html);
		}
		Map<String, Object> map = userService.findResumeByUserId(userIds,data);
		data.putAll(map);
		data.put("jobId", jobId);
		data.put("jobName", jobName);
		data.put("companyId", companyId);
		return "user/companResume";
	}
	
	
	@RequestMapping("/examineOnWx/{userIds}/{jobId}/{email}/{jobName}/{companyId}")
	public String examineOnWx(HttpServletRequest request,
			@PathVariable("userIds") Integer userIds,
			@PathVariable("jobId") Integer jobId,
			@PathVariable("email")String email,
			@PathVariable("companyId")Integer companyId,
			@PathVariable("jobName")String jobNamex,
			Map<String, Object> data) throws UnsupportedEncodingException {
		UserJob userJob = userJobMapper.findStatus(userIds, jobId);
		if(userJob.getStatus()==0){
			UserBasicInfo basicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userIds);
			userJobMapper.updateStatusOf(userIds, jobId, 1);
			String html = null;
			List<Map<String, Object>> list = jobMapper.findCompanyByJid(jobId);
			String companyName = list.get(0).get("companyName").toString();
			String jobName = list.get(0).get("jobName").toString();
			companyName = URLEncoder.encode(companyName, "utf-8");
			jobName = URLEncoder.encode(jobName, "utf-8");
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/checkEmail/"
			+basicInfo.getEmail()+"/"+companyName+"/"+jobName;
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			companyService.sendEmail("要实习-简历状态通知",basicInfo.getEmail(), html);
		}
		Map<String, Object> map = userService.findResumeByUserId(userIds,data);
		data.putAll(map);
		data.put("userIdFor", userIds);
		data.put("jobIdFor", jobId);
		data.put("emailFor", email);
		data.put("companyIdFor", companyId);
		data.put("jobNameFor", jobNamex);
		return "openLogin/enterprise/ResumeDetail";
	}
	/**
	 * <p>查看用户简历并发送邮件通知该用户简历已被公司HR查看<br/>
	 * @title resumes<br/>
	 * @date 2014-4-16 下午2:30:35<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param userIds
	 * @param jobId
	 * @param email
	 * @param data
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/previewOnWx/{userIds}/{jobId}/{email}/{jobName}/{companyId}")
	public String resumesOnWx(HttpServletRequest request,
			@PathVariable("userIds") Integer userIds,
			@PathVariable("jobId") Integer jobId,
			@PathVariable("email")String email,
			@PathVariable("companyId")Integer companyId,
			@PathVariable("jobName")String jobName,
			Map<String, Object> data) throws UnsupportedEncodingException {
		UserJob userJob = userJobMapper.findStatus(userIds, jobId);
		if(userJob.getStatus()==0){
			userJobMapper.updateStatusOf(userIds, jobId, 1);
			String html = null;
			List<Map<String, Object>> list = jobMapper.findCompanyByJid(jobId);
			String companyName = list.get(0).get("companyName").toString();
			String jobNames = list.get(0).get("jobName").toString();
			companyName = URLEncoder.encode(companyName, "utf-8");
			jobName = URLEncoder.encode(jobNames, "utf-8");
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/checkEmail/"
			+email+"/"+companyName+"/"+jobNames;
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			companyService.sendEmail("要实习-简历状态通知",email+".com", html);
		}
		Map<String, Object> map = userService.findResumeByUserId(userIds,data);
		data.put("userIdFor", userIds);
		data.put("jobIdFor", jobId);
		data.put("emailFor", email);
		data.put("companyIdFor", companyId);
		data.put("jobNameFor", jobName);
		data.putAll(map);
		System.out.println("头像:"+map.get("headImg"));
		data.put("headImg", map.get("headImg").toString());
		return "openLogin/enterprise/ResumeDetail";
		
	}


	/*@RequestMapping("/saveResume")
	public String saveResume(
			@RequestBean("userBasicInfo") UserBasicInfo userBasicInfo,
			@RequestBean("resume") Resume resume,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		String newMajorAbility ="";
		if(!"".equals(resume.getMajorAbility()) && resume.getMajorAbility()!=null){
			newMajorAbility = resume.getMajorAbility().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		String newSpeciality = "";
		if(!"".equals(resume.getSpeciality()) && resume.getSpeciality()!=null){
			newSpeciality = resume.getSpeciality().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}

		resume.setMajorAbility(newMajorAbility);
		resume.setSpeciality(newSpeciality);
		if (userBasicInfo != null) {
			if ("高中".equals(userBasicInfo.getEducation())) {
				userBasicInfo.setEducation("2");
			} else if ("专科".equals(userBasicInfo.getEducation())) {
				userBasicInfo.setEducation("3");
			} else if ("本科".equals(userBasicInfo.getEducation())) {
				userBasicInfo.setEducation("4");
			} else if ("硕士".equals(userBasicInfo.getEducation())) {
				userBasicInfo.setEducation("5");
			} else if ("博士".equals(userBasicInfo.getEducation())) {
				userBasicInfo.setEducation("6");
			}
			userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
		}
		userService.updateResume(resume, userId);
		data.putAll(userService.findResumeByUserId(userId));
		return "user/resumeEducationModel";
	}*/
	/**
	 * <p>添加和修改用户的社团实践简历<br/>
	 * @title saveSocialpractice<br/>
	 * @date 2014-5-4 下午1:52:26<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param socialPractice
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/saveSocialpractice")
	public String saveSocialpractice(
			@RequestBean("socialPractice")SocialPractice socialPractice,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		String newMajorAbility = "";
		if(!"".equals(socialPractice.getActivityContent()) && socialPractice.getActivityContent()!=null){
			newMajorAbility = socialPractice.getActivityContent().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		//List<Map<String, Object>> map = socialPracticeMapper.findByUserId(userId);
		socialPractice.setActivityContent(newMajorAbility);
		socialPractice.setUserId(userId);
		//if(map.size()<1){
		//	socialPracticeMapper.insertSocial(socialPractice);
		//}else{
			socialPracticeMapper.updateById(socialPractice);
		//}
		data.put("social",socialPracticeMapper.findByUserId(userId));
		return "user/socialPractice";
	}
	@RequestMapping("/addSocialpractice")
	public String addSocialpractice(@RequestBean("socialPractice")SocialPractice socialPractice,
			@SessionValue("userId") int userId, Map<String, Object> data){
		String newMajorAbility = "";
		if(!"".equals(socialPractice.getActivityContent()) && socialPractice.getActivityContent()!=null){
			newMajorAbility = socialPractice.getActivityContent().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		socialPractice.setActivityContent(newMajorAbility);
		socialPractice.setUserId(userId);
		socialPracticeMapper.insertSocial(socialPractice);
		data.put("social",socialPracticeMapper.findByUserId(userId));
		return "user/socialPractice";
	}
	@RequestMapping("/deleteSocial")
	public String deleteSocial(int id,
			@SessionValue("userId") int userId, Map<String, Object> data){
		socialPracticeMapper.deleteSocial(id);
		data.put("social",socialPracticeMapper.findByUserId(userId));
		return "user/socialPractice";
	}
	@RequestMapping("/getByuserId")
	public String getByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("experience", experienceMapper.findByUserId(userId));
		return "user/experience";
	}
	
	@RequestMapping("/userBasicByuserId")
	public String userBasicByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("userBasicInfo", userBasicInfoMapper.findByUserId(userId));
		return "user/resumeBasicInfoModel";
	}
	
	@RequestMapping("/educationByuserId")
	public String educationByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("education", educationExperienceMapper.getByUserId(userId));
		return "user/resumeEducationModel";
	}
	@RequestMapping("/universityByuserId")
	public String universityByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("school", educationExperienceMapper.getByUserId(userId));
		return "job/school";
	}
	
	@RequestMapping("/socialByuserId")
	public String socialByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("social", socialPracticeMapper.findByUserId(userId));
		return "user/socialPractice";
	}
	@RequestMapping("/awardByuserId")
	public String awardByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("award", schoolRewardsMapper.findByUserId(userId));
		return "user/schoolAward";
	}
	@RequestMapping("/vocationalByuserId")
	public String vocationalByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	@RequestMapping("/selfDescByuserId")
	public String selfDescByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		data.put("resumeSelf", educationExperienceMapper.getByUserId(userId));
		return "user/resumeSelfDesc";
	}
	
	@RequestMapping("/fileResumeByuserId")
	public String fileResumeByuserId(@SessionValue("userId") int userId, Map<String, Object> data){
		UserBasicInfo resume = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
		if(resume.getAccessory()!=null && !"".equals(resume.getAccessory())){
			data.put("adjunct", (resume.getAccessory()).split("_")[1]);
		}
		data.put("accessory", resume.getAccessory());
		return "user/fileResume";
	}
	/**
	 * <p>添加和修改用户实习经历简历<br/>
	 * @title saveExperience<br/>
	 * @date 2014-5-4 下午1:53:21<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param socialPractice
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/saveExperience")
	public String saveExperience(
			@RequestBean("experience")Experience experience,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		String newMajorAbility = "";
		if(!"".equals(experience.getSxConut()) && experience.getSxConut()!=null){
			newMajorAbility = experience.getSxConut().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		//List<Map<String, Object>> maps = experienceMapper.findByUserId(userId);
		experience.setSxConut(newMajorAbility);
		experience.setUserId(userId);
		//if(maps.size()<1){
		//	experienceMapper.interExperience(experience);
		///}else{
			experienceMapper.updateById(experience);
		//}
			data.put("experience", experienceMapper.findByUserId(userId));
		return "user/experience";
	}
	
	@RequestMapping("/AddExperience")
	public String AddExperience(@RequestBean("experience")Experience experience,
			@SessionValue("userId") int userId, Map<String, Object> data){
		String newMajorAbility = "";
		if(!"".equals(experience.getSxConut()) && experience.getSxConut()!=null){
			newMajorAbility = experience.getSxConut().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		experience.setSxConut(newMajorAbility);
		experience.setUserId(userId);
		experienceMapper.interExperience(experience);
		data.put("experience", experienceMapper.findByUserId(userId));
		return "user/experience";
	}
	
	@RequestMapping("/deleteExperience")
	public String deleteExperience(int id,
			@SessionValue("userId") int userId, Map<String, Object> data){
		experienceMapper.deleteExperience(id);
		data.put("experience", experienceMapper.findByUserId(userId));
		return "user/experience";
	}
	/**
	 * <p>添加和修改用户校内奖励简历<br/>
	 * @title saveExperience<br/>
	 * @date 2014-5-4 下午1:53:21<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param schoolRewards
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/saveSchoolAward")
	public String saveSchoolAward(
			@RequestBean("schoolRewards")SchoolRewards schoolRewards,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		schoolRewards.setUserId(userId);
		schoolRewardsMapper.updateById(schoolRewards);
		data.put("award", schoolRewardsMapper.findByUserId(userId));
		return "user/schoolAward";
	}
	@RequestMapping("/addSchoolAward")
	public String addSchoolAward(@RequestBean("schoolRewards")SchoolRewards schoolRewards,
			@SessionValue("userId") int userId, Map<String, Object> data){
		schoolRewards.setUserId(userId);
		schoolRewardsMapper.insertSchoolRewar(schoolRewards);
		data.put("award", schoolRewardsMapper.findByUserId(userId));
		return "user/schoolAward";
	}
	@RequestMapping("/deleteAward")
	public String deleteAward(int id,
			@SessionValue("userId") int userId, Map<String, Object> data){
		schoolRewardsMapper.deleteSchoolRewar(id);
		data.put("award", schoolRewardsMapper.findByUserId(userId));
		return "user/schoolAward";
	}
	/**
	 * <p>添加和修改用户职业技能简历<br/>
	 * @title saveExperience<br/>
	 * @date 2014-5-4 下午1:53:21<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param schoolRewards
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/saveVocationalSkills")
	public String saveVocationalSkills(
			@RequestBean("vocationalSkills")VocationalSkills vocationalSkills,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		vocationalSkills.setUserId(userId);
		vocationalSkillsMapper.updateById(vocationalSkills);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	@RequestMapping("/deleteVocational")
	public String deleteVocational(int id,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		vocationalSkillsMapper.deleteById(id);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	@RequestMapping("/addVocationalSkills")
	public String addVocationalSkills(
			@RequestBean("vocationalSkills")VocationalSkills vocationalSkills,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		vocationalSkills.setUserId(userId);
		vocationalSkillsMapper.insertVocational(vocationalSkills);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	@RequestMapping("/addJtSkills")
	public String addJtSkills(@RequestBean("itSkill")ItSkill itSkill,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		itSkill.setUserId(userId);
		itSkill.setFamiliarity(1);
		itSkillMapper.insertItSkill(itSkill);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	@RequestMapping("/findVocationSkill")
	public String findVocationSkill(int userId, Map<String, Object> data) {
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		data.put("userId", userId);
		return "openLogin/user/vocationalSkills";
	}
	
	@RequestMapping("/saveJtSkills")
	public String saveJtSkills(@RequestBean("itSkill")ItSkill itSkill,
			@SessionValue("userId") int userId, Map<String, Object> data){
		itSkillMapper.updateById(itSkill);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	
	@RequestMapping("/deleteJtSkills")
	public String deleteJtSkills(int id,
			@SessionValue("userId") int userId, Map<String, Object> data){
		itSkillMapper.deleteById(id);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	
	@RequestMapping("/addPtSkills")
	public String addPtSkills(@RequestBean("itSkill")ItSkill itSkill,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		itSkill.setUserId(userId);
		itSkill.setFamiliarity(2);
		itSkillMapper.insertItSkill(itSkill);
		data.put("vocational", vocationalSkillsMapper.findByUserId(userId));
		data.put("itSkillJt", itSkillMapper.findByUserId(userId,1));
		data.put("itSkillPt", itSkillMapper.findByUserId(userId,2));
		return "user/vocationalSkills";
	}
	
	@RequestMapping("/saveSelfsDesc")
	public String saveSelfsDesc(@RequestBean("userBasicInfo") UserBasicInfo userBasicInfo,
			@SessionValue("userId") int userId, Map<String, Object> data) {
		String newMajorAbility = "";
		if(!"".equals(userBasicInfo.getSelfDescription()) && userBasicInfo.getSelfDescription()!=null){
			newMajorAbility = userBasicInfo.getSelfDescription().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		userBasicInfo.setSelfDescription(newMajorAbility);
		userBasicInfo.setUserId(userId);
		userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
		data.put("resumeSelf", userBasicInfoMapper.findByUserId(userId));
		return "user/resumeSelfDesc";
	}

	@RequestMapping("/saveUserBasicInfo")
	public String saveUserBasicInfo(@RequestBean("userBasicInfo") UserBasicInfo userBasicInfo,
			@SessionValue("userId") Integer userId,
			 Map<String, Object> data) {
		userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
		String emails = loginMapper.findLoginByUserId(userId).getEmail();
		if ("".equals(emails) || emails == null) {
			Login loginEmail= loginMapper.findUserByEmail(userBasicInfo.getEmail());
			if(loginEmail==null){
				loginMapper.updateByUserId(userBasicInfo.getEmail(),userId);
			}
		}
		Login login = loginMapper.findUserById(userId);
		setSessionValue(login);
		data.put("userBasicInfo", userBasicInfoMapper.findUserBasicInfoByUserId(userId));
		return "user/resumeBasicInfoModel";
	}

	/**
	 * <p>修改教育背景<br/>
	 * @title saveEducation<br/>
	 * @date 2014-5-5 下午4:54:23<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userBasicInfo
	 * @param resume
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/saveEducation")
	public String saveEducation(@RequestBean("educationExperience") EducationExperience educationExperience,
			@SessionValue("userId") Integer userId,
			 Map<String, Object> data) {
		String newMajorAbility ="";
		if(!"".equals(educationExperience.getMajorAbility()) && educationExperience.getMajorAbility()!=null){
			newMajorAbility = educationExperience.getMajorAbility().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		educationExperience.setMajorAbility(newMajorAbility);
		//resume.setSpeciality(newSpeciality);
		if (educationExperience != null) {
			if ("高中".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("2");
			} else if ("专科".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("3");
			} else if ("本科".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("4");
			} else if ("硕士".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("5");
			} else if ("博士".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("6");
			}
			educationExperience.setUserId(userId);
			educationExperienceMapper.updeteEducationExperience(educationExperience);
			session.setAttribute("university", educationExperience.getUniversity());
		}	
		data.put("education", educationExperienceMapper.getByUserId(userId));
		return "user/resumeEducationModel";
	}
	
	@RequestMapping("/AddEducation")
	public String AddEducation(@RequestBean("educationExperience") EducationExperience educationExperience,
			@SessionValue("userId") Integer userId,
			 Map<String, Object> data) {
		String newMajorAbility ="";
		if(!"".equals(educationExperience.getMajorAbility()) && educationExperience.getMajorAbility()!=null){
			newMajorAbility = educationExperience.getMajorAbility().replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
		}
		educationExperience.setMajorAbility(newMajorAbility);
		if (educationExperience != null) {
			if ("高中".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("2");
			} else if ("专科".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("3");
			} else if ("本科".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("4");
			} else if ("硕士".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("5");
			} else if ("博士".equals(educationExperience.getEducation())) {
				educationExperience.setEducation("6");
			}
			educationExperience.setUserId(userId);
			educationExperienceMapper.AddEducationExperience(educationExperience);
			session.setAttribute("university", educationExperience.getUniversity());
		}	
		data.put("education", educationExperienceMapper.getByUserId(userId));
		return "user/resumeEducationModel";
	}
	
	@RequestMapping("/deleteEducation")
	public String deleteEducation(int id,
			@SessionValue("userId") Integer userId,
			 Map<String, Object> data) {
		educationExperienceMapper.deleteEducation(id);
		data.put("education", educationExperienceMapper.getByUserId(userId));
		return "user/resumeEducationModel";
	}
	
	/**
	 * <p>
	 * 用户激活后填写的个人信息<br/>
	 * @title addUserBasicInfo<br/>
	 * @date 2014-4-3 下午1:50:28<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param userBasicInfo
	 * @param resume
	 * @param data
	 * @return
	 */
	@RequestMapping("/addUserBasicInfo")
	public String addUserBasicInfo(@SessionValue("userId") Integer userId,
			@RequestBean("userBasicInfo") UserBasicInfo userBasicInfo,
			 Map<String, Object> data) {
		userBasicInfo.setUserId(userId);
		userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
		return "indexPc";
	}

	@RequestMapping("/diliverResume")
	public void diliverResume(HttpServletRequest request,HttpServletResponse response,
			@SessionValue("userId") Integer userId,String declaration,int jobId,
			String daAn1,String daAn2,String daAn3,String daAn4,String daAn5,Integer terrace) {
		session.setAttribute("quantityHH", userBasicInfoMapper.findQuantity(userId));
		String newDeclaration = "";
		String newDaAnOne = "";
		String newDaAnTwo = "";
		String newDaAnThree = "";
		String newDaAnFour = "";
		String newDaAnFive = "";
		if(declaration!=null && !"".equals(declaration)){
			newDeclaration= declaration.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn1!=null && !"".equals(daAn1)){
			newDaAnOne= daAn1.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn2!=null && !"".equals(daAn2)){
			newDaAnTwo= daAn2.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn3!=null && !"".equals(daAn3)){
			newDaAnThree= daAn3.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn4!=null && !"".equals(daAn4)){
			newDaAnFour= daAn4.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn5!=null && !"".equals(daAn5)){
			newDaAnFive= daAn5.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		int num = userJobMapper.getUserJobNumBy(userId, jobId);
		if (num > 0) {
			JsonUtils.toJson(response, "该职位您已经投递");
			return;
		}
		UserJob userJob = new UserJob();
		userJob.setUserId(userId);
		userJob.setJobId(jobId);
		userJob.setAnswerOne(newDaAnOne);
		userJob.setAnswerTwo(newDaAnTwo);
		userJob.setAnswerThree(newDaAnThree);
		userJob.setAnswerFour(newDaAnFour);
		userJob.setAnswerFive(newDaAnFive);
		userJob.setTerrace(terrace);
		userService.diliverResume(userJob);
		RecordChart recordChart = new RecordChart();
		recordChart.setResumeSum(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
				"yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录投递简历数
		}
		//new SendEmailThread(request, jobId, userId,newDeclaration).start();
		try {
			sendEmailResume(request, jobId, userId,newDeclaration,newDaAnOne,newDaAnTwo,newDaAnThree,newDaAnFour,newDaAnFive);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			sendEmailTo(request, jobId, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JsonUtils.toJson(response, "简历投递成功");
	}

	
	@RequestMapping("/diliverResumeWxWjl")
	public void diliverResumeWxWjl(HttpServletRequest request,HttpServletResponse response,
			@SessionValue("userId") Integer userId,String declaration,int jobId,
			String daAn1,String daAn2,String daAn3,String daAn4,String daAn5,Integer terrace) {
		session.setAttribute("quantityHH", userBasicInfoMapper.findQuantity(userId));
		String newDeclaration = "";
		String newDaAnOne = "";
		String newDaAnTwo = "";
		String newDaAnThree = "";
		String newDaAnFour = "";
		String newDaAnFive = "";
		if(declaration!=null && !"".equals(declaration)){
			newDeclaration= declaration.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn1!=null && !"".equals(daAn1)){
			newDaAnOne= daAn1.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn2!=null && !"".equals(daAn2)){
			newDaAnTwo= daAn2.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn3!=null && !"".equals(daAn3)){
			newDaAnThree= daAn3.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn4!=null && !"".equals(daAn4)){
			newDaAnFour= daAn4.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn5!=null && !"".equals(daAn5)){
			newDaAnFive= daAn5.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		int num = userJobMapper.getUserJobNumBy(userId, jobId);
		if (num > 0) {
			JsonUtils.toJson(response, "该职位您已经投递");
			return;
		}
		UserJob userJob = new UserJob();
		userJob.setUserId(userId);
		userJob.setJobId(jobId);
		userJob.setAnswerOne(newDaAnOne);
		userJob.setAnswerTwo(newDaAnTwo);
		userJob.setAnswerThree(newDaAnThree);
		userJob.setAnswerFour(newDaAnFour);
		userJob.setAnswerFive(newDaAnFive);
		userJob.setTerrace(terrace);
		userService.diliverResume(userJob);
		RecordChart recordChart = new RecordChart();
		recordChart.setResumeSum(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
				"yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录投递简历数
		}
		//new SendEmailThread(request, jobId, userId,newDeclaration).start();
		try {
			sendEmailResumeWxWjl(request, jobId, userId,newDeclaration,newDaAnOne,newDaAnTwo,newDaAnThree,newDaAnFour,newDaAnFive);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			sendEmailTo(request, jobId, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JsonUtils.toJson(response, "简历投递成功");
	}
	
	
	@RequestMapping("/declaration/{jobId}")
	public String declaration(@SessionValue("userId") Integer userId,
			@PathVariable("jobId")int jobId,
			Map<String,Object> data) throws UnsupportedEncodingException{
		Integer quantity = userBasicInfoMapper.findQuantity(userId);
		if(quantity != null && quantity != 0 && jobId!=0){
			data.put("quantity", quantity);
			Job job = jobMapper.getJobOf(jobId);
			if(job.getInterQuestionsOne()!=null && !"".equals(job.getInterQuestionsOne())){
				data.put("wenTi1", job.getInterQuestionsOne());
				data.put("wenTi2", job.getInterQuestionsTwo());
				data.put("wenTi3", job.getInterQuestionsThree());
				data.put("wenTi4", job.getInterQuestionsFour());
				data.put("wenTi5", job.getInterQuestionsFive());
			}
			System.out.println("job.getInterQuestionsOne()=="+job.getInterQuestionsOne());
			data.put("jobId", jobId);
			return "user/declaration";
		}else{
			//userName = URLEncoder.encode(userName, "utf-8");
			data.put("inviteRegister", "http://www.yaoshixi.com/inviteRegister/"+userId);
			return "user/quantityFull";
		}
	}
	
	@RequestMapping("/declarationPhone/{jobId}")
	public String declarationPhone(@SessionValue("userId") Integer userId,
			@PathVariable("jobId")int jobId,
			Map<String,Object> data) throws UnsupportedEncodingException{
		Integer quantity = userBasicInfoMapper.findQuantity(userId);
		if(quantity != null && quantity != 0 && jobId!=0){
			data.put("quantity", quantity);
			Job job = jobMapper.getJobOf(jobId);
			if(job.getInterQuestionsOne()!=null && !"".equals(job.getInterQuestionsOne())){
				data.put("wenTi1", job.getInterQuestionsOne());
				data.put("wenTi2", job.getInterQuestionsTwo());
				data.put("wenTi3", job.getInterQuestionsThree());
				data.put("wenTi4", job.getInterQuestionsFour());
				data.put("wenTi5", job.getInterQuestionsFive());
			}
			System.out.println("job.getInterQuestionsOne()=="+job.getInterQuestionsOne());
			data.put("jobId", jobId);
			return "m/declaration";
		}else{
			//userName = URLEncoder.encode(userName, "utf-8");
			data.put("inviteRegister", "http://www.yaoshixi.com/inviteRegister/"+userId);
			return "user/quantityFull";
		}
	}
	
	@RequestMapping("/declarationWeix/{jobId}")
	public String declarationWeix(@SessionValue("userId") Integer userId,
			@PathVariable("jobId")int jobId,
			Map<String,Object> data) throws UnsupportedEncodingException{
		Integer quantity = userBasicInfoMapper.findQuantity(userId);
		if(quantity != null && quantity != 0 && jobId!=0){
			data.put("quantity", quantity);
			Job job = jobMapper.getJobOf(jobId);
			if(job.getInterQuestionsOne()!=null && !"".equals(job.getInterQuestionsOne())){
				data.put("wenTi1", job.getInterQuestionsOne());
				data.put("wenTi2", job.getInterQuestionsTwo());
				data.put("wenTi3", job.getInterQuestionsThree());
				data.put("wenTi4", job.getInterQuestionsFour());
				data.put("wenTi5", job.getInterQuestionsFive());
			}
			System.out.println("job.getInterQuestionsOne()=="+job.getInterQuestionsOne());
			data.put("jobId", jobId);
			return "weixin/declaration";
		}else{
			//userName = URLEncoder.encode(userName, "utf-8");
			data.put("inviteRegister", "http://www.yaoshixi.com/inviteRegister/"+userId);
			return "weixin/quantityFull";
		}
	}
	/*
	 * 微信投递简历
	 */
	@RequestMapping("/diliverResumeByWx")
	public void diliverResumeByWx(HttpServletRequest request,
			HttpServletResponse response,
			@SessionValue("userId") Integer userId,
			@SessionValue("roleId")Integer roleId, int jobId,String declaration,
			String daAn1,String daAn2,String daAn3,String daAn4,String daAn5) {
		session.setAttribute("quantityHH", userBasicInfoMapper.findQuantity(userId));
		String newDeclaration = "";
		String newDaAnOne = "";
		String newDaAnTwo = "";
		String newDaAnThree = "";
		String newDaAnFour = "";
		String newDaAnFive = "";
		if(declaration!=null && !"".equals(declaration)){
			newDeclaration= declaration.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn1!=null && !"".equals(daAn1)){
			newDaAnOne= daAn1.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn2!=null && !"".equals(daAn2)){
			newDaAnTwo= daAn2.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn3!=null && !"".equals(daAn3)){
			newDaAnThree= daAn3.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn4!=null && !"".equals(daAn4)){
			newDaAnFour= daAn4.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn5!=null && !"".equals(daAn5)){
			newDaAnFive= daAn5.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if (userId == 0) {
			JsonUtils.toJson(response, "请先绑定用户");
			return;
			// return "openLogin/wxLogin";
		}
		else if(roleId==1){
			JsonUtils.toJson(response, "企业用户不能投递简历");
			return;
		}
		int num = userJobMapper.getUserJobNumBy(userId, jobId);
		if (num > 0) {
			JsonUtils.toJson(response, "简历已经投递");
			return;
		}
		UserJob userJob = new UserJob();
		userJob.setUserId(userId);
		userJob.setJobId(jobId);
		userJob.setAnswerOne(newDaAnOne);
		userJob.setAnswerTwo(newDaAnTwo);
		userJob.setAnswerThree(newDaAnThree);
		userJob.setAnswerFour(newDaAnFour);
		userJob.setAnswerFive(newDaAnFive);
		userService.diliverResume(userJob);
		RecordChart recordChart = new RecordChart();
		recordChart.setResumeSum(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
				"yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录投递简历数
		}
		//new SendEmailThread(request, jobId, userId,newDeclaration).start();
		try {
			sendEmailResume(request, jobId, userId,newDeclaration,newDaAnOne,newDaAnTwo,newDaAnThree,newDaAnFour,newDaAnFive);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			sendEmailTo(request, jobId, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JsonUtils.toJson(response, "简历投递成功");
		return;
	}

	
	
	@RequestMapping("/declarationx/{jobId}")
	public String declarationx(@SessionValue("userId") Integer userId,
			@PathVariable("jobId")int jobId,
			Map<String,Object> data) throws UnsupportedEncodingException{
		Integer quantity = userBasicInfoMapper.findQuantity(userId);
		if(quantity != null && quantity != 0 && jobId!=0){
			data.put("quantity", quantity);
			Job job = jobMapper.getJobOf(jobId);
			if(job.getInterQuestionsOne()!=null && !"".equals(job.getInterQuestionsOne())){
				data.put("wenTi1", job.getInterQuestionsOne());
				data.put("wenTi2", job.getInterQuestionsTwo());
				data.put("wenTi3", job.getInterQuestionsThree());
				data.put("wenTi4", job.getInterQuestionsFour());
				data.put("wenTi5", job.getInterQuestionsFive());
			}
			data.put("jobId", jobId);
			return "openLogin/declaration";
		}else{
			//userName = URLEncoder.encode(userName, "utf-8");
			data.put("inviteRegister", "http://www.yaoshixi.com/inviteRegister/"+userId);
			return "user/quantityFull";
		}
	}
	
	/*
	 * 微信推送投递简历
	 */
	
	@RequestMapping("/diliverResumeByWxSend")
	public void diliverResumeByWxSend(HttpServletRequest request,
			HttpServletResponse response,
			@SessionValue("userId") Integer userId,
			@SessionValue("roleId")Integer roleId, int jobId,String declaration,
			String daAn1,String daAn2,String daAn3,String daAn4,String daAn5) {
		session.setAttribute("quantityHH", userBasicInfoMapper.findQuantity(userId));
		String newDeclaration = "";
		String newDaAnOne = "";
		String newDaAnTwo = "";
		String newDaAnThree = "";
		String newDaAnFour = "";
		String newDaAnFive = "";
		if(declaration!=null && !"".equals(declaration)){
			newDeclaration= declaration.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn1!=null && !"".equals(daAn1)){
			newDaAnOne= daAn1.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn2!=null && !"".equals(daAn2)){
			newDaAnTwo= daAn2.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn3!=null && !"".equals(daAn3)){
			newDaAnThree= daAn3.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn4!=null && !"".equals(daAn4)){
			newDaAnFour= daAn4.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if(daAn5!=null && !"".equals(daAn5)){
			newDaAnFive= daAn5.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		if (userId == 0) {
			JsonUtils.toJson(response, "请先绑定用户");
			return;
			// return "openLogin/wxLogin";
		}
		else if(roleId==1){
			JsonUtils.toJson(response, "企业用户不能投递简历");
			return;
		}
		int num = userJobMapper.getUserJobNumBy(userId, jobId);
		if (num > 0) {
			JsonUtils.toJson(response, "简历已经投递");
			return;
		}
		UserJob userJob = new UserJob();
		userJob.setUserId(userId);
		userJob.setJobId(jobId);
		userJob.setAnswerOne(newDaAnOne);
		userJob.setAnswerTwo(newDaAnTwo);
		userJob.setAnswerThree(newDaAnThree);
		userJob.setAnswerFour(newDaAnFour);
		userJob.setAnswerFive(newDaAnFive);
		userService.diliverResume(userJob);
		RecordChart recordChart = new RecordChart();
		recordChart.setResumeSum(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
				"yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录投递简历数
		}
		//new SendEmailThread(request, jobId, userId,newDeclaration).start();
		try {
			sendEmailResume(request, jobId, userId,newDeclaration,newDaAnOne,newDaAnTwo,newDaAnThree,newDaAnFour,newDaAnFive);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			sendEmailTo(request, jobId, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JsonUtils.toJson(response, "简历投递成功");
		return;
	}
	
	

	class SendEmailThread extends Thread {
		private HttpServletRequest request;
		private int jobId;
		private int userId;
		private String declaration;
		public SendEmailThread(HttpServletRequest request, int jobId, int userId,String declaration) {
			this.request = request;
			this.jobId = jobId;
			this.userId = userId;
			this.declaration = declaration;
		}

		@Override
		public void run() {
			try {
				sendEmailToHR(request, jobId, userId,declaration);
			} catch (Exception e) {
				e.printStackTrace();
			}
			super.run();
		}
	}
	/**
	 * <p>用户投递简历发送自己的简历给企业Hr<br/>
	 * @title sendEmailToHR<br/>
	 * @date 2014-4-18 下午12:30:50<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param jobId
	 * @param userId
	 * @throws Exception
	 */
	private void sendEmailToHR(HttpServletRequest request, int jobId, int userId,String declaration)
			throws Exception {
		EmailSmtpSend ess = EmailUtils.getEmailSmtpSendDefault();
		declaration = URLEncoder.encode(declaration, "utf-8");
		String urlStr = PropertyUtils.getProperty("projectUrl")
				+ "user/preview/"+declaration;
		
		String html = EmailUtils.convertHtmlToStr(request, urlStr);
		Integer companyId = (Integer) jobMapper.findJobsById(jobId).get(
				"companyId");
		String companyName = (String) jobMapper.findJobsById(jobId).get(
				"companyName");
		String email = companyMapper.getCompanyInfoByCompanyId(companyId)
				.getEmail();
		if("yaoshixi@szfore.com".equals(email)){
			email = "cv@yaoshixi.com";
		}
		String jobName = jobMapper.getJobOf(jobId).getJobName();
		String userName = userBasicInfoMapper.findUserBasicInfoByUserId(userId)
				.getUserName();
		ess.sendHtmlMail(
				"要实习-投递-"+ companyName +"-" + jobName+"-"+userName+"的简历", html,
				email);
	}

	/**
	 * <p>用户投递简历发邮件通知企业HR<br/>
	 * @title sendEmailTo<br/>
	 * @date 2014-4-18 下午12:29:58<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param jobId
	 * @param userId
	 * @throws Exception
	 */
	private void sendEmailResume(HttpServletRequest request, int jobId, int userId,
			String declaration,String daAnOne,String daAnTwo,String daAnThree,
			String daAnFour,String daAnFive)
			throws Exception {
			session.setAttribute("declaration", declaration);
			session.setAttribute("daAnOne", daAnOne);
			session.setAttribute("daAnTwo", daAnTwo);
			session.setAttribute("daAnThree", daAnThree);
			session.setAttribute("daAnFour", daAnFour);
			session.setAttribute("daAnFive", daAnFive);
			String urlStr = PropertyUtils.getProperty("projectUrl")
					+"user/deliveryResume/"+jobId;
			
			String html = EmailUtils.convertHtmlToStr(request, urlStr);
			
			Integer companyId = (Integer) jobMapper.findJobsById(jobId).get(
					"companyId");
			String companyName = (String) jobMapper.findJobsById(jobId).get(
					"companyName");
			String email = companyMapper.getCompanyInfoByCompanyId(companyId).getEmail();
			if("yaoshixi@szfore.com".equals(email)){
				email = "cv@yaoshixi.com";
			}
			session.removeAttribute("declaration");
			session.removeAttribute("daAnOne");
			session.removeAttribute("daAnTwo");
			session.removeAttribute("daAnThree");
			session.removeAttribute("daAnFour");
			session.removeAttribute("daAnFive");
			String jobName = jobMapper.getJobOf(jobId).getJobName();
			String userName = userBasicInfoMapper.findUserBasicInfoByUserId(userId).getUserName();
			EmailSmtpSend ess = EmailUtils.getEmailSmtpSendDefault();
			ess.sendHtmlMail("要实习-投递-"+ companyName +"-" + jobName+"-"+userName+"的简历", html,email);
	}
	
	private void sendEmailResumeWxWjl(HttpServletRequest request, int jobId, int userId,
			String declaration,String daAnOne,String daAnTwo,String daAnThree,
			String daAnFour,String daAnFive)
			throws Exception {
			session.setAttribute("declaration", declaration);
			session.setAttribute("daAnOne", daAnOne);
			session.setAttribute("daAnTwo", daAnTwo);
			session.setAttribute("daAnThree", daAnThree);
			session.setAttribute("daAnFour", daAnFour);
			session.setAttribute("daAnFive", daAnFive);
			String urlStr = PropertyUtils.getProperty("projectUrl")
					+"user/deliveryResumeWxWjl/"+jobId;
			
			String html = EmailUtils.convertHtmlToStr(request, urlStr);
			
			Integer companyId = (Integer) jobMapper.findJobsById(jobId).get(
					"companyId");
			String companyName = (String) jobMapper.findJobsById(jobId).get(
					"companyName");
			String email = companyMapper.getCompanyInfoByCompanyId(companyId).getEmail();
			if("yaoshixi@szfore.com".equals(email) || email==null || email==""){
				email = "cv@yaoshixi.com";
			}
			session.removeAttribute("declaration");
			session.removeAttribute("daAnOne");
			session.removeAttribute("daAnTwo");
			session.removeAttribute("daAnThree");
			session.removeAttribute("daAnFour");
			session.removeAttribute("daAnFive");
			String jobName = jobMapper.getJobOf(jobId).getJobName();
			String userName = userBasicInfoMapper.findUserBasicInfoByUserId(userId).getUserName();
			EmailSmtpSend ess = EmailUtils.getEmailSmtpSendDefault();
			ess.sendHtmlMail("要实习-投递-"+ companyName +"-" + jobName+"-"+userName+"的简历", html,email);
	}
	
	
	private void sendEmailTo(HttpServletRequest request, int jobId, int userId)
			throws Exception {
		Integer companyId = (Integer) jobMapper.findJobsById(jobId).get(
				"companyId");
		String companyName = (String) jobMapper.findJobsById(jobId).get(
				"companyName");
		String email = companyMapper.getCompanyInfoByCompanyId(companyId)
				.getEmail();
		if("yaoshixi@szfore.com".equals(email)){
			email = "cv@yaoshixi.com";
		}
		String jobName = jobMapper.getJobOf(jobId).getJobName();
		//String jobName2 = URLEncoder.encode(jobName, "utf-8");
		session.setAttribute("TsjobName", jobName);
		session.setAttribute("Tsemail", email);
		String urlStr = PropertyUtils.getProperty("projectUrl")
				+ "user/deliveryNotification/"+companyId;
		String html = EmailUtils.convertHtmlToStr(request, urlStr);
		/*EmailSmtpSend ess = EmailUtils.getEmailSmtpSendDefault();
		ess.sendHtmlMail(
				"要实习-投递" + companyName + "-" + jobName+"-职位提示", html,
				email);*/
		System.out.println("email=="+email);
		SendCloudEmail cloudEmail = new SendCloudEmail();
		try {
			cloudEmail.SendCloudEmailHtml("要实习-投递" + companyName + "-" + jobName+"-职位提示", html, email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * <p>用户投递简历后发邮件给HR的邮件页面<br/>
	 * @title sendEmailToHR2<br/>
	 * @date 2014-4-18 下午12:29:09<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param jobName
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping("/deliveryNotification/{companyId}")
	public String deliveryNotification(@PathVariable("companyId")Integer companyId,Map<String, Object> data) {
		String jobName = (String) session.getAttribute("TsjobName");
		String email = (String) session.getAttribute("Tsemail");
		data.put("jobName", jobName);
		data.put("email", email);
		session.removeAttribute("TsjobName");
		session.removeAttribute("Tsemail");
		String registId = EmailUtils.genRegistId();
		String validateUrl = EmailUtils.genValidateUrljobReferrals(registId, email,companyId);
		data.put("validateUrl", validateUrl);
		return "company/sendEmailInform";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/userJob")
	public String userJob(@SessionValue("userId") Integer userId,
			@ModelAttribute("page") Page page) {
		page.setResults(userService.getUserJobs(userId, page));
		return "/user/userJobModel";
	}

	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request,Map<String, Object> data) {
		request.getSession().invalidate();
		/*String access_token = session.getAttribute("access_token").toString();
		String urlForUserInfo = "https://api.weibo.com/2/account/end_session.json?access_token="+access_token;
		try {
		   HttpUtil.doGet(urlForUserInfo);
		} catch (Exception e) {
			System.out.println("error");
		}*/
		data.put("checkLogin", 0);
		return "login";
	}

	@RequestMapping("/jobList")
	public String jobList() {
		return "/user/jobList";
	}

	/**
	 * 论坛 与用户相关的操作
	 */
	@RequestMapping("/addTopic")
	public String addTopic(@SessionValue("userId") Integer userId,
			@ModelAttribute("topic") Topic topic) {
		topic.setUserId(userId);
		topic.setPublishTime(new Date());
		System.out.println("1111111111111111");
		System.out.println(topic.getTitle());
		System.out.println(topic.getType());
		System.out.println(topic.getContent());
		topicMapper.insertTopic(topic);
		return "forum/index";
	}

	@RequestMapping("/addReply")
	public void addReply(HttpServletResponse response,
			@SessionValue("userId") Integer userId, int topicId, int pid,
			String replyContent) {
		if (userId == null) {
			JsonUtils.toJson(response, "登录后，才能发布回复");
			return;
		}
		UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
		if(userBasicInfo.getUserName()!=null && !"".equals(userBasicInfo.getUserName())){
			Reply reply = new Reply();
			reply.setUserId(userId);
			reply.setTopicId(topicId);
			reply.setPid(pid);
			reply.setReplyTime(new Date());
			reply.setReplyContent(replyContent);
			replyMapper.insertReply(reply);
			JsonUtils.toJson(response, "回复成功");
		}else{
			JsonUtils.toJson(response, "请先完善您的个人信息，才能发布回复");
		}
		return;
	}

	@RequestMapping("/addTopicInput")
	public String addTopicInput() {
		return "forum/addTopic";
	}

	/**
	 * <p>
	 * 企业用户登录获得的消息<br/>
	 * @title findReceiveResumeMsg<br/>
	 * @date 2014-3-31 下午5:02:56<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/findReceiveResumeMsg")
	public String findReceiveResumeMsg(@SessionValue("userId") int userId,
			Map<String, Object> data) {
		List<Map<String, Object>> jobs = jobMapper.findReceiveResumeMsg(userId);
		data.put("msgList", jobs);
		/*Login login = new Login();
		login.setNum(jobs.size());
		setSessionValue(login);*/
		return "user/message";
	}

	/**
	 * <p>
	 * 个人用户登录获得的消息<br/>
	 * 
	 * @title findReceivePerson<br/>
	 * @date 2014-3-31 下午5:02:01<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/findReceivePerson")
	public String findReceivePerson(@SessionValue("userId") int userId,
			Map<String, Object> data) {
		// data.put("msgList", jobMapper.findReceiveResumeMsg(userId));
		data.put("interviewNotices",interviewNoticeMapper.findInterviewNotice(userId));
		data.put("intern", internMapper.findByStatus(userId, 0));
		return "user/message";
	}

	@RequestMapping("/interviewNotice/{id}")
	public String interviewNotice(@PathVariable("id") int id,
			Map<String, Object> data) {
		interviewNoticeMapper.updateStatus(id);
		data.putAll(interviewNoticeMapper.findInterviewNoticeById(id));
		return "user/interviewNotice";
	}

	/**
	 * 微信查看面试通知
	 * @param id
	 * @param data
	 * @return
	 */
	@RequestMapping("/interviewNoticeByWx/{id}")
	public String interviewNoticeByWx(@PathVariable("id") int id,
			Map<String, Object> data) {
		interviewNoticeMapper.updateStatus(id);
		data.putAll(interviewNoticeMapper.findInterviewNoticeById(id));
		return "openLogin/interviewNoticeOnWx";
	}
	/**
	 * 检测该QQ是否是第一次登录，如果是，则生成一个userId，然后在相应的表插入数据
	 * 如果不是第一次登录，则直接登录，不需要任何插入操作。
	 * 这个方法的作用，其实就是生成/获取userId
	 * @param code
	 * @param state
	 * @param wx
	 * @return
	 */
	@RequestMapping("/openlogin_callback")
	public String openlogin_callback(String code, String state,Map<String, Object> data) {
		String appId = "101026976";
		String appKey = "d657fbcae5917b88fc05cdfa83e168e1";
		String access_token = "";
		String joinId = "";
		String nickname = "";
		String urlForAccessToken = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id="+ appId +
				"&client_secret="+ appKey +
				"&code="+ code +"&state="+ code +
				"&redirect_uri=http://www.yaoshixi.com/user/openlogin_callback";
		try {
			access_token = HttpUtil.doGet(urlForAccessToken);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error");
		}
		access_token = access_token.substring(access_token.indexOf("access_token="), access_token.indexOf("&")).split("=")[1];
		System.out.println(access_token);
		
		
		//上面的连接，可以获取到access_token，通过它可以得到用户的joinId(与QQ号相对应)
		String urlForopenid = "https://graph.qq.com/oauth2.0/me?access_token="+ access_token;
		
		try {
			joinId = HttpUtil.doGet(urlForopenid);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error");
		}
		String openJson = joinId.substring(joinId.indexOf("{"), joinId.indexOf("}")+1);
		System.out.println(openJson);
		joinId = JsonUtil.toMap(openJson).get("openid").toString();
		System.out.println(joinId);
		
		//获取用户的信息
		String urlForUserInfo = "https://graph.qq.com/user/get_user_info?access_token="+ access_token +
				"&oauth_consumer_key="+ appId +
				"&openid=" + joinId;
		try {
			nickname = HttpUtil.doGet(urlForUserInfo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error");
		}
		String userinfoJson = nickname.substring(nickname.indexOf("{"), nickname.indexOf("}")+1);
		System.out.println(userinfoJson);
		nickname = JsonUtil.toMap(userinfoJson).get("nickname").toString();
		System.out.println(nickname);
		
		OAuthVO oAuth = loginMapper.selectOAuthUser(joinId);
		Login login = new Login();
		if (oAuth == null) {
			// 该第三方用户第一次登录
			// 插入用户信息
			login.setActiveStatus(1);
			login.setRoleId(2);

			loginMapper.insertUser(login);
			loginMapper.insertOAuthUser(joinId, login.getId(), nickname,
					access_token,0);
			UserBasicInfo userBasicInfo = new UserBasicInfo();
			userBasicInfo.setUserId(login.getId());
			userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);

			setSessionValue(login);
			session.setAttribute("userName", nickname);
			session.setAttribute("openLogin", "1");
			
			
		} else {
			// 该第三方用户已经登录过
			login = loginMapper.findLoginByUserId(oAuth.getUserId());
			System.out.println(login);
			setSessionValue(login);
			UserBasicInfo ubi = userBasicInfoMapper.findUserBasicInfoByUserId(login.getId());
			if (ubi != null && null != ubi.getUserName()) {
				session.setAttribute("userName", ubi.getUserName());
			} else {
				session.setAttribute("userName", nickname);
				session.setAttribute("openLogin", "1");
			}
			loginMapper.updateUserLoginInfo(login.getId());
			System.out.println(session.getAttribute("userName"));
			
		}
		//如果是从微信通过QQ注册的，则执行以下步骤
		if(!"qq".equals(state)) {
			if(bindWXCount(state, login.getId(), data)){
				return "openLogin/wxBdingSuccess";
			}
			/*if(loginMapper.selectOAuthUser(state)==null){
			loginMapper.insertOAuthUser(state, login.getId(), "","",1);
			data.put("flag", 0);
			return "openLogin/wxBdingSuccess";
			}*/
		}
		//记录用户登陆量
		RecordChart recordChart = new RecordChart();
		recordChart.setUserLogin(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil
				.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()),
					recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录用户登录量
		}
		//记录用户登陆量
		return "redirect:http://www.yaoshixi.com/indexPc";
	}

	/**
	 * <p>
	 * 向我推荐--根据用户id查询用户信息匹配招聘信息<br/>
	 * 
	 * @title positionRecommend<br/>
	 * @date 2014-3-21 上午9:56:18<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param userId
	 * @param page
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/positionRecommend")
	public String positionRecommend(HttpServletRequest request,
			@SessionValue("userId") Integer userId,
			@ModelAttribute("page") Page page) {
		if(userId==null){
			return "ogInFirst";
		}else{
			UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(userId);
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			if ((!"".equals(userBasicInfo.getCity()) && userBasicInfo.getCity() != null)) {
				list = jobService.JobsRecd(userId, userBasicInfo, page);
				if (list.size() > 0) {
					page.setResults(list);
					return "indexModelRecommend";
				} else {
					return "reminder";
				}
			} else {
				return "recommend";
			}
		}
	}
	
	@RequestMapping("/sinaLogin")
	public String sinaLogin(String code){
		String appId = "1862990248";
		String appKey = "86fee89091bb1f5e5fa79aa4f56dd245";
		String access_token = "";
		String joinId = "";
		String nickname = "";
		System.out.println(code+">>>>>>>>>>>>>>>>>");
		String urlForAccessToken = "https://api.weibo.com/oauth2/access_token";
		Map<String, String> params = new HashMap<String, String>();
		params.put("client_id", appId);
		params.put("client_secret", appKey);
		params.put("grant_type", "authorization_code");
		params.put("redirect_uri", "http://www.yaoshixi.com/user/sinaLogin");
		params.put("code", code);
		try {
			access_token = HttpUtil.doPost(urlForAccessToken, params);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error");
		}
		joinId = access_token.substring(access_token.indexOf("uid"), access_token.indexOf("}")).split("\"")[2];
		access_token = access_token.substring(access_token.indexOf("access_token"), access_token.indexOf("}")).split("\"")[2];
		//获取用户的信息
		
		String urlForUserInfo = "https://api.weibo.com/2/users/show.json?access_token="+access_token+"&uid="+joinId;
		try {
			nickname = HttpUtil.doGet(urlForUserInfo);
		} catch (Exception e) {
			System.out.println("error");
		}
		nickname = nickname.substring(nickname.indexOf("screen_name"), nickname.indexOf("}")).split("\"")[2];
		
		OAuthVO oAuth = loginMapper.selectOAuthUser(joinId);
		Login login = new Login();
		if (oAuth == null) {
			login.setActiveStatus(1);
			login.setRoleId(2);

			loginMapper.insertUser(login);
			loginMapper.insertOAuthUser(joinId, login.getId(), nickname,
					"sina microblog",2);
			UserBasicInfo userBasicInfo = new UserBasicInfo();
			userBasicInfo.setUserId(login.getId());
			userBasicInfo.setUserName(nickname);
			userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);

			setSessionValue(login);
			session.setAttribute("userName", nickname);
			session.setAttribute("openLogin", "1");
		}else{
			login = loginMapper.findLoginByUserId(oAuth.getUserId());
			setSessionValue(login);
			UserBasicInfo ubi = userBasicInfoMapper.findUserBasicInfoByUserId(login.getId());
			if (ubi != null && ubi.getUserName() != null) {
				session.setAttribute("userName", ubi.getUserName());
			} else {
				session.setAttribute("userName", nickname);
				session.setAttribute("openLogin", "1");
			}
			loginMapper.updateUserLoginInfo(login.getId());
			System.out.println(session.getAttribute("userName"));
		}
		session.setAttribute("access_token", access_token);
		//记录用户登陆量
		RecordChart recordChart = new RecordChart();
		recordChart.setUserLogin(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil
				.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()),
					recordChart);
		} else {
			userService.insertRecordChart(recordChart);// 记录用户登录量
		}
		//记录用户登陆量
		return "redirect:http://www.yaoshixi.com/indexPc";
	}
	/**
	 * <p>微信查看我的简历<br/>
	 * @title resumeWx<br/>
	 * @date 2014-5-20 上午11:30:15<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/resumeWx/{userId}")
	public String resumeWx(@PathVariable("userId") Integer userId,
			Map<String, Object> data){
		OAuthVO authVO = loginMapper.selectOAuthUserByUser(userId);
		if(authVO != null){
			System.out.println(authVO.getJoinId());
			Map<String, Object> map = userService.findByUserId(userId,"1");
			Login login= loginMapper.findLoginByUserId(userId);
			setSessionValue(login);
			data.putAll(map);
			return "openLogin/user/resumeWx";
		}else{
			data.put("flag", 11);
			return "openLogin/wxBdingSuccess";
		}
	}
	/**
	 * <p>扫码编辑简历<br/>
	 * @title publishResume<br/>
	 * @date 2015-3-3 下午5:20:06<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param data
	 * @return
	 */
	@RequestMapping("publishResume")
	public String publishResume(Map<String,Object> data){
		Object userId = session.getAttribute("userId");
		if(userId != null){
			OAuthVO authVO = loginMapper.selectOAuthUserByUser((Integer) userId);
			if(authVO != null){
				System.out.println(authVO.getJoinId());
				Map<String, Object> map = userService.findByUserId((Integer)userId,"1");
				Login login= loginMapper.findLoginByUserId((Integer)userId);
				setSessionValue(login);
				data.putAll(map);
				return "openLogin/user/resumeWx";
			}else{
				data.put("flag", 11);
				return "openLogin/wxBdingSuccess";
			}
		}else{
			session.setAttribute("requestURLs","/user/resumeWx/");
			return "weixin/loginRegistry";
		}
	}
	
	@RequestMapping("/resumeWxWei/{userId}")
	public String resumeWxWei(@PathVariable("userId") Integer userId,Map<String, Object> data){
		Map<String, Object> map = userService.findByUserIdGzr(userId,"1");
		data.putAll(map);
		return "openLogin/user/weixResume";
	}
	
	/*@RequestMapping("/flashHire/{companyId}/{userId}")
	public String flashHire(@PathVariable("companyId")int companyId,
			@PathVariable("userId")int userId,Map<String,Object> data){
		Login login = loginMapper.findLoginByUserId(userId);
		setSessionValue(login);
		data.put("companyId", companyId);
		return "weixin/flashHire";
	}*/
	@RequestMapping("/flashHire/{userId}")
	public String flashHire(@PathVariable("userId")int userId,
			@SessionValue("requestURLs") String requestURLs,Map<String,Object> data){
		CompanyInfo info = companyMapper.getCompanyInfoOf(userId);
		Login login = loginMapper.findLoginByUserId(userId);
		setSessionValue(login);
		data.put("userId", userId);
		if(info != null){
			data.put("companyId", info.getId());
			data.put("companyName", info.getCompanyName());
			data.put("companyShortName", info.getCompanyShortName());
			data.put("phone", info.getPhone());
			data.put("email", info.getEmail());
			data.put("compStart", "falses");
			//return "weixin/flashHire";
		}else{
			data.put("compStart", "tures");
			//return "weixin/flashHireCom";
		}
		return "weixin/flashHire";
	}
	
	/**
	 * <p>扫码发布职位<br/>
	 * @title publishJob<br/>
	 * @date 2015-3-3 上午11:46:16<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param data
	 * @return
	 */
	@RequestMapping("/publishJob")
	public String publishJob(Map<String,Object> data){
		 Object userId = session.getAttribute("userId");
		if(userId != null){
			CompanyInfo info = companyMapper.getCompanyInfoOf((Integer) userId);
			Login login = loginMapper.findLoginByUserId((Integer) userId);
			setSessionValue(login);
			if(info != null){
				data.put("companyId", info.getId());
				return "weixin/flashHire";
			}else{
				data.put("userId", userId);
				return "weixin/flashHireCom";
			}
		}else{
			session.setAttribute("requestURLs","/user/flashHire/");
			return "weixin/loginRegistry";
		}
	}
	/**
	 * <p>微信修改保存我的简历<br/>
	 * @title saveResumeWx<br/>
	 * @date 2014-5-20 上午11:31:28<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param response
	 * @param userBasicInfo
	 * @param educationExperience
	 * @param userId
	 * @param data
	 */
	@RequestMapping("/saveResumeWx/{userId}")
	@ResponseBody
	public String saveResumeWx(HttpServletRequest request,@PathVariable("userId") Integer userId,
			@RequestBean("userBasicInfo") UserBasicInfo userBasicInfo,
			@RequestBean("educationExperience") EducationExperience educationExperience,
			 Map<String, Object> data) {
		if (educationExperience != null) {
			if(educationExperience.getId() == null){
				EducationExperience experience = new EducationExperience();
				experience.setUniversity(educationExperience.getUniversity());
				experience.setUserId(userBasicInfo.getUserId());
				experience.setEducation(educationExperience.getEducation());
				experience.setMajor(educationExperience.getMajor());
				experience.setEnterUniversityYear(educationExperience.getEnterUniversityYear());
				experience.setEndUniversityYear(educationExperience.getEndUniversityYear());
				experience.setMajorAbility(educationExperience.getMajorAbility());
				experience.setGrade(educationExperience.getGrade());
				educationExperienceMapper.AddEducationExperience(experience);
			}else{
				educationExperience.setUserId(userBasicInfo.getUserId());
				educationExperienceMapper.updeteEducationExperience(educationExperience);
			}
			session.setAttribute("university", educationExperience.getUniversity());
		}	
		if(userBasicInfo != null){
			userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
			Login login= loginMapper.findLoginByUserId(userId);
			setSessionValue(login);
			/*if(userBasicInfo.getRefreshto() == 2){
				Login loginByEmail= loginMapper.findUserByEmail(userBasicInfo.getEmail());
				if(loginByEmail == null){
					loginMapper.updateByUserId(userBasicInfo.getEmail(),userBasicInfo.getUserId());
					Login login= loginMapper.findLoginByUserId(userId);
					setSessionValue(login);
					data.put("flag", 6);
				}else{
					//setSessionValue(loginByEmail);
					data.put("flag", 7);
				}
			}*/
		}
		/*if(userBasicInfo.getRefreshto() == 2){
			return "openLogin/wxBdingSuccess";
		}else{
			return "redirect:/user/findUserWeixinById/"+userId;
		}*/
		return "{\"start\":0,\"userId\":\""+userId+"\"}";
	}
	
	
	
	@RequestMapping("/findUserWeixinById/{userId}")
	public String findUserWeixinById(@PathVariable("userId") Integer userId,Map<String, Object> data){
		session.setAttribute("requestURLt","/user/findXiansById/"+userId);
		UserBasicInfo basicInfo = userService.findUserBasicInfoByUserId(userId);
		if(basicInfo.getExpose()==2){
			userBasicInfoMapper.updateByUserId(userId);//浏览次数加一
			Map<String, Object> map = userService.findByUserIdGzr(userId,"1");
			data.putAll(map);
			return "/openLogin/user/index";
		}else{
			data.put("flag", 44);
			return "/openLogin/wxBdingSuccess";
		}
	}
	
	@RequestMapping("/findUserDestById/{userId}/{jobId}")
	public String findUserDestById(@PathVariable("userId") Integer userId,
			@PathVariable("jobId") Integer jobId,Map<String, Object> data){
		session.setAttribute("requestURLs","/user/findUserDestById/"+userId/jobId);
		//userBasicInfoMapper.updateByUserId(userId);//浏览次数加一
		Map<String, Object> map = userService.findByUserIdGzr(userId,"1");
		data.putAll(map);
		data.put("jobId", jobId);
		return "/weixin/miniresume";
	}
	
	@RequestMapping("/findXiansById/{userId}")
	public String findXiansById(@PathVariable("userId") Integer userId,Map<String, Object> data){
		Map<String, Object> map = userService.findByUserIdGzr(userId,"1");
		data.putAll(map);
		return "/openLogin/user/contactWay";
	}
	
	@RequestMapping("addtagUser")
	@ResponseBody
	public String addtsgUser(HttpServletRequest request){
		String tagName = request.getParameter("tagName");
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		userService.addtagUser(tagName, userId);
		return "{\"start\":0,\"msg\":\"ok\"}";
	}
	@RequestMapping("deltagUser")
	@ResponseBody
	public String deltagUser(HttpServletRequest request){
		String tagName = request.getParameter("tagName");
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		userService.deltagUser(tagName, userId);
		return "{\"start\":0,\"msg\":\"ok\"}";
	}
	/**
	 * <p>微信查看我的求职意向<br/>
	 * @title jobIntensionWx<br/>
	 * @date 2014-5-20 上午11:29:36<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/jobIntensionWx/{userId}")
	public String jobIntensionWx(@PathVariable("userId") Integer userId,Map<String, Object> data){
		Map<String, Object> map = userService.findByUserId(userId,"2");
		data.putAll(map);
		return "openLogin/user/jobIntensionWx";
	}
	
	@RequestMapping("/saveJobIntensionWx")
	public String saveJobIntensionWx(@RequestBean("userBasicInfo") UserBasicInfo userBasicInfo,
			Map<String, Object> data){
		userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
		data.put("flag", 5);
		return "openLogin/wxBdingSuccess";
	}
	/**
	 * <p>更改用户简历是否公开<br/>
	 * @title exposeSet<br/>
	 * @date 2014-8-4 上午10:57:54<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param num
	 * @return
	 */
	
	@RequestMapping("/exposeSet")
	public void exposeSet(HttpServletResponse response,@SessionValue("userId") Integer userId,Integer num){
		userBasicInfoMapper.updateExpose(userId, num);
		JsonUtils.toJson(response, "设置成功！");
	}
	/**
	 * <p>查询我收到的简历<br/>
	 * @title receivedResume<br/>
	 * @date 2015-3-16 下午4:20:01<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param data
	 * @return
	 */
	@RequestMapping("/receivedResume/{userId}")
	public String receivedResume(@PathVariable("userId") Integer userId,Map<String, Object> data){
		List<Map<String,Object>> list = userService.getReceiveResume(userId);
		data.put("receivedResume",list);
		return "weixin/reumerLb";
	}
	
	
}
