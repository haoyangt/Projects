package com.szfore.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.i18n.LocaleContextHolder;
import org.w3c.tidy.Configuration;
import org.w3c.tidy.Tidy;

/**
 * 把获取页面的html
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 26, 2013
 */
public class EmailUtils {

	public static String genRegistId() {
		double randomNum = Math.random() * Math.random();
		String registId = MD5Util.getMD5(String.valueOf(randomNum));
		return registId;
	}
	
	public static EmailSmtpSend getEmailSmtpSendDefault() {
		EmailSmtpSend ess = new EmailSmtpSend(PropertyUtils.getProperty("smtpUrl"), PropertyUtils.getProperty("username"), PropertyUtils.getProperty("password"));
		return ess;
	}
	
	public static String genValidateUrl(String registId,String email,Integer userId) {
		StringBuffer sb = new StringBuffer();
		sb.append(PropertyUtils.getProperty("projectUrl"))
		  .append("activeEmail?registId=")
		  .append(registId)
		  .append("&email="+email);
		return sb.toString();
	}
	/**
	 * <p>用户收到欢迎加入要实习的邮件链接完善公司信息<br/>
	 * @title welValidateUrl<br/>
	 * @date 2014-6-3 下午2:38:27<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param registId
	 * @param email
	 * @param userId
	 * @return
	 */
	public static String welValidateUrl(String registId,String email,Integer userId) {
		StringBuffer sb = new StringBuffer();
		sb.append(PropertyUtils.getProperty("projectUrl"))
		  .append("welCompanyH?registId=")
		  .append(registId)
		  .append("&email="+email);
		return sb.toString();
	}
	
	public static String genValidateUrlPass(String registId,String email) {
		StringBuffer sb = new StringBuffer();
		sb.append(PropertyUtils.getProperty("projectUrl"))
		  .append("activeEmailPass?registId=")
		  .append(registId)
		  .append("&email="+email);
		return sb.toString();
	}
	/**
	 * <p>激活公司邮箱路径<br/>
	 * @title genValidateUrlActivate<br/>
	 * @date 2014-4-1 上午11:17:19<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param registId
	 * @param email
	 * @return
	 */
	public static String genValidateUrlActivate(String registId,
			String email,String cdkey,String password,String companyName) {
		StringBuffer sb = new StringBuffer();
		sb.append(PropertyUtils.getProperty("projectUrl"))
		  .append("activeEmailCompany?registId=")
		  .append(registId)
		  .append("&email="+email)
		  .append("&cdkey="+cdkey)
		  .append("&password="+password)
		  .append("&companyName="+companyName);
		return sb.toString();
	}
	public static String genValidateUrljobReferrals(String registId,
			String email,Integer companyId) {
		StringBuffer sb = new StringBuffer();
		sb.append(PropertyUtils.getProperty("projectUrl"))
		  .append("activeEmailjobReferrals?registId=")
		  .append(registId).append("&companyId="+companyId)
		  .append("&email="+email);
		return sb.toString();
	}
	public static String convertHtmlToStr(HttpServletRequest request,String urlStr) throws Exception {
		URL url;
		
		String sessionId = request.getSession().getId();
			if (urlStr.indexOf("?") != -1) {
				urlStr = urlStr + "&locale="
						+ LocaleContextHolder.getLocale().toString();
			} else {
				urlStr = urlStr + "?locale="
						+ LocaleContextHolder.getLocale().toString();
			}
			url = new URL(urlStr);
			
			URLConnection uc = url.openConnection();
			uc.setRequestProperty("Cookie", "JSESSIONID="+sessionId);
			
			InputStream is = uc.getInputStream();
		//	InputStream is = new FileInputStream(urlStr);
			
			Tidy tidy = new Tidy();
		
			OutputStream os2 = new ByteArrayOutputStream();
			tidy.setXHTML(true); // 设定输出为xhtml(还可以输出为xml)
			tidy.setCharEncoding(Configuration.UTF8); // 设定编码以正常转换中文
			tidy.setTidyMark(false); // 不设置它会在输出的文件中给加条meta信息
			tidy.setXmlPi(true); // 让它加上<?xml version="1.0"?>
			tidy.setIndentContent(true); // 缩进，可以省略，只是让格式看起来漂亮一些
			tidy.parse(is, os2);
			
			is.close();
		
			// 解决乱码 --将转换后的输出流重新读取改变编码
			String temp;
			StringBuffer sb = new StringBuffer();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					new ByteArrayInputStream(
							((ByteArrayOutputStream) os2).toByteArray()),
					"utf-8"));
			while ((temp = in.readLine()) != null) {
				sb.append(temp);
			}
			return sb.toString();
		}
	
	
}
