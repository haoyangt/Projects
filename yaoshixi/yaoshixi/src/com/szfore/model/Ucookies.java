/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;
/**
 * <p><br/>
 * @className Ucookies.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-5-26 下午4:18:07<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class Ucookies {

	private int id;
	private int userId;//用户Id
	private String cookies;//用户搜索记录
	private String city;//
	private int education;//学历
	private int jobCategory;//工作性质
	private int issueDays;//发布天数
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCookies() {
		return cookies;
	}
	public void setCookies(String cookies) {
		this.cookies = cookies;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getEducation() {
		return education;
	}
	public void setEducation(int education) {
		this.education = education;
	}
	public int getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(int jobCategory) {
		this.jobCategory = jobCategory;
	}
	public int getIssueDays() {
		return issueDays;
	}
	public void setIssueDays(int issueDays) {
		this.issueDays = issueDays;
	}
	
	
}
