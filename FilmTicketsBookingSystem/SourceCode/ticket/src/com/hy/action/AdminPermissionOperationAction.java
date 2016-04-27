package com.hy.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.hy.biz.IUserBiz;
import com.hy.biz.impl.UserBizImpl;
import com.hy.po.Percontent;
import com.hy.po.Permission;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class AdminPermissionOperationAction extends ActionSupport implements Preparable,RequestAware,ModelDriven<Percontent>{
	private Map<String, Object> request;
	private IUserBiz ub;
	private Percontent percontent=new Percontent();
	private String pmsname;
	
	public String getPmsname() {
		return pmsname;
	}

	public void setPmsname(String pmsname) {
		this.pmsname = pmsname;
	}

	public String display(){
		List<Permission> permissions= ub.getAllPermissionIncludePercontent();
		if(percontent.getPno()>0)
			request.put("pno", percontent.getPno());
		request.put("permissions", permissions);
		return SUCCESS;
	}
	
	public String update(){
		Permission permission=new Permission();
		permission.setPno(percontent.getPm_pno());
		permission.setPname(pmsname);
		
		List<Percontent> percontents=new ArrayList<Percontent>();
		String[] pnamearray=percontent.getPname().split(",");
		for (String pname : pnamearray) {
			Percontent percontentUpdate=new Percontent();
			percontentUpdate.setPm_pno(percontent.getPm_pno());
			percontentUpdate.setPname(pname);
			if(pname.contains("电影管理"))percontentUpdate.setPurl("displayAllFilm");
			if(pname.contains("影院管理"))percontentUpdate.setPurl("displayAllCinemaByAdmin");
			if(pname.contains("影厅管理"))percontentUpdate.setPurl("displayAllHall");
			if(pname.contains("影片上映管理"))percontentUpdate.setPurl("displayAllTicket");
			if(pname.contains("轮播图管理"))percontentUpdate.setPurl("displaySlideinfo");
			if(pname.contains("用户管理"))percontentUpdate.setPurl("displayAdmin");
			if(pname.contains("权限管理"))percontentUpdate.setPurl("displayAllPermission");
			if(pname.contains("excel导入导出"))percontentUpdate.setPurl("displayAllTablename");
			percontents.add(percontentUpdate);
		}
		permission.setPercontent(percontents);
		ub.updatePermission(permission);
		
		//重新读入数据
		List<Permission> permissions= ub.getAllPermissionIncludePercontent();
		if(percontent.getPno()>0)
			request.put("pno", 0);
		request.put("permissions", permissions);
		return SUCCESS;
	}
	
	public String delete(){
		Permission permission=new Permission();
		permission.setPno(percontent.getPno());
		ub.deletePermission(permission);
		
		//重新读入数据
		List<Permission> permissions= ub.getAllPermissionIncludePercontent();
		if(percontent.getPno()>0)
			request.put("pno", 0);
		request.put("permissions", permissions);
		return SUCCESS;
	}
	
	public String add(){
		Permission permission=new Permission();
		List<Percontent> percontents=new ArrayList<Percontent>();
		
		permission.setPname(pmsname);
		String[] pnamearray=percontent.getPname().split(",");
		for (String pname : pnamearray) {
			Percontent percontentUpdate=new Percontent();
			percontentUpdate.setPm_pno(percontent.getPm_pno());
			percontentUpdate.setPname(pname);
			if(pname.contains("电影管理"))percontentUpdate.setPurl("displayAllFilm");
			if(pname.contains("影院管理"))percontentUpdate.setPurl("displayAllCinemaByAdmin");
			if(pname.contains("影厅管理"))percontentUpdate.setPurl("displayAllHall");
			if(pname.contains("影片上映管理"))percontentUpdate.setPurl("displayAllTicket");
			if(pname.contains("轮播图管理"))percontentUpdate.setPurl("displaySlideinfo");
			if(pname.contains("用户管理"))percontentUpdate.setPurl("displayAdmin");
			if(pname.contains("权限管理"))percontentUpdate.setPurl("displayAllPermission");
			if(pname.contains("excel导入导出"))percontentUpdate.setPurl("displayAllTablename");
			percontents.add(percontentUpdate);
		}
		permission.setPercontent(percontents);
		ub.addPermission(permission);
		
		//重新读入数据
		List<Permission> permissions= ub.getAllPermissionIncludePercontent();
		if(percontent.getPno()>0)
			request.put("pno", 0);
		request.put("permissions", permissions);
		return SUCCESS;
	}
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		ub=new UserBizImpl();
	}

	@Override
	public Percontent getModel() {
		// TODO Auto-generated method stub
		return percontent;
	}

}
