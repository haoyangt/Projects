package com.hy.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.IFilmBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.po.Cinema;
import com.hy.po.Film;
import com.hy.vo.PageBean;

public class FilmAndCinemaDetailAction {
	private int fno;
	private int cno;
	private int currentPage;
	private String simpleloc;
	private String movieq;
	public String getMovieq() {
		return movieq;
	}

	public void setMovieq(String movieq) {
		this.movieq = movieq;
	}

	public String getSimpleloc() {
		return simpleloc;
	}

	public void setSimpleloc(String simpleloc) {
		this.simpleloc = simpleloc;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}
	public String filmDetail(){
		//电影详情
		IFilmBiz fb=new FilmBizImpl();
		Film film=fb.findFilmByFno(fno);
		HttpServletRequest request = ServletActionContext.getRequest ();
		request.setAttribute("film", film);
		
		//热映电影
		fb=new FilmBizImpl();
		PageBean listFilm=fb.findAllReleasedFilm(1, 5);
		request.setAttribute("listFilm", listFilm);
		
		//电影院列表
		int pageSize=5;				//设置每页显示的电影数目
		if(currentPage<=0)
			currentPage=1;
		ICinemaBiz cb=new CinemaBizImpl();
		PageBean listCinema=null;
		if(movieq==null){
			if(simpleloc==null){
				listCinema=cb.findAllCinemaByFno(currentPage, pageSize, fno);
				request.setAttribute("simpleloc", "all");
			}else{
				listCinema=cb.findAllCinemaByFnoBySimpleloc(currentPage, pageSize, fno, simpleloc);
				request.setAttribute("simpleloc", simpleloc);
			}
		}else{
			listCinema=cb.findAllCinemaByFnoByCname(currentPage, pageSize, fno, movieq);
		}
		request.setAttribute("listCinema", listCinema);
		
		displayAllCinemaCount();
		return "OK";
	}
	
	public String cinemaDetail(){
		//电影院详情
		ICinemaBiz cb=new CinemaBizImpl();
		Cinema cinema=cb.findCinemaByCno(cno);
		HttpServletRequest request = ServletActionContext.getRequest ();
		request.setAttribute("cinema", cinema);
		
		//电影院的上映电影列表
		IFilmBiz fb=new FilmBizImpl();
		int pageSize=5;				//设置每页显示的电影数目
		if(currentPage<=0)
			currentPage=1;
		PageBean listFilm=fb.findReleasedFilmByCno(currentPage, pageSize, cno);
		request.setAttribute("listFilm", listFilm);
		
		return "OK";
	}
	
	//获取地区分类的电影院数目
	public void displayAllCinemaCount(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ICinemaBiz cb;
		cb=new CinemaBizImpl();
		request.setAttribute("all", cb.findCinemaCountByFno(fno));
		cb=new CinemaBizImpl();
		request.setAttribute("heping", cb.findCinemaCountByFno(fno,"heping"));
		cb=new CinemaBizImpl();
		request.setAttribute("nankai", cb.findCinemaCountByFno(fno,"nankai"));
		cb=new CinemaBizImpl();
		request.setAttribute("hexi", cb.findCinemaCountByFno(fno,"hexi"));
		cb=new CinemaBizImpl();
		request.setAttribute("binhai", cb.findCinemaCountByFno(fno,"binhai"));
		cb=new CinemaBizImpl();
		request.setAttribute("beichen", cb.findCinemaCountByFno(fno,"beichen"));
		cb=new CinemaBizImpl();
		request.setAttribute("hongqiao", cb.findCinemaCountByFno(fno,"hongqiao"));
		cb=new CinemaBizImpl();
		request.setAttribute("hedong", cb.findCinemaCountByFno(fno,"hedong"));
		cb=new CinemaBizImpl();
		request.setAttribute("jinghai", cb.findCinemaCountByFno(fno,"jinghai"));
		cb=new CinemaBizImpl();
		request.setAttribute("baodi", cb.findCinemaCountByFno(fno,"baodi"));
	}
}
