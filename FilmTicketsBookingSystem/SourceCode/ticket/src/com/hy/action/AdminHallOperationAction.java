package com.hy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.IHallBiz;
import com.hy.biz.impl.HallBizImpl;
import com.hy.po.Hall;

public class AdminHallOperationAction {
	private int hno;
	private int cno;
	private String hname;
	private String cname;
	private int maxseat;
	private String seatsequence;
	private String remark;
	private String seats[];
	public String[] getSeats() {
		return seats;
	}

	public void setSeats(String[] seats) {
		this.seats = seats;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getMaxseat() {
		return maxseat;
	}

	public void setMaxseat(int maxseat) {
		this.maxseat = maxseat;
	}

	public String getSeatsequence() {
		return seatsequence;
	}

	public void setSeatsequence(String seatsequence) {
		this.seatsequence = seatsequence;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String displayAllHall(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IHallBiz hb=new HallBizImpl();
		List<Hall> allHall=hb.findAllHall();
		hb=new HallBizImpl();
		List<Integer> countGroupByCno=hb.getCountGroupByCno();
		hb=new HallBizImpl();
		List<String> listCnoCname=hb.getCnoCnameList();
		request.setAttribute("allHall", allHall);
		request.setAttribute("countGroupByCno", countGroupByCno);
		request.setAttribute("listCnoCname", listCnoCname);
		if(hno>0)
			request.setAttribute("hno", hno);
		return "OK";
	}
	
	public String updateHall(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IHallBiz hb=new HallBizImpl();
		Hall hall=new Hall();
		hall.setHno(hno);
		hall.setHname(hname);
		hall.setRemark(remark);
		hb.changeHall(hall);
		
		//重新读取数据
		List<Hall> allHall=hb.findAllHall();
		hb=new HallBizImpl();
		List<Integer> countGroupByCno=hb.getCountGroupByCno();
		hb=new HallBizImpl();
		List<String> listCnoCname=hb.getCnoCnameList();
		request.setAttribute("allHall", allHall);
		request.setAttribute("countGroupByCno", countGroupByCno);
		request.setAttribute("listCnoCname", listCnoCname);
		if(hno>0)
			request.setAttribute("hno", 0);
		return "OK";
	}
	
	public String deleteHall(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IHallBiz hb=new HallBizImpl();
		hb.deleteHall(hno);
		
		//重新读取数据
		List<Hall> allHall=hb.findAllHall();
		hb=new HallBizImpl();
		List<Integer> countGroupByCno=hb.getCountGroupByCno();
		hb=new HallBizImpl();
		List<String> listCnoCname=hb.getCnoCnameList();
		request.setAttribute("allHall", allHall);
		request.setAttribute("countGroupByCno", countGroupByCno);
		request.setAttribute("listCnoCname", listCnoCname);
		if(hno>0)
			request.setAttribute("hno", 0);
		return "OK";
	}
	
	public String addHall(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IHallBiz hb=new HallBizImpl();
		Hall hall=new Hall();
		hall.setCno(cno);
		hall.setHname(hname);
		hall.setRemark(remark);
		hall.setSeatsequence("000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000;000001111111111111111111100000");
		hb.addHall(hall);

		//重新读取数据
		List<Hall> allHall=hb.findAllHall();
		hb=new HallBizImpl();
		List<Integer> countGroupByCno=hb.getCountGroupByCno();
		hb=new HallBizImpl();
		List<String> listCnoCname=hb.getCnoCnameList();
		request.setAttribute("allHall", allHall);
		request.setAttribute("countGroupByCno", countGroupByCno);
		request.setAttribute("listCnoCname", listCnoCname);
		if(hno>0)
			request.setAttribute("hno", 0);
		return "OK";
	}
	
	public String displaySeatselection(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IHallBiz hb=new HallBizImpl();
		String seatsequence=hb.getSeatsequence(hno);
		request.setAttribute("seatsequence", seatsequence);
		
		//重新读取数据
		hb=new HallBizImpl();
		List<Hall> allHall=hb.findAllHall();
		hb=new HallBizImpl();
		List<Integer> countGroupByCno=hb.getCountGroupByCno();
		hb=new HallBizImpl();
		List<String> listCnoCname=hb.getCnoCnameList();
		request.setAttribute("allHall", allHall);
		request.setAttribute("countGroupByCno", countGroupByCno);
		request.setAttribute("listCnoCname", listCnoCname);
		request.setAttribute("hno", hno);
		return "OK";
	}
	
	public String updateSeatsequence(){
		StringBuffer seatsequenceBF=new StringBuffer("000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000;000000000000000000000000000000");
		for(String seat:seats){
			String []rowandcolumn= seat.split("_");
			int row=Integer.parseInt(rowandcolumn[0]);
			int column=Integer.parseInt(rowandcolumn[1]);
			int rrow=1;
			int ccolumn=0;
			for(int i=0;i<seatsequenceBF.length();i++){
				if(rrow==row){
					ccolumn++;
					if(ccolumn==column){
						seatsequenceBF.setCharAt(i, '1');
						break;
					}
				}
				if(seatsequenceBF.charAt(i)==';')
					rrow++;
			}
		}
		//获取座位序列
		String seatsequence=seatsequenceBF.toString();
		//获取最大座位数
		int countSeat=0;
		for(int i=0;i<seatsequence.length();i++){
			if(seatsequence.charAt(i)=='1')
				countSeat++;
		}
		IHallBiz hb=new HallBizImpl();
		hb.changeSeat(hno, countSeat, seatsequence);
		
		//重新读取数据
		HttpServletRequest request = ServletActionContext.getRequest ();
		List<Hall> allHall=hb.findAllHall();
		hb=new HallBizImpl();
		List<Integer> countGroupByCno=hb.getCountGroupByCno();
		hb=new HallBizImpl();
		List<String> listCnoCname=hb.getCnoCnameList();
		request.setAttribute("allHall", allHall);
		request.setAttribute("countGroupByCno", countGroupByCno);
		request.setAttribute("listCnoCname", listCnoCname);
		if(hno>0)
			request.setAttribute("hno", 0);
		return "OK";
	}
}
