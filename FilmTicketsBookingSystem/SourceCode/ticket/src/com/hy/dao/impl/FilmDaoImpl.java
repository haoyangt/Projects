package com.hy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hy.vo.PageBean;
import com.hy.dao.IFilmDao;
import com.hy.po.Film;
import com.hy.po.SlideImg;
import com.hy.util.DBHelper;

public class FilmDaoImpl implements IFilmDao {
	
	private DBHelper db;
	
	public FilmDaoImpl() {
		super();
		this.db=new DBHelper();
	}

	@Override
	public List<Film> selectAllReleasedFilm() {
		String sql="select * from film where now()>rdate and state=1 order by rdate desc limit  ?,? ";
		ResultSet rs= db.execQuery(sql, new Object[]{0,1});
		List<Film> allReleasedFilm=new ArrayList<Film>();
		Film film;
		try {
			while(rs.next()){
				film=new Film();
				film.setFno(rs.getInt("fno"));
				film.setFname(rs.getString("fname"));
				film.setPoster(rs.getString("poster"));
				film.setGrade(rs.getDouble("grade"));
				film.setRdate(rs.getString("rdate"));
				film.setDirector(rs.getString("director"));
				film.setLanguage(rs.getString("language"));
				film.setLocation(rs.getString("location"));
				film.setRuntime(rs.getInt("runtime"));
				film.setType(rs.getString("type"));
				film.setVersion(rs.getString("version"));
				film.setProtagonist(rs.getString("protagonist"));
				film.setRemark(rs.getString("remark"));
				film.setPlot(rs.getString("plot"));
				film.setStill(rs.getString("still"));
				film.setPrevue(rs.getString("prevue"));
				film.setState(rs.getInt("state"));
				allReleasedFilm.add(film);
			}
			rs.close();
			return allReleasedFilm;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.db.closeConn();
		}
		return null;
	}

	@Override
	public List<Film> selectAllReleaseSoonFilm() {
		String sql="select * from film where now()<rdate and state=1 order by rdate desc limit  ?,? ";
		ResultSet rs= db.execQuery(sql, new Object[]{0,1});
		List<Film> allReleasedFilm=new ArrayList<Film>();
		Film film;
		try {
			while(rs.next()){
				film=new Film();
				film.setFno(rs.getInt("fno"));
				film.setFname(rs.getString("fname"));
				film.setPoster(rs.getString("Poster"));
				film.setGrade(rs.getDouble("grade"));
				film.setRdate(rs.getString("rdate"));
				film.setDirector(rs.getString("director"));
				film.setLanguage(rs.getString("language"));
				film.setLocation(rs.getString("location"));
				film.setRuntime(rs.getInt("runtime"));
				film.setType(rs.getString("type"));
				film.setVersion(rs.getString("version"));
				film.setProtagonist(rs.getString("protagonist"));
				film.setRemark(rs.getString("remark"));
				film.setPlot(rs.getString("plot"));
				film.setStill(rs.getString("still"));
				film.setPrevue(rs.getString("prevue"));
				film.setState(rs.getInt("state"));
				allReleasedFilm.add(film);
			}
			rs.close();
			return allReleasedFilm;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.db.closeConn();
		}
		return null;
	}
	
	@Override
	public List<Film> selectAllFilm() {
		// TODO Auto-generated method stub
		String sql="select * from film  order by state desc,rdate desc";
		ResultSet rs= db.execQuery(sql, new Object[]{});
		List<Film> allFilm=new ArrayList<Film>();
		Film film;
		try {
			while(rs.next()){
				film=new Film();
				film.setFno(rs.getInt("fno"));
				film.setFname(rs.getString("fname"));
				film.setPoster(rs.getString("Poster"));
				film.setGrade(rs.getDouble("grade"));
				film.setRdate(rs.getString("rdate"));
				film.setDirector(rs.getString("director"));
				film.setLanguage(rs.getString("language"));
				film.setLocation(rs.getString("location"));
				film.setRuntime(rs.getInt("runtime"));
				film.setType(rs.getString("type"));
				film.setVersion(rs.getString("version"));
				film.setProtagonist(rs.getString("protagonist"));
				film.setRemark(rs.getString("remark"));
				film.setPlot(rs.getString("plot"));
				film.setStill(rs.getString("still"));
				film.setPrevue(rs.getString("prevue"));
				film.setState(rs.getInt("state"));
				allFilm.add(film);
			}
			rs.close();
			return allFilm;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.db.closeConn();
		}
		return null;
	}
	
