package com.szfore.action.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szfore.model.Login;
import com.szfore.service.UserService;
import com.szfore.util.ActionUtil;
import com.szfore.util.DWZUtil;
import com.szfore.utils.MD5Util;

@Controller
@RequestMapping("/admin/login")
public class AdminLoginAction {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(String username,String password){
		Login login = userService.login(username);
		if(login == null || Login.ROLE_ADMIN != login.getRoleId()){
				return DWZUtil.fail("用户名不正确!");
		}else if(!login.getPassword().equals(MD5Util.getMD5(password))){
			return DWZUtil.fail("密码不正确!");
		}
		session.setAttribute("adminUser", login);
		return DWZUtil.success("登录成功");
	}
	
	@RequestMapping("/logout")
	public String logout(){
		session.removeAttribute("adminUser");
		session.invalidate();
		return ActionUtil.redirectTo("/admin/login.jsp");
	}
}
