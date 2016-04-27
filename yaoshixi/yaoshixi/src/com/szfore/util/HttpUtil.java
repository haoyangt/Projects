package com.szfore.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.context.i18n.LocaleContextHolder;
import org.w3c.tidy.Configuration;
import org.w3c.tidy.Tidy;

public class HttpUtil {
	public static String doGet(String urlStr) throws Exception {
		URL url;

		// String sessionId = request.getSession().getId();
		if (urlStr.indexOf("?") != -1) {
			urlStr = urlStr + "&locale="
					+ LocaleContextHolder.getLocale().toString();
		} else {
			urlStr = urlStr + "?locale="
					+ LocaleContextHolder.getLocale().toString();
		}
		url = new URL(urlStr);

		URLConnection uc = url.openConnection();
		// uc.setRequestProperty("Cookie", "JSESSIONID="+sessionId);

		InputStream is = uc.getInputStream();
		// InputStream is = new FileInputStream(urlStr);

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
						((ByteArrayOutputStream) os2).toByteArray()), "utf-8"));
		while ((temp = in.readLine()) != null) {
			sb.append(temp);
		}
		return sb.toString();
	}
	
	
	public static String doPost(String url,Map<String, String> params) throws Exception {
		URL u = null;
		HttpURLConnection con = null;
		//构建请求参数
		StringBuffer sb = new StringBuffer();
		if(params!=null){
			for (Entry<String, String> e : params.entrySet()) {
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
			}
			sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:"+url);
		System.out.println("send_data:"+sb.toString());
		//尝试发送请求
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}

		//读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con
			.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
	
}
