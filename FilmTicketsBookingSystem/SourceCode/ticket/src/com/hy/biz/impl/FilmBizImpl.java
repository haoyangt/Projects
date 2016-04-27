package com.hy.biz.impl;

import java.util.List;

import com.hy.biz.IFilmBiz;
import com.hy.dao.IFilmDao;
import com.hy.dao.impl.FilmDaoImpl;
import com.hy.po.Film;
import com.hy.po.SlideImg;
import com.hy.vo.PageBean;

public class FilmBizImpl implements IFilmBiz {
	private IFilmDao fd;
	
	public FilmBizImpl() {
		super();
		this.fd=new FilmDaoImpl();
	}

	@Override
	public List<Film> findAllReleasedFilm() {
		// TODO Auto-generated method stub
		return fd.selectAllReleasedFilm();
	}

	@Override
	public List<Film> findAllReleaseSoonFilm() {
		// TODO Auto-generated method stub
		return fd.selectAllReleaseSoonFilm();
	}

	@Override
	public PageBean findAllReleasedFilm(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return fd.selectAllReleasedFilm(currentPage, pageSize);
	}

	@Override
	public PageBean findAllReleaseSoonFilm(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return fd.selectAllReleaseSoonFilm(currentPage, pageSize);
	}

	@Override
	public int findReleasedFilmCount() {
		// TODO Auto-generated method stub
		return fd.selectReleasedFilmCount();
	}

	@Override
	public int findReleaseSoonFilmCount() {
		// TODO Auto-generated method stub
		return fd.selectReleaseSoonFilmCount();
	}

	@Override
	public PageBean findAllReleasedFilmByName(int currentPage, int pageSize,
			String name) {
		// TODO Auto-generated method stub
		return fd.selectAllReleasedFilmByName(currentPage, pageSize, name);
	}

	@Override
	public PageBean findAllReleaseSoonFilmByName(int currentPage, int pageSize,
			String name) {
		// TODO Auto-generated method stub
		return fd.selectAllReleaseSoonFilmByName(currentPage, pageSize, name);
	}

	@Override
	public int findAllFilmCount() {
		// TODO Auto-generated method stub
		return fd.selectAllFilmCount();
	}

	@Override
	public Film findFilmByFno(int fno) {
		// TODO Auto-generated method stub
		return fd.selectFilmByFno(fno);
	}

	@Override
	public PageBean findReleasedFilmByCno(int currentPage, int pageSize, int cno) {
		// TODO Auto-generated method stub
		return fd.selectReleasedFilmByCno(currentPage, pageSize, cno);
	}

	@Override
	public String findFilmShowtime(int fno, int cno) {
		// TODO Auto-generated method stub
		return fd.selectFilmShowtime(fno, cno);
	}

	@Override
	public List<Film> findAllFilm() {
		// TODO Auto-generated method stub
		return fd.selectAllFilm();
	}

	@Override
	public void changeFilm(Film film) {
		// TODO Auto-generated method stub
		fd.updateFilm(film);
	}

	@Override
	public void deleteFilm(int fno) {
		// TODO Auto-generated method stub
		fd.deleteFilm(fno);
	}

	@Override
	public void addFilm(Film film) {
		// TODO Auto-generated method stub
		fd.insertFilm(film);
	}

	@Override
	public List<SlideImg> getSlideImg() {
		// TODO Auto-generated method stub
		return fd.selectAllSlideImg();
	}

	@Override
	public void addSlideimg(SlideImg slideimg) {
		// TODO Auto-generated method stub
		fd.insertSlideImg(slideimg);
	}

	@Override
	public void changeSlideimg(SlideImg slideimg) {
		// TODO Auto-generated method stub
		fd.updateSlideImg(slideimg);
	}

	@Override
	public void deleteSlideimg(int sno) {
		// TODO Auto-generated method stub
		fd.deleteSlideImg(sno);
	}

	@Override
	public List<String> getSuspensionPoster() {
		// TODO Auto-generated method stub
		return fd.selectSuspensionFilmPoster();
	}

	@Override
	public void updatePoster(int fno, String poster) {
		// TODO Auto-generated method stub
		fd.updatePoster(fno, poster);
	}

	@Override
	public void updateStill(int fno, String oldstill,String still) {
		// TODO Auto-generated method stub
		fd.updateStill(fno, oldstill, still);
	}

	@Override
	public void addStill(int fno, String still) {
		// TODO Auto-generated method stub
		fd.insertStill(fno, still);
	}

	@Override
	public void changeSlideimg(int sno, String img) {
		// TODO Auto-generated method stub
		fd.updateSlideImg(sno, img);
	}


}
