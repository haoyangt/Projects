package com.hy.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.IFilmBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.vo.PageBean;

public class FilmOperationAction {
	private int currentPage;
	private String qf;
	public String getQf() {
		return qf;
	}
	public void setQf(String qf) {
		this.qf = qf;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	//显示所有的上映电影
	public String displayAllReleasedFilm(){
		//获取request
		HttpServletRequest request = ServletActionContext.getRequest ();
		int pageSize=10;				//设置每页显示的电影数目
		if(currentPage<=0)
			currentPage=1;
			
		IFilmBiz fb=new FilmBizImpl();
		PageBean allReleasedFilm=fb.findAllReleasedFilm(currentPage,pageSize);
		
		request.setAttribute("allReleasedFilm", allReleasedFilm);
		
		//显示边栏电影列表
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean listCinema=cb.findAllCinema(1, 5);
		request.setAttribute("listCinema", listCinema);
		return "OK";
	}
	//显示所有的即将上映电影
	public String displayAllReleaseSoonFilm(){
		//获取request
		HttpServletRequest request = ServletActionContext.getRequest ();
		int pageSize=10;				//设置每页显示的电影数目
		if(currentPage<=0)
			currentPage=1;
		
		IFilmBiz fb=new FilmBizImpl();
		PageBean allReleaseSoonFilm=fb.findAllReleaseSoonFilm(currentPage,pageSize);
		
		request.setAttribute("allReleaseSoonFilm", allReleaseSoonFilm);
		
		//显示边栏电影列表
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean listCinema=cb.findAllCinema(1, 5);
		request.setAttribute("listCinema", listCinema);
		return "OK";
	}
	
	
	//显示根据片名查询的上映电影
		public String displayAllReleasedFilmByName(){
			//获取request
			HttpServletRequest request = ServletActionContext.getRequest ();
			int pageSize=10;				//设置每页显示的电影数目
			if(currentPage<=0)
				currentPage=1;
				
			IFilmBiz fb=new FilmBizImpl();
			PageBean allReleasedFilmByName=fb.findAllReleasedFilmByName(currentPage,pageSize,qf);
			request.setAttribute("allReleasedFilmByName", allReleasedFilmByName);
			
			//显示边栏电影列表
			ICinemaBiz cb=new CinemaBizImpl();
			PageBean listCinema=cb.findAllCinema(1, 5);
			request.setAttribute("listCinema", listCinema);
			return "OK";
		}
		//显示根据片名查询的即将上映电影
		public String displayAllReleaseSoonFilmByName(){
			//获取request
			HttpServletRequest request = ServletActionContext.getRequest ();
			int pageSize=10;				//设置每页显示的电影数目
			if(currentPage<=0)
				currentPage=1;
			
			IFilmBiz fb=new FilmBizImpl();
			PageBean allReleaseSoonFilmByName=fb.findAllReleaseSoonFilmByName(currentPage, pageSize, qf);
			request.setAttribute("allReleaseSoonFilmByName", allReleaseSoonFilmByName);
			
			//显示边栏电影列表
			ICinemaBiz cb=new CinemaBizImpl();
			PageBean listCinema=cb.findAllCinema(1, 5);
			request.setAttribute("listCinema", listCinema);
			return "OK";
		}
	
}
