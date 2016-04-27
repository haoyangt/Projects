/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;

import java.util.Date;

/**
 * <p><br/>
 * @className SchoolRewards.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-5-4 下午4:24:47<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class SchoolRewards {

	private int id;
	private int userId;//用户id
	private String schoolReward;//活动奖项
	private String seminary;//学校
	private Date rewardTime;//时间
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
	public String getSchoolReward() {
		return schoolReward;
	}
	public void setSchoolReward(String schoolReward) {
		this.schoolReward = schoolReward;
	}
	public String getSeminary() {
		return seminary;
	}
	public void setSeminary(String seminary) {
		this.seminary = seminary;
	}
	public Date getRewardTime() {
		return rewardTime;
	}
	public void setRewardTime(Date rewardTime) {
		this.rewardTime = rewardTime;
	}
	
	
}
