package com.szfore.action.weixin.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReplyImageMessage {
	private String toUserName;
	private String fromUserName;
	private String createTime;
	private String msgType;
	private List<Article> articleList=new ArrayList<Article>();
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
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
	
	public List<Article> getArticleList() {
		return articleList;
	}
	
	public String toString(){
		String xml="<xml>"+
				 "<ToUserName><![CDATA["+getToUserName()+"]]></ToUserName>"+
				 "<FromUserName><![CDATA["+getFromUserName()+"]]></FromUserName>"+
				 "<CreateTime>"+new Date().getTime()+"</CreateTime>"+
				 "<MsgType><![CDATA[news]]></MsgType>"+
				 "<ArticleCount>"+getArticleList().size()+"</ArticleCount>"+
				 "<Articles>";
				
				for (int i = 0; i < getArticleList().size(); i++) {
					ReplyImageMessage.Article article=getArticleList().get(i);
					xml+="<item>"+
						 "<Title><![CDATA["+article.getTitle()+"]]></Title>"+
						 "<Description><![CDATA["+article.getDescription()+"]]></Description>"+
						 "<PicUrl><![CDATA["+article.getPicUrl()+"]]></PicUrl>"+
						 "<Url><![CDATA["+article.getUrl()+"]]></Url>"+
						 "</item>";
				}
				 
				xml+="</Articles>"+
				 "<FuncFlag>1</FuncFlag>"+
				 "</xml>";
				return xml;
	}
	
	public Article createArticle(){
		return new Article();
	}

	/**
	 * 封装图文信息
	 */
	public class Article{
		private String title;
		private String description;
		private String picUrl;
		private String url;
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getPicUrl() {
			return picUrl;
		}
		public void setPicUrl(String picUrl) {
			this.picUrl = picUrl;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
	}
	
}
