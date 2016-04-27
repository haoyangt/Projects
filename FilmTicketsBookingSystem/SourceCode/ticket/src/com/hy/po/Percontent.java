package com.hy.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Percontent implements Serializable {
	public Percontent() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Percontent(int pno, int pm_pno, String pname, String purl) {
		super();
		this.pno = pno;
		this.pm_pno = pm_pno;
		this.pname = pname;
		this.purl = purl;
	}
	private int pno;
	private int pm_pno;
	private String pname;
	private String purl;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getPm_pno() {
		return pm_pno;
	}
	public void setPm_pno(int pm_pno) {
		this.pm_pno = pm_pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPurl() {
		return purl;
	}
	public void setPurl(String purl) {
		this.purl = purl;
	}
}
