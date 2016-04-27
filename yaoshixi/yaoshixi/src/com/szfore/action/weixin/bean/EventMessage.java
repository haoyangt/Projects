package com.szfore.action.weixin.bean;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class EventMessage extends WeixinMessage{
	private String event;
	private String eventKey;
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getEventKey() {
		return eventKey;
	}
	public void setEventKey(String eventKey) {
		this.eventKey = eventKey;
	}
	
	/**
	 * 解析事件消息
	 * @throws DocumentException 
	 */
	public static EventMessage parse(String wx_xml_msg) throws DocumentException{
		EventMessage eventMsg=new EventMessage();
		Document doc=DocumentHelper.parseText(wx_xml_msg);
		Element rootElt = doc.getRootElement();
		eventMsg.setEvent(rootElt.element("Event").getTextTrim().toLowerCase());
		//eventMsg.setEventKey(rootElt.element("EventKey").getTextTrim());
		eventMsg.setFromUserName(rootElt.element("FromUserName").getTextTrim());
		eventMsg.setToUserName(rootElt.element("ToUserName").getTextTrim());
		eventMsg.setMsgType(rootElt.element("MsgType").getTextTrim().toLowerCase());
		eventMsg.setCreateTime(rootElt.element("CreateTime").getTextTrim());
		return eventMsg;
	}
	/**
	 * 解析菜单事件
	 * @throws DocumentException 
	 */
	public static EventMessage parseMenuEvent(String wx_xml_msg) throws DocumentException{
		EventMessage eventMsg=new EventMessage();
		Document doc=DocumentHelper.parseText(wx_xml_msg);
		Element rootElt = doc.getRootElement();
		eventMsg=parse(wx_xml_msg);
		eventMsg.setEventKey(rootElt.element("EventKey").getTextTrim());
		return eventMsg;
	}
	
}
