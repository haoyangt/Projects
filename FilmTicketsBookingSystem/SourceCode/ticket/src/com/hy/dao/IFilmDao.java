package com.hy.dao;

import java.util.List;

import com.hy.po.Film;
import com.hy.po.SlideImg;
import com.hy.vo.PageBean;

public interface IFilmDao {
	public abstract List<Film> selectAllReleasedFilm();
	public abstract List<Film> selectAllReleaseSoonFilm();
	public abstract List<Film> selectAllFilm();
	public abstract PageBean selectAllReleasedFilm(int currentPage, int pageSize);
	public abstract PageBean selectAllReleaseSoonFilm(int currentPage, int pageSize);
	public abstract PageBean selectAllReleasedFilmByName(int currentPage, int pageSize,String name);
	public abstract PageBean selectAllReleaseSoonFilmByName(int currentPage, int pageSize,String name);
	public abstract int selectReleasedFilmCount();
	public abstract int selectReleaseSoonFilmCount();
	public abstract int selectAllFilmCount();
	public abstract Film selectFilmByFno(int fno);
	public abstract PageBean selectReleasedFilmByCno(int currentPage, int pageSize,int cno);
	public abstract String selectFilmShowtime(int fno,int cno);
	public abstract void updateFilm(Film film);
	public abstract void deleteFilm(int fno);
	public abstract void insertFilm(Film film);
	public abstract List<SlideImg> selectAllSlideImg();
	public abstract void updateSlideImg(SlideImg slideimg);
	public abstract void updateSlideImg(int sno,String img);
	public abstract void deleteSlideImg(int sno);
	public abstract void insertSlideImg(SlideImg slideimg);
	public abstract List<String> selectSuspensionFilmPoster();
	public abstract void updatePoster(int fno,String poster);
	public abstract void updateStill(int fno,String oldstill,String still);
	public abstract void insertStill(int fno,String still);
}
