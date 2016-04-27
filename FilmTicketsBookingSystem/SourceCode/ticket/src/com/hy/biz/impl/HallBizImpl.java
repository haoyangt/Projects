package com.hy.biz.impl;

import java.util.List;

import com.hy.biz.IHallBiz;
import com.hy.dao.IHallDao;
import com.hy.dao.impl.HallDaoImpl;
import com.hy.po.Hall;

public class HallBizImpl implements IHallBiz {
	private IHallDao hd;

	public HallBizImpl() {
		super();
		hd=new HallDaoImpl();
	}

	@Override
	public List<Hall> findAllHall() {
		// TODO Auto-generated method stub
		return hd.selectAllHall();
	}

	@Override
	public List<Integer> getCountGroupByCno() {
		// TODO Auto-generated method stub
		return hd.selectCountGroupByCno();
	}

	@Override
	public void changeHall(Hall hall) {
		// TODO Auto-generated method stub
		hd.updateHall(hall);
	}

	@Override
	public void deleteHall(int hno) {
		// TODO Auto-generated method stub
		hd.deleteHall(hno);
	}

	@Override
	public List<String> getCnoCnameList() {
		// TODO Auto-generated method stub
		return hd.selectCnoCnameList();
	}

	@Override
	public void addHall(Hall hall) {
		// TODO Auto-generated method stub
		hd.insertHall(hall);
	}

	@Override
	public String getSeatsequence(int hno) {
		// TODO Auto-generated method stub
		return hd.selectSeatsequence(hno);
	}

	@Override
	public void changeSeat(int hno, int maxseat, String seatsequence) {
		// TODO Auto-generated method stub
		hd.updateMaxseat(hno, maxseat);
		hd.updateSeatsequence(hno, seatsequence);
	}

}
