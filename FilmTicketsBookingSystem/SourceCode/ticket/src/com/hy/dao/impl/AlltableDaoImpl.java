package com.hy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hy.dao.IAlltableDao;
import com.hy.util.DBHelper;

public class AlltableDaoImpl implements IAlltableDao {
	private DBHelper db;
	public AlltableDaoImpl() {
		super();
		db=new DBHelper();
	}

	@Override
	public List<String> displayAllTableName() {
		// TODO Auto-generated method stub
		String sql="show tables";
		List<String> listTablename=new ArrayList<String>();
		String tablename=null;
		ResultSet rs=db.execQuery(sql, new Object[]{});
		try {
			while(rs.next()){
				tablename=rs.getString(1);
				listTablename.add(tablename);
			}
			return listTablename;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public List<Object> selectAllData(String table) {
		// TODO Auto-generated method stub
		List<Object> allData=new ArrayList<Object>();
		int maxj=0;
		if(table.equals("buy"))maxj=5;
    	if(table.equals("cinema"))maxj=14;
    	if(table.equals("film"))maxj=17;
    	if(table.equals("hall"))maxj=6;
    	if(table.equals("percontent"))maxj=4;
    	if(table.equals("permission"))maxj=2;
    	if(table.equals("slideimg"))maxj=7;
    	if(table.equals("ticket"))maxj=7;
    	if(table.equals("user"))maxj=4;
    	
    	String sql="desc "+table;
    	ResultSet rs2=db.execQuery(sql, new Object[]{});
    	try {
			while(rs2.next()){
				allData.add(rs2.getObject(1));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			db.closeConn();
		}
    	
    	sql="select * from "+table;
		ResultSet rs=db.execQuery(sql, new Object[]{});
		try {
			while(rs.next()){
				for(int j=1;j<=maxj;j++){
					allData.add(rs.getObject(j));
				}
			}
			return allData;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void updateAllData(String info) {
		// TODO Auto-generated method stub
		String[] infos=info.split("thisisseperator");
		if(infos[0].equals("buy")){
			String sql="update buy set uno=?,tno=?,row=?,col=? where bno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[5],infos[1]});
		}
		if(infos[0].equals("cinema")){
			String sql="update cinema set cname=?,logo=?,grade=?,openinghours=?,location=?,simpleloc=?,tel=?,route=?,introduction=?,image=?,remark=?,latitude=?,longitude=? where cno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[5],infos[6],infos[7],infos[8],infos[9],infos[10],infos[11],infos[12],infos[13],infos[14],infos[1]});
		}
		if(infos[0].equals("film")){
			String sql="update film set fname=?,poster=?,grade=?,rdate=?,director=?,language=?,location=?,runtime=?,type=?,version=?,protagonist=?,remark=?,plot=?,still=?,prevue=?,state=? where fno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[5],infos[6],infos[7],infos[8],infos[9],infos[10],infos[11],infos[12],infos[13],infos[14],infos[15],infos[16],infos[17],infos[1]});
		}
		if(infos[0].equals("hall")){
			String sql="update hall set cno=?,hname=?,maxseat=?,seatsequence=?,remark=? where hno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[5],infos[6],infos[1]});
		}
		if(infos[0].equals("percontent")){
			String sql="update percontent set pm_pno=?,pname=?,purl=? where pno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[1]});
		}
		if(infos[0].equals("permission")){
			String sql="update permission set pname=? where pno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[1]});
		}
		if(infos[0].equals("slideimg")){
			String sql="update slideimg set sname=?,href=?,score1=?,score2=?,title=?,img=? where sno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[5],infos[6],infos[7],infos[1]});
		}
		if(infos[0].equals("ticket")){
			String sql="update ticket set fno=?,hno=?,price=?,restseat=?,seatsequence=?,time=? where tno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[5],infos[6],infos[7],infos[1]});
		}
		if(infos[0].equals("user")){
			String sql="update user set username=?,password=?,status=? where uno=?";
			db.execOthers(sql, new Object[]{infos[2],infos[3],infos[4],infos[1]});
		}
	}

}
