package com.hy.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Film implements Serializable{
	private int fno;
	private String fname;
	private String poster;
	private double grade;
	private String rdate;
	private String director;
	private String language;
	private String location;
	private int runtime;
	private String type;
	private String version;
	private String protagonist;
	private String remark;
	private String plot;
	private String still;
	private String prevue;
	private int state;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getProtagonist() {
		return protagonist;
	}
	public void setProtagonist(String protagonist) {
		this.protagonist = protagonist;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStill() {
		return still;
	}
	public void setStill(String still) {
		this.still = still;
	}
	public String getPrevue() {
		return prevue;
	}
	public void setPrevue(String prevue) {
		this.prevue = prevue;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
