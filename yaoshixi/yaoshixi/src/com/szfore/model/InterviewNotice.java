package com.szfore.model;

import java.util.Date;

/**
 * 用户面试消息通知
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Jan 14, 2014
 */
public class InterviewNotice {

	private int id;
	
	private int userId;
	
	private int companyId;
	
	private int jobId;
	//面试时间
	private Date interviewTime;
	//面试地点
	private String place;
	//联系人
	private String contactPerson;
	//联系电话
	private String contactPhone;
	//面试内容
	private String content;
	//面试通知是否被实习生看到 0 未查看， 1是已经查看
	private int status;
	//用户邮箱
	private String email;
	
	private String hour;
	
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
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public Date getInterviewTime() {
		return interviewTime;
	}
	public void setInterviewTime(Date interviewTime) {
		this.interviewTime = interviewTime;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
}
