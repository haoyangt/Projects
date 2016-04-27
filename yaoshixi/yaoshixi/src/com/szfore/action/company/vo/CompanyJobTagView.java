package com.szfore.action.company.vo;

import java.util.List;

import com.szfore.model.CompanyInfo;
import com.szfore.model.TagCompany;

public class CompanyJobTagView {
	
	private CompanyInfo companyInfo;
	
	private List<CompanyJob> jobList;
	
	private List<TagCompany> tagCompanyList;

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public List<CompanyJob> getJobList() {
		return jobList;
	}

	public void setJobList(List<CompanyJob> jobList) {
		this.jobList = jobList;
	}

	public List<TagCompany> getTagCompanyList() {
		return tagCompanyList;
	}

	public void setTagCompanyList(List<TagCompany> tagCompanyList) {
		this.tagCompanyList = tagCompanyList;
	}

	
	
	
}
