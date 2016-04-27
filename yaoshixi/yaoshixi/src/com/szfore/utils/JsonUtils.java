package com.szfore.utils;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class JsonUtils {

	private static final String RESULT_CODE = "code";
	private static final int SUCCESS_CODE = 0x01;
	private static final int FAILED_CODE = 0x02;
	
	public static void toJson(HttpServletResponse response,Object src) {
		if(src == null) {
			return;
		}
		outJson(response, toJson(src));
	}
	
	public static void toJson(HttpServletResponse response, String msg) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		outJson(response,toJson(map));
	}
	
	
	public static void toJson(HttpServletResponse response,boolean success, String msg) {
		Map<String,Object> map = new HashMap<String, Object>();
		if(success) {
			map.put(RESULT_CODE, SUCCESS_CODE);
		} else {
			map.put(RESULT_CODE, FAILED_CODE);
		}
		map.put("msg", msg);
		outJson(response,toJson(map));
	}
	
	private static String toJson(Object src) {
		if(src == null) {
			return "";
		}
		Gson gson = new Gson();
		return gson.toJson(src);
	}

	
	private static void outJson(HttpServletResponse response,String msg) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		response.setHeader("pragma", "no-cache");
		response.setDateHeader("expires", 0);
		try {
			response.getWriter().write(msg);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
