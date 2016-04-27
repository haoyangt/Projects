/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;
/**
 * <p><br/>
 * @className FriendProposals.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-7-9 下午3:50:11<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class FriendProposals {

	private int id;
	private String userName;//姓名
	private int sex;//性别
	private String telPhone;//电话
	private String email;//邮箱
	private String jobInterview;//面试职位
	private String designGoal;//设计目的
	private String interviewForm;//面试形式
	private String descriptionInterview;//面试描述
	private String referenceIdeas;//参考思路
	private int voteNum;//得票数
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getTelPhone() {
		return telPhone;
	}
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJobInterview() {
		return jobInterview;
	}
	public void setJobInterview(String jobInterview) {
		this.jobInterview = jobInterview;
	}
	public String getDesignGoal() {
		return designGoal;
	}
	public void setDesignGoal(String designGoal) {
		this.designGoal = designGoal;
	}
	public String getInterviewForm() {
		return interviewForm;
	}
	public void setInterviewForm(String interviewForm) {
		this.interviewForm = interviewForm;
	}
	public String getDescriptionInterview() {
		return descriptionInterview;
	}
	public void setDescriptionInterview(String descriptionInterview) {
		this.descriptionInterview = descriptionInterview;
	}
	public String getReferenceIdeas() {
		return referenceIdeas;
	}
	public void setReferenceIdeas(String referenceIdeas) {
		this.referenceIdeas = referenceIdeas;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	
}
