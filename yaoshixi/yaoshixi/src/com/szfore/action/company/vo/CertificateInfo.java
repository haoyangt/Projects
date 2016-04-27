package com.szfore.action.company.vo;

import com.szfore.action.exception.IllegalParameterException;

public class CertificateInfo {

	private String university;//实习生学校
	private String college;//实习生学院
	private String major;//实习生专业
	private String internName;//实习生姓名
	
	private String companyName;//公司名称
	private String jobName;//职位名称
	
	private CertificateInfo(){}
	
	public static void validate(Integer userJobNum, Integer companyJobNum) throws IllegalParameterException 
	{
		if(userJobNum == null || userJobNum <= 0)
		{
			throw new IllegalParameterException();
		}
		if(companyJobNum == null || companyJobNum <= 0)
		{
			throw new IllegalParameterException();
		}
	}

	public String getUniversity() {
		return university;
	}

	public String getCollege() {
		return college;
	}

	public String getMajor() {
		return major;
	}

	public String getInternName() {
		return internName;
	}


	public String getJobName() {
		return jobName;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public void setInternName(String internName) {
		this.internName = internName;
	}


	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
}
