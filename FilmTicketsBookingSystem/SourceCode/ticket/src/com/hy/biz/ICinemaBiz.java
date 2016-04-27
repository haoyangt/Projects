package com.hy.biz;

import com.hy.po.Cinema;
import com.hy.vo.PageBean;

public interface ICinemaBiz {
	public abstract PageBean findAllCinema(int currentPage, int pageSize);
	public abstract PageBean findAllCinemaBySimpleloc(int currentPage, int pageSize,String simpleloc);
	public abstract PageBean findAllCinemaByName(int currentPage, int pageSize,String name);
	public abstract PageBean findAllCinemaByFno(int currentPage, int pageSize,int fno);
	public abstract PageBean findAllCinemaByFnoBySimpleloc(int currentPage, int pageSize,int fno,String simpleloc);
	public abstract PageBean findAllCinemaByFnoByCname(int currentPage, int pageSize,int fno,String cname);
	public abstract int findCinemaCount();
	public abstract int findCinemaCount(String simpleloc);
	public abstract int findCinemaCountByFno(int fno);
	public abstract int findCinemaCountByFno(int fno,String simpleloc);
	public abstract Cinema findCinemaByCno(int cno);
	public abstract void changeCinema(Cinema cinema);
	public abstract void deleteCinema(int cno);
	public abstract void addCinema(Cinema cinema);
	public abstract void updateLogo(int cno,String logo);
	public abstract void updateImage(int cno,String oldimage,String image);
	public abstract void addImage(int cno,String image);
}