	//查询一页即将上映电影
	public PageBean selectAllReleaseSoonFilm(int currentPage, int pageSize) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from film where now()<rdate and state=1 order by rdate desc limit  ?,?";
		Object[] params = new Object[]{start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Film> allReleasedFilm = new ArrayList<Film>();
		try {
			Film film;
			while(rs.next()){
				film=new Film();
				film.setFno(rs.getInt("fno"));
				film.setFname(rs.getString("fname"));
				film.setPoster(rs.getString("poster"));
				film.setGrade(rs.getDouble("grade"));
				film.setRdate(rs.getString("rdate"));
				film.setDirector(rs.getString("director"));
				film.setLanguage(rs.getString("language"));
				film.setLocation(rs.getString("location"));
				film.setRuntime(rs.getInt("runtime"));
				film.setType(rs.getString("type"));
				film.setVersion(rs.getString("version"));
				film.setProtagonist(rs.getString("protagonist"));
				film.setRemark(rs.getString("remark"));
				film.setPlot(rs.getString("plot"));
				film.setStill(rs.getString("still"));
				film.setPrevue(rs.getString("prevue"));
				film.setState(rs.getInt("state"));
				allReleasedFilm.add(film);
			}
			pageBean.setData(allReleasedFilm);
			
		strSQL = "select count(*) from film where now()<rdate and state=1";
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

	
	//查询一页上映电影
		public PageBean selectAllReleasedFilm(int currentPage, int pageSize) {
			PageBean pageBean = new PageBean();
			int start = (currentPage -1)*pageSize;
			String strSQL = "select * from film where now()>rdate and state=1 order by rdate desc limit  ?,?";
			Object[] params = new Object[]{start, pageSize};
			ResultSet rs = this.db.execQuery(strSQL, params);
			List<Film> allReleasedFilm = new ArrayList<Film>();
			try {
				Film film;
				while(rs.next()){
					film=new Film();
					film.setFno(rs.getInt("fno"));
					film.setFname(rs.getString("fname"));
					film.setPoster(rs.getString("poster"));
					film.setGrade(rs.getDouble("grade"));
					film.setRdate(rs.getString("rdate"));
					film.setDirector(rs.getString("director"));
					film.setLanguage(rs.getString("language"));
					film.setLocation(rs.getString("location"));
					film.setRuntime(rs.getInt("runtime"));
					film.setType(rs.getString("type"));
					film.setVersion(rs.getString("version"));
					film.setProtagonist(rs.getString("protagonist"));
					film.setRemark(rs.getString("remark"));
					film.setPlot(rs.getString("plot"));
					film.setStill(rs.getString("still"));
					film.setPrevue(rs.getString("prevue"));
					film.setState(rs.getInt("state"));
					allReleasedFilm.add(film);
				}
				pageBean.setData(allReleasedFilm);
				
				strSQL = "select count(*) from film where now()>rdate and state=1";
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

		//根据影片名查询即将上映电影
		public PageBean selectAllReleaseSoonFilmByName(int currentPage, int pageSize,String name) {
			PageBean pageBean = new PageBean();
			int start = (currentPage -1)*pageSize;
			String strSQL = "select * from film where now()<rdate and state=1 and fname like '%"+name+"%' order by rdate desc limit  ?,?";
			Object[] params = new Object[]{start, pageSize};
			ResultSet rs = this.db.execQuery(strSQL, params);
			List<Film> allReleasedFilm = new ArrayList<Film>();
			try {
				Film film;
				while(rs.next()){
					film=new Film();
					film.setFno(rs.getInt("fno"));
					film.setFname(rs.getString("fname"));
					film.setPoster(rs.getString("poster"));
					film.setGrade(rs.getDouble("grade"));
					film.setRdate(rs.getString("rdate"));
					film.setDirector(rs.getString("director"));
					film.setLanguage(rs.getString("language"));
					film.setLocation(rs.getString("location"));
					film.setRuntime(rs.getInt("runtime"));
					film.setType(rs.getString("type"));
					film.setVersion(rs.getString("version"));
					film.setProtagonist(rs.getString("protagonist"));
					film.setRemark(rs.getString("remark"));
					film.setPlot(rs.getString("plot"));
					film.setStill(rs.getString("still"));
					film.setPrevue(rs.getString("prevue"));
					film.setState(rs.getInt("state"));
					allReleasedFilm.add(film);
				}
				pageBean.setData(allReleasedFilm);
				
				strSQL = "select count(*) from film where now()<rdate and state=1 and fname like '%"+name+"%'";
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
		
		//根据影片名查询上映电影
		public PageBean selectAllReleasedFilmByName(int currentPage, int pageSize,String name) {
			PageBean pageBean = new PageBean();
			int start = (currentPage -1)*pageSize;
			String strSQL = "select * from film where now()>rdate and state=1 and fname like '%"+name+"%' order by rdate desc limit  ?,?";
			Object[] params = new Object[]{start, pageSize};
			ResultSet rs = this.db.execQuery(strSQL, params);
			List<Film> allReleasedFilm = new ArrayList<Film>();
			try {
				Film film;
				while(rs.next()){
					film=new Film();
					film.setFno(rs.getInt("fno"));
					film.setFname(rs.getString("fname"));
					film.setPoster(rs.getString("poster"));
					film.setGrade(rs.getDouble("grade"));
					film.setRdate(rs.getString("rdate"));
					film.setDirector(rs.getString("director"));
					film.setLanguage(rs.getString("language"));
					film.setLocation(rs.getString("location"));
					film.setRuntime(rs.getInt("runtime"));
					film.setType(rs.getString("type"));
					film.setVersion(rs.getString("version"));
					film.setProtagonist(rs.getString("protagonist"));
					film.setRemark(rs.getString("remark"));
					film.setPlot(rs.getString("plot"));
					film.setStill(rs.getString("still"));
					film.setPrevue(rs.getString("prevue"));
					film.setState(rs.getInt("state"));
					allReleasedFilm.add(film);
				}
				pageBean.setData(allReleasedFilm);
				
				strSQL = "select count(*) from film where now()>rdate and state=1 and fname like '%"+name+"%'";
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
	public int selectReleasedFilmCount() {
		String sql="select count(*) from film where now()>rdate and state=1";
		ResultSet rs=this.db.execQuery(sql,new Object[]{});
		try {
			rs.next();
			int count= rs.getInt(1);
			rs.close();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.db.closeConn();
		}
		return 0;
	}

	@Override
	public int selectReleaseSoonFilmCount() {
		String sql="select count(*) from film where now()<rdate and state=1";
		ResultSet rs=this.db.execQuery(sql,new Object[]{});
		try {
			rs.next();
			int count= rs.getInt(1);
			rs.close();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.db.closeConn();
		}
		return 0;
	}

	@Override
	public int selectAllFilmCount() {
		String sql="select count(*) from film where state=1";
		ResultSet rs=this.db.execQuery(sql,new Object[]{});
		try {
			rs.next();
			int count= rs.getInt(1);
			rs.close();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.db.closeConn();
		}
		return 0;
	}

	@Override
	public Film selectFilmByFno(int fno) {
		String sql="select * from film where fno=? and state=1";
		ResultSet rs=this.db.execQuery(sql,new Object[]{fno});
		Film film=new Film();
		try {
			rs.next();
			film.setFno(rs.getInt("fno"));
			film.setFname(rs.getString("fname"));
			film.setPoster(rs.getString("poster"));
			film.setGrade(rs.getDouble("grade"));
			film.setRdate(rs.getString("rdate"));
			film.setDirector(rs.getString("director"));
			film.setLanguage(rs.getString("language"));
			film.setLocation(rs.getString("location"));
			film.setRuntime(rs.getInt("runtime"));
			film.setType(rs.getString("type"));
			film.setVersion(rs.getString("version"));
			film.setProtagonist(rs.getString("protagonist"));
			film.setRemark(rs.getString("remark"));
			film.setPlot(rs.getString("plot"));
			film.setStill(rs.getString("still"));
			film.setPrevue(rs.getString("prevue"));
			film.setState(rs.getInt("state"));
			rs.close();
			return film;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.db.closeConn();
		}
		return null;
	}

	@Override
	public PageBean selectReleasedFilmByCno(int currentPage, int pageSize,
			int cno) {
		PageBean pageBean = new PageBean();
		int start = (currentPage -1)*pageSize;
		String strSQL = "select * from film where fno in (select distinct fno from ticket where hno in (select distinct hno from hall where cno=?)) and now()>rdate and state=1 order by rdate desc limit  ?,?";
		Object[] params = new Object[]{cno,start, pageSize};
		ResultSet rs = this.db.execQuery(strSQL, params);
		List<Film> allReleasedFilm = new ArrayList<Film>();
		try {
			Film film;
			while(rs.next()){
				film=new Film();
				film.setFno(rs.getInt("fno"));
				film.setFname(rs.getString("fname"));
				film.setPoster(rs.getString("poster"));
				film.setGrade(rs.getDouble("grade"));
				film.setRdate(rs.getString("rdate"));
				film.setDirector(rs.getString("director"));
				film.setLanguage(rs.getString("language"));
				film.setLocation(rs.getString("location"));
				film.setRuntime(rs.getInt("runtime"));
				film.setType(rs.getString("type"));
				film.setVersion(rs.getString("version"));
				film.setProtagonist(rs.getString("protagonist"));
				film.setRemark(rs.getString("remark"));
				film.setPlot(rs.getString("plot"));
				film.setStill(rs.getString("still"));
				film.setPrevue(rs.getString("prevue"));
				film.setState(rs.getInt("state"));
				allReleasedFilm.add(film);
			}
				pageBean.setData(allReleasedFilm);
			
				strSQL = "select count(*) from film where fno in (select distinct fno from ticket where hno in (select distinct hno from hall where cno=?)) and now()>rdate and state=1";
				params = new Object[]{cno};
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
	public String selectFilmShowtime(int fno, int cno) {
		String strSQL = "select time from ticket where hno in (select distinct hno from hall  where cno=?) and fno=? order by time";
		Object[] params = new Object[]{cno,fno};
		ResultSet rs = this.db.execQuery(strSQL, params);
		String time="";
		try {
			while(rs.next()){
				time+=rs.getString(1);
				time+="  ";
			}
			rs.close();
			return time;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.db.closeConn();
		}
		return null;
	}

	@Override
	public void updateFilm(Film film) {
		// TODO Auto-generated method stub
		String sql="update film set fname=?,grade=?,rdate=?,director=?,language=?,location=?,runtime=?,type=?,version=?,protagonist=?,remark=?,plot=?,prevue=?,state=? where fno=?";
		db.execOthers(sql, new Object[]{film.getFname(),film.getGrade(),film.getRdate(),film.getDirector(),film.getLanguage(),film.getLocation(),film.getRuntime(),film.getType(),film.getVersion(),film.getProtagonist(),film.getRemark(),film.getPlot(),film.getPrevue(),film.getState(),film.getFno()});
	}

	@Override
	public void deleteFilm(int fno) {
		// TODO Auto-generated method stub
		String sql="delete from film where fno=?";
		db.execOthers(sql, new Object[]{fno});
	}

	@Override
	public void insertFilm(Film film) {
		// TODO Auto-generated method stub
		String sql="insert into film (fname,grade,rdate,director,language,location,runtime,type,version,protagonist,remark,plot,prevue) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		db.execOthers(sql, new Object[]{film.getFname(),film.getGrade(),film.getRdate(),film.getDirector(),film.getLanguage(),film.getLocation(),film.getRuntime(),film.getType(),film.getVersion(),film.getProtagonist(),film.getRemark(),film.getPlot(),film.getPrevue()});
	}

	@Override
	public List<SlideImg> selectAllSlideImg() {
		// TODO Auto-generated method stub
		String sql="select * from slideimg";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<SlideImg> listimg=new ArrayList<SlideImg>();
		SlideImg slideimg;
		try {
			while(rs.next()){
				slideimg=new SlideImg();
				slideimg.setSno(rs.getInt("sno"));
				slideimg.setSname(rs.getString("sname"));
				slideimg.setTitle(rs.getString("title"));
				slideimg.setHref(rs.getString("href"));
				slideimg.setImg(rs.getString("img"));
				slideimg.setScore1(rs.getInt("score1"));
				slideimg.setScore2(rs.getInt("score2"));
				listimg.add(slideimg);
			}
			return listimg;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void updateSlideImg(SlideImg slideimg) {
		// TODO Auto-generated method stub
		String sql="update slideimg set sname=?,href=?,score1=?,score2=?,title=? where sno=?";
		db.execOthers(sql, new Object[]{slideimg.getSname(),slideimg.getHref(),slideimg.getScore1(),slideimg.getScore2(),slideimg.getTitle(),slideimg.getSno()});
	}

	@Override
	public void deleteSlideImg(int sno) {
		// TODO Auto-generated method stub
		String sql="delete from slideimg where sno=?";
		db.execOthers(sql, new Object[]{sno});
	}

	@Override
	public void insertSlideImg(SlideImg slideimg) {
		// TODO Auto-generated method stub
		String sql="insert into slideimg (sname,href,score1,score2,title) values (?,?,?,?,?)";
		db.execOthers(sql, new Object[]{slideimg.getSname(),slideimg.getHref(),slideimg.getScore1(),slideimg.getScore2(),slideimg.getTitle()});
		
	}

	@Override
	public List<String> selectSuspensionFilmPoster() {
		// TODO Auto-generated method stub
		String sql="select poster from film where state=1 order by rdate desc";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<String> listSuspensionFilmPoster=new ArrayList<String>();
		String poster;
		try {
			while(rs.next()){
				poster=rs.getString(1);
				listSuspensionFilmPoster.add(poster);
			}
			return listSuspensionFilmPoster;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}

	@Override
	public void updatePoster(int fno, String poster) {
		// TODO Auto-generated method stub
		String sql="update film set poster=? where fno=?";
		db.execOthers(sql, new Object[]{poster,fno});
	}

	@Override
	public void updateStill(int fno, String oldstill,String still) {
		// TODO Auto-generated method stub
		String sql="select still from film where fno=?";
		ResultSet rs=db.execQuery(sql, new Object[]{fno});
		String updatestill="";
		try {
			if(rs.next()){
				String originstill=rs.getString(1);
				updatestill=originstill.replace(oldstill, still);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		sql="update film set still=? where fno=?";
		db.execOthers(sql, new Object[]{updatestill,fno});
	}

	@Override
	public void insertStill(int fno, String still) {
		// TODO Auto-generated method stub
		String sql="update film set still=concat(still,?,';') where fno=?;";
		db.execOthers(sql, new Object[]{still,fno});
	}

	@Override
	public void updateSlideImg(int sno, String img) {
		// TODO Auto-generated method stub
		String sql="update slideimg set img=? where sno=?";
		db.execOthers(sql, new Object[]{img,sno});
	}

	
}
