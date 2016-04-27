package com.szfore.model;

import java.util.Date;

/**
 * 企业发布的职位
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 28, 2013
 */
public class Job {

	public static final Integer STATUS_ONLINE = 1; //有效职位
	public static final Integer STATUS_OFFLINE = 2;//下线职位
	
	private int id;
	private int companyId;//企业id
	private String jobName;//职位名称
	private String jobDesc;//职位描述
	private String jobRequest; //能力要求
	private String educationalReq; //学历要求
	private String otherReq; //其他要求
	private String payment; //薪酬待遇
	private String city; //工作城市
	private String workTime; //工作时间1.全职；2.按天；3.按小时
	private String workTimeInterval;//实习时间段要求
	private Date publishTime;//发布日期
	private String mark;//备注
	private String belongDeptName;//所属部门
	private Integer status;//1：已发布； 2：已下线
	private String temptation; //职位诱惑
	private Integer employ;//招聘人数
	private String area;//区域
	private String dacategory;//职位大类别
	private String category;//职位类别
	private int stature=0;//身高
	private int pageView=0;//浏览量
	private int sharetimes;//分享次数
	private String interQuestionsOne;
	private String interQuestionsTwo;
	private String interQuestionsThree;
	private String interQuestionsFour;
	private String interQuestionsFive;
	private String email;
	private String jobType;//招聘的人员：正式，实习
	private String skip;
	private String postJob;//岗位
	public String getSkip() {
		return skip;
	}
	public void setSkip(String skip) {
		this.skip = skip;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}
	public String getEducationalReq() {
		return educationalReq;
	}
	public void setEducationalReq(String educationalReq) {
		this.educationalReq = educationalReq;
	}
	public String getOtherReq() {
		return otherReq;
	}
	public void setOtherReq(String otherReq) {
		this.otherReq = otherReq;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getJobRequest() {
		return jobRequest;
	}
	public void setJobRequest(String jobRequest) {
		this.jobRequest = jobRequest;
	}
	public String getBelongDeptName() {
		return belongDeptName;
	}
	public void setBelongDeptName(String belongDeptName) {
		this.belongDeptName = belongDeptName;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getWorkTimeInterval() {
		return workTimeInterval;
	}
	public void setWorkTimeInterval(String workTimeInterval) {
		this.workTimeInterval = workTimeInterval;
	}
	public String getTemptation() {
		return temptation;
	}
	public void setTemptation(String temptation) {
		this.temptation = temptation;
	}
	public Integer getEmploy() {
		return employ;
	}
	public void setEmploy(Integer employ) {
		this.employ = employ;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
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
	public int getPageView() {
		return pageView;
	}
	public void setPageView(int pageView) {
		this.pageView = pageView;
	}
	public String getInterQuestionsOne() {
		return interQuestionsOne;
	}
	public void setInterQuestionsOne(String interQuestionsOne) {
		this.interQuestionsOne = interQuestionsOne;
	}
	public String getInterQuestionsTwo() {
		return interQuestionsTwo;
	}
	public void setInterQuestionsTwo(String interQuestionsTwo) {
		this.interQuestionsTwo = interQuestionsTwo;
	}
	public String getInterQuestionsThree() {
		return interQuestionsThree;
	}
	public void setInterQuestionsThree(String interQuestionsThree) {
		this.interQuestionsThree = interQuestionsThree;
	}
	public String getInterQuestionsFour() {
		return interQuestionsFour;
	}
	public void setInterQuestionsFour(String interQuestionsFour) {
		this.interQuestionsFour = interQuestionsFour;
	}
	public String getInterQuestionsFive() {
		return interQuestionsFive;
	}
	public void setInterQuestionsFive(String interQuestionsFive) {
		this.interQuestionsFive = interQuestionsFive;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDacategory() {
		return dacategory;
	}
	public void setDacategory(String dacategory) {
		this.dacategory = dacategory;
	}
	public int getSharetimes() {
		return sharetimes;
	}
	public void setSharetimes(int sharetimes) {
		this.sharetimes = sharetimes;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getPostJob() {
		return postJob;
	}
	public void setPostJob(String postJob) {
		this.postJob = postJob;
	}
	
}
