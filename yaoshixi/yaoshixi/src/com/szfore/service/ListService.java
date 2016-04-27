package com.szfore.service;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Service;

import com.szfore.mapper.ListMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.plugin.Page;
import com.szfore.plugin.QueryList;

@Service
public class ListService {
	private static String suffix = "Mapper";
	
	@Autowired
	private ApplicationContext context;
	
	/**
	 * 继承接口的方式实现分页查询 
	 * @see ListMapper
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Page list(Page page, String mapperName) 
	{
		ListMapper mapper = (ListMapper)context.getBean(mapperName + suffix);
		
		List results = mapper.list(page);
		
		page.setResults(results);
		
		return page;
	}
	
	/**
	 * 注解的方式实现分页查询
	 * @see QueryList
	 * @see LoginMapper 使用例子：LoginMaper list 方法
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Page list(Page page, String mapperName, String queryName) 
	{
		Object mapper = context.getBean(mapperName + suffix);
		
		Object queryResult = null;
		try {
			Method abstractQueryMethod = _getAbstractQueryMethod(mapper, queryName);
			
			Object[] arguments = _getArgumentValues(abstractQueryMethod, page);
			Method queryMethod = _getQueryMethod(mapper, abstractQueryMethod);
			
			queryResult = _invokeQueryMethod(mapper, queryMethod, arguments);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		page.setResults((List)queryResult);
		
		return page;
	}

	private Method _getAbstractQueryMethod(Object mapper, String queryName) throws Exception 
	{
		Class<?>[] interfases = mapper.getClass().getInterfaces();
		
		for (Class<?> interfase : interfases) 
		{
			for (Method method : interfase.getMethods()) 
			{
				QueryList qlAnnotation = method.getAnnotation(QueryList.class);
				if(qlAnnotation != null && qlAnnotation.value().equals(queryName))
				{
					return method;
				}
			}
		}
		throw new Exception("ListService: 没有找到查询的方法，annotation value: " + queryName + "不存在");
	}
	
	@SuppressWarnings("rawtypes")
	private Object[] _getArgumentValues(Method method, Page page) 
	{
		int count = method.getParameterTypes().length;
		Object[] arguments = new Object[count];
		
		for (int paramIndex = 0; paramIndex < count; paramIndex++) 
		{
			MethodParameter parameter = new MethodParameter(method, paramIndex);
			if(parameter.getParameterType().equals(Page.class))
			{
				arguments[paramIndex] = page;
			}else 
			{
				String argumentName = parameter.getParameterAnnotation(Param.class).value();
				arguments[paramIndex] = page.getParams().get(argumentName);
			}
		}
		return arguments;
	}
	
	private Method _getQueryMethod(Object mapper, Method abstractQueryMethod) throws SecurityException, NoSuchMethodException
	{
		return mapper.getClass().getMethod(abstractQueryMethod.getName(), abstractQueryMethod.getParameterTypes());
	}
	
	private Object _invokeQueryMethod(Object mapper, Method queryMethod, Object[] arguments)
			throws Exception 
	{
		//一定要带有 Page 类型的参数  && 返回类型是list
		if(!_isParameterLegal(queryMethod) || !isReturnTypeLegal(queryMethod))
		{
			throw new Exception("缺少参数： " + Page.class.toString() + " 或者 返回类型不合法，需要返回 List 类型");
		}
		
		return queryMethod.invoke(mapper, arguments);
	}

	private boolean _isParameterLegal(Method queryMethod) 
	{
		Class<?>[] clazzs = queryMethod.getParameterTypes();
		for (Class<?> clazz : clazzs) 
		{
			if(clazz.equals(Page.class))
			{
				return true;
			}
		}
		return false;
	}

	private boolean isReturnTypeLegal(Method queryMethod) 
	{
		if(queryMethod.getReturnType().equals(List.class))
		{
			return true;
		}
		return false;
	}
}
