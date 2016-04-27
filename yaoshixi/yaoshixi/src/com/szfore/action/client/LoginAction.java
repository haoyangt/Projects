package com.szfore.action.client;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginAction {
	@RequestMapping("/weixinLogin")
	public String weixinLogin(){ 
		String  GetCodeRequest = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=yejian#wechat_redirect";
		String corpId = "wxf59d12c60b5c355d";
		/*Map params=new HashMap();
		params.put("corpId", corpId);
		List<Map> list = loginMapper.findAuthority(params);*/
		//if(list.size()>=1){ 
			String REDIRECT_URIyz = "http://www.yaoshixi.com/requestView";
			 GetCodeRequest  = GetCodeRequest.replace("APPID", urlEnodeUTF8(corpId));
		     GetCodeRequest  = GetCodeRequest.replace("REDIRECT_URI",urlEnodeUTF8(REDIRECT_URIyz));
			 String url = GetCodeRequest;
			 System.out.println("url====="+url);
			 return "redirect:" + url;
		/*}else{
			return "loginApp";
		}*/
	}
	
	 public static String urlEnodeUTF8(String str){
	        String result = str;
	        try {
	            result = URLEncoder.encode(str,"UTF-8");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result;
		 }
}
