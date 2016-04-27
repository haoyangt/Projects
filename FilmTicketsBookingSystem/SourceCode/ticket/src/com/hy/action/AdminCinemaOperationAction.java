package com.hy.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.po.Cinema;
import com.hy.vo.PageBean;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdminCinemaOperationAction extends ActionSupport{
	private int cno;
	private String cname;
	private String logo;
	private double grade;
	private String openinghours;
	private String location;
	private String simpleloc;
	private String tel;
	private String route;
	private String introduction;
	private String image;
	private String remark;
	private double latitude;
	private double longitude;
	private String openTime;
	private String closeTime;
	private File updateimg;
	private String updateimgContentType;
	private String updateimgFileName;
	private int updateimgcno;
	private String updatetype;
	private String originimg;
	public int getUpdateimgcno() {
		return updateimgcno;
	}
	public void setUpdateimgcno(int updateimgcno) {
		this.updateimgcno = updateimgcno;
	}
	public String getUpdatetype() {
		return updatetype;
	}
	public void setUpdatetype(String updatetype) {
		this.updatetype = updatetype;
	}
	public String getOriginimg() {
		return originimg;
	}
	public void setOriginimg(String originimg) {
		this.originimg = originimg;
	}
	public void setUpdateimg(File updateimg) {
		this.updateimg = updateimg;
	}
	public void setUpdateimgContentType(String updateimgContentType) {
		this.updateimgContentType = updateimgContentType;
	}
	public void setUpdateimgFileName(String updateimgFileName) {
		this.updateimgFileName = updateimgFileName;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
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
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getOpeninghours() {
		return openinghours;
	}
	public void setOpeninghours(String openinghours) {
		this.openinghours = openinghours;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSimpleloc() {
		return simpleloc;
	}
	public void setSimpleloc(String simpleloc) {
		this.simpleloc = simpleloc;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public String displayAllCinema(){
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean allCinema=cb.findAllCinema(1, 100);
		HttpServletRequest request = ServletActionContext.getRequest ();
		request.setAttribute("allCinema", allCinema);
		if(cno>0)
			request.setAttribute("cno", cno);
		return "OK";
	}
	
	public String updateCinema(){
		Cinema cinema=new Cinema();
		cinema.setCno(cno);
		cinema.setCname(cname);
		cinema.setGrade(grade);
		cinema.setOpeninghours(openTime+'-'+closeTime);
		cinema.setLocation(location);
		cinema.setSimpleloc(simpleloc);
		cinema.setTel(tel);
		cinema.setRoute(route);
		cinema.setIntroduction(introduction);
		cinema.setRemark(remark);
		cinema.setLatitude(latitude);
		cinema.setLongitude(longitude);
		ICinemaBiz cb=new CinemaBizImpl();
		cb.changeCinema(cinema);
		//重新读取电影院列表
		PageBean allCinema=cb.findAllCinema(1, 100);
		HttpServletRequest request = ServletActionContext.getRequest ();
		request.setAttribute("allCinema", allCinema);
		request.setAttribute("cno", 0);
		return "OK";
	}
	
	public String deleteCinema(){
		ICinemaBiz cb=new CinemaBizImpl();
		cb.deleteCinema(cno);
		
		//重新读取电影院列表
		PageBean allCinema=cb.findAllCinema(1, 100);
		HttpServletRequest request = ServletActionContext.getRequest ();
		request.setAttribute("allCinema", allCinema);
		request.setAttribute("cno", 0);
		return "OK";
	}
	
	public String addCinema(){
		ICinemaBiz cb=new CinemaBizImpl();
		Cinema cinema=new Cinema();
		cinema.setCname(cname);
		cinema.setGrade(grade);
		cinema.setOpeninghours(openTime+'-'+closeTime);
		cinema.setLocation(location);
		cinema.setSimpleloc(simpleloc);
		cinema.setTel(tel);
		cinema.setRoute(route);
		cinema.setIntroduction(introduction);
		cinema.setRemark(remark);
		cinema.setLatitude(latitude);
		cinema.setLongitude(longitude);
		cb.addCinema(cinema);
		
		//重新读取电影院列表
		PageBean allCinema=cb.findAllCinema(1, 100);
		HttpServletRequest request = ServletActionContext.getRequest ();
		request.setAttribute("allCinema", allCinema);
		request.setAttribute("cno", 0);
		return "OK";
	}
	
	public String updateimg(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ICinemaBiz cb=new CinemaBizImpl();
		String fname=updateimgCommon();
		if(!fname.equals("error")){
			//将最新的上传图片名字 写入数据库
			if(updatetype.equals("logo"))
				cb.updateLogo(updateimgcno,fname );
			if(updatetype.equals("image"))
				cb.updateImage(updateimgcno,originimg, fname);
		}
		//重新读取数据
		PageBean allCinema=cb.findAllCinema(1, 100);
		request.setAttribute("allCinema", allCinema);
		return SUCCESS;
	}
	
	public String addimg(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ICinemaBiz cb=new CinemaBizImpl();
		String fname=updateimgCommon();
		if(!fname.equals("error")){
			//将最新的上传图片名字 写入数据库
			cb.addImage(updateimgcno, fname);
		}
		//重新读取数据
		PageBean allCinema=cb.findAllCinema(1, 100);
		request.setAttribute("allCinema", allCinema);
		return SUCCESS;
	}
	
	private String updateimgCommon() {
		
		// 准备存储目录photo
		File path = new File(ServletActionContext.getServletContext().getRealPath("image\\cinema"));
		if(!path.exists()){
			path.mkdir();
		}
		
		// 验证是否选择了文件
		if(updateimg == null){
			this.addActionMessage("<script>alert('请选择要上传的文件！');</script>");
			return "error";
		}
		
		//System.out.println(">>> 临时文件名：" + updateimg.getName());
		// 验证文件类型
		if(!updateimgContentType.contains("image")){
			this.addActionMessage("<script>alert('只能上传图片文件！');</script>");
			return "error";
		}
		
		// 验证文件大小  300K
		if(updateimg.length()>300*1024){
			this.addActionMessage("<script>alert('只能上传小于300K的图片！');</script>");
			return "error";
		}
		
		// 获取文件名
		String[] extname = updateimgFileName.split("\\.");
		String fname = new Date().getTime()+"."+extname[extname.length-1];
		
		// 使用流把文件从缓存拷贝到指定目录photo
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			fis = new FileInputStream(updateimg);
			fos = new FileOutputStream(path+"\\" + fname);
			byte[] buff = new byte[100];
			int len = 0;
			while((len=fis.read(buff, 0, buff.length))>0){
				fos.write(buff, 0, len);
			}
			fos.close();
			fis.close();
			this.addActionMessage("<script>alert('文件上传成功！');</script>");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			this.addActionMessage("<script>alert('文件上传失败！');</script>");
		} catch (IOException e) {
			e.printStackTrace();
			this.addActionMessage("<script>alert('文件上传失败！');</script>");
		}
		
		return fname;
	}
	
}
