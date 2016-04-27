package com.szfore.action.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jodd.util.StringUtil;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.szfore.util.DWZUtil;

public class AdminActionInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
        HttpSession session = request.getSession();
        String contentPath = request.getContextPath();
        String requestURI = request.getRequestURI();
		if(requestURI.startsWith(contentPath + "/admin/login") ||
				session.getAttribute("adminUser") != null){
			return true;
		}
		adminSessionTimeoutFilter(request, response);
        return false;
    }
	//后台超时处理
	private void adminSessionTimeoutFilter(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		//非ajax请求情况
		if(!StringUtil.equals("XMLHttpRequest", request.getHeader("X-Requested-With"))){
			response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
			return;
		}
		//ajax请求情况
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		writer.flush();
		writer.print(DWZUtil.sessionTimeout(""));
	}
}
