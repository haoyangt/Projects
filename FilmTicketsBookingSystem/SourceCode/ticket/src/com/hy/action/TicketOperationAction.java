package com.hy.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.IFilmBiz;
import com.hy.biz.ITicketBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.biz.impl.TicketBizImpl;
import com.hy.po.Cinema;
import com.hy.po.Film;
import com.hy.po.Ticket;
import com.hy.po.User;
import com.hy.vo.PageBean;
import com.opensymphony.xwork2.ActionContext;

public class TicketOperationAction {
	private int fno;
	private int cno;
	private int tno;
	private int hno;
	private int uno;
	private int bno;
	private int currentPage;
	private String movieq;
	private String simpleloc;
	private String jspComeFrom;
	private String seats[];
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String[] getSeats() {
		return seats;
	}

	public void setSeats(String[] seats) {
		this.seats = seats;
	}

	public String getJspComeFrom() {
		return jspComeFrom;
	}

	public void setJspComeFrom(String jspComeFrom) {
		this.jspComeFrom = jspComeFrom;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getMovieq() {
		return movieq;
	}

	public void setMovieq(String movieq) {
		this.movieq = movieq;
	}

	public String getSimpleloc() {
		return simpleloc;
	}

	public void setSimpleloc(String simpleloc) {
		this.simpleloc = simpleloc;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String displayTicketInCinemaDetail(){
		//电影票列表显示
		Map<String, Object> session=ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest ();
		if(session.containsKey("user")){
			ITicketBiz tb=new TicketBizImpl();
	    	List<Ticket>listTicket= tb.findAllTicketByFnoCno(fno, cno);
	    	request.setAttribute("listTicket", listTicket);
		}else{
			request.setAttribute("message", "<script>alert('请先登录!');</script>");
		}
    	
    	getCinemaDetail();
    	
		return "OK";
	}
	
	public String displayTicketInFilmDetail(){
		//电影票列表显示
		Map<String, Object> session=ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest ();
		if(session.containsKey("user")){
			ITicketBiz tb=new TicketBizImpl();
	    	List<Ticket>listTicket= tb.findAllTicketByFnoCno(fno, cno);
	    	request.setAttribute("listTicket", listTicket);
		}else{
			request.setAttribute("message", "<script>alert('请先登录!');</script>");
		}
    	
    	getFilmDetail();
    	
		return "OK";
	}
	
	public String getSeatsequence(){
		ITicketBiz tb=new TicketBizImpl();
		String seatsequence=tb.findSeatsequence(tno, hno);
		HttpServletRequest request = ServletActionContext.getRequest ();
    	request.setAttribute("seatsequence", seatsequence);
    	request.setAttribute("tno", tno);
    	if(jspComeFrom.equals("cinema_detail"))
    		getCinemaDetail();
    	else
    		getFilmDetail();
		
		return jspComeFrom;
	}
	
	public String buyTicket(){
		Map<String, Object> session=ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest ();
		int uno=((User)session.get("user")).getUno();
		if(uno>0){
			ITicketBiz tb=new TicketBizImpl();
			StringBuffer seatsequenceBF=new StringBuffer(tb.getTicketSeatsequence(tno));
			for(String seat:seats){
				String []rowandcolumn= seat.split("_");
				int row=Integer.parseInt(rowandcolumn[0]);
				int column=Integer.parseInt(rowandcolumn[1]);
				tb.buyTicket(uno, tno, row, column);
				int rrow=1;
				int ccolumn=0;
				for(int i=0;i<seatsequenceBF.length();i++){
					if(rrow==row){
						if(seatsequenceBF.charAt(i)=='1'||seatsequenceBF.charAt(i)=='2')
							ccolumn++;
						if(ccolumn==column){
							seatsequenceBF.setCharAt(i, '2');
							break;
						}
					}
					if(seatsequenceBF.charAt(i)==';')
						rrow++;
				}
				String seatsequence=seatsequenceBF.toString();
				int countSeat=0;
				for(int i=0;i<seatsequence.length();i++){
					if(seatsequence.charAt(i)=='1')
						countSeat++;
				}
				tb.changeRestseat(tno, countSeat);
				tb=new TicketBizImpl();
				tb.changeTicketSeatsequence(tno, seatsequence);
			}
			request.setAttribute("message", "<script>alert('订票成功!');</script>");
		}else{
			request.setAttribute("message", "<script>alert('请先登录!');</script>");
		}
		request.setAttribute("closeseat", "closeseat");
		
		
		if(jspComeFrom.equals("cinema_detail"))
    		getCinemaDetail();
    	else
    		getFilmDetail();
		
		return jspComeFrom;
	}
	
	public String displayAllBoughtTicket(){
		Map<String, Object> session=ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest ();
		if(session.containsKey("user")){
			ITicketBiz tb=new TicketBizImpl();
	    	List<Ticket>listTicket= tb.findAllTicketByUno(uno);
	    	request.setAttribute("listTicket", listTicket);
		}else{
			request.setAttribute("message", "<script>alert('请先登录!');</script>");
		}
    	
		return "OK";
	}
	
	public String refundTicket(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ITicketBiz tb=new TicketBizImpl();
		tb.refundTicketByBno(bno);
		List<Ticket>listTicket= tb.findAllTicketByUno(uno);
    	request.setAttribute("listTicket", listTicket);
    	request.setAttribute("message", "<script>alert('退票成功!');</script>");
		return "OK";
	}
	
	//以下为重新获取详细电影和电影院数据
	private void getFilmDetail(){
		HttpServletRequest request = ServletActionContext.getRequest ();
    	//根据cno获取电影院名字
		ICinemaBiz cb=new CinemaBizImpl();
		if(cno>0){
			Cinema cinema=cb.findCinemaByCno(cno);
			request.setAttribute("cname", cinema.getCname());
		}
    	
    	//电影详情
		IFilmBiz fb=new FilmBizImpl();
		Film film=fb.findFilmByFno(fno);
		request.setAttribute("film", film);
		
		//热映电影
		fb=new FilmBizImpl();
		PageBean listFilm=fb.findAllReleasedFilm(1, 5);
		request.setAttribute("lstFilm", listFilm);
		
		//电影院列表
		int pageSize=5;				//设置每页显示的电影数目
		if(currentPage<=0)
			currentPage=1;
		cb=new CinemaBizImpl();
		PageBean listCinema=null;
		if(movieq==null){
			if(simpleloc==null){
				listCinema=cb.findAllCinemaByFno(currentPage, pageSize, fno);
				request.setAttribute("simpleloc", "all");
			}else{
				listCinema=cb.findAllCinemaByFnoBySimpleloc(currentPage, pageSize, fno, simpleloc);
				request.setAttribute("simpleloc", simpleloc);
			}
		}else{
			listCinema=cb.findAllCinemaByFnoByCname(currentPage, pageSize, fno, movieq);
		}
		request.setAttribute("listCinema", listCinema);
		
		displayAllCinemaCount();
	}
	private void getCinemaDetail(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		//根据fno获取电影院名字
		IFilmBiz fb=new FilmBizImpl();
		if(fno>0){
			Film film=fb.findFilmByFno(fno);
			request.setAttribute("fname", film.getFname());
		}
		
    	//电影院详情
		ICinemaBiz cb=new CinemaBizImpl();
		Cinema cinema=cb.findCinemaByCno(cno);
		request.setAttribute("cinema", cinema);
		
		//电影院的上映电影列表
		fb=new FilmBizImpl();
		int pageSize=5;				//设置每页显示的电影数目
		if(currentPage<=0)
			currentPage=1;
		PageBean listFilm=fb.findReleasedFilmByCno(currentPage, pageSize, cno);
		request.setAttribute("listFilm", listFilm);
	}
	
	
	//获取地区分类的电影院数目
	private void displayAllCinemaCount(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		ICinemaBiz cb;
		cb=new CinemaBizImpl();
		request.setAttribute("all", cb.findCinemaCountByFno(fno));
		cb=new CinemaBizImpl();
		request.setAttribute("heping", cb.findCinemaCountByFno(fno,"heping"));
		cb=new CinemaBizImpl();
		request.setAttribute("nankai", cb.findCinemaCountByFno(fno,"nankai"));
		cb=new CinemaBizImpl();
		request.setAttribute("hexi", cb.findCinemaCountByFno(fno,"hexi"));
		cb=new CinemaBizImpl();
		request.setAttribute("binhai", cb.findCinemaCountByFno(fno,"binhai"));
		cb=new CinemaBizImpl();
		request.setAttribute("beichen", cb.findCinemaCountByFno(fno,"beichen"));
		cb=new CinemaBizImpl();
		request.setAttribute("hongqiao", cb.findCinemaCountByFno(fno,"hongqiao"));
		cb=new CinemaBizImpl();
		request.setAttribute("hedong", cb.findCinemaCountByFno(fno,"hedong"));
		cb=new CinemaBizImpl();
		request.setAttribute("jinghai", cb.findCinemaCountByFno(fno,"jinghai"));
		cb=new CinemaBizImpl();
		request.setAttribute("baodi", cb.findCinemaCountByFno(fno,"baodi"));
	}
}
