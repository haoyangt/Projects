/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;

import java.util.Date;

/**
 * <p><br/>
 * @className Experience.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-5-4 下午1:42:00<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class Experience {

	private int id;
	private int userId;//用户id
	private String sxCompanyName;//公司名称
	private String sxPosition;//职位
	private Date ksTime;//开始时间
	private Date jsTime;//结束时间
	private String sxConut;//实习内容
	
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
	public String getSxCompanyName() {
		return sxCompanyName;
	}
	public void setSxCompanyName(String sxCompanyName) {
		this.sxCompanyName = sxCompanyName;
	}
	public String getSxPosition() {
		return sxPosition;
	}
	public void setSxPosition(String sxPosition) {
		this.sxPosition = sxPosition;
	}
	public Date getKsTime() {
		return ksTime;
	}
	public void setKsTime(Date ksTime) {
		this.ksTime = ksTime;
	}
	public Date getJsTime() {
		return jsTime;
	}
	public void setJsTime(Date jsTime) {
		this.jsTime = jsTime;
	}
	public String getSxConut() {
		return sxConut;
	}
	public void setSxConut(String sxConut) {
		this.sxConut = sxConut;
	}
	
	
}
