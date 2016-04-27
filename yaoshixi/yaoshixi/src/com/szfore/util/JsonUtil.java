package com.szfore.util;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

/**
 * json工具类
 * @author 罗季晖
 *
 */
public class JsonUtil {
	/**
	 * bean转json
	 * @param obj
	 * @return
	 */
	public static String toJson(Object obj){
		if(obj == null){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(obj);
	}

	@SuppressWarnings("rawtypes")
	public static Map toMap(String jsonStr) 
	{
		Gson gson = new Gson();
		Map map = gson.fromJson(jsonStr, HashMap.class);
		
		return map;
	}
	
	public static void main(String[] args) {
		String str = "abcaad";
		System.out.println(str.replace("a","M"));
		System.out.println(str.replaceAll("a", "M"));
	}
}
