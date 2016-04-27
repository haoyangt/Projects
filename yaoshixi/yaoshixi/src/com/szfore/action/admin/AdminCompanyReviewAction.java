package com.szfore.action.admin;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jodd.util.ArraysUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szfore.model.CompanyInfo;
import com.szfore.plugin.Page;
import com.szfore.service.CompanyService;
import com.szfore.service.UserService;
import com.szfore.util.DWZUtil;
import com.szfore.utils.EmailUtils;
import com.szfore.utils.PropertyUtils;

@Controller
@RequestMapping("/admin/companyReview")
public class AdminCompanyReviewAction {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	@RequestMapping("/index")
	public String index(
			Page<Map<String, Object>> page,
			Map<String, Object> datas){
		if(page != null && ArraysUtil.contains(new int[]{0,3}, page.getNumPerPage())){
			page.setNumPerPage(15);
		}
		page = companyService.reviewPage(page);
		datas.put("page", page);
		return "/admin/companyReview/index";
	}
	
	
	@RequestMapping("/reviewPage/{companyId}")
	public String reviewPage(
			@PathVariable("companyId")Integer companyId,
			Map<String, Object> datas){
		CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(companyId);
		datas.put("companyInfo", companyInfo);
		return "/admin/companyReview/reviewPage";
	}
	
	@RequestMapping("/authenticationIndex")
	public String authenticationIndex(
			Page<Map<String, Object>> page,
			Map<String, Object> datas){
		if(page != null && ArraysUtil.contains(new int[]{0,3}, page.getNumPerPage())){
			page.setNumPerPage(15);
		}
		page = companyService.authentication(page);
		datas.put("page", page);
		return "/admin/companyReview/authenticationIndex";
	}
	
	@RequestMapping("/authentication/{companyId}")
	public String authentication(
			@PathVariable("companyId")Integer companyId,
			Map<String, Object> datas){
		CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(companyId);
		datas.put("companyInfo", companyInfo);
		return "/admin/companyReview/authentication";
	}
	
	@RequestMapping("/sendInvitations/{companyId}")
	public String sendInvitations(
			@PathVariable("companyId")Integer companyId,
			Map<String, Object> datas){
		CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(companyId);
		datas.put("companyInfo", companyInfo);
		return "/admin/company/sendInvitations";
	}
	
	@RequestMapping("/sendInvitationEmail")
	@ResponseBody
	public String sendInvitationEmail(HttpServletRequest request,String email,String companyName,
			String cdkey,Integer cdkeyStatus,Map<String, Object> datas) throws Exception{
		if(cdkeyStatus==2){
			return "{\"msg\":\"该公司的激活码已使用\", \"status\": \"200\"}";
		}else{
			companyName = URLEncoder.encode(companyName, "utf-8");
			String urlStr = PropertyUtils.getProperty("projectUrl")+"admin/companyReview/emailPage/"+companyName+"/"+cdkey;
			String html = null;
			try {
				html = EmailUtils.convertHtmlToStr(request, urlStr);
				userService.sendWelEmail(email, html);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "{\"msg\":\"邀请成功\", \"status\": \"200\"}";
		}
	}
	
	@RequestMapping("/emailPage/{companyName}/{cdkey}")
	public String emailPage(@PathVariable("companyName")String companyName,
			@PathVariable("cdkey")String cdkey,Map<String,Object> data) {
		data.put("cdkey", cdkey);
		data.put("companyName", companyName);
		return "/admin/company/emailPage";
	}
	
	@RequestMapping("/review/{companyId}")
	@ResponseBody
	public String review(@PathVariable("companyId")Integer companyId){
		boolean flag = companyService.reviewPass(companyId);
		if(flag){
			return DWZUtil.success("企业审核成功");
		}
		return DWZUtil.fail("企业审核失败");
	}
	
	@RequestMapping("/reviewAuthentication/{companyId}")
	@ResponseBody
	public String reviewAuthentication(@PathVariable("companyId")Integer companyId){
		boolean flag = companyService.authenticationPass(companyId);
		if(flag){
			return DWZUtil.success("企业认证成功");
		}
		return DWZUtil.fail("企业认证失败");
	}
}
