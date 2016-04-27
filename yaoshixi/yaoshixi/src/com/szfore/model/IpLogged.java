/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.model;

import java.util.Date;


/**
 * <p><br/>
 * @className IpLogged.java<br/>
 * @packageName com.szfore.model<br/>
 * @date 2014-7-18 下午5:15:09<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class IpLogged {

	private String ipLocation;//
	private Date time;//
	public String getIpLocation() {
		return ipLocation;
	}
	public void setIpLocation(String ipLocation) {
		this.ipLocation = ipLocation;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
}
