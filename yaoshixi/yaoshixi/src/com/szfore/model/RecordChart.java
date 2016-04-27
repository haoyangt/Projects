/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;

import java.util.Date;

/**
 * <p><br/>
 * @className RecordChart.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-4-23 上午9:49:09<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class RecordChart {
	private int id;
	private Date responseTime;
	private int userLogin=0;//今日学生用户登录量
	private int newUsers=0;//今日学生用户注册量
	private int resumeSum=0;//今日简历投递量
	private int companyLogin=0;//今日企业用户登录量
	private int companyUser=0;//今日企业用户激活量
	private int companyRegist=0;//今日企业用户注册量
	private int employQuantity=0;//今日录用量
	private int newJobs=0;//今日新增职位量
	private int interview=0;//今日面试通知量
	private int refused=0;//今日拒绝量
	private int userWeixinNum=0;//学生用户微信量
	private int companyWeixinNum=0;//企业用户微信量
	private int weixinResum=0;//微信端投递简历数
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getResponseTime() {
		return responseTime;
	}
	public void setResponseTime(Date responseTime) {
		this.responseTime = responseTime;
	}
	public int getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(int userLogin) {
		this.userLogin = userLogin;
	}
	public int getNewUsers() {
		return newUsers;
	}
	public void setNewUsers(int newUsers) {
		this.newUsers = newUsers;
	}
	public int getResumeSum() {
		return resumeSum;
	}
	public void setResumeSum(int resumeSum) {
		this.resumeSum = resumeSum;
	}
	public int getCompanyUser() {
		return companyUser;
	}
	public void setCompanyUser(int companyUser) {
		this.companyUser = companyUser;
	}
	public int getCompanyLogin() {
		return companyLogin;
	}
	public void setCompanyLogin(int companyLogin) {
		this.companyLogin = companyLogin;
	}
	public int getEmployQuantity() {
		return employQuantity;
	}
	public void setEmployQuantity(int employQuantity) {
		this.employQuantity = employQuantity;
	}
	public int getNewJobs() {
		return newJobs;
	}
	public void setNewJobs(int newJobs) {
		this.newJobs = newJobs;
	}
	public int getInterview() {
		return interview;
	}
	public void setInterview(int interview) {
		this.interview = interview;
	}
	public int getRefused() {
		return refused;
	}
	public void setRefused(int refused) {
		this.refused = refused;
	}
	public int getUserWeixinNum() {
		return userWeixinNum;
	}
	public void setUserWeixinNum(int userWeixinNum) {
		this.userWeixinNum = userWeixinNum;
	}
	public int getCompanyWeixinNum() {
		return companyWeixinNum;
	}
	public void setCompanyWeixinNum(int companyWeixinNum) {
		this.companyWeixinNum = companyWeixinNum;
	}
	public int getWeixinResum() {
		return weixinResum;
	}
	public void setWeixinResum(int weixinResum) {
		this.weixinResum = weixinResum;
	}
	public int getCompanyRegist() {
		return companyRegist;
	}
	public void setCompanyRegist(int companyRegist) {
		this.companyRegist = companyRegist;
	}
	
	
}
