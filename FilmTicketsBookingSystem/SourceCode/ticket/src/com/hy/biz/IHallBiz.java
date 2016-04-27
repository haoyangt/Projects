package com.hy.biz;

import java.util.List;

import com.hy.po.Hall;

public interface IHallBiz {
	public abstract List<Hall> findAllHall();
	public abstract List<Integer> getCountGroupByCno();
	public abstract void changeHall(Hall hall);
	public abstract void addHall(Hall hall);
	public abstract void deleteHall(int hno);
	public abstract List<String> getCnoCnameList();
	public abstract String getSeatsequence(int hno);
	public abstract void changeSeat(int hno,int maxseat,String seatsequence);
}
