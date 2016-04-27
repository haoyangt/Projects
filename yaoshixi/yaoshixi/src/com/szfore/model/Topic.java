package com.szfore.model;

import java.util.Date;

/**
 * 
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 9, 2013
 */
public class Topic {

	private int id;
	
	private String title;
	
	private String type;
	
	private String content;
	
	private Date publishTime;
	
	private int userId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
