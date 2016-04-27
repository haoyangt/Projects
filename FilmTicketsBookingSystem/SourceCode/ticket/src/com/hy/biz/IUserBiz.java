package com.hy.biz;

import java.util.List;

import com.hy.po.Permission;
import com.hy.po.User;

public interface IUserBiz {
	public abstract User findUser(String username,String password);
	public abstract void changePassword(int uno,String password);
	public abstract void register(User user);
	public abstract List<User> findAllAdmin();
	public abstract void changeUser(User user);
	public abstract void deleteUser(int uno);
	public abstract List<String> getAllPermission(); 
	public abstract List<String> getAllPermission2(); 
	public abstract List<Permission> getAllPermissionIncludePercontent();
	public abstract void updatePermission(Permission permission);
	public abstract void deletePermission(Permission permission);
	public abstract void addPermission(Permission permission);
}
