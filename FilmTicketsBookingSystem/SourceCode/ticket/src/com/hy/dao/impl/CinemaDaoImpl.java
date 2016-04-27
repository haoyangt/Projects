package com.hy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hy.dao.ICinemaDao;
import com.hy.po.Cinema;
import com.hy.util.DBHelper;
import com.hy.vo.PageBean;

public class CinemaDaoImpl implements ICinemaDao {

	DBHelper db;
	public CinemaDaoImpl() {
		super();
		db=new DBHelper();
	}

	@Override
	public PageBean selectAllCinema(int currentPage, int pageSize) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from cinema order by grade desc limit  ?,?";
		Object[] params = new Object[]{start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Cinema> allCinema = new ArrayList<Cinema>();
		try {
			Cinema cinema;
			while(rs.next()){
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				allCinema.add(cinema);
			}
			pageBean.setData(allCinema);
			
			strSQL = "select count(*) from cinema";
			params = new Object[]{};
			rs = this.db.execQuery(strSQL, params);
			rs.next();
			pageBean.setTotalRows(rs.getInt(1));
			pageBean.setCurrentPage(currentPage);
			pageBean.setPageSize(pageSize);
			
			rs.close();
			
			return pageBean;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				this.db.closeConn();
			}
	}
	
	@Override
	public PageBean selectAllCinemaBySimpleloc(int currentPage, int pageSize,
			String simpleloc) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from cinema where simpleloc=? order by grade desc limit  ?,?";
		Object[] params = new Object[]{simpleloc,start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Cinema> allCinema = new ArrayList<Cinema>();
		try {
			Cinema cinema;
			while(rs.next()){
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				allCinema.add(cinema);
			}
			pageBean.setData(allCinema);
			
			strSQL = "select count(*) from cinema where simpleloc=?";
			params = new Object[]{simpleloc};
			rs = this.db.execQuery(strSQL, params);
			rs.next();
			pageBean.setTotalRows(rs.getInt(1));
			pageBean.setCurrentPage(currentPage);
			pageBean.setPageSize(pageSize);
			
			rs.close();
			
			return pageBean;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				this.db.closeConn();
			}
	}
	
	@Override
	public PageBean selectAllCinemaByName(int currentPage, int pageSize,
			String name) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from cinema where cname like '%"+name+"%' order by grade desc limit  ?,?";
		Object[] params = new Object[]{start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Cinema> allCinema = new ArrayList<Cinema>();
		try {
			Cinema cinema;
			while(rs.next()){
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				allCinema.add(cinema);
			}
			pageBean.setData(allCinema);
			
			strSQL = "select count(*) from cinema where cname like '%"+name+"%'";
			params = new Object[]{};
			rs = this.db.execQuery(strSQL, params);
			rs.next();
			pageBean.setTotalRows(rs.getInt(1));
			pageBean.setCurrentPage(currentPage);
			pageBean.setPageSize(pageSize);
			
			rs.close();
			
			return pageBean;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				this.db.closeConn();
			}
	}

	@Override
	public int selectCinemaCount() {
			String strSQL = "select count(*) from cinema";
			ResultSet rs = this.db.execQuery(strSQL,new Object[]{});
			try{
				rs.next();
				int count=rs.getInt(1);
				rs.close();
				return count;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return -1;
			} finally {
				this.db.closeConn();
			}
	}

	@Override
	public int selectCinemaCount(String simpleloc) {
		String strSQL = "select count(*) from cinema where simpleloc=?";
		ResultSet rs = this.db.execQuery(strSQL,new Object[]{simpleloc});
		try{
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			this.db.closeConn();
		}
	}

