package com.szfore.action.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.mapper.InternMapper;
import com.szfore.model.Intern;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.SessionValue;

@Controller
@RequestMapping("/company/intern")
public class InternAction {
	
	@Autowired
	private InternMapper internMapper;
	
	/**
	 * 实习生列表 
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/list/{status}")
	public String internList(@SessionValue("companyId")Integer companyId, @PathVariable("status")String status, @ModelAttribute("page")Page page, Map<String, Object> data)
	{
		page.putParam("status", Intern.getHireStatus(status));
		page.putParam("companyId", companyId);
		List<Intern> interns = internMapper.listIntern(page);
		
		page.setResults(interns);
		data.put("status", status);
		data.put("page", page);
		return "company/intern/list";
	}
	

	/**
	 * 评价编辑页面 
	 */
	@RequestMapping("/evaluateEdit/{userId}")
	public String evaluateEdit(@SessionValue("companyId")Integer companyId, @PathVariable("userId")Integer userId, Map<String, Object> data)
	{
		Intern intern = internMapper.findIntern(companyId, userId);
		data.put("intern", intern);
		return "company/intern/evaluateEdit";
	}
	
	/**
	 * 评价实习生 
	 */
	@RequestMapping("/evaluate")
	public String evaluateIntern(@SessionValue("companyId")Integer companyId, Integer userId, String content)
	{
		internMapper.saveEvaluationOf(companyId, userId, content, Intern.COMMENT_STATUS_DONE);
		return "success";
	}
	
	/**
	 * 查看评价 
	 */
	@RequestMapping("/showEvaluation/{userId}")
	public String showEvaluation(@SessionValue("companyId")Integer companyId, @PathVariable("userId")Integer userId, Map<String, Object> data)
	{
		Intern intern = internMapper.findIntern(companyId, userId);
		
		data.put("intern", intern);
		return "company/intern/showEvaluation";
	}
}
