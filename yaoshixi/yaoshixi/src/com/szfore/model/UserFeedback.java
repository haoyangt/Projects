package com.szfore.model;

import java.util.Date;

/**
 * 记录微信用户的反馈意见
 * @author wanglq
 * email:wanglq@szfore.com
 * 1, April,2014
 */
public class UserFeedback {
	private int id;
	private int userId;
	private String content;
	private Date fbtime;	//反馈时间
	private int status;		//是否处理
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getFbtime() {
		return fbtime;
	}
	public void setFbtime(Date fbtime) {
		this.fbtime = fbtime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
