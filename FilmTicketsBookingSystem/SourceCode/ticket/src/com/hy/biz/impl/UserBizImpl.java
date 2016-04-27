package com.hy.biz.impl;

import java.util.List;

import com.hy.biz.IUserBiz;
import com.hy.dao.IUserDao;
import com.hy.dao.impl.UserDaoImpl;
import com.hy.po.Permission;
import com.hy.po.User;

public class UserBizImpl implements IUserBiz {
	IUserDao ud;
	
	public UserBizImpl() {
		super();
		ud=new UserDaoImpl();
	}


	@Override
	public User findUser(String username, String password) {
		// TODO Auto-generated method stub
		return ud.selectUser(username, password);
	}


	@Override
	public void changePassword(int uno, String password) {
		// TODO Auto-generated method stub
		ud.updatePassword(uno, password);
	}


	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		ud.insertUser(user);
	}


	@Override
	public List<User> findAllAdmin() {
		// TODO Auto-generated method stub
		return ud.selectAllAdmin();
	}


	@Override
	public void changeUser(User user) {
		// TODO Auto-generated method stub
		ud.updateUser(user);
	}


	@Override
	public void deleteUser(int uno) {
		// TODO Auto-generated method stub
		ud.deleteUser(uno);
	}


	@Override
	public List<String> getAllPermission() {
		// TODO Auto-generated method stub
		return ud.selectAllPermission();
	}


	@Override
	public List<Permission> getAllPermissionIncludePercontent() {
		// TODO Auto-generated method stub
		return ud.selectPermissionIncludePercontent();
	}


	@Override
	public void updatePermission(Permission permission) {
		// TODO Auto-generated method stub
		ud.updatePermission(permission);
	}


	@Override
	public void deletePermission(Permission permission) {
		// TODO Auto-generated method stub
		ud.deletePermission(permission);
	}


	@Override
	public List<String> getAllPermission2() {
		// TODO Auto-generated method stub
		return ud.selectAllPermission2();
	}


	@Override
	public void addPermission(Permission permission) {
		// TODO Auto-generated method stub
		ud.insertPermission(permission);
	}

}
