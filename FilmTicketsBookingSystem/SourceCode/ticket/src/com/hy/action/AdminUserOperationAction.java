package com.hy.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hy.biz.IUserBiz;
import com.hy.biz.impl.UserBizImpl;
import com.hy.po.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserOperationAction  implements ModelDriven<User>{
	private User user=new User();
	private String newpwd;
	private String vpwd;
	
	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getVpwd() {
		return vpwd;
	}

	public void setVpwd(String vpwd) {
		this.vpwd = vpwd;
	}

	public String displayAdmin(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IUserBiz ub=new UserBizImpl();
		List<User> users=ub.findAllAdmin();
		List<String> permissions=ub.getAllPermission();
		request.setAttribute("users", users);
		request.setAttribute("permissions", permissions);
		if(user.getUno()>0)
			request.setAttribute("uno", user.getUno());
		return "OK";
	}
	
	public String updateAdmin(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IUserBiz ub=new UserBizImpl();
		ub.changeUser(user);
		
		//重新获取数据
		List<User> users=ub.findAllAdmin();
		request.setAttribute("users", users);
		request.setAttribute("uno", 0);
		return "OK";
	}
	
	public String deleteAdmin(){
		HttpServletRequest request = ServletActionContext.getRequest ();
		IUserBiz ub=new UserBizImpl();
		ub.deleteUser(user.getUno());
		
		//重新获取数据
		List<User> users=ub.findAllAdmin();
		request.setAttribute("users", users);
		request.setAttribute("uno", 0);
		return "OK";
	}
	
	public String addAdmin(){
		Map<String, Object> session=ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest ();
		IUserBiz ub=new UserBizImpl();
		if(newpwd.length()<6||vpwd.length()<6){
			session.put("errorRegisterMsg", "密码长度必须大于等于6位");
		}else{
			if(newpwd.equals(vpwd)){
				user.setPassword(newpwd);
				ub.register(user);
				if(session.containsKey("errorRegisterMsg"))
					session.remove("errorRegisterMsg");
			}else{
				session.put("errorRegisterMsg", "两次密码输入不一致");
			}
		}
		
		//重新获取数据
		List<User> users=ub.findAllAdmin();
		request.setAttribute("users", users);
		request.setAttribute("uno", 0);
		return "OK";
	}
	
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return this.user;
	}

}
