package com.szfore.model;

import java.util.Date;
/**
 * 
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public class Login {

	public static final Integer ROLE_COMPANY = 1;
	public static final Integer ROLE_USER = 2;
	public static final Integer ROLE_ADMIN = 3;
	
	private int id;
	
	private String email;
	
	private String password;
	//角色id
	private int roleId;
	//上次登录时间
	private Date lastLoginTime;
	//总共登录次数
	private Date totalLoginTime;
	//注册时间
	private Date registTime;
	//状态是否激活 0代表未激活，1代表已经激活
	private int activeStatus=0;
	//激活码id
	private String registId;
	
	private int num;//收到消息数
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Date getTotalLoginTime() {
		return totalLoginTime;
	}

	public void setTotalLoginTime(Date totalLoginTime) {
		this.totalLoginTime = totalLoginTime;
	}

	public Date getRegistTime() {
		return registTime;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public int getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(int activeStatus) {
		this.activeStatus = activeStatus;
	}

	public String getRegistId() {
		return registId;
	}

	public void setRegistId(String registId) {
		this.registId = registId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
}
