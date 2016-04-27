/*
 * $id$
 * Copyright (C) 2015 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.action.weixinYj;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.security.MessageDigest;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.szfore.action.weixinYj.weixin.AesException;
import com.szfore.action.weixinYj.weixin.WXBizMsgCrypt;
import com.szfore.mapper.JobMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.model.AccessToken;
import com.szfore.service.UserService;
import com.szfore.util.HttpUtil;
import com.szfore.utils.EnumMethod;
import com.szfore.utils.HttpRequestUtil;

/**
 * <p><br/>
 * @className WeixinAction.java<br/>
 * @packageName com.szfore.action.weixinYj<br/>
 * @date 2015-1-7 上午10:27:59<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
@Controller
@RequestMapping("/weixin")
public class WeixinAction {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	
	@Autowired 
	private JobMapper jobMapper;
	/**
	 * <p>开启回调模式验证方法<br/>
	 * @title t<br/>
	 * @date 2014-12-8 下午1:54:41<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param corpID
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/callback/{corpID}")
	public void t(@PathVariable("corpID") String corpID,HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException{
		/*List<Map> list = loginMapper.findBycorpID(corpID);
		String sToken = list.get(0).get("token").toString();
		System.out.println("sToken==="+sToken);
		String sEncodingAESKey = list.get(0).get("EncodingAESKey").toString();
		System.out.println("sEncodingAESKey==="+sEncodingAESKey);*/
		String sToken = "szfore";
		String sCorpID = "wx916479acee4084e2";
		String sEncodingAESKey = "QvJFsWus3ArFUaklrcsT5qvUgaomaScPccWoDeSNSwx";
		 // 微信加密签名 
        String sVerifyMsgSig = request.getParameter("msg_signature");
       // System.out.println("sVerifyMsgSig===="+sVerifyMsgSig);
        // 时间戳
        String sVerifyTimeStamp = request.getParameter("timestamp");
       // System.out.println("sVerifyTimeStamp===="+sVerifyTimeStamp);
        // 随机数
        String sVerifyNonce = request.getParameter("nonce");
        //System.out.println("sVerifyNonce===="+sVerifyNonce);
        // 随机字符串
        String sVerifyEchoStr = request.getParameter("echostr");
        //System.out.println("sVerifyEchoStr===="+sVerifyEchoStr);
        String sEchoStr; //需要返回的明文
        PrintWriter out = response.getWriter();  
        WXBizMsgCrypt wxcpt;
        try {
            wxcpt = new WXBizMsgCrypt(sToken, sEncodingAESKey, corpID);
            sEchoStr = wxcpt.VerifyURL(sVerifyMsgSig, sVerifyTimeStamp,sVerifyNonce, sVerifyEchoStr);
            System.out.println("verifyurl echostr: " + sEchoStr);
            // 验证URL成功，将sEchoStr返回
            out.print(sEchoStr);  
            out.close();
            out = null;
        } catch (AesException e1) {
            e1.printStackTrace();
        }
	}
	
	/**
	 * 获取access_token
	 * @param appid 凭证
	 * @param appsecret 密钥
	 * @return
	 */
	public String getAccessToken() {
		String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
		String appid = "wx916479acee4084e2";
		String appsecret = "fce2f0468dc63bf05ade483a08bd6931";
		String access_token = "";
		List<AccessToken> list = userService.getAccesstoin(appid);
		if(list.size()<1){
			String requestUrl = access_token_url.replace("APPID", appid).replace("APPSECRET", appsecret);
			JSONObject jsonObject = HttpRequestUtil.httpRequest(requestUrl, EnumMethod.GET.name(), null);
			System.out.println("access_token====="+jsonObject);
			access_token = jsonObject.getString("access_token");
			List<AccessToken> lists = userService.getAccesstoinByCorpId(appid);
			if(lists.size() >= 1){
				userService.updateAccesstion(access_token,new Date(),appid);
			}else{
				userService.addAccesstion(access_token,new Date(), appid);
			}
		}else{
			access_token = list.get(0).getToken();
		}
		return access_token;
	}
	
	
	
	public String getTicket(){
		String appid = "wx916479acee4084e2";
		String ticket = "";
		List<Map<String,Object>> list = userService.getTicket(appid);
		if(list.size()<1){
			String ACCESS_TOKEN = getAccessToken();
			String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
			url = url.replace("ACCESS_TOKEN", ACCESS_TOKEN);
			JSONObject jsonObject = HttpRequestUtil.httpRequest(url, EnumMethod.GET.name(), null);
			System.out.println("jsonObject======"+jsonObject);
			ticket = jsonObject.getString("ticket");
			userService.updateTicket(ticket,new Date(),appid);
		}else{
			ticket=list.get(0).get("ticket").toString();
		}
		return ticket;
	}
	
	/*public static void main(String[] args){
		 String jsapi_ticket = getTicket();
	        String url = "http://www.yaoshixi.com";
	        Map<String, String> ret = sign(jsapi_ticket, url);
	        for (Map.Entry entry : ret.entrySet()) {
	            System.out.println(entry.getKey() + ", " + entry.getValue());
	        }
	 }*/
	@RequestMapping("/approve")
	@ResponseBody
	public String approve(HttpServletRequest request){
		String url = request.getParameter("url");
		System.out.println("url===="+url);
		String jsapi_ticket = getTicket();
		String signature = "";
		String timestamp = "";
		String nonceStr = "";
		Map<String, String> ret = sign(jsapi_ticket, url);
        for (Map.Entry entry : ret.entrySet()) {
        	if("signature".equals(entry.getKey())){
        		signature = entry.getValue().toString();
        		System.out.println("signature====="+signature);
        	}
        	if("timestamp".equals(entry.getKey())){
        		timestamp = entry.getValue().toString();
        		System.out.println("timestamp====="+timestamp);
        	}
        	if("nonceStr".equals(entry.getKey())){
        		nonceStr = entry.getValue().toString();
        		System.out.println("nonceStr====="+nonceStr);
        	}
            //System.out.println(entry.getKey() + ", " + entry.getValue());
        }
		return "{\"signature\":\""+signature+"\",\"timestamp\":\""+timestamp+"\",\"nonceStr\":\""+nonceStr+"\"}";
	}
	 
	 public Map<String, String> sign(String jsapi_ticket, String url) {
	        Map<String, String> ret = new HashMap<String, String>();
	        String nonce_str = create_nonce_str();
	        String timestamp = create_timestamp();
	        //String nonce_str = "afdfa668-93cd-4ac4-adf3-57f5928696ae";
	        //String timestamp = "1422327482";
	        String string1;
	        String signature = "";

	        //注意这里参数名必须全部小写，且必须有序
	        string1 = "jsapi_ticket=" + jsapi_ticket +
	                  "&noncestr=" + nonce_str +
	                  "&timestamp=" + timestamp +
	                  "&url=" + url;
	        System.out.println(string1);

	        try{
	            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
	            crypt.reset();
	            crypt.update(string1.getBytes("UTF-8"));
	            signature = byteToHex(crypt.digest());
	        }catch (NoSuchAlgorithmException e){
	            e.printStackTrace();
	        }catch (UnsupportedEncodingException e){
	            e.printStackTrace();
	        }

	        ret.put("url", url);
	        ret.put("jsapi_ticket", jsapi_ticket);
	        ret.put("nonceStr", nonce_str);
	        ret.put("timestamp", timestamp);
	        ret.put("signature", signature);

	        return ret;
	    }
	 
	 
	 private String byteToHex(final byte[] hash) {
	        Formatter formatter = new Formatter();
	        for (byte b : hash){
	            formatter.format("%02x", b);
	        }
	        String result = formatter.toString();
	        formatter.close();
	        return result;
	    }

	    private String create_nonce_str() {
	        return UUID.randomUUID().toString();
	    }

	    private String create_timestamp() {
	        return Long.toString(System.currentTimeMillis() / 1000);
	    }
	    
	    
	 @RequestMapping("fenxcs/{userId}")
	 @ResponseBody
	 public String fenxcs(@PathVariable("userId") Integer userId){
		 userBasicInfoMapper.updateByUserIdFx(userId);
		 return "{\"msg\":\"ok\"}";
	 }
	 
	 
	 @RequestMapping("fenxcsJob/{jobId}")
	 @ResponseBody
	 public String fenxcsJob(@PathVariable("jobId") Integer jobId){
		 jobMapper.updateSharetimes(jobId);
		 return "{\"msg\":\"ok\"}";
	 }
	 
}
