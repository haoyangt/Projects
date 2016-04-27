/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
/**
 * <p><br/>
 * @className SendCloudEmail.java<br/>
 * @packageName com.szfore.utils<br/>
 * @date 2014-6-10 上午10:54:22<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class SendCloudEmail {

	public void SendCloudEmailHtml(String subject,String html,String to) throws ClientProtocolException, IOException {
		String url = "https://sendcloud.sohu.com/webapi/mail.send.xml";
		HttpClient httpclient = new DefaultHttpClient();
		// httpclient = wrapHttpClient(httpclient);
		HttpPost httpost = new HttpPost(url);

		List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
                //不同于登录SendCloud站点的帐号，您需要登录后台创建发信子帐号，使用子帐号和密码才可以进行邮件的发送。
		nvps.add(new BasicNameValuePair("api_user", "postmaster@yaoshixi.sendcloud.org"));
		nvps.add(new BasicNameValuePair("api_key", "3vXF1US3sEYWCBTU"));
		nvps.add(new BasicNameValuePair("from", "cv@yaoshixi.com"));
		nvps.add(new BasicNameValuePair("to", to));
		nvps.add(new BasicNameValuePair("subject", subject));
		nvps.add(new BasicNameValuePair("html", html));

		httpost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
		// 请求
		HttpResponse response = httpclient.execute(httpost);
		// 处理响应
		if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) { // 正常返回
			// 读取xml文档
			String result = EntityUtils.toString(response.getEntity());
			System.out.println(result);
		} else {
			System.err.println("error");
		}
	}
}
