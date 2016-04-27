package com.hy.biz;

import java.util.List;

import com.hy.po.Film;
import com.hy.po.SlideImg;
import com.hy.vo.PageBean;

public interface IFilmBiz {
	public abstract List<Film> findAllReleasedFilm();
	public abstract List<Film> findAllReleaseSoonFilm();
	public abstract List<Film> findAllFilm();
	public abstract PageBean findAllReleasedFilm(int currentPage, int pageSize);
	public abstract PageBean findAllReleaseSoonFilm(int currentPage, int pageSize);
	public abstract PageBean findAllReleasedFilmByName(int currentPage, int pageSize,String name);
	public abstract PageBean findAllReleaseSoonFilmByName(int currentPage, int pageSize,String name);
	public abstract int findReleasedFilmCount();
	public abstract int findReleaseSoonFilmCount();
	public abstract int findAllFilmCount();
	public abstract Film findFilmByFno(int fno);
	public abstract PageBean findReleasedFilmByCno(int currentPage, int pageSize,int cno);
	public abstract String findFilmShowtime(int fno,int cno);
	public abstract void changeFilm(Film film);
	public abstract void deleteFilm(int fno);
	public abstract void addFilm(Film film);
	public abstract List<SlideImg> getSlideImg();
	public abstract void addSlideimg(SlideImg slideimg);
	public abstract void changeSlideimg(SlideImg slideimg);
	public abstract void changeSlideimg(int sno,String img);
	public abstract void deleteSlideimg(int sno);
	public abstract List<String> getSuspensionPoster();
	public abstract void updatePoster(int fno,String poster);
	public abstract void updateStill(int fno,String oldstill,String still);
	public abstract void addStill(int fno,String still);
}
