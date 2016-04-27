package com.hy.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Cinema implements Serializable {
	private int cno;
	private String cname;
	private String logo;
	private double grade;
	private String openinghours;
	private String location;
	private String simpleloc;
	private String tel;
	private String route;
	private String introduction;
	private String image;
	private String remark;
	private double latitude;
	private double longitude;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getOpeninghours() {
		return openinghours;
	}
	public void setOpeninghours(String openinghours) {
		this.openinghours = openinghours;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSimpleloc() {
		return simpleloc;
	}
	public void setSimpleloc(String simpleloc) {
		this.simpleloc = simpleloc;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
}
