package com.szfore.action.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/index")
public class AdminIndexAction {

	@RequestMapping("/index")
	public String index(){
		return "/admin/index/index";
	}
	
}
