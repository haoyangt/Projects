package com.szfore.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 记录用户投递过的职位
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 28, 2013
 */
public class UserJob {

	public static final Integer STATUS_RECIEVED = 0;
	public static final Integer STATUS_SCANED = 1;
	public static final Integer STATUS_DOWNLOADED = 2;
	public static final Integer STATUS_INTERESTED = 3;
	private static Map<String, String> STATUS_MAP;
	
	static{
		STATUS_MAP = new HashMap<String, String>();
		STATUS_MAP.put("download", STATUS_DOWNLOADED + "");
		STATUS_MAP.put("scan", STATUS_SCANED + "");
		STATUS_MAP.put("recieve", STATUS_RECIEVED + "");
		STATUS_MAP.put("interest", STATUS_INTERESTED + "");
		STATUS_MAP.put("default", STATUS_RECIEVED + "," + STATUS_SCANED);
	}
	
	private int id;
	//投递人id
	private int userId;
	//投递的职位id
	private int jobId;
	//投递的时间
	private Date diliverTime;
	
	public int status;
	
	private String answerOne;//答案1
	private String answerTwo;//答案2
	private String answerThree;//答案3
	private String answerFour;//答案4
	private String answerFive;//答案5
	
	private int terrace;//投简历的平台：0.网页，1.微信
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
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public Date getDiliverTime() {
		return diliverTime;
	}
	public void setDiliverTime(Date diliverTime) {
		this.diliverTime = diliverTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getAnswerOne() {
		return answerOne;
	}
	public void setAnswerOne(String answerOne) {
		this.answerOne = answerOne;
	}
	public String getAnswerTwo() {
		return answerTwo;
	}
	public void setAnswerTwo(String answerTwo) {
		this.answerTwo = answerTwo;
	}
	public String getAnswerThree() {
		return answerThree;
	}
	public void setAnswerThree(String answerThree) {
		this.answerThree = answerThree;
	}
	public String getAnswerFour() {
		return answerFour;
	}
	public void setAnswerFour(String answerFour) {
		this.answerFour = answerFour;
	}
	public String getAnswerFive() {
		return answerFive;
	}
	public void setAnswerFive(String answerFive) {
		this.answerFive = answerFive;
	}
	
	public int getTerrace() {
		return terrace;
	}
	public void setTerrace(int terrace) {
		this.terrace = terrace;
	}
	public static String getQueryStatus(String status) 
	{
		if(status == null)
		{
			return STATUS_MAP.get("default");
		}
		if(STATUS_MAP.containsKey(status))
		{
			return STATUS_MAP.get(status);
		}
		return STATUS_MAP.get("default");
	}
}
