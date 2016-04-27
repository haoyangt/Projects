package com.hy.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.hy.biz.IFilmBiz;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.po.SlideImg;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class AdminSlideimgOperationAction extends ActionSupport implements Preparable,RequestAware,ModelDriven<SlideImg>{
	private IFilmBiz fb;
	private Map<String, Object> request;
	private SlideImg slideimg=new SlideImg();
	private File updateimg;
	private String updateimgContentType;
	private String updateimgFileName;
	private int updateimgsno;

	public String displaySlideinfo(){
		List<SlideImg> slideimglist=fb.getSlideImg();
		request.put("slideimg", slideimglist);
		if(slideimg.getSno()>0)
			request.put("sno", slideimg.getSno());
		return "OK";
	}
	
	public String updateSlideinfo(){
		fb.changeSlideimg(slideimg);
		
		//重新读取数据
		List<SlideImg> slideimglist=fb.getSlideImg();
		request.put("slideimg", slideimglist);
		if(slideimg.getSno()>0)
			request.put("sno", 0);
		return "OK";
	}
	
	public String deleteSlideinfo(){
		fb.deleteSlideimg(slideimg.getSno());
		
		//重新读取数据
		List<SlideImg> slideimglist=fb.getSlideImg();
		request.put("slideimg", slideimglist);
		if(slideimg.getSno()>0)
			request.put("sno", 0);
		return "OK";
	}
	
	public String addSlideinfo(){
		fb.addSlideimg(slideimg);
		
		//重新读取数据
		List<SlideImg> slideimglist=fb.getSlideImg();
		request.put("slideimg", slideimglist);
		if(slideimg.getSno()>0)
			request.put("sno", 0);
		return "OK";
	}
	
	public String updateSlideimg(){
		String fname=updateimgCommon();
		if(!fname.equals("error")){
			//将最新的上传图片名字 写入数据库
			fb.changeSlideimg(updateimgsno, fname);
		}
		//重新读取数据
		List<SlideImg> slideimglist=fb.getSlideImg();
		request.put("slideimg", slideimglist);
		return SUCCESS;
	}
	
	private String updateimgCommon() {
		
		// 准备存储目录photo
		File path = new File(ServletActionContext.getServletContext().getRealPath("image\\slide_picture"));
		if(!path.exists()){
			path.mkdir();
		}
		
		// 验证是否选择了文件
		if(updateimg == null){
			this.addActionMessage("<script>alert('请选择要上传的文件！');</script>");
			return "error";
		}
		
		//System.out.println(">>> 临时文件名：" + updateimg.getName());
		// 验证文件类型
		if(!updateimgContentType.contains("image")){
			this.addActionMessage("<script>alert('只能上传图片文件！');</script>");
			return "error";
		}
		
		// 验证文件大小  300K
		if(updateimg.length()>800*1024){
			this.addActionMessage("<script>alert('只能上传小于800K的图片！');</script>");
			return "error";
		}
		
		// 获取文件名
		String[] extname = updateimgFileName.split("\\.");
		String fname = new Date().getTime()+"."+extname[extname.length-1];
		
		// 使用流把文件从缓存拷贝到指定目录photo
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			fis = new FileInputStream(updateimg);
			fos = new FileOutputStream(path+"\\" + fname);
			byte[] buff = new byte[100];
			int len = 0;
			while((len=fis.read(buff, 0, buff.length))>0){
				fos.write(buff, 0, len);
			}
			fos.close();
			fis.close();
			this.addActionMessage("<script>alert('文件上传成功！');</script>");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			this.addActionMessage("<script>alert('文件上传失败！');</script>");
		} catch (IOException e) {
			e.printStackTrace();
			this.addActionMessage("<script>alert('文件上传失败！');</script>");
		}
		
		return fname;
	}
	
	public int getUpdateimgsno() {
		return updateimgsno;
	}

	public void setUpdateimgsno(int updateimgsno) {
		this.updateimgsno = updateimgsno;
	}

	public void setUpdateimg(File updateimg) {
		this.updateimg = updateimg;
	}

	public void setUpdateimgContentType(String updateimgContentType) {
		this.updateimgContentType = updateimgContentType;
	}

	public void setUpdateimgFileName(String updateimgFileName) {
		this.updateimgFileName = updateimgFileName;
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		this.fb=new FilmBizImpl();
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}

	@Override
	public SlideImg getModel() {
		// TODO Auto-generated method stub
		return this.slideimg;
	}
}
