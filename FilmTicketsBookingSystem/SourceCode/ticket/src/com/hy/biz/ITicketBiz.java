package com.hy.biz;

import java.util.List;

import com.hy.po.Ticket;

public interface ITicketBiz {
	public abstract List<Ticket> findAllTicketByFnoCno(int fno,int cno);
	public abstract List<Ticket> findAllTicketByUno(int uno);
	public abstract List<Ticket> findAllTicket();
	public abstract List<Integer> getCountGroupByFno();
	public abstract String findSeatsequence(int tno,int hno);
	public abstract void buyTicket(int uno,int tno,int row,int column);
	public abstract String getTicketSeatsequence(int tno);
	public abstract void changeTicketSeatsequence(int tno,String seatsequence);
	public abstract void changeRestseat(int tno,int num);
	public abstract void changeTicket(Ticket ticket);
	public abstract void refundTicketByBno(int bno);
	public abstract void deleteTicketByTno(int tno);
	public abstract List<String> getCnoCnameList();
	public abstract List<String> getFnoFnameList();
	public abstract String getCnoHnoHnameString();
	public abstract void addTicket(Ticket ticket);
}
