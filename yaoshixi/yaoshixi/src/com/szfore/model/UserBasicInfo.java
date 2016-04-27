package com.szfore.model;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户的基本信息
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 26, 2013
 */
public class UserBasicInfo {

	private int id;
	private int userId;
	private String userName;
	private String telPhone;
	private String  city;
	private String approach;
	private String jobCity;//希望工作所在城市
	private String category;//希望的职位类别
	private int jobCategory;//希望工作性质
	private int gender;//性别 0代表男，1代表女
	private Date birthDay;//出生年月
	private String headImg;//头像
	private String email;//邮箱
	private int stature;//身高
	private String accessory;//简历附件
	private String selfDescription;//自我描述
	private int quantity;//每天投递简历的量
	private int expose;//简历是否公开：0.公开，1.不公开
	private String workReady;//每周可工作的日子
	private String monthReady;//每月可工作的日子
	private int refreshto;
	private String certificate;
	private String skill;
	private String experience;
	private String hobby;
	private int viewCount;
	private int sharetimes;
	
	public int getSharetimes() {
		return sharetimes;
	}
	public void setSharetimes(int sharetimes) {
		this.sharetimes = sharetimes;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	private String giveHRword;//给HR的一句话
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getTelPhone() {
		return telPhone;
	}
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}
	
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getApproach() {
		return approach;
	}
	public void setApproach(String approach) {
		this.approach = approach;
	}
	
	public String getJobCity() {
		return jobCity;
	}
	public void setJobCity(String jobCity) {
		this.jobCity = jobCity;
	}
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getStature() {
		return stature;
	}
	public void setStature(int stature) {
		this.stature = stature;
	}
	
	public int getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(int jobCategory) {
		this.jobCategory = jobCategory;
	}
	
	public String getSelfDescription() {
		return selfDescription;
	}
	public void setSelfDescription(String selfDescription) {
		this.selfDescription = selfDescription;
	}
	public String getAccessory() {
		return accessory;
	}
	public void setAccessory(String accessory) {
		this.accessory = accessory;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getExpose() {
		return expose;
	}
	public void setExpose(int expose) {
		this.expose = expose;
	}
	
	public String getWorkReady() {
		return workReady;
	}
	public void setWorkReady(String workReady) {
		this.workReady = workReady;
	}
	
	public String getMonthReady() {
		return monthReady;
	}
	public void setMonthReady(String monthReady) {
		this.monthReady = monthReady;
	}
	
	public int getRefreshto() {
		return refreshto;
	}
	public void setRefreshto(int refreshto) {
		this.refreshto = refreshto;
	}
	
	public String getGiveHRword() {
		return giveHRword;
	}
	public void setGiveHRword(String giveHRword) {
		this.giveHRword = giveHRword;
	}
	public  Map<String, Object> toMap(){
		Field[] fields = this.getClass().getDeclaredFields();
		if(fields == null || fields.length <= 0){
			return null;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < fields.length; i++) {
			Field field = fields[i];
		try {
			field.setAccessible(true);
		    Object value = field.get(this);
		    String name = field.getName();
		    map.put(name, value);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
			return map;
		}
	}
