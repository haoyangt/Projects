package com.hy.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Hall implements Serializable {
	private int hno;
	private int cno;
	private String hname;
	private String cname;
	private String logo;
	private int maxseat;
	private String seatsequence;
	private String remark;
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public int getMaxseat() {
		return maxseat;
	}
	public void setMaxseat(int maxseat) {
		this.maxseat = maxseat;
	}
	public String getSeatsequence() {
		return seatsequence;
	}
	public void setSeatsequence(String seatsequence) {
		this.seatsequence = seatsequence;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
