package com.hy.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.hy.biz.IAlltableBiz;
import com.hy.biz.impl.AlltableBizImpl;
import com.hy.excel.ReadWriteExcelUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class AdminExcelOperationAction extends ActionSupport implements RequestAware,Preparable{
	private Map<String, Object> request;
	private IAlltableBiz ab;
	private String[] tablenames;
	private String filename;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String[] getTablenames() {
		return tablenames;
	}
	public void setTablenames(String[] tablenames) {
		this.tablenames = tablenames;
	}
	
	public String display(){
		List<String> listTablename=ab.displayAllTablename();
		request.put("listTablename", listTablename);
		return SUCCESS;
	}
	public String write(){
		ReadWriteExcelUtil.writeExcel(filename,tablenames);
		//重新读取数据
		List<String> listTablename=ab.displayAllTablename();
		request.put("listTablename", listTablename);
		this.clearMessages();
		this.addActionMessage("<script>alert('导出excel成功');</script>");
		return SUCCESS;
	}
	
	public String read(){
		boolean result=ReadWriteExcelUtil.readExcel(filename,tablenames);
		//重新读取数据
		List<String> listTablename=ab.displayAllTablename();
		request.put("listTablename", listTablename);
		this.clearMessages();
		if(result)
			this.addActionMessage("<script>alert('导入excel成功');</script>");
		else
			this.addActionMessage("<script>alert('该文件不存在！');</script>");
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
		ab=new AlltableBizImpl();
	}
}
