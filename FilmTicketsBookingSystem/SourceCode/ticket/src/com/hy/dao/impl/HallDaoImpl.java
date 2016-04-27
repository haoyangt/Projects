package com.hy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hy.dao.IHallDao;
import com.hy.po.Hall;
import com.hy.util.DBHelper;

public class HallDaoImpl implements IHallDao {
	private DBHelper db;
	public HallDaoImpl() {
		super();
		db=new DBHelper();
	}

	@Override
	public List<Hall> selectAllHall() {
		String sql="select hno,hall.cno,hname,cname,logo,maxseat,seatsequence,hall.remark from hall inner join cinema on hall.cno=cinema.cno order by hall.cno,hall.hno";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<Hall> listhall=new ArrayList<Hall>();
		Hall hall;
		try {
			while(rs.next()){
				hall=new Hall();
				hall.setHno(rs.getInt("hno"));
				hall.setCno(rs.getInt("hall.cno"));
				hall.setHname(rs.getString("hname"));
				hall.setCname(rs.getString("cname"));
				hall.setLogo(rs.getString("logo"));
				hall.setMaxseat(rs.getInt("maxseat"));
				hall.setSeatsequence(rs.getString("seatsequence"));
				hall.setRemark(rs.getString("hall.remark"));
				listhall.add(hall);
			}
			return listhall;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public List<Integer> selectCountGroupByCno() {
		String sql="select cno,count(*) from hall group by cno order by cno,hno";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<Integer> countGroupByCno=new ArrayList<Integer>();
		try {
			while(rs.next()){
				countGroupByCno.add(rs.getInt(2));
			}
			return countGroupByCno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void updateHall(Hall hall) {
		// TODO Auto-generated method stub
		String sql="update hall set hname=?,remark=? where hno=?";
		db.execOthers(sql, new Object[]{hall.getHname(),hall.getRemark(),hall.getHno()});
	}

	@Override
	public void deleteHall(int hno) {
		// TODO Auto-generated method stub
		String sql="delete from hall where hno=?";
		db.execOthers(sql, new Object[]{hno});
	}

	@Override
	public List<String> selectCnoCnameList() {
		// TODO Auto-generated method stub
		String sql="select cno,cname from cinema ";
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
	public void insertHall(Hall hall) {
		// TODO Auto-generated method stub
		String sql="insert into hall (cno,hname,remark,seatsequence) values (?,?,?,?)";
		db.execOthers(sql, new Object[]{hall.getCno(),hall.getHname(),hall.getRemark(),hall.getSeatsequence()});
	}

	@Override
	public String selectSeatsequence(int hno) {
		// TODO Auto-generated method stub
		String sql="select seatsequence from hall where hno=?";
		ResultSet rs=db.execQuery(sql, new Object[]{hno});
		try {
			if(rs.next()){
				return rs.getString(1);
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
	public void updateSeatsequence(int hno, String seatsequence) {
		// TODO Auto-generated method stub
		String sql="update hall set seatsequence=? where hno=?";
		db.execOthers(sql, new Object[]{seatsequence,hno});
	}

	@Override
	public void updateMaxseat(int hno, int maxseat) {
		// TODO Auto-generated method stub
		String sql="update hall set maxseat=? where hno=?";
		db.execOthers(sql, new Object[]{maxseat,hno});
		
	}
	

}
