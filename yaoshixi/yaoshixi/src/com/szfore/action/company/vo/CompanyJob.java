package com.szfore.action.company.vo;

import com.szfore.model.Job;

public class CompanyJob extends Job{
	
	private Integer receivedResumeNum;

	public Integer getReceivedResumeNum() {
		return receivedResumeNum;
	}

	public void setReceivedResumeNum(Integer receivedResumeNum) {
		this.receivedResumeNum = receivedResumeNum;
	}
}
