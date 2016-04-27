package com.szfore.plugin.mvc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

/**
 * 
 * @author zhangyong 
 * Sep 22, 2013-10:29:41 AM
 * info:action中的RequestBean注解
 */
@Component
public class BeanArgumentResolver implements WebArgumentResolver {

	@SuppressWarnings("rawtypes")
	public Object resolveArgument(MethodParameter param, NativeWebRequest request) throws Exception {
		RequestBean requestBean = param.getParameterAnnotation(RequestBean.class);
		
		if (requestBean != null) {
			String _param = requestBean.value();
			if (_param.equals("_def_param_name")) {
				_param = param.getParameterName();
			}
			Class clazz = param.getParameterType();
			Object object = clazz.newInstance();
			HashMap<String, String[]> paramsMap = new HashMap<String, String[]>();
			Iterator<String> itor = request.getParameterNames();
			while (itor.hasNext()) {
				String webParam = (String) itor.next();
				String[] webValue = request.getParameterValues(webParam);
				if (webParam.startsWith(_param)) {
					paramsMap.put(webParam, webValue);
				}
			}
			BeanWrapper obj = new BeanWrapperImpl(object);
			//obj.findCustomEditor(paramClass, paramString)
			obj.registerCustomEditor(Date.class, null, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
			//WebDataBinder.
			System.out.println(obj.findCustomEditor(Date.class, null).getAsText());
			
			for (String propName : paramsMap.keySet()) {
				String[] propVals = paramsMap.get(propName);
				String[] props = propName.split("\\.");
				if (props.length == 2) {
					obj.setPropertyValue(props[1], propVals);
				} else if (props.length == 3) {
					Object tmpObj = obj.getPropertyValue(props[1]);
					if (tmpObj == null)
						obj.setPropertyValue(props[1], obj.getPropertyType(props[1]).newInstance());
					obj.setPropertyValue(props[1] + "." + props[2], propVals);
				}

			}
			/*
			 * Field[] fields = clazz.getDeclaredFields(); for(Field
			 * field:fields){ obj.setPropertyValue(field.getName(),
			 * paramsMap.get(_param +"."+field.getName())); }
			 * 
			 * for(String porpName:paramsMap.keySet()){ String[] params =
			 * paramsMap.get(porpName); if (null != params) { Object
			 * field=obj.getPropertyValue(porpName.replaceFirst(_param+".",
			 * "")); Class
			 * clz=obj.getPropertyType(porpName.replaceFirst(_param+".", ""));
			 * System.out.println(porpName.replaceFirst(_param+".",
			 * "")+":"+field+" "+clz); if(field==null){
			 * //field=obj.getPropertyType(porpName.replaceFirst(_param+".",
			 * "")).newInstance(); }
			 * obj.setPropertyValue(porpName.replaceFirst(_param+".", ""),
			 * params); } }
			 */
			/*
			 * Method[] methods = clazz.getMethods(); for (Method m : methods) {
			 * Class[] parClazzs = m.getParameterTypes(); String methodName =
			 * m.getName(); if (parClazzs.length == 1 &&
			 * methodName.startsWith("set")) {
			 * 
			 * String[] params = paramsMap.get(_param +
			 * methodName.toLowerCase().replace("set", "."));
			 * 
			 * if (parClazzs[0].equals(String.class)) { if (null != params) {
			 * m.invoke(object, new Object[] { params[0] }); } } else if
			 * (parClazzs[0].equals(String[].class)) { if (null != params) {
			 * m.invoke(object, new Object[] { params }); } } }
			 * 
			 * }
			 */
			return object;
		} else {
			return WebArgumentResolver.UNRESOLVED;
		}
	}
}
