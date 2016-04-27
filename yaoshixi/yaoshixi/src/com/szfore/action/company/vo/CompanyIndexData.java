package com.szfore.action.company.vo;

import java.util.List;

import com.szfore.model.CompanyInfo;
import com.szfore.model.TagCompany;
import com.szfore.plugin.Page;
import com.szfore.util.EntityUtil;

public class CompanyIndexData extends CompanyInfo{
	
	private List<CompanyJob> jobPage;
	private List<TagCompany> tagCompanyList;

	public static CompanyIndexData create(CompanyInfo companyInfo, List<CompanyJob> jobPage, List<TagCompany> tagCompanyList )
	{
		CompanyIndexData companyIndexData = new CompanyIndexData();
		
		EntityUtil.copyPropertyValues(companyInfo, companyIndexData);
		
		companyIndexData.setJobPage(jobPage);
		
		companyIndexData.setTagCompanyList(tagCompanyList);
		
		return companyIndexData;
	}
	
	public List<CompanyJob> getJobPage() {
		return jobPage;
	}
	
	private void setJobPage(List<CompanyJob> jobPage) {
		this.jobPage = jobPage;
	}

	public List<TagCompany> getTagCompanyList() {
		return tagCompanyList;
	}

	public void setTagCompanyList(List<TagCompany> tagCompanyList) {
		this.tagCompanyList = tagCompanyList;
	}
	
}
