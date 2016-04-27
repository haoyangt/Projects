package com.szfore.action.company;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jodd.http.HttpRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.InternMapper;
import com.szfore.mapper.InterviewNoticeMapper;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.Intern;
import com.szfore.model.InterviewNotice;
import com.szfore.model.Job;
import com.szfore.model.Login;
import com.szfore.model.RecordChart;
import com.szfore.model.UserJob;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.RequestBean;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;
import com.szfore.service.UserService;
import com.szfore.util.DateUtil;
import com.szfore.utils.EmailUtils;
import com.szfore.utils.PropertyUtils;

@Controller
@RequestMapping("/company/resume")
public class CompanyResumeAction {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserJobMapper userJobMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private InterviewNoticeMapper interviewNoticeMapper;
	@Autowired
	private InternMapper internMapper;
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private HttpSession session;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	/**
	 * 消息处收到的简历显示
	 * @param jobId
	 * @param companyId
	 * @param page
	 * @param data
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/listNews/{jobId}/{uId}/{email}")
	public String receivedResumesBy(HttpServletRequest request,
			@PathVariable("uId")int uId,@SessionValue("userId") Integer userId,
			@PathVariable("jobId")String jobId, 
			@PathVariable("email")String email, 
			@ModelAttribute("page")Page page, Map<String, Object> data) throws UnsupportedEncodingException {
		UserJob userJob = userJobMapper.findStatus(uId, Integer.parseInt(jobId));
		if(userJob.getStatus()==0){
			userJobMapper.updateStatusOf(uId, Integer.parseInt(jobId), 1);
			String html = null;
			List<Map<String, Object>> list = jobMapper.findCompanyByJid(Integer.parseInt(jobId));
			String companyName = URLEncoder.encode(list.get(0).get("companyName").toString(), "utf-8");
			String jobName = URLEncoder.encode(list.get(0).get("jobName").toString(), "utf-8");
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/checkEmail/"+email+"/"+companyName+"/"+jobName;
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			//session.invalidate(); 
			companyService.sendEmail("要实习-简历状态通知",email+".com", html);
		}
		data.put("jobId", jobId);
		List<Map<String, Object>> jobs = jobMapper.findReceiveResumeMsg(userId);
		session.setAttribute("num", jobs.size());
		return "company/resume/list";
	}
	/**
	 * <p>查看该职位收到的简历<br/>
	 * @title receivedResumesBy<br/>
	 * @date 2014-4-11 上午10:20:26<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param jobId
	 * @param page
	 * @param data
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/resumeStatus/{jobId}/{status}")
	public String receivedResumesBy(
			@PathVariable("jobId")Integer jobId, 
			@PathVariable("status")Integer status, 
			@ModelAttribute("page")Page page, Map<String, Object> data) {
		page = companyService.receivedResumesBystatus(jobId, status, page);	
		data.put("page", page);
		data.putAll(userJobMapper.getCountByJobId(jobId));
		data.put("jobId", jobId);
		data.put("status", status);
		return "company/resume/receivedResume";
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping("/TalentBackup/{status}")
	public String TalentBackup(@PathVariable("status")Integer status, 
			@SessionValue("companyId")Integer companyId,
			@ModelAttribute("page")Page page, Map<String, Object> data){
		page = companyService.TalentResumesBystatus(companyId, status, page);	
		data.put("page", page);
		return "company/resume/receivedResume";
	}
	/**
	 * 微信端查看职位被投递的简历
	 * @param jobId
	 * @param status
	 * @param page
	 * @param data
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/listOnWx/{jobId}/{status}")
	public String receivedResumesByOnWx(
			@PathVariable("jobId")String jobId, 
			@PathVariable("status")Integer status, 
			@ModelAttribute("page")Page page, Map<String, Object> data) {
		System.out.println(status);
		page = companyService.receivedResumesBystatus(Integer.parseInt(jobId), status, page);	
		data.put("page", page);
		data.put("jobId", jobId);
		return "openLogin/enterprise/receivedResume";
	}
	
	@RequestMapping("/jobResume/{jobId}")
	public String jobResume(@PathVariable("jobId")Integer jobId, Map<String, Object> data) {
		data.put("jobId", jobId);
		return "company/resume/list";
	}
	/*@RequestMapping("/headline/{jobId}")
	public String headline(@PathVariable("jobId")Integer jobId, Map<String, Object> data){
		data.putAll(userJobMapper.getCountByJobId(jobId));
		data.put("jobId", jobId);
		return "company/resume/headline";
	}*/
	/**
	 * 微信端查询职位被投递的简历列表
	 * @param jobId
	 * @param data
	 * @return
	 */
	@RequestMapping("/jobResumeOnWx/{jobId}/{userId}")
	public String jobResumeOnWx(@PathVariable("jobId")String jobId,
			@PathVariable("userId")Integer userId,HttpSession session, Map<String, Object> data) {
		Login login=loginMapper.findLoginByUserId(userId);
		if(login!=null){
			setSessionValue(login);
		}
		data.put("jobId", jobId);
		return "openLogin/enterprise/jobResumeList";
	}
	
