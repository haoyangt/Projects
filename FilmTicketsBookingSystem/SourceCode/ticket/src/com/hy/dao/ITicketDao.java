package com.hy.dao;

import java.util.List;

import com.hy.po.Ticket;

public interface ITicketDao {
	public abstract List<Ticket> selectAllTicketByFnoCno(int fno,int cno);
	public abstract List<Ticket> selectAllTicketByUno(int uno);
	public abstract List<Ticket> selectAllTicket();
	public abstract List<Integer> selectCountGroupByFno();
	public abstract String selectSeatsequenceByTnoHno(int tno,int hno);
	public abstract void buyTicket(int uno,int tno,int row,int column);
	public abstract String selectTicketSeatsequence(int tno);
	public abstract void updateTicketSeatsequence(int tno,String seatsequence);
	public abstract void updateRestseat(int tno,int num);
	public abstract void updateTicket(Ticket ticket);
	public abstract void deleteTicketByBno(int bno);
	public abstract void deleteTicketByTno(int tno);
	public abstract List<String> selectCnoCnameList();
	public abstract List<String> selectFnoFnameList();
	public abstract String selectCnoHnoHnameString();
	public abstract void insertTicket(Ticket ticket);
}
