package com.hy.dao;

import java.util.List;

import com.hy.po.Permission;
import com.hy.po.User;

public interface IUserDao {
	public abstract User selectUser(String username,String password);
	public abstract void updatePassword(int uno,String password);
	public abstract void insertUser(User user);
	public abstract List<User> selectAllAdmin();
	public abstract void updateUser(User user);
	public abstract void deleteUser(int uno);
	public abstract List<String> selectAllPermission();
	public abstract List<String> selectAllPermission2();
	public abstract List<Permission> selectPermissionIncludePercontent();
	public abstract void updatePermission(Permission permission);
	public abstract void deletePermission(Permission permission);
	public abstract void insertPermission(Permission permission);
}
 