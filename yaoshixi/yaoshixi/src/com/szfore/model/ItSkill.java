/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;
/**
 * <p><br/>
 * @className ItSkill.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-5-7 下午4:21:39<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class ItSkill {

	private int id;
	private int userId;//用户id
	private String skill;//技能
	private int familiarity;//熟悉度：1.精通，2.熟悉
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
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public int getFamiliarity() {
		return familiarity;
	}
	public void setFamiliarity(int familiarity) {
		this.familiarity = familiarity;
	}
	
	
}
