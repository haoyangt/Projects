/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;

import java.util.Date;

/**
 * <p><br/>
 * @className EducationExperience.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-5-6 上午11:47:48<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class EducationExperience {

	private Integer id;
	private int userId;
	private String university;//学校
	private String college;//学院
	private String major;//专业
	private String education;//学历
	private Date enterUniversityYear;//入学时间
	private Date endUniversityYear;//毕业时间
	private String majorAbility;//专业能力
	private String grade;//年级
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public Date getEnterUniversityYear() {
		return enterUniversityYear;
	}
	public void setEnterUniversityYear(Date enterUniversityYear) {
		this.enterUniversityYear = enterUniversityYear;
	}
	public String getMajorAbility() {
		return majorAbility;
	}
	public void setMajorAbility(String majorAbility) {
		this.majorAbility = majorAbility;
	}
	public Date getEndUniversityYear() {
		return endUniversityYear;
	}
	public void setEndUniversityYear(Date endUniversityYear) {
		this.endUniversityYear = endUniversityYear;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}
