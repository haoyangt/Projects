package com.szfore.model;
/**
 * 公司的标签
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public class TagCompany {

	private int id;
	//公司id
	private int companyId;
	//公司的标签名称
	private String tagName;
	//备注
	private String mark;
	
	public TagCompany(){}
	
	public TagCompany(int companyId, String tagName) {
		super();
		this.companyId = companyId;
		this.tagName = tagName;
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
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
}