	@Override
	public PageBean selectAllCinemaByFno(int currentPage, int pageSize, int fno) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) order by grade desc limit  ?,?";
		Object[] params = new Object[]{fno,start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Cinema> allCinema = new ArrayList<Cinema>();
		try {
			Cinema cinema;
			while(rs.next()){
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				allCinema.add(cinema);
			}
			pageBean.setData(allCinema);
			
			strSQL = "select count(*) from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?))";
			params = new Object[]{fno};
			rs = this.db.execQuery(strSQL, params);
			rs.next();
			pageBean.setTotalRows(rs.getInt(1));
			pageBean.setCurrentPage(currentPage);
			pageBean.setPageSize(pageSize);
			
			rs.close();
			
			return pageBean;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				this.db.closeConn();
			}
	}

	@Override
	public PageBean selectAllCinemaByFnoBySimpleloc(int currentPage,
			int pageSize, int fno, String simpleloc) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) and simpleloc = ? order by grade desc limit  ?,?";
		Object[] params = new Object[]{fno,simpleloc,start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Cinema> allCinema = new ArrayList<Cinema>();
		try {
			Cinema cinema;
			while(rs.next()){
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				allCinema.add(cinema);
			}
			pageBean.setData(allCinema);
			
			strSQL = "select count(*) from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) and simpleloc = ?";
			params = new Object[]{fno,simpleloc};
			rs = this.db.execQuery(strSQL, params);
			rs.next();
			pageBean.setTotalRows(rs.getInt(1));
			pageBean.setCurrentPage(currentPage);
			pageBean.setPageSize(pageSize);
			
			rs.close();
			
			return pageBean;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				this.db.closeConn();
			}
	}

	@Override
	public PageBean selectAllCinemaByFnoByCname(int currentPage, int pageSize,
			int fno, String cname) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) and cname like '%"+cname+"%' order by grade desc limit  ?,?";
		Object[] params = new Object[]{fno,start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Cinema> allCinema = new ArrayList<Cinema>();
		try {
			Cinema cinema;
			while(rs.next()){
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				allCinema.add(cinema);
			}
			pageBean.setData(allCinema);
			
			strSQL = "select count(*) from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) and cname like '%"+cname+"%' ";
			params = new Object[]{fno};
			rs = this.db.execQuery(strSQL, params);
			rs.next();
			pageBean.setTotalRows(rs.getInt(1));
			pageBean.setCurrentPage(currentPage);
			pageBean.setPageSize(pageSize);
			
			rs.close();
			
			return pageBean;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				this.db.closeConn();
			}
	}

	@Override
	public int selectCinemaCountByFno(int fno) {
		String strSQL = "select count(*) from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) ";
		ResultSet rs = this.db.execQuery(strSQL,new Object[]{fno});
		try{
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			this.db.closeConn();
		}
	}

	@Override
	public int selectCinemaCountByFno(int fno, String simpleloc) {
		String strSQL = "select count(*) from cinema where cno in (select distinct cno from hall where hno in (select distinct hno  from ticket where fno=?)) and simpleloc=?";
		ResultSet rs = this.db.execQuery(strSQL,new Object[]{fno,simpleloc});
		try{
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			this.db.closeConn();
		}
	}

	@Override
	public Cinema selectCinemaByCno(int cno) {
		String strSQL = "select * from cinema where cno=?";
		Object[] params = new Object[]{cno};
		ResultSet rs = this.db.execQuery(strSQL, params);
			Cinema cinema;
			try {
				rs.next();
				cinema=new Cinema();
				cinema.setCno(rs.getInt("cno"));
				cinema.setCname(rs.getString("cname"));
				cinema.setLogo(rs.getString("logo"));
				cinema.setGrade(rs.getDouble("grade"));
				cinema.setOpeninghours(rs.getString("openinghours"));
				cinema.setLocation(rs.getString("location"));
				cinema.setSimpleloc(rs.getString("simpleloc"));
				cinema.setTel(rs.getString("tel"));
				cinema.setRoute(rs.getString("route"));
				cinema.setIntroduction(rs.getString("introduction"));
				cinema.setImage(rs.getString("image"));
				cinema.setRemark(rs.getString("remark"));
				cinema.setLatitude(rs.getDouble("latitude"));
				cinema.setLongitude(rs.getDouble("longitude"));
				return cinema;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				this.db.closeConn();
			}
		return null;
	}

	@Override
	public void updateCinema(Cinema cinema) {
		// TODO Auto-generated method stub
		String sql="update cinema set cname=?,grade=?,openinghours=?,location=?,simpleloc=?,tel=?,route=?,introduction=?,remark=?,latitude=?,longitude=? where cno=?";
		db.execOthers(sql, new Object[]{cinema.getCname(),cinema.getGrade(),cinema.getOpeninghours(),cinema.getLocation(),cinema.getSimpleloc(),cinema.getTel(),cinema.getRoute(),cinema.getIntroduction(),cinema.getRemark(),cinema.getLatitude(),cinema.getLongitude(),cinema.getCno()});
	}

	@Override
	public void deleteCinema(int cno) {
		// TODO Auto-generated method stub
		String sql="delete from cinema where cno=?";
		db.execOthers(sql, new Object[]{cno});
	}

	@Override
	public void insertCinema(Cinema cinema) {
		// TODO Auto-generated method stub
		String sql="insert into cinema (cname,grade,openinghours,location,simpleloc,tel,route,introduction,remark,latitude,longitude) values (?,?,?,?,?,?,?,?,?,?,?)";
		db.execOthers(sql, new Object[]{cinema.getCname(),cinema.getGrade(),cinema.getOpeninghours(),cinema.getLocation(),cinema.getSimpleloc(),cinema.getTel(),cinema.getRoute(),cinema.getIntroduction(),cinema.getRemark(),cinema.getLatitude(),cinema.getLongitude()});
	}

	@Override
	public void updateLogo(int cno, String logo) {
		// TODO Auto-generated method stub
		String sql="update cinema set logo=? where cno=?";
		db.execOthers(sql, new Object[]{logo,cno});
	}

	@Override
	public void updateImage(int cno, String oldimage, String image) {
		// TODO Auto-generated method stub
		String sql="select image from cinema where cno=?";
		ResultSet rs=db.execQuery(sql, new Object[]{cno});
		String updateimage="";
		try {
			if(rs.next()){
				String originimage=rs.getString(1);
				updateimage=originimage.replace(oldimage, image);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		sql="update cinema set image=? where cno=?";
		db.execOthers(sql, new Object[]{updateimage,cno});
	}

	@Override
	public void insertImage(int cno, String image) {
		// TODO Auto-generated method stub
		String sql="update cinema set image=concat(image,?,';') where cno=?;";
		db.execOthers(sql, new Object[]{image,cno});
	}
	

}
