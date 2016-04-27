package com.hy.biz.impl;

import java.util.List;

import com.hy.biz.ITicketBiz;
import com.hy.dao.ITicketDao;
import com.hy.dao.impl.TicketDaoImpl;
import com.hy.po.Ticket;

public class TicketBizImpl implements ITicketBiz {
	
	ITicketDao td;

	public TicketBizImpl() {
		super();
		td=new TicketDaoImpl();
	}


	@Override
	public List<Ticket> findAllTicketByFnoCno(int fno, int cno) {
		// TODO Auto-generated method stub
		return td.selectAllTicketByFnoCno(fno, cno);
	}


	@Override
	public String findSeatsequence(int tno, int hno) {
		// TODO Auto-generated method stub
		return td.selectSeatsequenceByTnoHno(tno, hno);
	}


	@Override
	public void buyTicket(int uno, int tno, int row, int column) {
		// TODO Auto-generated method stub
		td.buyTicket(uno, tno, row, column);
	}


	@Override
	public String getTicketSeatsequence(int tno) {
		// TODO Auto-generated method stub
		return td.selectTicketSeatsequence(tno);
	}


	@Override
	public void changeTicketSeatsequence(int tno, String seatsequence) {
		// TODO Auto-generated method stub
		td.updateTicketSeatsequence(tno, seatsequence);
	}


	@Override
	public void changeRestseat(int tno, int num) {
		// TODO Auto-generated method stub
		td.updateRestseat(tno, num);
	}


	@Override
	public List<Ticket> findAllTicketByUno(int uno) {
		// TODO Auto-generated method stub
		return td.selectAllTicketByUno(uno);
	}


	@Override
	public void refundTicketByBno(int bno) {
		// TODO Auto-generated method stub
		td.deleteTicketByBno(bno);
	}


	@Override
	public List<Ticket> findAllTicket() {
		// TODO Auto-generated method stub
		return td.selectAllTicket();
	}


	@Override
	public List<Integer> getCountGroupByFno() {
		// TODO Auto-generated method stub
		return td.selectCountGroupByFno();
	}


	@Override
	public void changeTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		td.updateTicket(ticket);
	}


	@Override
	public void deleteTicketByTno(int tno) {
		// TODO Auto-generated method stub
		td.deleteTicketByTno(tno);
	}


	@Override
	public List<String> getCnoCnameList() {
		// TODO Auto-generated method stub
		return td.selectCnoCnameList();
	}


	@Override
	public List<String> getFnoFnameList() {
		// TODO Auto-generated method stub
		return td.selectFnoFnameList();
	}


	@Override
	public String getCnoHnoHnameString() {
		// TODO Auto-generated method stub
		return td.selectCnoHnoHnameString();
	}


	@Override
	public void addTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		td.insertTicket(ticket);
	}

}
