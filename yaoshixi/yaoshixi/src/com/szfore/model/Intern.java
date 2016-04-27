package com.szfore.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Intern {

	private static final Integer STATUS_HIRED = 1; //在职
	private static final Integer STATUS_LEAVED = 2;//已离职
	public static final Integer COMMENT_STATUS_TODO = 0;//未评价
	public static final Integer COMMENT_STATUS_DONE = 1;//已评价
	
	private Integer userId;
	private Integer companyId;
	private Integer jobId;
	private Integer status; //状态：1在职；2 已离职
	private Integer commentStatus;//评论状态：0 未评价； 1 已评价
	private Date hireDate; //录用日期
	private Date leaveDate;//离职日期
	private String content; //评价内容
	
	private String linkman;//联系人
	private String jobName;
	private String phone;//联系电话
	private String officeAddress;//入职地址
	private String email;
	private String hour;
	private static final Map<String, String> STATUS_MAP = new HashMap<String, String>();
	static{
		STATUS_MAP.put("default", STATUS_HIRED + "");
		STATUS_MAP.put("hire", STATUS_HIRED + "");
		STATUS_MAP.put("leave", STATUS_LEAVED + "");
	}
	
	public static String getHireStatus(String statusKey) 
	{
		if(STATUS_MAP.containsKey(statusKey))
		{
			return STATUS_MAP.get(statusKey);
		}
		return STATUS_MAP.get("default");
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(Integer commentStatus) {
		this.commentStatus = commentStatus;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}


	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
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
	
}
