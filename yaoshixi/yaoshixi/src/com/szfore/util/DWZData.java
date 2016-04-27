package com.szfore.util;

import com.google.gson.Gson;

/**
 * dwz框架数据
 * @author 罗季晖
 *
 */
public class DWZData{
	private int statusCode;//状态码 200成功 300失败 301超时
	private String message;//状态消息
	private String navTabId;//需要刷新的tab
	private String callbackType;//返回类型
	private String forwardUrl;//刷新url
	private Object data;//附加数据
	
	public DWZData(int statusCode, String message){
		this(statusCode,message,null);
	}
	public DWZData(int statusCode, String message,Object data){
		this(statusCode,message,null,data);
	}
	public DWZData(int statusCode, String message,String callbackType,Object data){
		this(statusCode,message,null,callbackType,null,data);
	}
	public DWZData(int statusCode, String message, String navTabId,
			String callbackType, String forwardUrl, Object data) {
		this.statusCode = statusCode;
		this.message = message;
		this.navTabId = navTabId;
		this.callbackType = callbackType;
		this.forwardUrl = forwardUrl;
		this.data = data;
		System.out.println("message===" + message);
	}
	
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNavTabId() {
		return navTabId;
	}
	public void setNavTabId(String navTabId) {
		this.navTabId = navTabId;
	}
	public String getCallbackType() {
		return callbackType;
	}
	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}
	public String getForwardUrl() {
		return forwardUrl;
	}
	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
