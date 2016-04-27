package com.szfore.util;

/**
 * DWZ框架返回值
 * @author 罗季晖
 *
 */
public class DWZUtil {
	
	private static final int SUCCESS_CODE = 200;
	private static final int FAIL_CODE = 300;
	private static final int TIMEOUT_CODE = 301;
	
	//responsebody封装
	public static String success(String message){
		return JsonUtil.toJson(new DWZData(SUCCESS_CODE, message));
	}
	public static String success(String message, Object data){
		return JsonUtil.toJson(new DWZData(SUCCESS_CODE, message, data));
	}
	public static String fail(String message){
		return JsonUtil.toJson(new DWZData(FAIL_CODE, message));
	}
	public static String fail(String message, Object data){
		return JsonUtil.toJson(new DWZData(FAIL_CODE, message, data));
	}
	public static String sessionTimeout(String message){
		return JsonUtil.toJson(new DWZData(TIMEOUT_CODE, message));
	}
	public static String ajaxReturn(int statusCode,String message,String navTabId,
			String callbackType,String forwardUrl,Object data){
		return JsonUtil.toJson(new DWZData(statusCode, message, navTabId, callbackType, forwardUrl, data));
	}
	
}
