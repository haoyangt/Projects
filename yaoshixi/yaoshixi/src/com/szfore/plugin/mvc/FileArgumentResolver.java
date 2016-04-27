package com.szfore.plugin.mvc;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.szfore.util.ActionUtil;

public class FileArgumentResolver implements WebArgumentResolver {

	@Override
	public Object resolveArgument(MethodParameter parameter,
			NativeWebRequest webRequest) throws Exception {
		
		FileVariable fileVariableAnnot = parameter.getParameterAnnotation(FileVariable.class);
		
		if(fileVariableAnnot != null){
			String attrName = fileVariableAnnot.value();
			if(attrName == null || attrName.equals("")){
				throw new Exception("@FileVariable(value)注解，value不能留空");
			}
			
			HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
			if(request instanceof MultipartHttpServletRequest){
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
				MultiValueMap<String, MultipartFile> fileMap = multiRequest.getMultiFileMap();
				MultipartFile multipartFile = fileMap.getFirst(attrName);
				
				String filePath = ActionUtil.upload(request, multipartFile);
				return new File(filePath);
			}
			throw new Exception("提交的请求里没有包含文件");
		}
		return WebArgumentResolver.UNRESOLVED;
	}
}
