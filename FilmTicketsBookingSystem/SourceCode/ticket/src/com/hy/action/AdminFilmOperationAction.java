package com.hy.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.IFilmBiz;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.po.Film;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdminFilmOperationAction extends ActionSupport {
	private int fno;
	private String fname;
	private String poster;
	private double grade;
	private String rdate;
	private String director;
	private String language;
	private String location;
	private int runtime;
	private String type;
	private String version;
	private String protagonist;
	private String remark;
	private String plot;
	private String still;
	private String prevue;
	private int state;
	private File updateimg;
	private String updateimgContentType;
	private String updateimgFileName;
	private int updateimgfno;
	private String updatetype;
	private String originimg;
	public int getUpdateimgfno() {
		return updateimgfno;
	}
	public void setUpdateimgfno(int updateimgfno) {
		this.updateimgfno = updateimgfno;
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
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getProtagonist() {
		return protagonist;
	}
	public void setProtagonist(String protagonist) {
		this.protagonist = protagonist;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getStill() {
		return still;
	}
	public void setStill(String still) {
		this.still = still;
	}
	public String getPrevue() {
		return prevue;
	}
	public void setPrevue(String prevue) {
		this.prevue = prevue;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String displayAllFilm(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IFilmBiz fb=new FilmBizImpl();
		List<Film> allFilm=fb.findAllFilm();
		request.setAttribute("allFilm", allFilm);
		if(fno>0)
			request.setAttribute("fno", fno);
		return "OK";
	}
	
	public String updateFilm(){
		Film film=new Film();
		film.setFno(fno);
		film.setFname(fname);
		film.setGrade(grade);
		film.setRdate(rdate);
		film.setDirector(director);
		film.setLanguage(language);
		film.setLocation(location);
		film.setRuntime(runtime);
		type=type.replace(',', '/');
		film.setType(type);
		version=version.replace(',', '/');
		film.setVersion(version);
		film.setProtagonist(protagonist);
		film.setRemark(remark);
		film.setPlot(plot);
		film.setPrevue(prevue);
		film.setState(state);
		IFilmBiz fb=new FilmBizImpl();
		fb.changeFilm(film);
		
		//重新读取电影内容
		HttpServletRequest request = ServletActionContext.getRequest ();
		List<Film> allFilm=fb.findAllFilm();
		request.setAttribute("allFilm", allFilm);
		request.setAttribute("fno", 0);
		return "OK";
	}
	
	public String deleteFilm(){
		IFilmBiz fb=new FilmBizImpl();
		fb.deleteFilm(fno);
		
		//重新读取电影内容
		HttpServletRequest request = ServletActionContext.getRequest ();
		List<Film> allFilm=fb.findAllFilm();
		request.setAttribute("allFilm", allFilm);
		request.setAttribute("fno", 0);
		return "OK";
	}
	
	public String addFilm(){
		IFilmBiz fb=new FilmBizImpl();
		Film film=new Film();
		film.setFname(fname);
		film.setGrade(grade);
		film.setRdate(rdate);
		film.setDirector(director);
		film.setLanguage(language);
		film.setLocation(location);
		film.setRuntime(runtime);
		type=type.replace(',', '/');
		film.setType(type);
		version=version.replace(',', '/');
		film.setVersion(version);
		film.setProtagonist(protagonist);
		film.setRemark(remark);
		film.setPlot(plot);
		film.setPrevue(prevue);
		fb.addFilm(film);
		
		//重新读取电影内容
		HttpServletRequest request = ServletActionContext.getRequest ();
		List<Film> allFilm=fb.findAllFilm();
		request.setAttribute("allFilm", allFilm);
		return "OK";
	}
	public String updateimg(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IFilmBiz fb=new FilmBizImpl();
		String fname=updateimgCommon();
		if(!fname.equals("error")){
			//将最新的上传图片名字 写入数据库
			if(updatetype.equals("poster"))
				fb.updatePoster(updateimgfno,fname );
			if(updatetype.equals("still"))
				fb.updateStill(updateimgfno,originimg, fname);
		}
		//重新读取数据
		List<Film> allFilm=fb.findAllFilm();
		request.setAttribute("allFilm", allFilm);
		return SUCCESS;
	}
	
	public String addimg(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IFilmBiz fb=new FilmBizImpl();
		String fname=updateimgCommon();
		if(!fname.equals("error")){
			//将最新的上传图片名字 写入数据库
			fb.addStill(updateimgfno, fname);
		}
		//重新读取数据
		List<Film> allFilm=fb.findAllFilm();
		request.setAttribute("allFilm", allFilm);
		return SUCCESS;
	}
	
	private String updateimgCommon() {
		
		// 准备存储目录photo
		File path = new File(ServletActionContext.getServletContext().getRealPath("image\\film"));
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
