package com.szfore.action.weixin.bean;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class LocationMessage extends WeixinMessage{
//	Location_X	 地理位置维度
//	Location_Y	 地理位置经度
//	Scale	 地图缩放大小
//	Label	 地理位置信息
//	MsgId	 消息id，64位整型
	private String location_X;
	private String location_Y;
	private String scale;
	private String label;
	private String msgId;
	
	public String getLocation_X() {
		return location_X;
	}

	public void setLocation_X(String location_X) {
		this.location_X = location_X;
	}

	public String getLocation_Y() {
		return location_Y;
	}

	public void setLocation_Y(String location_Y) {
		this.location_Y = location_Y;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	/**
	 * 解析事件消息
	 * @throws DocumentException 
	 */
	public static LocationMessage parse(String wx_xml_msg) throws DocumentException{
		LocationMessage eventMsg=new LocationMessage();
		Document doc=DocumentHelper.parseText(wx_xml_msg);
		Element rootElt = doc.getRootElement();
//		eventMsg.setEvent(rootElt.element("Event").getTextTrim().toLowerCase());
//		eventMsg.setEventKey(rootElt.element("EventKey").getTextTrim());
		eventMsg.setFromUserName(rootElt.element("FromUserName").getTextTrim());
		eventMsg.setToUserName(rootElt.element("ToUserName").getTextTrim());
		eventMsg.setMsgType(rootElt.element("MsgType").getTextTrim().toLowerCase());
		eventMsg.setCreateTime(rootElt.element("CreateTime").getTextTrim());
		eventMsg.setLocation_X(rootElt.element("Location_X").getTextTrim());
		eventMsg.setLocation_Y(rootElt.element("Location_Y").getTextTrim());
		eventMsg.setScale(rootElt.element("Scale").getTextTrim());
		eventMsg.setLabel(rootElt.element("Label").getTextTrim());
		eventMsg.setMsgId(rootElt.element("MsgId").getTextTrim());
		return eventMsg;
	}
	
}
