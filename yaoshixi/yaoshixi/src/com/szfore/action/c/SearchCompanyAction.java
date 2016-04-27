package com.szfore.action.c;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.action.company.vo.CompanyIndexData;
import com.szfore.action.company.vo.CompanyJob;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.model.Job;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;

@Controller
@RequestMapping("/c")
public class SearchCompanyAction {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	
	@RequestMapping("/index")
	public String search(){		
		return "c/index";	
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping("/model")
	public String model(HttpServletRequest request, @ModelAttribute("page")Page page, 
			String city, String scale, String nature, String field, 
			String companyName, String major,Integer authentication){		
		companyService.searchCompany(page, city, scale, nature, field, companyName, major,authentication);
		return "c/cModel";		
	}
	
	@RequestMapping("/modelPhone/{num}")
	public String modelPhone(HttpServletRequest request,String companyName,
			String city, String scale, String nature, String field,Integer authentication, 
			@PathVariable("num")Integer num,Map<String,Object> data){		
		List <Map <String,Object>> list = companyService.searchCompanyPhone(city, scale, nature, field, companyName,authentication,num);
		data.put("company", list);
		data.put("companyName", companyName);
		data.put("companyCount", list.size());
		data.put("num", num);
		return "m/cModel";		
	}
	
	@RequestMapping("/tuigmodelPhone/{num}")
	public String tuigmodelPhone(HttpServletRequest request,String companyName,
			String city, String scale, String nature, String field,Integer authentication, 
			@PathVariable("num")Integer num,Map<String,Object> data){		
		List <Map <String,Object>> list = companyService.tuigCompanyPhone(city, scale, nature, field, companyName,authentication,num);
		data.put("company", list);
		data.put("companyName", companyName);
		data.put("companyCount", list.size());
		data.put("num", num);
		return "m/cModel";		
	}
	
	/**
	 * 根据公司id查看公司信息
	 */
	@RequestMapping("/index/{inputCmpId}")
	public String index(@SessionValue("userId")Integer userId, 
						@PathVariable("inputCmpId")Integer inputCmpId,
						@SessionValue("companyId")Integer sessionCmpId,
						Map<String, Object> data){
		CompanyIndexData companyIndexData = companyService.load(inputCmpId); 
		data.put("company", companyIndexData);
		if(userId!=null){
			if(userBasicInfoMapper.findSchoolfellow(inputCmpId, userId)!=null){
				data.put("school",userBasicInfoMapper.findSchoolfellow(inputCmpId, userId));
			}
			if(inputCmpId == sessionCmpId){
				data.put("isCompany", true);
				return "company/index";
			} 
		}
		return "c/companyIndex";
	
	}
	@RequestMapping("/indexPhone/{inputCmpId}")
	public String indexPhone(@PathVariable("inputCmpId")Integer inputCmpId,
						Map<String, Object> data){
		CompanyIndexData companyIndexData = companyService.load(inputCmpId); 
		data.put("company", companyIndexData);
		return "m/companyDetails";
	
	}
	@RequestMapping("/jobList/{companyId}")
	public String jobList(@PathVariable("companyId")Integer companyId, @ModelAttribute("page")Page<CompanyJob> page)
	{
		companyService.listJobs(companyId, Job.STATUS_ONLINE, page);
		return "c/jobList";
	}
}
