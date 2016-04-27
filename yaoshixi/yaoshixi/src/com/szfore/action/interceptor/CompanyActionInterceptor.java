package com.szfore.action.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.szfore.model.CompanyInfo;

public class CompanyActionInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
        HttpSession session = request.getSession();
        
        if(!isLogined(session))
        {
        	//request.getRequestDispatcher("/login.jsp").forward(request, response);
        	String webRootPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/" + request.getContextPath() + "/";
        	response.sendRedirect(webRootPath + "login.jsp");
        	return false;
        }
        
		if(!isRegistedCompany(session))
		{
			request.getRequestDispatcher("/company/addEdit.jsp").forward(request, response);
			//response.sendRedirect(webRootPath + "company/addEdit.jsp");
	        return false;
		}
		
		if(!isCertifiedCompany(session)){
			request.getRequestDispatcher("/company/certifyInfo.jsp").forward(request, response);
			//response.sendRedirect(webRootPath + "company/addEdit.jsp");
			return false;
		}
		return true;
    }

	private boolean isRegistedCompany(HttpSession session){
		return session.getAttribute("companyId") != null;
	}
	
	private boolean isCertifiedCompany(HttpSession session){
		return session.getAttribute("certifyStatus") != null && session.getAttribute("certifyStatus").equals(CompanyInfo.STATUS_CERTIFIED);
	}
	
	private boolean isLogined(HttpSession session){
		return session.getAttribute("userId") != null;
	}
}
