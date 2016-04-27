/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;
/**
 * <p><br/>
 * @className relevance.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-4-2 下午2:28:24<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class Relevance {

	private int id;
	//用户id
	private Integer userId;
	//企业id
	private Integer companyId;
	private Integer status; //状态：1公司评论用户   2 用户评论公司
	private String content;//评价内容
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
