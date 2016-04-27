package com.szfore.action.weixin.bean;

import java.util.Date;

/**
 * 回复给用户的文本消息
 * @author jk
 */
public class ReplyTextMessage {
	private String toUserName;
	private String fromUserName;
	private String createTime;
	private String msgType;
	private String content;
	private String funcFlag;
	/**
	 * 客户微信OpenId
	 */
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	/**
	 * 远界公共账号OpenId
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFuncFlag() {
		return funcFlag;
	}
	public void setFuncFlag(String funcFlag) {
		this.funcFlag = funcFlag;
	}
	public String toString(){
		String xml="<xml>"+
				 "<ToUserName><![CDATA["+getToUserName()+"]]></ToUserName>"+
				 "<FromUserName><![CDATA["+getFromUserName()+"]]></FromUserName>"+
				 "<CreateTime>"+new Date().getTime()+"</CreateTime>"+
				 "<MsgType><![CDATA[text]]></MsgType>"+
				 "<Content><![CDATA["+getContent()+"]]></Content>"+
				 "<FuncFlag>0</FuncFlag>"+
				 "</xml>";
		return xml;
	}
}
