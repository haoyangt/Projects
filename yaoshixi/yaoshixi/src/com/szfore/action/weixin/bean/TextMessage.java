package com.szfore.action.weixin.bean;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
/**
 * 微信文本消息
 */
public class TextMessage extends WeixinMessage {
	private String content;
	private String msgId;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	
	
	/**
	 * 解析微信文本消息
	 * @throws DocumentException 
	 */
	public static TextMessage parse(String wx_xml_msg) throws DocumentException{
		TextMessage wechatMsg=new TextMessage();
		Document doc=DocumentHelper.parseText(wx_xml_msg);
		Element rootElt = doc.getRootElement();
		wechatMsg.setToUserName(rootElt.element("ToUserName").getTextTrim());
		wechatMsg.setFromUserName(rootElt.element("FromUserName").getTextTrim());
		wechatMsg.setCreateTime(rootElt.element("CreateTime").getTextTrim());
		wechatMsg.setMsgType(rootElt.element("MsgType").getTextTrim().toLowerCase());
		wechatMsg.setContent(rootElt.element("Content").getTextTrim());
		wechatMsg.setMsgId(rootElt.element("MsgId").getTextTrim());
		return wechatMsg;
	}
	
}
