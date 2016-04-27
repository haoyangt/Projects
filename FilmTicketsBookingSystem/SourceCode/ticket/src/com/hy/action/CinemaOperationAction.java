package com.hy.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.IFilmBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.vo.PageBean;

public class CinemaOperationAction {
	private int currentPage;				//当前页参数
	private String simpleloc;			//电影院地址（区）参数
	private String movieq;
	
	public String getMovieq() {
		return movieq;
	}
	public void setMovieq(String movieq) {
		this.movieq = movieq;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public String getSimpleloc() {
		return simpleloc;
	}
	public void setSimpleloc(String simpleloc) {
		this.simpleloc = simpleloc;
	}
	//显示所有电影院（默认排序、全部地区影院）
	public String displayAllCinema(){
		//获取request
		HttpServletRequest request = ServletActionContext.getRequest ();
		int pageSize=5;				//设置每页显示的电影院数目
		if(currentPage<=0)
			currentPage=1;
		
		//显示边栏电影列表
		IFilmBiz fb=new FilmBizImpl();
		PageBean listFilm=fb.findAllReleasedFilm(1, 5);
		request.setAttribute("listFilm", listFilm);
			
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean allCinema=null;
		if(simpleloc==null){
			allCinema=cb.findAllCinema(currentPage,pageSize);
			request.setAttribute("simpleloc", "all");
		}else {
			allCinema=cb.findAllCinemaBySimpleloc(currentPage,pageSize,simpleloc);
			request.setAttribute("simpleloc", simpleloc);
		}
		
		int allCinemaCount=allCinema.getTotalRows();
		request.setAttribute("allCinema", allCinema);
		request.setAttribute("allCinemaCount", allCinemaCount);
		displayAllCinemaCount();   //调用获取地区分类电影院数目的函数
		
		
		
		//此处需要重新实例化一个ICinemaBiz才能运行，why？
		//request.setAttribute("nankai", cb.findCinemaCount("nankai"));
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
	}
	
	//显示查询的电影院
	public String displayAllCinemaByName(){
		//获取request
		HttpServletRequest request = ServletActionContext.getRequest ();
		int pageSize=5;				//设置每页显示的电影院数目
		if(currentPage<=0)
			currentPage=1;
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean allCinemaByName=cb.findAllCinemaByName(currentPage, pageSize, movieq);
		System.out.println(allCinemaByName.getTotalPages());
		request.setAttribute("allCinemaByName", allCinemaByName);
		displayAllCinemaCount();
		
		//显示边栏电影列表
		IFilmBiz fb=new FilmBizImpl();
		PageBean listFilm=fb.findAllReleasedFilm(1, 5);
		request.setAttribute("listFilm", listFilm);
		
		return "OK";
	}
}
