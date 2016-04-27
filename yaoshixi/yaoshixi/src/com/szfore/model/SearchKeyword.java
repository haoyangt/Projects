package com.szfore.model;

import java.util.Date;

/**
 * 关键字搜索
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public class SearchKeyword {

	private int kId;
	//搜索的关键字名称
	private String kName;
	//搜索的数量
	private int count;
	//上一次搜索的时间
	private Date lastDate;
	public int getkId() {
		return kId;
	}
	public void setkId(int kId) {
		this.kId = kId;
	}
	public String getkName() {
		return kName;
	}
	public void setkName(String kName) {
		this.kName = kName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	
}
