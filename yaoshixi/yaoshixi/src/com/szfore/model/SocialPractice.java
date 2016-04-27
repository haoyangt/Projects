/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;

import java.util.Date;

/**
 * <p><br/>
 * @className SocialPractice.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-4-30 下午5:18:51<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class SocialPractice {

	private int id;
	private Date starDayNum;//开始参加时间
	private Date endDayNum;//结束参加时间
	private String school;//学校
	private String position;//职位
	private String activityContent;//活动内容
	private int userId;//用户id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getStarDayNum() {
		return starDayNum;
	}
	public void setStarDayNum(Date starDayNum) {
		this.starDayNum = starDayNum;
	}
	public Date getEndDayNum() {
		return endDayNum;
	}
	public void setEndDayNum(Date endDayNum) {
		this.endDayNum = endDayNum;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getActivityContent() {
		return activityContent;
	}
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
