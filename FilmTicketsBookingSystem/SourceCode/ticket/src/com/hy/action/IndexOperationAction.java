package com.hy.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.IFilmBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.po.SlideImg;
import com.hy.vo.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class IndexOperationAction  {
	
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String display(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		//正在上映电影信息
		IFilmBiz fb=new FilmBizImpl();
		PageBean indexReleasedFilm=fb.findAllReleasedFilm(1, 7);
		request.setAttribute("indexReleasedFilm", indexReleasedFilm);
		request.setAttribute("allFilmCount", fb.findAllFilmCount());
		
		//即将上映电影信息
		PageBean indexReleaseSoonFilm=fb.findAllReleaseSoonFilm(1, 5);
		request.setAttribute("indexReleaseSoonFilm", indexReleaseSoonFilm);
		
		//即将上映电影信息
		List<String> suspensionFilm=fb.getSuspensionPoster();
		request.setAttribute("suspensionFilm", suspensionFilm);
		
		//影院信息
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean indexCinema=cb.findAllCinema(1, 5);
		request.setAttribute("indexCinema", indexCinema);
		request.setAttribute("indexCinemaCount", cb.findCinemaCount());
		displayAllCinemaCount();
		
		//获取轮播图信息
		List<SlideImg> slideimg=fb.getSlideImg();
		request.setAttribute("slideimg", slideimg);
		
		return "OK";
	}
	
	//获取地区分类的电影院数目
	public void displayAllCinemaCount(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ICinemaBiz cb;
		cb=new CinemaBizImpl();
		request.setAttribute("all", cb.findCinemaCount());
		cb=new CinemaBizImpl();
		request.setAttribute("heping", cb.findCinemaCount("heping"));
		cb=new CinemaBizImpl();
		request.setAttribute("nankai", cb.findCinemaCount("nankai"));
		cb=new CinemaBizImpl();
		request.setAttribute("hexi", cb.findCinemaCount("hexi"));
		cb=new CinemaBizImpl();
		request.setAttribute("binhai", cb.findCinemaCount("binhai"));
		cb=new CinemaBizImpl();
		request.setAttribute("beichen", cb.findCinemaCount("beichen"));
		cb=new CinemaBizImpl();
		request.setAttribute("hongqiao", cb.findCinemaCount("hongqiao"));
		cb=new CinemaBizImpl();
		request.setAttribute("hedong", cb.findCinemaCount("hedong"));
		cb=new CinemaBizImpl();
		request.setAttribute("jinghai", cb.findCinemaCount("jinghai"));
		cb=new CinemaBizImpl();
		request.setAttribute("baodi", cb.findCinemaCount("baodi"));
		
		//时间
		Date now=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("M月dd日     E");
		Map<String, Object> session=ActionContext.getContext().getSession();
		session.put("now", sdf.format(now));
	}
	
}
