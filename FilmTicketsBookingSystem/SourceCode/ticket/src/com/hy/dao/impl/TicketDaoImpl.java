package com.hy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hy.dao.ITicketDao;
import com.hy.po.Ticket;
import com.hy.util.DBHelper;

public class TicketDaoImpl implements ITicketDao {
	
	private DBHelper db;

	public TicketDaoImpl() {
		super();
		db=new DBHelper();
	}

	@Override
	public List<Ticket> selectAllTicketByFnoCno(int fno, int cno) {
		String strSQL="select tno,film.fno,cinema.cno,hall.hno,ticket.time,ticket.restseat,ticke"+
"t.price,film.type,film.language,hall.hname,hall.maxseat  from ticket inner join"+
" film on ticket.fno=film.fno inner join hall on ticket.hno=hall.hno inner join ci"+
"nema on hall.cno=cinema.cno where cinema.cno=? and film.fno=? order by ticket.time";
		List<Ticket> listTicket=new ArrayList<Ticket>();
		Ticket ticket;
		ResultSet rs=db.execQuery(strSQL, new Object[]{cno,fno});
		try {
			while(rs.next()){
				ticket=new Ticket();
				ticket.setTno(rs.getInt("tno"));
				ticket.setFno(rs.getInt("film.fno"));
				ticket.setCno(rs.getInt("cinema.cno"));
				ticket.setHno(rs.getInt("hall.hno"));
				ticket.setTime(rs.getString("ticket.time"));
				ticket.setRestseat(rs.getInt("ticket.restseat"));
				ticket.setPrice(rs.getInt("ticket.price"));
				ticket.setType(rs.getString("film.type"));
				ticket.setLanguage(rs.getString("language"));
				ticket.setHname(rs.getString("hall.hname"));
				ticket.setMaxseat(rs.getInt("hall.maxseat"));
				listTicket.add(ticket);
			}
			return listTicket;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public List<Ticket> selectAllTicketByUno(int uno) {
		// TODO Auto-generated method stub
		String strSQL="select ticket.tno,film.fno,cinema.cno,hall.hno,buy.bno,buy.row,buy.col,buy.row,buy.col,ticket.seatsequence,ticket.time,ticket.price,film.fname,film.poster,film.type,film.language,hall.hname,cinema.cname  from buy inner join ticket on buy.tno=ticket.tno inner join film on ticket.fno=film.fno inner join hall on ticket.hno=hall.hno inner join cinema on hall.cno=cinema.cno where uno=? order by ticket.time";
			List<Ticket> listTicket=new ArrayList<Ticket>();
			Ticket ticket;
			ResultSet rs=db.execQuery(strSQL, new Object[]{uno});
			try {
				while(rs.next()){
					ticket=new Ticket();
					ticket.setTno(rs.getInt("ticket.tno"));
					ticket.setFno(rs.getInt("film.fno"));
					ticket.setCno(rs.getInt("cinema.cno"));
					ticket.setHno(rs.getInt("hall.hno"));
					ticket.setBno(rs.getInt("buy.bno"));
					ticket.setTime(rs.getString("ticket.time"));
					ticket.setPrice(rs.getInt("ticket.price"));
					ticket.setPoster(rs.getString("film.poster"));
					ticket.setType(rs.getString("film.type"));
					ticket.setLanguage(rs.getString("language"));
					ticket.setHname(rs.getString("hall.hname"));
					ticket.setFname(rs.getString("film.fname"));
					ticket.setCname(rs.getString("cinema.cname"));
					ticket.setRow(rs.getInt("buy.row"));
					ticket.setCol(rs.getInt("buy.col"));
					listTicket.add(ticket);
				}
				return listTicket;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				db.closeConn();
			}
			return null;
	}
	
	@Override
	public String selectSeatsequenceByTnoHno(int tno, int hno) {
		String sql="select seatsequence from ticket where tno=?";
		ResultSet rs= db.execQuery(sql, new Object[]{tno});
		String seatsequence;
		try {
			rs.next();
			seatsequence=rs.getString("seatsequence");
			if(seatsequence.length()>10){
				return seatsequence;
			}else{
				sql="select seatsequence from hall where hno=?";
				rs=db.execQuery(sql, new Object[]{hno});
				rs.next();
				seatsequence=rs.getString("seatsequence");
				return seatsequence;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void buyTicket(int uno, int tno, int row, int column) {
		// TODO Auto-generated method stub
		String sql="insert into buy (uno,tno,row,col) values (?,?,?,?)";
		db.execOthers(sql, new Object[]{uno,tno,row,column});
	}

	@Override
	public String selectTicketSeatsequence(int tno) {
		String sql="select seatsequence from ticket where tno=?";
		ResultSet rs=db.execQuery(sql, new Object[]{tno});
		try {
			rs.next();
			String seatsequence=rs.getString("seatsequence");
			if(seatsequence.length()<=1){
				sql="select hall.seatsequence from ticket inner join hall on ticket.hno=hall.hno where tno=?";
				rs=db.execQuery(sql, new Object[]{tno});
				rs.next();
				seatsequence=rs.getString("seatsequence");
			}
				
			rs.close();
			return seatsequence;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void updateTicketSeatsequence(int tno,String seatsequence) {
		String sql="update ticket set seatsequence=? where tno=?";
		db.execOthers(sql, new Object[]{seatsequence,tno});
	}

	@Override
	public void updateRestseat(int tno,int num) {
		String sql="update ticket set restseat=? where tno=?";
		db.execOthers(sql, new Object[]{num,tno});
		
	}

	@Override
	public void deleteTicketByBno(int bno) {
		// TODO Auto-generated method stub
		int row;
		int col;
		String sql="select row,col from buy where bno=?";
		ResultSet rs=db.execQuery(sql, new Object[]{bno});
		try {
			if(rs.next()){
				row=rs.getInt("row");
				col=rs.getInt("col");
				sql="update ticket set restseat=restseat+1 where tno in (select distinct tno from buy where bno=? )";
				db.execOthers(sql, new Object[]{bno});
				sql="select seatsequence from ticket where tno in (select distinct tno from buy where bno=? )";
				rs=db.execQuery(sql, new Object[]{bno});
				if(rs.next()){
					StringBuffer seatsequenceBF=new StringBuffer(rs.getString("seatsequence"));
					int rrow=1;
					int ccol=0;
					for(int i=0;i<seatsequenceBF.length();i++){
						if(rrow==row){
							if(seatsequenceBF.charAt(i)=='1'||seatsequenceBF.charAt(i)=='2')
								ccol++;
							if(ccol==col){
								seatsequenceBF.setCharAt(i, '1');
								ccol++;
							}
						}
						if(seatsequenceBF.charAt(i)==';')
							rrow++;
					}
					String seatsequence=seatsequenceBF.toString();
					sql="update ticket set seatsequence=? where tno in (select distinct tno from buy where bno=?)";
					db.execOthers(sql, new Object[]{seatsequence,bno});
					sql="delete from buy where bno=?";
					db.execOthers(sql, new Object[]{bno});
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
	}

	@Override
	public List<Ticket> selectAllTicket() {
		// TODO Auto-generated method stub
		String strSQL="select ticket.tno,film.fname,cinema.cname,hall.hname,ticket.price,ticket.restseat,ticket.time,film.poster,cinema.logo from ticket inner join hall on ticket.hno=hall.hno inner join cinema on hall.cno=cinema.cno inner join film on ticket.fno=film.fno where film.state=1 order by ticket.fno,hall.cno,ticket.hno";
		List<Ticket> listTicket=new ArrayList<Ticket>();
		Ticket ticket;
		ResultSet rs=db.execQuery(strSQL, new Object[]{});
		try {
			while(rs.next()){
				ticket=new Ticket();
				ticket.setTno(rs.getInt("ticket.tno"));
				ticket.setHname(rs.getString("hall.hname"));
				ticket.setFname(rs.getString("film.fname"));
				ticket.setCname(rs.getString("cinema.cname"));
				ticket.setTime(rs.getString("ticket.time"));
				ticket.setPrice(rs.getInt("ticket.price"));
				ticket.setRestseat(rs.getInt("ticket.restseat"));
				ticket.setPoster(rs.getString("film.poster"));
				ticket.setLogo(rs.getString("cinema.logo"));
				listTicket.add(ticket);
			}
			return listTicket;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
}

	@Override
	public List<Integer> selectCountGroupByFno() {
		// TODO Auto-generated method stub
		String sql="select count(tno) from ticket inner join hall on ticket.hno=hall.hno inner join film on ticket.fno=film.fno where film.state=1 group by ticket.fno order by ticket.fno,hall.cno,ticket.hno";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<Integer> countGroupByFno=new ArrayList<Integer>();
		try {
			while(rs.next()){
				countGroupByFno.add(rs.getInt(1));
			}
			return countGroupByFno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void updateTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		String sql="update ticket set time=?,price=?,restseat=? where tno=?";
		db.execOthers(sql, new Object[]{ticket.getTime(),ticket.getPrice(),ticket.getRestseat(),ticket.getTno()});
	}

	@Override
	public void deleteTicketByTno(int tno) {
		// TODO Auto-generated method stub
		String sql="delete from ticket where tno=?";
		db.execOthers(sql, new Object[]{tno});
	}

	@Override
	public List<String> selectCnoCnameList() {
		// TODO Auto-generated method stub
		String sql="select cno,cname from cinema order by cno";
		ResultSet rs= db.execQuery(sql, new Object[]{});
		List<String > listMsg=new ArrayList<String>();
		try {
			while(rs.next()){
				listMsg.add(rs.getInt(1)+";"+rs.getString(2));
			}
			return listMsg;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<String> selectFnoFnameList() {
		// TODO Auto-generated method stub
		String sql="select fno,fname from film where state=1 order by fno";
		ResultSet rs= db.execQuery(sql, new Object[]{});
		List<String> listMsg=new ArrayList<String>();
		try {
			while(rs.next()){
				listMsg.add(rs.getInt(1)+";"+rs.getString(2));
			}
			return listMsg;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String selectCnoHnoHnameString() {
		// TODO Auto-generated method stub
		String sql="select hall.cno,hno,hname from hall inner join cinema on hall.cno=cinema.cno order by hall.cno,hno";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		String msg="";
		try {
			while(rs.next()){
				msg+=(rs.getInt(1)+","+rs.getInt(2)+","+rs.getString(3)+";");
			}
			return msg.substring(0, msg.length()-1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void insertTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		String sql="insert into ticket (fno,hno,price,time,restseat,seatsequence) values (?,?,?,?,(select maxseat from hall where hno=?),(select seatsequence from hall where hno=?))";
		db.execOthers(sql, new Object[]{ticket.getFno(),ticket.getHno(),ticket.getPrice(),ticket.getTime(),ticket.getHno(),ticket.getHno()});
	}

	
}
