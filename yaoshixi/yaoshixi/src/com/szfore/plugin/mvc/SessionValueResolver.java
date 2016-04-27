package com.szfore.plugin.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;
@Component
public class SessionValueResolver implements WebArgumentResolver {

	/*public Object resolveArgument(MethodParameter parameter,
			ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			WebDataBinderFactory dataBinderFactory) throws Exception 
	{
		return _resolveArgument(parameter, webRequest);
	}

	public boolean supportsParameter(MethodParameter parameter) 
	{
		SessionValue svAnnotation = parameter.getParameterAnnotation(SessionValue.class);
		
		return svAnnotation != null;
	}*/

	private Object _resolveArgument(MethodParameter parameter,
			NativeWebRequest webRequest) throws Exception {
		
		SessionValue sessionValueAnnot = parameter.getParameterAnnotation(SessionValue.class);
		
		String attrName = sessionValueAnnot.value();
		if(attrName == null || attrName.equals(""))
		{
			attrName = parameter.getParameterName();
		}
		
		HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
		
		Object value = request.getSession().getAttribute(attrName);
		if(value == null)
		{
			return WebArgumentResolver.UNRESOLVED;
		}
		
		return value;
	}

	@Override
	public Object resolveArgument(MethodParameter parameter,
			NativeWebRequest webRequest) throws Exception {
		
		SessionValue svAnnotation = parameter.getParameterAnnotation(SessionValue.class);
		if(svAnnotation == null)
		{
			return WebArgumentResolver.UNRESOLVED;
		}
		return _resolveArgument(parameter, webRequest);
	}
}
