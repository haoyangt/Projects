package com.hy.po;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Permission implements Serializable {
	
	public Permission() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Permission(int pno, String pname) {
		super();
		this.pno = pno;
		this.pname = pname;
	}

	private int pno;
	private String pname;
	private List<Percontent> percontent;
	
	public List<Percontent> getPercontent() {
		return percontent;
	}
	public void setPercontent(List<Percontent> percontent) {
		this.percontent = percontent;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
}
