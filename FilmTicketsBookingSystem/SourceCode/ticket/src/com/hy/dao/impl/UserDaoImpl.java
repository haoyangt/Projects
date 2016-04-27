package com.hy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hy.dao.IUserDao;
import com.hy.po.Percontent;
import com.hy.po.Permission;
import com.hy.po.User;
import com.hy.util.DBHelper;

public class UserDaoImpl implements IUserDao {
	private DBHelper db;
	
	public UserDaoImpl() {
		super();
		db=new DBHelper();
	}


	@Override
	public User selectUser(String username, String password) {
		String strSQL="select * from user where username=? and password=?";
		ResultSet rs=db.execQuery(strSQL, new Object[]{username,password});
		User user=new User();
		try {
			if(rs.next()){
				//插入user表中数据
				user.setUno(rs.getInt("uno"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				int status=rs.getInt("status");
				user.setStatus(rs.getInt("status"));
				//插入permission表中数据
				strSQL="select * from permission where pno=?";
				rs=db.execQuery(strSQL, new Object[]{status});
				Permission permission=new Permission();
				rs.next();
				int pno=rs.getInt("pno");
				permission.setPno(rs.getInt("pno"));
				permission.setPname(rs.getString("pname"));
				//插入percontent表中数据
				strSQL="select * from percontent where pm_pno=? order by pno";
				rs=db.execQuery(strSQL, new Object[]{pno});
				List<Percontent> percontents=new ArrayList<Percontent>();
				Percontent percontent;
				while(rs.next()){
					percontent=new Percontent();
					percontent.setPno(rs.getInt("pno"));
					percontent.setPm_pno(rs.getInt("pm_pno"));
					percontent.setPname(rs.getString("pname"));
					percontent.setPurl(rs.getString("purl"));
					percontents.add(percontent);
				}
				//将所有权限数据 插入user
				permission.setPercontent(percontents);
				user.setPermission(permission);
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}


	@Override
	public void updatePassword(int uno, String password) {
		String strSQL="update user set password=? where uno=?";
		db.execOthers(strSQL, new Object[]{password,uno});
	}


	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		String strSQL="insert into user (username,password,status) values (?,?,?)";
		db.execOthers(strSQL, new Object[]{user.getUsername(),user.getPassword(),user.getStatus()});
	}


	@Override
	public List<User> selectAllAdmin() {
		// TODO Auto-generated method stub
		String sql="select * from user order by status desc,username";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<User> users=new ArrayList<User>();
		User user;
		try {
			while(rs.next()){
				user=new User();
				user.setUno(rs.getInt("uno"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				int status=rs.getInt("status");
				user.setStatus(status);
				
				sql="select * from permission where pno=?";
				ResultSet rs2=db.execQuery(sql, new Object[]{status});
				Permission permission=new Permission();
				rs2.next();
				permission.setPno(rs2.getInt("pno"));
				permission.setPname(rs2.getString("pname"));
				user.setPermission(permission);
				users.add(user);
			}
			return users;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn();
		}
		return null;
	}


	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		String sql="update user set username=?,password=?,status=? where uno=?";
		db.execOthers(sql, new Object[]{user.getUsername(),user.getPassword(),user.getStatus(),user.getUno()});
	}


	@Override
	public void deleteUser(int uno) {
		// TODO Auto-generated method stub
		String sql="delete from user where uno=?";
		db.execOthers(sql, new Object[]{uno});
	}


	@Override
	public List<String> selectAllPermission() {
		// TODO Auto-generated method stub
		String sql="select pno,pname from permission";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<String> listPermission=new ArrayList<String>();
		try {
			while(rs.next()){
				listPermission.add(rs.getInt(1)+"_"+rs.getString(2));
			}
			return listPermission;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			db.closeConn();
		}
	}


	@Override
	public List<Permission> selectPermissionIncludePercontent() {
		// TODO Auto-generated method stub
		List<Permission> listPermission=new ArrayList<Permission>();
		Permission permission;
		String sql="select * from permission";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		try {
			while(rs.next()){
				permission=new Permission();
				permission.setPno(rs.getInt(1));
				permission.setPname(rs.getString(2));
				
				sql="select * from percontent where pm_pno=?";
				ResultSet rs2=db.execQuery(sql, new Object[]{rs.getInt(1)});
				List<Percontent> listPercontent=new ArrayList<Percontent>();
				Percontent percontent;
				while(rs2.next()){
					percontent=new Percontent();
					percontent.setPno(rs2.getInt(1));
					percontent.setPm_pno(rs2.getInt(2));
					percontent.setPname(rs2.getString(3));
					percontent.setPurl(rs2.getString(4));
					listPercontent.add(percontent);
				}
				permission.setPercontent(listPercontent);
				listPermission.add(permission);
			}
			return listPermission;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}


	@Override
	public void updatePermission(Permission permission) {
		// TODO Auto-generated method stub
		String sql="update permission set pname=? where pno=?";
		db.execOthers(sql, new Object[]{permission.getPname(),permission.getPno()});
		sql="delete from percontent where pm_pno=?";
		db.execOthers(sql, new Object[]{permission.getPno()});
		sql="insert into percontent (pm_pno,pname,purl) values (?,?,?)";
		List<Percontent> percontents=permission.getPercontent();
		for (Percontent percontent : percontents) {
			db.execOthers(sql, new Object[]{percontent.getPm_pno(),percontent.getPname(),percontent.getPurl()});
		}
	}


	@Override
	public void deletePermission(Permission permission) {
		// TODO Auto-generated method stub
		String sql="delete from permission where pno=?";
		db.execOthers(sql, new Object[]{permission.getPno()});
	}


	@Override
	public List<String> selectAllPermission2() {
		String sql="select pname from permission";
		ResultSet rs=db.execQuery(sql, new Object[]{});
		List<String> listPermission=new ArrayList<String>();
		try {
			while(rs.next()){
				listPermission.add(rs.getString(1));
			}
			return listPermission;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			db.closeConn();
		}
	}


	@Override
	public void insertPermission(Permission permission) {
		// TODO Auto-generated method stub
		String sql="insert into permission (pname) values (?)";
		db.execOthers(sql, new Object[]{permission.getPname()});
		sql="select pno from permission where pname=?";
		ResultSet rs=db.execQuery(sql, new Object[]{permission.getPname()});
		try {
			if(rs.next()){
				int pmspno=rs.getInt(1);
				sql="insert into percontent (pm_pno,pname,purl) values (?,?,?)";
				List<Percontent> percontents=permission.getPercontent();
				for (Percontent percontent : percontents) {
					db.execOthers(sql, new Object[]{pmspno,percontent.getPname(),percontent.getPurl()});
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
