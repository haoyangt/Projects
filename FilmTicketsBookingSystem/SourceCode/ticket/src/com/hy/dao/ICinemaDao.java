package com.hy.dao;


import com.hy.po.Cinema;
import com.hy.vo.PageBean;

public interface ICinemaDao {
	public abstract PageBean selectAllCinema(int currentPage, int pageSize);
	public abstract PageBean selectAllCinemaBySimpleloc(int currentPage, int pageSize,String simpleloc);
	public abstract PageBean selectAllCinemaByName(int currentPage, int pageSize,String name);
	public abstract PageBean selectAllCinemaByFno(int currentPage, int pageSize,int fno);
	public abstract PageBean selectAllCinemaByFnoBySimpleloc(int currentPage, int pageSize,int fno,String simpleloc);
	public abstract PageBean selectAllCinemaByFnoByCname(int currentPage, int pageSize,int fno,String cname);
	public abstract int selectCinemaCount();
	public abstract int selectCinemaCount(String simpleloc);
	public abstract int selectCinemaCountByFno(int fno);
	public abstract int selectCinemaCountByFno(int fno,String simpleloc);
	public abstract Cinema selectCinemaByCno(int cno);
	public abstract void updateCinema(Cinema cinema);
	public abstract void deleteCinema(int cno);
	public abstract void insertCinema(Cinema cinema);
	public abstract void updateLogo(int cno,String logo);
	public abstract void updateImage(int cno,String oldimage,String image);
	public abstract void insertImage(int cno,String image);
}
