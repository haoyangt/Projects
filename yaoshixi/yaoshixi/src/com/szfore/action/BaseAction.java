package com.szfore.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.google.gson.Gson;

/**
 * 
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 5, 2013
 */
public class BaseAction {

	protected static final String RESULT_CODE = "code";
	protected static final int SUCCESS_CODE = 0x01;
	protected static final int FAILED_CODE = 0x02;
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;

	@ModelAttribute
	protected void setReqAndRes(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		this.request = request;
		this.response = response;
		this.session = session;
	}
	protected String toJson(Object src) {
		if(src == null) {
			return "";
		}
		Gson gson = new Gson();
		return  gson.toJson(src);
	}
	
	protected void toJson(boolean success, String msg) {
		Map<String,Object> map = new HashMap<String, Object>();
		if(success) {
			map.put(RESULT_CODE, SUCCESS_CODE);
		} else {
			map.put(RESULT_CODE, FAILED_CODE);
		}
		map.put("msg", msg);
		outJson(toJson(map));
	}
	
	protected void outJson(String msg) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		response.setHeader("pragma", "no-cache");
		response.setDateHeader("expires", 0);
		try {
			response.getWriter().write(msg);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void downLoadFile(InputStream in,String fileName) {
		try {
			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") >0) {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
			} else if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") >0) {
			   fileName = URLEncoder.encode(fileName, "UTF-8"); //IE浏览器
			} else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");  //google
			}
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.reset();
		response.setCharacterEncoding("uft-8");
		response.setContentType("application/x-msdownload;charset=uft-8");
		response.setHeader("Content-disposition", "attachment;filename="+fileName);
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		ServletOutputStream out = null;
		
		int byteRead;
		byte[] buffer = new byte[10*1024];
		int len = buffer.length;
		try {
			out = response.getOutputStream();
			bis = new BufferedInputStream(in);
			bos = new BufferedOutputStream(out);
			while((byteRead = bis.read(buffer, 0, len))!=-1) {
				bos.write(buffer, 0, byteRead);	
			}
			bos.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
				bos.close();
				in.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
	
}
