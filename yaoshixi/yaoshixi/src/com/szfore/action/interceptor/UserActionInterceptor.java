package com.szfore.action.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserActionInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
		System.out.println("**************preHandle*******************");
        HttpSession session = request.getSession();
        String requestURI = request.getRequestURI();
        System.out.println("requestURI:"+requestURI);
        
        if(requestURI.equals("/user/login") || 
        		requestURI.equals("/user/loginPhone") ||
        		requestURI.equals("/user/loginUser") ||
        		requestURI.equals("/user/publishJob")||
        		requestURI.equals("/user/registryEditor")||
        		requestURI.equals("/user/registCompany")||
        		requestURI.equals("/user/publishResume")||
        		requestURI.equals("/user/openlogin_callback") || 
        		requestURI.equals("/user/sinaLogin") ||
        		requestURI.equals("/user/updatepasses") || 
        		requestURI.equals("/user/loginCompany") || 
        		requestURI.equals("/user/indRecommendSan") ||
        		requestURI.equals("/company/uploadLicense") ||
        		requestURI.equals("/user/saveJobIntensionWx") ||
        		requestURI.equals("/company/job/invitation") ||
        		requestURI.equals("/company/SubmitReviewes") ||
        		requestURI.equals("/user/findVocationSkill") ||
        		requestURI.equals("/user/wxLogin")||
        		requestURI.equals("/user/wJlLogin")) {
        	Object requestURL = session.getAttribute("requestURL");
			if(requestURL != null) {
				System.out.println("************************requestURL***********"+requestURL);
				session.removeAttribute("requestURL");
				System.out.println("============================================================");
				response.sendRedirect(requestURL.toString());
			}
			return true;
        }
        
		if(isUser(session)){
			return true;
		}
		session.setAttribute("requestURL", request.getRequestURL().toString());
		System.out.println("requestURL:"+request.getRequestURL().toString());
		String webSizeIndex = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/" + request.getContextPath() + "/login.jsp";
		response.sendRedirect(webSizeIndex);
        return false;
    }
	
	private boolean isUser(HttpSession session){
		/*if(session.getAttribute("userId") != null && session.getAttribute("roleId") != null)
		{
			return session.getAttribute("roleId").equals(Login.ROLE_USER);
		}*/
		return session.getAttribute("userId") != null;
	}
}
