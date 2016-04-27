package com.hy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ITicketBiz;
import com.hy.biz.impl.TicketBizImpl;
import com.hy.po.Ticket;
import com.opensymphony.xwork2.ModelDriven;

public class AdminTicketOperationAction implements ModelDriven<Ticket> {
	private Ticket ticket=new Ticket();
	
	public String displayAllTicket(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ITicketBiz tb=new TicketBizImpl();
		List<Ticket> allTicket=tb.findAllTicket();
		List<Integer> countGroupByFno=tb.getCountGroupByFno();
		List<String> listCnoCname=tb.getCnoCnameList();
		List<String> listFnoFname=tb.getFnoFnameList();
		String cnoHnoHnameStr=tb.getCnoHnoHnameString();
		if(ticket.getTno()>0)
			request.setAttribute("tno", ticket.getTno());
		request.setAttribute("allTicket", allTicket);
		request.setAttribute("countGroupByFno", countGroupByFno);
		request.setAttribute("listCnoCname", listCnoCname);
		request.setAttribute("listFnoFname", listFnoFname);
		request.setAttribute("cnoHnoHnameStr", cnoHnoHnameStr);
		
		return "OK";
	}
	
	public String updateTicket(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ITicketBiz tb=new TicketBizImpl();
		tb.changeTicket(ticket);
		
		//重新读取数据
		List<Ticket> allTicket=tb.findAllTicket();
		List<Integer> countGroupByFno=tb.getCountGroupByFno();
		List<String> listCnoCname=tb.getCnoCnameList();
		List<String> listFnoFname=tb.getFnoFnameList();
		String cnoHnoHnameStr=tb.getCnoHnoHnameString();
		request.setAttribute("listCnoCname", listCnoCname);
		request.setAttribute("listFnoFname", listFnoFname);
		request.setAttribute("cnoHnoHnameStr", cnoHnoHnameStr);
		request.setAttribute("tno", 0);
		request.setAttribute("allTicket", allTicket);
		request.setAttribute("countGroupByFno", countGroupByFno);
		return "OK";
	}
	
	public String deleteTicket(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ITicketBiz tb=new TicketBizImpl();
		tb.deleteTicketByTno(ticket.getTno());
		
		//重新读取数据
		List<Ticket> allTicket=tb.findAllTicket();
		List<Integer> countGroupByFno=tb.getCountGroupByFno();
		List<String> listCnoCname=tb.getCnoCnameList();
		List<String> listFnoFname=tb.getFnoFnameList();
		String cnoHnoHnameStr=tb.getCnoHnoHnameString();
		request.setAttribute("listCnoCname", listCnoCname);
		request.setAttribute("listFnoFname", listFnoFname);
		request.setAttribute("cnoHnoHnameStr", cnoHnoHnameStr);
		request.setAttribute("tno", 0);
		request.setAttribute("allTicket", allTicket);
		request.setAttribute("countGroupByFno", countGroupByFno);
		return "OK";
	}
	
	public String addTicket(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ITicketBiz tb=new TicketBizImpl();
		tb.addTicket(ticket);
		
		//重新读取数据
		List<Ticket> allTicket=tb.findAllTicket();
		List<Integer> countGroupByFno=tb.getCountGroupByFno();
		List<String> listCnoCname=tb.getCnoCnameList();
		List<String> listFnoFname=tb.getFnoFnameList();
		String cnoHnoHnameStr=tb.getCnoHnoHnameString();
		request.setAttribute("listCnoCname", listCnoCname);
		request.setAttribute("listFnoFname", listFnoFname);
		request.setAttribute("cnoHnoHnameStr", cnoHnoHnameStr);
		request.setAttribute("tno", 0);
		request.setAttribute("allTicket", allTicket);
		request.setAttribute("countGroupByFno", countGroupByFno);
		return "OK";
	}
	
	@Override
	public Ticket getModel() {
		// TODO Auto-generated method stub
		return this.ticket;
	}
}
