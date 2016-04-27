package com.szfore.model;

import java.util.Date;

public class OAuthVO {
	private int userId;
	private String joinId;
	private Date joinDate;
	private String nickName;
	private String accessToken;
	private int type;	//绑定类型0表示qq绑定，1表示微信绑定,2表示新浪绑定
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getJoinId() {
		return joinId;
	}
	public void setJoinId(String joinId) {
		this.joinId = joinId;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
