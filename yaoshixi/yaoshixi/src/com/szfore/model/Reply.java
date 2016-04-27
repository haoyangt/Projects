package com.szfore.model;

import java.util.Date;

/**
 * 论坛回复
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 9, 2013
 */
public class Reply {

	private int id;
	
	private int topicId;
	
	private int pid;
	
	private int userId;
	
	private Date replyTime;
	
	private String replyContent;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
}
