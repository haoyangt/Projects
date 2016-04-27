package com.szfore.model;
/**
 * 用户的标签
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public class TagUser {

	private int id;
	//用户id
	private int userId;
	//用户的标签名称
	private String tagName;
	//备注
	private String mark;
	
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
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
}
