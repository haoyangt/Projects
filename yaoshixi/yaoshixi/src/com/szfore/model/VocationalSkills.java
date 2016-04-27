/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;
/**
 * <p><br/>
 * @className VocationalSkills.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-5-4 下午5:48:06<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class VocationalSkills {

	private int id;
	private int userId;//用户id
	private String language;//语种
	private String hearOf;//听说
	private String readWrite;//读写
	private String grade;//等级
	private float score=0;//分数
	
	
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
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getHearOf() {
		return hearOf;
	}
	public void setHearOf(String hearOf) {
		this.hearOf = hearOf;
	}
	public String getReadWrite() {
		return readWrite;
	}
	public void setReadWrite(String readWrite) {
		this.readWrite = readWrite;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	
	
}
