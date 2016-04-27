package com.szfore.action.company;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.action.company.vo.CertificateInfo;
import com.szfore.action.company.vo.CompanyJob;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.UserJobMapper;
import com.szfore.model.Job;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;
import com.szfore.util.ActionUtil;
/**
 * 实习证明
 */
@Controller
@RequestMapping("/company/certificate")
public class CertificateAction {
	
	@Autowired
	private JobMapper jobMapper;
	@Autowired
	private UserJobMapper userJobMapper;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 打印实习证明首页 
	 */
	@RequestMapping("/printIndex")
	public String printIndex(@SessionValue("companyId")Integer companyId, @ModelAttribute("page")Page<CompanyJob> page, Map<String, Object> data)
	{
		List<CompanyJob> jobs = jobMapper.list(companyId, Job.STATUS_OFFLINE, page);
		page.setResults(jobs);
		
		data.put("page", page);
		return "company/certificate/printIndex";
	}
	
	/**
	 * 列表投递的简历，选择打印实习证明 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/postedList/{jobId}")
	public String postedList(@PathVariable("jobId")Integer jobId, @ModelAttribute("page")Page page, Map<String, Object> data)
	{
		page.putParam("jobIds", jobId.toString());
		List<Map<String, Object>> userJobs = userJobMapper.getUserJobOf(page);
		page.setResults(userJobs);
		
		data.put("page", page);
		return "company/certificate/postedList";
	}
	
	/**
	 * 预览实习证明
	 */
	@RequestMapping("/scan/{userId}/{jobId}")
	public String scan(@PathVariable("userId")Integer userId, 
								  @PathVariable("jobId")Integer jobId, 
								  @SessionValue("companyId")Integer companyId,
								  Map<String, Object> data) throws Exception
	{
		CertificateInfo certificateInfo = companyService.getCertificateInfo(userId, jobId, companyId);
		data.put("certificateInfo", certificateInfo);
		return "company/certificate/scanCertificate";
	}
	
	/**
	 * 下载实习证明 
	 */
	@RequestMapping("/download")
	public String download(@SessionValue("companyId")Integer companyId)
	{
		String downloadFilePath = _getDownloadPath() + "helloword.txt";
		
		return "file:" + downloadFilePath;
	}

	/**
	 * 搜索简历，可以打印实习证明 
	 */
	@RequestMapping("/searchResume")
	public String searchResume(String name, @SessionValue("companyId")Integer companyId, Map<String, Object> data)
	{
		List<Map<String, Object>> resumes = userJobMapper.searchUserBy(name, companyId);
		
		data.put("resumes", resumes);
		return "company/certificate/searchResume";
	}
	
	private String _getDownloadPath() 
	{
		return ActionUtil.getRootPath(request) + "res/download/";
	}
}
