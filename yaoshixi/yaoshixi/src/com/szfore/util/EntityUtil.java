package com.szfore.util;

import java.lang.reflect.Field;

import jodd.bean.BeanUtil;


public class EntityUtil {
	
	/**
	 * 将属性值从t，复制到 k
	 * @param t
	 * @param k
	 */
	public static <T, K> void copyPropertyValues(T t, K k)
	{
		
		Field[] fields = t.getClass().getDeclaredFields();
		for (Field field : fields) 
		{
			String fieldName = field.getName();
			Object value = BeanUtil.getDeclaredPropertySilently(t, fieldName);
			
			BeanUtil.setDeclaredPropertySilent(k, fieldName, value);
		}
	}
}
