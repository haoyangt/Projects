package com.hy.dao;

import java.util.List;

import com.hy.po.Hall;


public interface IHallDao {
	public abstract List<Hall> selectAllHall();
	public abstract List<Integer> selectCountGroupByCno();
	public abstract void updateHall(Hall hall);
	public abstract void insertHall(Hall hall);
	public abstract void deleteHall(int hno);
	public abstract List<String> selectCnoCnameList();
	public abstract String selectSeatsequence(int hno);
	public abstract void updateSeatsequence(int hno,String seatsequence);
	public abstract void updateMaxseat(int hno,int maxseat);
	
}
