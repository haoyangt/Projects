package com.szfore.utils;


import java.io.File;
import java.util.regex.Pattern;


import jodd.io.FileNameUtil;
import jodd.io.FileUtil;
import jodd.mail.Email;
import jodd.mail.EmailAttachment;
import jodd.mail.Pop3Server;
import jodd.mail.SendMailSession;
import jodd.mail.SimpleAuthenticator;
import jodd.mail.SmtpServer;
import jodd.mail.att.FileAttachment;


/**
 * 邮件工具类
 */
@SuppressWarnings("unused")
public class EmailSmtpSend {
	//邮件正则表达式
	private final static Pattern emailer = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
	
	private String smtpUrl;
	private String username;
	private String password;
	private SmtpServer smtpServer;
	
	public EmailSmtpSend(String smtpUrl,String username,String password){
		this.smtpUrl = smtpUrl;
		this.username = username;
		this.password = password;
		smtpServer = new SmtpServer(smtpUrl, new SimpleAuthenticator(username, password));
	}
	/**
	 * 判断是不是一个合法的电子邮件地址
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email){
		if(email == null || email.trim().length()==0) 
			return false;
	    return emailer.matcher(email).matches();
	}
	
	/**
	 * 发送普通邮件
	 * @param to        收件人地址
	 * @param subject   邮件主题
	 * @param content   邮件内容
	 */
	public void sendPlaintTextMail(String subject,String content,String... to){
		SendMailSession session = null;
		try {
			Email email = genPlaintEmail(subject, content, "UTF-8", to);
			session = smtpServer.createSession();
			session.open();
			session.sendMail(email);
		} finally{
			if(session != null){
				session.close();
			}
		}
	}
	/**
	 * 发送带附件邮件
	 * @param to          收件人
	 * @param subject     主题
	 * @param content     内容
	 * @param fileAttach  附件
	 */
	public void sendPlaintTextMailWithFileAttach(String subject,String content,String fileAttach,String... to){
		SendMailSession session = null;
		try {
			Email email = genPlaintEmailWithFileAttachment(subject, content, "UTF-8",fileAttach,to);
			session = smtpServer.createSession();
			session.open();
			session.sendMail(email);
		} finally{
			if(session != null){
				session.close();
			}
		}
	}
	/**
	 * 发送html格式的邮件
	 * @param to       收件人地址
	 * @param subject  邮件主题
	 * @param content  邮件内容
	 */
	public void sendHtmlMail(String subject,String html,String... to){
		SendMailSession session = null;
		try {
			Email email = genHtmlEmail(subject, html, "UTF-8",to);
			session = smtpServer.createSession();
			session.open();
			session.sendMail(email);
		} finally{
			if(session != null){
				session.close();
			}
		}
	}
	/**
	 * 发送带附件邮件
	 * @param to          收件人
	 * @param subject     主题
	 * @param content     内容
	 * @param fileAttach  附件
	 */
	public void sendHtmlMailWithFileAttach(String subject,String content,String fileAttach,String... to){
		SendMailSession session = null;
		try {
			Email email = genHtmlEmailWithFileAttachment(subject, content, "UTF-8",fileAttach,to);
			session = smtpServer.createSession();
			session.open();
			session.sendMail(email);
		} finally{
			if(session != null){
				session.close();
			}
		}
	}
	private Email genPlaintEmail(String subject,String content,String encoding,String... to){
		Email email = new Email();
		email.from(username).to(to).subject(subject)
			 .addText(content,encoding);
		return email;
	}
	//生成html邮件
	private Email genHtmlEmail(String subject,String htmlContent,String encoding,String... to){
		Email email = new Email();
		email.from(username).to(to).subject(subject).addHtml(htmlContent,encoding);
		return email;
	}
	private Email genPlaintEmailWithFileAttachment(String subject,String content,String encoding,String attachFile,String... to){
		Email email = genPlaintEmail(subject, content, encoding,to);
		File file = new File(attachFile);
		FileAttachment fileAttachment = new FileAttachment(new File(attachFile), file.getName(), file.getName());
		email.attach(fileAttachment);
		return email;
	}
	private Email genHtmlEmailWithFileAttachment(String subject,String htmlContent,String encoding,String attachFile,String... to){
		Email email = genHtmlEmail(subject, htmlContent, encoding, to);
		File file = new File(attachFile);
		FileAttachment fileAttachment = new FileAttachment(new File(attachFile), file.getName(), file.getName());
		email.attach(fileAttachment);
		return email;
	}
	
	public static void main(String[] args) {
		EmailSmtpSend ess = new EmailSmtpSend("smtp.ym.163.com", "it@szfore.com", "Szfore68638");
	    ess.sendHtmlMail("邮箱验证", "<a href='http://www.baidu.com' target='_blank'>http://www.baidu.com</a>", "wanglk@szfore.com");
	//	double registId = Math.random() * Math.random();
	//	System.out.println(MD5Util.getMD5(String.valueOf(registId)));
	}
}

