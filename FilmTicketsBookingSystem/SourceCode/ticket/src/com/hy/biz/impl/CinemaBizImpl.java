package com.hy.biz.impl;

import com.hy.biz.ICinemaBiz;
import com.hy.dao.ICinemaDao;
import com.hy.dao.impl.CinemaDaoImpl;
import com.hy.po.Cinema;
import com.hy.vo.PageBean;

public class CinemaBizImpl implements ICinemaBiz {
	
	ICinemaDao cd;
	
	public CinemaBizImpl() {
		super();
		cd=new CinemaDaoImpl();
	}

	@Override
	public PageBean findAllCinema(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return cd.selectAllCinema(currentPage, pageSize);
	}
	
	@Override
	public PageBean findAllCinemaBySimpleloc(int currentPage, int pageSize,
			String simpleloc) {
		// TODO Auto-generated method stub
		return cd.selectAllCinemaBySimpleloc(currentPage, pageSize,simpleloc);
	}
	
	@Override
	public PageBean findAllCinemaByName(int currentPage, int pageSize,
			String name) {
		// TODO Auto-generated method stub
		return cd.selectAllCinemaByName(currentPage, pageSize,name);
	}
	
	@Override
	public int findCinemaCount() {
		// TODO Auto-generated method stub
		return cd.selectCinemaCount();
	}

	@Override
	public int findCinemaCount(String simpleloc) {
		// TODO Auto-generated method stub
		return cd.selectCinemaCount(simpleloc);
	}

	@Override
	public PageBean findAllCinemaByFno(int currentPage, int pageSize, int fno) {
		// TODO Auto-generated method stub
		return cd.selectAllCinemaByFno(currentPage, pageSize, fno);
	}

	@Override
	public PageBean findAllCinemaByFnoBySimpleloc(int currentPage,
			int pageSize, int fno, String simpleloc) {
		// TODO Auto-generated method stub
		return cd.selectAllCinemaByFnoBySimpleloc(currentPage, pageSize, fno, simpleloc);
	}

	@Override
	public PageBean findAllCinemaByFnoByCname(int currentPage, int pageSize,
			int fno, String cname) {
		// TODO Auto-generated method stub
		return cd.selectAllCinemaByFnoByCname(currentPage, pageSize, fno, cname);
	}

	@Override
	public int findCinemaCountByFno(int fno) {
		// TODO Auto-generated method stub
		return cd.selectCinemaCountByFno(fno);
	}

	@Override
	public int findCinemaCountByFno(int fno, String simpleloc) {
		// TODO Auto-generated method stub
		return cd.selectCinemaCountByFno(fno, simpleloc);
	}

	@Override
	public Cinema findCinemaByCno(int cno) {
		// TODO Auto-generated method stub
		return cd.selectCinemaByCno(cno);
	}

	@Override
	public void changeCinema(Cinema cinema) {
		// TODO Auto-generated method stub
		cd.updateCinema(cinema);
	}

	@Override
	public void deleteCinema(int cno) {
		// TODO Auto-generated method stub
		cd.deleteCinema(cno);
	}

	@Override
	public void addCinema(Cinema cinema) {
		// TODO Auto-generated method stub
		cd.insertCinema(cinema);
	}

	@Override
	public void updateLogo(int cno, String logo) {
		// TODO Auto-generated method stub
		cd.updateLogo(cno, logo);
	}

	@Override
	public void updateImage(int cno, String oldimage, String image) {
		// TODO Auto-generated method stub
		cd.updateImage(cno, oldimage, image);
	}

	@Override
	public void addImage(int cno, String image) {
		// TODO Auto-generated method stub
		cd.insertImage(cno, image);
	}

	

	

}