	private void setSessionValue(Login login) {
		session.setAttribute("userId", login.getId());
		session.setAttribute("email", login.getEmail());
		session.setAttribute("roleId", login.getRoleId());
		session.setAttribute("num", login.getNum());
		if (userBasicInfoMapper.findUserBasicInfoByUserId(login.getId()) != null) {
			session.setAttribute("userName", userBasicInfoMapper
					.findUserBasicInfoByUserId(login.getId()).getUserName());
			session.setAttribute("userEmail", userBasicInfoMapper
					.findUserBasicInfoByUserId(login.getId()).getEmail());
		}
		if (login.getRoleId() == 1) {
			CompanyInfo companyInfo = companyMapper.getCompanyInfoOf(login
					.getId());
			if (companyInfo != null) {
				session.setAttribute("companyId", companyInfo.getId());
				session.setAttribute("certifyStatus",
						companyInfo.getCertifyStatus());
			}
		}
	}

	
	/**
	 * <p>简历被查看发至邮箱通知用户的邮件页面<br/>
	 * @title checkEmail<br/>
	 * @date 2014-4-16 上午11:20:30<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping("/checkEmail/{email}/{companyName}/{jobName}")
	public String checkEmail(@PathVariable("email")String email,
			@PathVariable("companyName")String companyName,
			@PathVariable("jobName")String jobName,Map<String,Object> data) {
		data.put("email", email);
		data.put("companyName", companyName);
		data.put("jobName", jobName);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "user/checkEmail";
	}
	
	/*@RequestMapping("/preview/{userId}")
	public String resume(@PathVariable("userId")Integer userId, @SessionValue("companyId")Integer companyId, Map<String,Object> data) {
		if(companyId != null) {
			data.put("resume", userService.findResumeByUserId(userId));
			return "company/resume/preview"; 
		}
		return "unauthorized";
	} */
	@RequestMapping("/print/{userId}")
	public String resume2(@PathVariable("userId")Integer userId, @SessionValue("companyId")Integer companyId, Map<String,Object> data) {
		if(companyId != null) {
			data.putAll(userService.findResumeByUserId(userId,data));
			/*data.put("jobList", userService.getUserJobCompanyBy(userId, companyId));
			data.put("interns", internMapper.findAllInterns(userId));*/
			return "company/resume/print"; 
		}
		return "unauthorized";
	} 
	@RequestMapping("/printOnWx/{userId}/{companyId}")
	public String resume2OnWx(@PathVariable("userId")Integer userId, @PathVariable("companyId")Integer companyId, Map<String,Object> data) {
		if(companyId != null) {
			data.putAll(userService.findResumeByUserId(userId,data));
			data.put("jobList", userService.getUserJobCompanyBy(userId, companyId));
			data.put("interns", internMapper.findAllInterns(userId));
			return "openLogin/ProcessingResumes/print"; 
		}
		return "unauthorized";
	} 
	/**
	 * 把简历以邮件的方式发送出去，此方法只是返回了一个没有操作控件的简历页面。
	 * @param userId
	 * @param companyId
	 * @param data
	 * @return
	 */
	/*@RequestMapping("/emailResume/{userId}")
	public String emailResume(@PathVariable("userId")Integer userId, @SessionValue("companyId")Integer companyId, Map<String,Object> data) {
		if(companyId != null) {
			data.put("users",userService.findResumeByUserId(userId));
			data.put("interns", internMapper.findAllInterns(userId));
			return "user/preview"; 
		}
		return "unauthorized";
	} */
	@RequestMapping("/emailResume/{userId}/{declaration}")
	public String resume(@PathVariable("userId")Integer userId,
			@PathVariable("declaration")String declaration,Map<String, Object> data) {
		Map<String, Object> map = userService.findResumeByUserId(userId,data);
		data.putAll(map);
		data.put("content", declaration);
		return "user/preview";
	}
	/**
	 * 转发简历信息 
	 */
	@RequestMapping("/forward")
	@ResponseBody
	public String forwardResume(HttpServletRequest request, Integer userId,Integer jobId,
			String targetEmail, String content){
		System.out.println("uesrId="+userId);
		System.out.println("jobId="+jobId);
		content = content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		String declaration = "";
		try {
			declaration = URLEncoder.encode(content, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String urlStr = PropertyUtils.getProperty("projectUrl")+"/company/resume/emailResume/"+userId+"/"+declaration;
		String html = null;
		try {
			html =  EmailUtils.convertHtmlToStr(request, urlStr).replace("remark", "<div><p><b>" + content + "</b></p></div>");
		} catch (Exception e) {
			return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
		}
		System.out.println(targetEmail);
		companyService.sendEmail("要实习—转发同事",targetEmail, html);
		userJobMapper.updateStatusOf(userId, jobId, 6);
		return "{\"msg\":\"发送成功\", \"status\": \"200\"}";
	}
	
	/**
	 * 把简历发到用户的邮箱 
	 */
	@RequestMapping("/emailResumeToHr")
	@ResponseBody
	public String emailResumeToHr(HttpServletRequest request, Integer userId,
			@SessionValue("email")String email,Map<String, Object> data)
	{
		String urlStr = PropertyUtils.getProperty("projectUrl")+"/company/resume/emailResume/"+userId+"/hh";
		String html = null;
		try {
			html =  EmailUtils.convertHtmlToStr(request, urlStr);
		} catch (Exception e) {
			return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
		}
		companyService.sendEmail("要实习—转到邮箱",email, html);		
		return "{\"msg\":\"发送成功\", \"status\": \"200\"}";
	}
	
	@RequestMapping("/emailResumeToHrOnWx/{userId}")
	@ResponseBody
	public String emailResumeToHrOnWx(HttpServletRequest request, @PathVariable("userId")Integer userId, @SessionValue("email")String email,Map<String, Object> data)
	{
		
		String urlStr = PropertyUtils.getProperty("projectUrl")+"/company/resume/emailResume/"+userId+"/hh";
		String html = null;
		try {
			html =  EmailUtils.convertHtmlToStr(request, urlStr).replace("remark", "<div><p><b></b></p></div>");
		} catch (Exception e) {
			return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
		}
		companyService.sendEmail("要实习—转到邮箱",email, html);		
		return "{\"msg\":\"发送成功\", \"status\": \"200\"}";
	}
	
	@RequestMapping("/interview/{userId}/{jobId}/{email}")
	public String interview(@PathVariable("userId")int userId,@PathVariable("jobId")int jobId,@PathVariable("email")String email,Map<String,Object> data) {
		data.put("company", companyMapper.getCompanyByJobId(jobId));
		data.put("userId", userId);
		data.put("jobId", jobId);
		data.put("email", email);
		return "company/resume/interview";
	}
	
	@RequestMapping("/interviewYaoQing/{uId}/{email}")
	public String interviewYaoQing(@SessionValue("userId")Integer userId,
			@PathVariable("uId")int uId,@PathVariable("email")String email,Map<String,Object> data) {
		CompanyInfo companyInfo = companyMapper.getCompanyInfoOf(userId);
		data.put("company", companyInfo);
		data.put("job", jobMapper.getJobByCid(companyInfo.getId()));
		data.put("userId", uId);
		data.put("email", email);
		return "company/resume/interviewYaoQing";
	}
	
	@RequestMapping("/inteWeixYaoQing/{uId}/{email}")
	public String inteWeixYaoQing(@SessionValue("userId")Integer userId,
			@PathVariable("uId")int uId,@PathVariable("email")String email,
			Map<String,Object> data) {
		System.out.println("sdfs==="+userId);
		CompanyInfo companyInfo = companyMapper.getCompanyInfoOf(userId);
		data.put("company", companyInfo);
		data.put("job", jobMapper.getJobByCid(companyInfo.getId()));
		data.put("userId", uId);
		data.put("email", email);
		return "company/resume/inteWeixYaoQing";
	}
	
	
	@RequestMapping("/interviewOnWx/{userId}/{jobId}/{email}")
	public String interviewOnWx(@PathVariable("userId")int userId,@PathVariable("jobId")int jobId,@PathVariable("email")String email,Map<String,Object> data) {
		data.put("company", companyMapper.getCompanyByJobId(jobId));
		data.put("userId", userId);
		data.put("jobId", jobId);
		data.put("email", email);
		return "openLogin/ProcessingResumes/interview";
	}
	@RequestMapping("/contract/{userId}/{jobId}/{jobName}/{email}")
	public String contract(@PathVariable("userId")int userId,@PathVariable("jobId")int jobId,@PathVariable("jobName")String jobName,@PathVariable("email")String email,Map<String,Object> data) {
		data.put("company", companyMapper.getCompanyByJobId(jobId));
		data.put("userId", userId);
		data.put("jobId", jobId);
		data.put("jobName", jobName);
		data.put("email", email);
		return "company/resume/contract";
	}
	@RequestMapping("/contractOnWx/{userId}/{jobId}/{jobName}/{email}")
	public String contractOnWx(@PathVariable("userId")int userId,@PathVariable("jobId")int jobId,@PathVariable("jobName")String jobName,@PathVariable("email")String email,Map<String,Object> data) {
		data.put("company", companyMapper.getCompanyByJobId(jobId));
		data.put("userId", userId);
		data.put("jobId", jobId);
		data.put("jobName", jobName);
		data.put("email", email);
		return "openLogin/ProcessingResumes/contract";
	}
	/**
	 * 用户通知面试和发邮件
	 * @param request
	 * @param interviewNotice
	 * @param response 
	 * @return
	 */
	@RequestMapping("/sendInterviewNotice")
	@ResponseBody
	public String sendInterviewNotice(HttpServletRequest request,@RequestBean("interviewNotice")InterviewNotice interviewNotice) {
		System.out.println(interviewNotice.getJobId()+"eeeeeeeeeeeeeeee");
		List<Map<String,Object>> map = interviewNoticeMapper.findInterYaoQing(interviewNotice.getUserId(),interviewNotice.getJobId());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if(map.size()<1){
			/*String newDeclaration = declaration.replaceAll(
					"(\r\n|\r|\n|\n\r)", "<br>");
			declaration = URLEncoder.encode(declaration, "utf-8");*/
			HttpSession session = request.getSession();
			interviewNoticeMapper.insertInterviewNotice(interviewNotice);
			userJobMapper.updateStatusOf(interviewNotice.getUserId(), interviewNotice.getJobId(), 8);//改变 u_user_job里的简历状态
			session.setAttribute("interviewNotice", interviewNoticeMapper.findInterByUserId(interviewNotice.getUserId(),interviewNotice.getJobId()));
			session.setAttribute("interviewTime", formatter.format(interviewNotice.getInterviewTime()));
			CompanyInfo compInfo=companyMapper.getCompanyByJobId(interviewNotice.getCompanyId());
			session.setAttribute("companyNames", compInfo.getCompanyName());
			session.setAttribute("emails", interviewNotice.getEmail());
			session.setAttribute("registDate", formatter.format(new Date()));
			session.setAttribute("hour", interviewNotice.getHour());
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/inform";
			String html = null;
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			RecordChart recordChart = new RecordChart();
			recordChart.setInterview(1);
			recordChart.setResponseTime(new Date());
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);// 记录注册用户量
			}
			companyService.sendEmail("要实习-面试通知",interviewNotice.getEmail()+".com", html);
			session.removeAttribute("interviewNotice");
			session.removeAttribute("interviewTime");
			session.removeAttribute("companyNames");
			session.removeAttribute("emails");
			session.removeAttribute("registDate");
			session.removeAttribute("hour");
			return "{\"msg\":\"发送成功，点击通知面试可以一键发送面试信息到应聘者邮箱！发送后最好和应聘者电话确认一下哦！\", \"status\": \"200\"}";
		}else{
			return "{\"msg\":\"您已对该用户发送过面试通知\", \"status\": \"300\"}";
		}
	}
	/**
	 * 用户入职通知保存和发邮件
	 * @param request
	 * @param intern
	 * @param response 
	 * @return
	 */
	@RequestMapping("/internRecord")
	@ResponseBody
	public String internRecord(HttpServletRequest request,@RequestBean("intern")Intern intern) {
		List<Intern> list = internMapper.findEntry(intern.getCompanyId(), intern.getUserId(), intern.getJobId());
		if(list.size()<1){
			internMapper.saveInternAll(intern);
			String html = null;
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			HttpSession session = request.getSession();
			session.setAttribute("emails", intern.getEmail());
			CompanyInfo compInfo=companyMapper.getCompanyInfoByCompanyId(intern.getCompanyId());
			session.setAttribute("companyNames", compInfo.getCompanyName());
			session.setAttribute("hireDates", formatter2.format(intern.getHireDate()));
			session.setAttribute("userAddress", intern.getOfficeAddress());
			session.setAttribute("userNames", intern.getLinkman());
			session.setAttribute("userPhones", intern.getPhone());
			session.setAttribute("jobNames", intern.getJobName());
			session.setAttribute("registDate", formatter.format(new Date()));
			session.setAttribute("hour", intern.getHour());
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/inentryes";
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			//记录用户录用量
			RecordChart recordChart = new RecordChart();
			recordChart.setEmployQuantity(1);
			recordChart.setResponseTime(new Date());
			List<RecordChart> lists = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (lists.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);
			}
			//记录用户录用量
			System.out.println("录用email=="+intern.getEmail());
			companyService.sendEmail("要实习-入职通知",intern.getEmail()+".com", html);
			userJobMapper.updateStatusOf(intern.getUserId(), intern.getJobId(), 7);
			session.removeAttribute("emails");
			session.removeAttribute("companyNames");
			session.removeAttribute("hireDates");
			session.removeAttribute("userAddress");
			session.removeAttribute("userNames");
			session.removeAttribute("userPhones");
			session.removeAttribute("jobNames");
			session.removeAttribute("registDate");
			session.removeAttribute("hour");
			return "{\"msg\":\"发送成功\", \"status\": \"200\"}";
		}else{
			return "{\"msg\":\"您已对该用户发送过入职通知\", \"status\": \"200\"}";
		}
	}
	/**
	 * 把面试通知以邮件的方式发送出去，此方法只是返回了一个没有操作控件的面试通知页面。
	 * @param id
	 * @param data
	 * @return
	 */
	@RequestMapping("/inform")
	public String inform(HttpServletRequest request) {
		return "company/resume/inform"; 
	} 
	/**
	 * 把入职通知以邮件的方式发送出去，此方法只是返回了一个没有操作控件的入职通知页面。
	 * @param id
	 * @param data
	 * @return
	 */
	@RequestMapping("/inentryes")
	public String inentryes(HttpServletRequest request, Map<String,Object> data) {
		return "company/resume/entryNotice"; 
	} 
	
	@RequestMapping("/turnDown/{userId}/{jobId}/{email}")
	public String turnDown(@PathVariable("userId")int userId,@PathVariable("jobId")int jobId,@PathVariable("email")String email,Map<String,Object> data){
		List<UserJob> userJob = userJobMapper.findByUidJidStr(userId, jobId,4);
		List<Intern> list = internMapper.findE(userId, jobId);
		if(list.size()<1){
			if(userJob.size()<1){
				data.put("userId", userId);
				data.put("jobId", jobId);
				data.put("email", email);
			}else{
				data.put("msg", "您已拒绝了该职员");
			}
		}else{
			data.put("msg", "您已录用该职员");
		}
		return "company/resume/turnDown";
	}
	@RequestMapping("/turnDownOnWx/{userId}/{jobId}/{email}")
	public String turnDownOnWx(@PathVariable("userId")int userId,@PathVariable("jobId")int jobId,@PathVariable("email")String email,Map<String,Object> data){
		List<UserJob> userJob = userJobMapper.findByUidJidStr(userId, jobId,4);
		List<Intern> list = internMapper.findE(userId, jobId);
		if(list.size()<1){
			if(userJob.size()<1){
				data.put("userId", userId);
				data.put("jobId", jobId);
				data.put("email", email);
			}else{
				data.put("msg", "您已拒绝了该职员");
			}
		}else{
			data.put("msg", "您已录用该职员");
		}
		return "openLogin/ProcessingResumes/turnDown";
	}
	
	@RequestMapping("/turnDownUser")
	@ResponseBody
	public String turnDownUser(HttpServletRequest request,int userId,int jobId,String email,String content){
			String html = null;
			CompanyInfo companyInfo = companyMapper.getCompanyByJobId(jobId);
			Job job = jobMapper.getJobOf(jobId);
			userJobMapper.updateStatusOf(userId, jobId, 4);
			HttpSession session = request.getSession();
			session.setAttribute("companyNames", companyInfo.getCompanyName());
			session.setAttribute("jobNames", job.getJobName());
			session.setAttribute("content", content);
			String urlStr = PropertyUtils.getProperty("projectUrl")+"company/resume/turnDownEmail/"+email;
			try {
				html =  EmailUtils.convertHtmlToStr(request, urlStr);
			} catch (Exception e) {
				return "{\"msg\":\"发送失败\", \"status\": \"300\"}";
			}
			RecordChart recordChart = new RecordChart();
			recordChart.setRefused(1);
			recordChart.setResponseTime(new Date());
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat(
					"yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()), recordChart);
			} else {
				userService.insertRecordChart(recordChart);// 记录注册用户量
			}
			companyService.sendEmail("要实习-拒绝通知",email+".com", html);
			session.removeAttribute("companyNames");
			session.removeAttribute("jobNames");
			session.removeAttribute("content");
			return "{\"msg\":\"拒绝成功\", \"status\": \"200\"}";
	}
	
	@RequestMapping("/turnDownEmail/{email}")
	public String turnDownEmail(@PathVariable("email")String email, Map<String,Object> data) {
		data.put("emails", email);
		data.put("registDate", DateUtil.dateFormat("yyyy-MM-dd", new Date()));
		return "company/resume/turnDownEmail"; 
	} 
	/**
	 * <p>将简历状态改为备选状态<br/>
	 * @title alternative<br/>
	 * @date 2014-6-18 下午3:02:10<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param userId
	 * @param jobId
	 * @return
	 */
	@RequestMapping("/alternative")
	@ResponseBody
	public String alternative(HttpRequest request,Integer userId,Integer jobId){
		if(userId != null && jobId != null){
			userJobMapper.updateStatusOf(userId, jobId, 9);
			return "{\"msg\":\"操作成功\", \"status\": \"200\"}";
		}else{
			return "{\"msg\":\"操作失败\", \"status\": \"400\"}";
		}
	}
}
