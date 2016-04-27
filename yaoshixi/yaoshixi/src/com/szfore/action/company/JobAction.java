package com.szfore.action.company;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.szfore.action.company.vo.CompanyIndexData;
import com.szfore.action.company.vo.CompanyJob;
import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.Job;
import com.szfore.model.Login;
import com.szfore.model.RecordChart;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.RequestBean;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;
import com.szfore.service.JobService;
import com.szfore.service.UserService;
import com.szfore.util.DateUtil;

@Controller
@RequestMapping("/company/job")
public class JobAction {
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private JobService jobService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	@Autowired
	private HttpSession session;
	@Autowired
	private CompanyMapper companyMapper;
	/**
	 * 首页
	 */
	@RequestMapping("/index")
	public String index(@SessionValue("userId")Integer userId,
			@SessionValue("companyId")Integer companyId, Map<String, Object> data){
		/*Page<CompanyJob> jobPage = companyService.listJobs(companyId, Job.STATUS_ONLINE); 
		data.put("page", jobPage);	*/
		return "company/job/index";
	}
	
	@RequestMapping("/indexOnWx/{userId}")
	public String indexOnWx(@PathVariable("userId")Integer userId, Map<String, Object> data)
	{
		Login login=loginMapper.findLoginByUserId(userId);
		if(login!=null){
			setSessionValue(login);
		}
		return "openLogin/enterprise/index";
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
	
	@RequestMapping("/resumeIndex")
	public String resumeIndex(@SessionValue("userId")Integer userId, @SessionValue("companyId")Integer companyId, Map<String, Object> data){
		return "company/job/resumeIndex";
	}
	/**
	 * 根据状态查询我发布的职位
	 */
	@RequestMapping("/list/{status}")
	public String list(@PathVariable("status") Integer status, 
					   @SessionValue("userId")Integer userId, 
					   @SessionValue("companyId")Integer companyId, 
					   Page<CompanyJob> page, Map<String, Object> data){
		Page<CompanyJob> jobPage = companyService.listJobs(companyId, status, page); 
		data.put("page", jobPage);
		data.put("status", status);
		return "company/job/list";
	}
	/**
	 * <p>查询我发的职位和收到的简历数<br/>
	 * @title iReleasedPosition<br/>
	 * @date 2015-3-17 下午12:21:58<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @return
	 */
	@RequestMapping("/iReleasedPosition/{companyId}")
	public String iReleasedPosition(@PathVariable("companyId") Integer companyId,
			Map<String, Object> data){
		//List<Map<String, Object>> list = jobService.findJobReunm(userId);
		CompanyIndexData companyIndexData = companyService.load(companyId);
		data.put("receivedResume",companyIndexData);
		return "weixin/releasPositionLb";
	}
	/**
	 * 分页
	 */
	@RequestMapping("/listOnWx/{status}")
	public String listOnWx(@PathVariable("status") Integer status, 
					   @SessionValue("userId")Integer userId, 
					   @SessionValue("companyId")Integer companyId, 
					   Page<CompanyJob> page, Map<String, Object> data)
	{
		Page<CompanyJob> jobPage = companyService.listJobs(companyId, status, page); 
		
		data.put("page", jobPage);
		data.put("status", status);
		return "openLogin/enterprise/list";
	}
	/**
	 * <p>查看自己公司收到的简历<br/>
	 * @title resume<br/>
	 * @date 2014-4-8 下午2:47:19<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param status
	 * @param userId
	 * @param companyId
	 * @param page
	 * @param data
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/resume/{status}")
	public String resume(@PathVariable("status") Integer status, 
					   @SessionValue("userId")Integer userId, 
					   @SessionValue("companyId")Integer companyId, 
					   @ModelAttribute("page")Page page, Map<String, Object> data){
		page = companyService.resumeUser(userId,companyId, status, page); 
		
		data.put("page", page);
		data.put("status", status);
		return "company/job/resumer";
	}
	
	@RequestMapping("/addEdit")
	public String addEdit(){
		return "company/job/addEdit";
	}
	
	/**
	 * 发布职位招聘信息
	 */
	@RequestMapping("/addJob")
	public String addJob(@SessionValue("companyId")Integer companyId, @ModelAttribute("job")Job job,
			Map<String, Object> data){
		if(!"".equals(job.getTemptation()) && job.getTemptation()!=null){
			String newtemptation=job.getTemptation().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位诱惑   
			job.setTemptation(newtemptation);
		}
		if(!"".equals(job.getJobRequest()) && job.getJobRequest()!=null){
			String newjobRequest=job.getJobRequest().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//能力要求
			job.setJobRequest(newjobRequest);
		}
		if(!"".equals(job.getJobDesc()) && job.getJobDesc()!=null){
			String newjobDesc=job.getJobDesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位描述
			job.setJobDesc(newjobDesc);
		}
		if(!"".equals(job.getOtherReq()) && job.getOtherReq()!=null){
			String newotherReq=job.getOtherReq().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位描述
			job.setOtherReq(newotherReq);
		}
		job.setCompanyId(companyId);
		job.setPublishTime(Calendar.getInstance().getTime());
		jobService.saveJob(job);
	    //记录发布的职位量
		RecordChart recordChart = new RecordChart();
		recordChart.setNewJobs(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil
				.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()),
					recordChart);
		} else {
			userService.insertRecordChart(recordChart);
		}
		//记录发布的职位量
		List<Map<String, Object>> basicInfos = userService.recommendUser(job);
		data.put("userList", basicInfos);
		data.put("jobId", job.getId());
		return "company/job/addResult";
	}
	
	
	@RequestMapping("/addJobWeixin/{companyId}")
	@ResponseBody
	public String addJobWeixin(@PathVariable("companyId") Integer companyId,
			@RequestBean("job")Job job,Map<String, Object> data){
		List<Job> lists = jobService.findJobByCId(companyId, job.getId());
		CompanyInfo companyInfo = companyMapper.getCompanyInfoByCompanyId(companyId);
		if(lists.size()<1){
			job.setCompanyId(companyId);
			job.setPublishTime(Calendar.getInstance().getTime());
			jobService.saveJob(job);
		    //记录发布的职位量
			RecordChart recordChart = new RecordChart();
			recordChart.setNewJobs(1);
			recordChart.setResponseTime(new Date());
			List<RecordChart> list = userService.findByTime(DateUtil.dateFormat("yyyy-MM-dd", new Date()));
			if (list.size() > 0) {
				userService.updateRecordChart(
						DateUtil.dateFormat("yyyy-MM-dd", new Date()),
						recordChart);
			} else {
				userService.insertRecordChart(recordChart);
			}
			return "{\"start\":0,\"jobId\":\""+job.getId()+"\",\"companyId\":\""+companyId+"\",\"companyName\":\""+companyInfo.getCompanyName()+"\"}";
		}else{
			job.setCompanyId(companyId);
			job.setPublishTime(Calendar.getInstance().getTime());
			jobService.updateJobById(job);
			return "{\"start\":0,\"jobId\":\""+lists.get(0).getId()+"\",\"companyId\":\""+companyId+"\",\"companyName\":\""+companyInfo.getCompanyName()+"\"}";
		}
	}
	
	
	@RequestMapping("/addJobWeixinCom/{userId}")
	@ResponseBody
	public String addJobWeixinCom(@PathVariable("userId") Integer userId,
			@RequestBean("job")Job job,@RequestBean("companyInfo")CompanyInfo companyInfo,
			Map<String, Object> data){
		CompanyInfo companyInfo2 = userService.getCompanyInfoOf(userId);
		if(companyInfo2 == null){
			companyInfo.setUserId(userId);
			companyInfo.setCertifyStatus(1);
			String uuid = randomString(11);//随机生成激活码
			companyInfo.setCdkey(uuid);
			companyMapper.addCompany(companyInfo);
			loginMapper.updateRoleId(userId);
		}
		job.setCompanyId(companyInfo.getId());
		job.setPublishTime(Calendar.getInstance().getTime());
		jobService.saveJob(job);
	    //记录发布的职位量
		RecordChart recordChart = new RecordChart();
		recordChart.setNewJobs(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil
				.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()),
					recordChart);
		} else {
			userService.insertRecordChart(recordChart);
		}
		//记录发布的职位量
		/*if("1".equals(job.getSkip())){
			data.put("flag", 8);
			return "openLogin/wxBdingSuccess";
		}else if("3".equals(job.getSkip())){
			data.put("companyId", companyInfo.getId());
			return "weixin/flashHire";
		}else if("2".equals(job.getSkip())){*/
			return "{\"start\":0,\"jobId\":\""+job.getId()+"\",\"companyId\":\""+companyInfo.getId()+"\",\"companyName\":\""+companyInfo.getCompanyName()+"\"}";
			//return "redirect:/user/jobDetailWeix/"+job.getId();
		//}
	}
	
	private static Random randGen = null;
	private static char[] numbersAndLetters = null;
	/**
	 * <p>产生随机字符串<br/>
	 * @title randomString<br/>
	 * @date 2014-4-15 下午5:13:46<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param length 字符串长度
	 * @return
	 */
	public static final String randomString(int length) {
	         if (length < 1) {
	             return null;
	         }
	         if (randGen == null) {
	                randGen = new Random();
	                numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
	                   "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                  //numbersAndLetters = ("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                 }
	         char [] randBuffer = new char[length];
	         for (int i=0; i<randBuffer.length; i++) {
	             randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
	          //randBuffer[i] = numbersAndLetters[randGen.nextInt(35)];
	         }
	         return new String(randBuffer);
	}
	/*@RequestMapping("/jobShare/{jobId}")
	public String jobShare(@PathVariable("jobId") Integer jobId,Map<String, Object> data){
		data.putAll(jobService.findJobDetailById(jobId));
		return "weixin/preview";
	}*/
	
	/**
	 * 发布职位招聘信息
	 */
	@RequestMapping("/addOnWx")
	public String addOnWx(@SessionValue("companyId")Integer companyId, @ModelAttribute("job")Job job, Map<String, Object> data){
		if("".equals(job.getTemptation()) && job.getTemptation()!=null){
			String newtemptation=job.getTemptation().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位诱惑   
			job.setTemptation(newtemptation);
		}
		if("".equals(job.getJobRequest()) && job.getJobRequest()!=null){
			String newjobRequest=job.getJobRequest().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//能力要求
			job.setJobRequest(newjobRequest);
		}
		if("".equals(job.getJobDesc()) && job.getJobDesc()!=null){
			String newjobDesc=job.getJobDesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位描述
			job.setJobDesc(newjobDesc);
		}
		
		job.setCompanyId(companyId);
		job.setPublishTime(Calendar.getInstance().getTime());
		jobService.saveJob(job);
	    //记录发布的职位量
		RecordChart recordChart = new RecordChart();
		recordChart.setNewJobs(1);
		recordChart.setResponseTime(new Date());
		List<RecordChart> list = userService.findByTime(DateUtil
				.dateFormat("yyyy-MM-dd", new Date()));
		if (list.size() > 0) {
			userService.updateRecordChart(
					DateUtil.dateFormat("yyyy-MM-dd", new Date()),
					recordChart);
		} else {
			userService.insertRecordChart(recordChart);
		}
		 //记录发布的职位量
		data.put("jobId", job.getId());
		data.put("flag", 8);
		return "openLogin/wxBdingSuccess";
	}
	
	/**
	 * 职位详情
	 */
	@RequestMapping("/detail/{jobId}")
	public String detail(@PathVariable("jobId")Integer jobId, Map<String, Object> data)
	{
		Job job = jobMapper.getJobOf(jobId);
		
		data.put("job", job);
		return "company/job/detail";
	}
	
	/**
	 * 招聘信息修改页面
	 */
	@RequestMapping("/modifyEdit/{jobId}")
	public String modifyEdit(@PathVariable("jobId")Integer jobId, Map<String, Object> data)
	{
		Job job = jobMapper.getJobOf(jobId);
		data.put("job", job);
		return "company/job/modifyEdit";
	}
	
	/**
	 * 修改招聘信息
	 */
	@RequestMapping("/modify")
	public String modify(@SessionValue("companyId")Integer companyId, @ModelAttribute("job")Job job, Map<String, Object> data)
	{
		if(job.getTemptation()!=null && !"".equals(job.getTemptation())){
			String newtemptation=job.getTemptation().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位诱惑   
			job.setTemptation(newtemptation);
		}
		if(job.getJobRequest()!=null && !"".equals(job.getJobRequest())){
			String newjobRequest=job.getJobRequest().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//能力要求
			job.setJobRequest(newjobRequest);
		}
		if(job.getJobDesc()!=null && !"".equals(job.getJobDesc())){
			String newjobDesc=job.getJobDesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//职位描述
			job.setJobDesc(newjobDesc);
		}
		job.setPublishTime(Calendar.getInstance().getTime());
		job.setCompanyId(companyId);
		job.setStatus(1);
		jobService.modifyJob(job);
		List<Map<String, Object>> basicInfos = userService.recommendUser(job);
		data.put("userList", basicInfos);
		return "company/job/modifyResult";
	}
	
	@RequestMapping("/offline/{jobId}")
	public String offline(@SessionValue("companyId")Integer companyId, @PathVariable("jobId")Integer jobId)
	{
		jobMapper.modifyStatusOf(companyId, jobId, Job.STATUS_OFFLINE);
		return UrlBasedViewResolver.FORWARD_URL_PREFIX + "/company/job/index";
	}
	
	@RequestMapping("/online/{jobId}")
	public String online(@SessionValue("companyId")Integer companyId, @PathVariable("jobId")Integer jobId)
	{
		jobMapper.modifyStatusOf(companyId, jobId, Job.STATUS_ONLINE);
		return UrlBasedViewResolver.FORWARD_URL_PREFIX + "/company/job/index";
	}
	
	@RequestMapping("/againJob/{jobId}")
	public String againJob(@PathVariable("jobId")Integer jobId,Map<String, Object> data)
	{
		data.put("Job", jobMapper.findJobsById(jobId));
		return "company/job/addEdit";
	}
	
	@RequestMapping("/delete/{jobId}")
	public String delete(@SessionValue("companyId")Integer companyId, @PathVariable("jobId")Integer jobId)
	{
		jobMapper.delete(companyId, jobId);
		return UrlBasedViewResolver.FORWARD_URL_PREFIX + "/company/job/list/" + Job.STATUS_OFFLINE;
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping("/invitation")
	public String invitation(@SessionValue("companyId")Integer companyId,@ModelAttribute("page")Page page){
		/*CompanyInfo companyInfo = companyMapper.getCompanyInfoByCompanyId(companyId);
		if(companyInfo.getCertifyStatus()==1){*/
			jobService.invitation(companyId,page);
			return "company/job/invitationSubpage";
		/*}else{
			return "company/certifyInfo";
		}*/
	}
}
