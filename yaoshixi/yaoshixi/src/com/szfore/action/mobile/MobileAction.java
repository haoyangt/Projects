package com.szfore.action.mobile;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.plugin.Page;
import com.szfore.service.JobService;
import com.szfore.utils.JsonUtils;

/**
 * 
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 27, 2013
 */
@Controller
@RequestMapping("/mobile")
public class MobileAction {

	@Autowired
	private JobService jobService;
	
	@RequestMapping("/mobileFindJobs")
	public void mobileFindJobs(HttpServletResponse response,String keyword,@ModelAttribute("page")Page page) {
		page.setResults(jobService.searhJobsByKeyword(keyword,page));
		JsonUtils.toJson(response, page);
	}
}
