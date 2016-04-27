package com.szfore.action.weixin.bean;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * 微信各类消息的公共部分
 */
public class WeixinMessage {
	private String toUserName;
	private String fromUserName;
	private String createTime;
	private String msgType;
	/**
	 * 开发者公共账号
	 */
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	
	/**
	 * 用户的微信openId
	 */
	public String getFromUserName() {
		return fromUserName;
	}
	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	
	/**
	 * 创建回复给用户的文本消息
	 */
	public ReplyTextMessage createReplyTextMessage(){
		ReplyTextMessage replyTextMsg=new ReplyTextMessage();
		replyTextMsg.setFromUserName(getToUserName());
		replyTextMsg.setToUserName(getFromUserName());
		return replyTextMsg;
	}
	
	
	
	/**
	 * 解析微信消息公共部分
	 * @throws DocumentException 
	 */
	public static WeixinMessage parse(String wx_xml_msg) throws DocumentException{
		WeixinMessage weixinMsg=new WeixinMessage();
		Document doc=DocumentHelper.parseText(wx_xml_msg);
		Element rootElt = doc.getRootElement();
		if(rootElt.element("ToUserName") != null){
			weixinMsg.setToUserName(rootElt.element("ToUserName").getTextTrim());
		}
		if(rootElt.element("FromUserName") != null){
			weixinMsg.setFromUserName(rootElt.element("FromUserName").getTextTrim());
		}
		if(rootElt.element("CreateTime") != null){
			weixinMsg.setCreateTime(rootElt.element("CreateTime").getTextTrim());
		}
		if(rootElt.element("MsgType") != null){
			weixinMsg.setMsgType(rootElt.element("MsgType").getTextTrim().toLowerCase());
		}
		return weixinMsg;
	}
	
}
