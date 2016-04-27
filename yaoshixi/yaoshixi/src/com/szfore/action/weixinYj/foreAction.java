package com.szfore.action.weixinYj;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jodd.util.Base64;




import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.dom4j.DocumentException;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.szfore.action.company.vo.CompanyJob;
import com.szfore.action.weixin.bean.EventMessage;
import com.szfore.action.weixin.bean.LocationMessage;
import com.szfore.action.weixin.bean.ReplyImageMessage;
import com.szfore.action.weixin.bean.ReplyTextMessage;
import com.szfore.action.weixin.bean.TextMessage;
import com.szfore.action.weixin.bean.WeixinMessage;
import com.szfore.model.AccessToken;
import com.szfore.model.CompanyInfo;
import com.szfore.model.Job;
import com.szfore.model.Login;
import com.szfore.model.UserBasicInfo;
import com.szfore.model.UserFeedback;
import com.szfore.plugin.Page;
import com.szfore.service.CompanyService;
import com.szfore.service.JobService;
import com.szfore.service.UserService;
import com.szfore.service.WxService;
import com.szfore.utils.EnumMethod;
import com.szfore.utils.HttpRequestUtil;

/**
 * 要实习公共账号后台
 */
// @WebServlet(description = "要实习公共账号后台", urlPatterns = { "/weixinYj" })

public class foreAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Logger log = Logger.getLogger(this.getClass());
	private static String areas[] = new String[] { "福田", "罗湖", "南山", "盐田",
			"宝安", "龙岗", "光明", "坪山", "龙华", "大鹏",
			"越秀","海珠","荔湾","天河","白云","黄埔","花都","番禺","萝岗","南沙","从化","增城" };
	private static String citys[] = new String[] { "广州", "深圳"};

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String echo = request.getParameter("echostr");
		System.out.println(echo+"333");
		pw.println(echo);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String wxMsgXml = getPostContent(request);
		ServletContext servletContext = request.getSession().getServletContext();
		//System.out.println("接收到的xml：" + wxMsgXml);
		PrintWriter pw = response.getWriter();
		try {
			WeixinMessage weixinMsg = WeixinMessage.parse(wxMsgXml); // 解析微信消息公共部分
			String wxId = weixinMsg.getFromUserName(); // 获取微信账号
			if(wxId != null ){
				//System.out.println("wxId00=="+wxId);
				session.setAttribute("wxId", wxId); // 存取微信id
				setSessionValue(wxId, servletContext, session); // 查看微信账号有无绑定用户
			}
			if ("event".equals(weixinMsg.getMsgType())) {
				EventMessage eventMsg = EventMessage.parse(wxMsgXml);
				if ("subscribe".equals(eventMsg.getEvent())) {// 订阅
					about(weixinMsg, request,session, pw);
				}else if ("click".equals(eventMsg.getEvent())) {// 点击菜单
					eventMsg = EventMessage.parseMenuEvent(wxMsgXml);
					if("AssociatedUser".equals(eventMsg.getEventKey())) {// 绑定用户
						ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
						if (session.getAttribute("userId") == null) {
							replyTxtMsg.setContent("还没有绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/user/wxLogin/"
											+wxId+"\'>点击绑定</a>");
						}else {
							replyTxtMsg.setContent("亲，你已绑定要实习账号了哦！\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
									+ weixinMsg.getFromUserName()+"\'>点击重新绑定。</a>");
						}
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
					}else if("myResume".equals(eventMsg.getEventKey())){
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+"\'>点 击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						resumeWx(weixinMsg, request,session, pw,wxId);
					}else if("Recruitment".equals(eventMsg.getEventKey())){//微招聘
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						release(weixinMsg, request,session, pw,wxId);
					}else if("resume".equals(eventMsg.getEventKey())){//收到的简历
						/*receiveResume(weixinMsg,request, session,pw);*/
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+"\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						shouDaoResume(weixinMsg, request,session, pw,wxId);
					}else if("MyDropJob".equals(eventMsg.getEventKey())){//我投递的职位
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+"\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						/*searchUserJobs(weixinMsg, request, session, pw);*/
						deliveryStatus(weixinMsg, request,session, pw,wxId);//投递状态
					}else if("MyJob".equals(eventMsg.getEventKey())){//我发布的职位
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						/*getPublishJobs(weixinMsg,request, session,pw);*/
						releasedPosition(weixinMsg, request,session, pw,wxId);
					}else if("invite".equals(eventMsg.getEventKey())){//邀请我的职位
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						/*searchUserInterview(weixinMsg, request, session, pw);*/
						jobInvite(weixinMsg, request,session, pw,wxId);
					}else if("jobIntension".equals(eventMsg.getEventKey())){
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("请先绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+"\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						jobIntension(weixinMsg, request,session, pw);
					}else if ("LatestJobs".equals(eventMsg.getEventKey())) {// 最新职位
						searchAllJobs(eventMsg, request, pw);
					}else if ("PopularPosts".equals(eventMsg.getEventKey())) {// 热门职位
						getPopularPosts(Integer.valueOf(session.getAttribute("userId").toString()),eventMsg, request, pw);
					}else if ("JobsRecommend".equals(eventMsg.getEventKey())) {// 向我推荐
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("没有找到相关的职位信息，请先绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						RecommendJobsToMe(eventMsg, request, session, pw);
					}else if("loginFind".equals(eventMsg.getEventKey())){//登入网站查询职位
						if (session.getAttribute("userId") != null) {
							Integer userId = (Integer) session.getAttribute("userId");
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("登陆官网查看更多职位信息\n <a href=\'http://www.yaoshixi.com/user/loginFind/"
									+userId+"\'>点击进入</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
					}else if("sonKindle".equals(eventMsg.getEventKey())){//送kindle活动
						ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
						replyTxtMsg.setContent("要实习线上活动送kindle啦！\n <a href=\'http://www.yaoshixi.com/seajs/index.jsp\'>"
								+"http://www.yaoshixi.com/seajs/index.jsp</a>");
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					}else if ("MyRecommends".equals(eventMsg.getEventKey())) {// 我的投递
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("没有找到你投递的职位信息，请先绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						//searchUserJobs(eventMsg, request, session, pw);
					} else if ("help".equals(eventMsg.getEventKey())) {// 使用帮助
						ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
						String contents = "【绑定账号】\n回复“绑定”，建立要实习™账号和微信号关联\n"
								+ "【查询职位】\n回复职位关键字，查找目标职位信息\n"
								+ "【通过位置找职位】\n使用微信辅助功能，插入你的“位置”，查找附近的实习\n\n"
								+ "为了方便您投递简历，我们建议您在使用之前绑定要实习账号。\n"
								+"<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
								+ weixinMsg.getFromUserName()+ "\'>点击绑定</a>";
						replyTxtMsg.setContent(contents);
						pw.println(replyTxtMsg.toString());
					} else if ("ContactUs".equals(eventMsg.getEventKey())) {// 联系我们
						ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
						String contents = "客服邮箱：cs@yaoshixi.com \n"
								+ "商务合作：bc@yaoshixi.com \n"
								+ "企业HR合作：hr@yaoshixi.com \n" 
								+"联系方式\n 地址：深圳市福田区深南路与彩田路交汇处东方新天地广场第一栋C座6层605B";
						replyTxtMsg.setContent(contents);
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
					} else if ("InterviewNotice".equals(eventMsg.getEventKey())) {// 面试通知
						if (session.getAttribute("userId") == null) {
							ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
							replyTxtMsg.setContent("你还没有绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
											+ weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						//searchUserInterview(eventMsg, request, session, pw);
					} else if ("UserFeedback".equals(eventMsg.getEventKey())) {// 用户反馈
						String contents = "请输入你的反馈，格式：发送“反馈+内容”，例如“反馈不能投递简历”";
						ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
						if (session.getAttribute("userId") == null) {
							contents = "您还没有绑定要实习账号。\n<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
									+ weixinMsg.getFromUserName()+ "\'>点击绑定</a>";
						}
						replyTxtMsg.setContent(contents);
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					}else if ("EnterprisePort".equals(eventMsg.getEventKey())) {// 面试通知
						ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
						String msg="回复以下数字继续\n"+"1、发布新职位\n"+"2、收到的简历";
						if (session.getAttribute("userId") == null ) {
							msg="还没有绑定要实习账号。\n<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
									+weixinMsg.getFromUserName()+"\'>"+"点击绑定"+"</a>";
						}else if( !(session.getAttribute("roleId").toString().equals("1"))){
							msg="你不是企业用户。\n<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
									+weixinMsg.getFromUserName()+"\'>"+"点击绑定企业用户</a>";
						}else{
							ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
							CompanyService companyService=(CompanyService)ctx.getBean("companyService");
							//根据企业用户获取companyId
							CompanyInfo companyInfo=companyService.getCompanyInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
							if(companyInfo == null){
								replyTxtMsg.setContent("没有找到你的公司信息。");
								pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
								return;
							}
						}
						replyTxtMsg.setContent(msg);			
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					 }
				}
			}else if ("text".equals(weixinMsg.getMsgType())) {
				TextMessage receivedTextMsg = TextMessage.parse(wxMsgXml);// 解析微信文本消息
				if ("绑定".equals(receivedTextMsg.getContent())) {
					ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
					if (session.getAttribute("userId") == null) {
						replyTxtMsg.setContent("还没有绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
										+weixinMsg.getFromUserName()+"\'>点击绑定</a>");
					} else {
						replyTxtMsg.setContent("亲，你已绑定要实习账号了哦！\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
										+weixinMsg.getFromUserName()+"\'>点击重新绑定。</a>");
					}
					pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
					return;
				} else if (receivedTextMsg.getContent().startsWith("反馈")) {
					ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
					WxService wxService = (WxService) ctx.getBean("wxService");
					UserFeedback userFeedback = new UserFeedback();
					userFeedback.setUserId(Integer.parseInt(session.getAttribute("userId").toString()));
					userFeedback.setContent(receivedTextMsg.getContent().substring(2));
					wxService.insertUserFeedback(userFeedback); // 保存反馈信息

					ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
					replyTxtMsg.setContent("您的反馈我们已经收到，我们会尽快回复，谢谢。");
					pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
					return;
				}else if ("2".equals(receivedTextMsg.getContent())) {
					ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
					if (session.getAttribute("userId") == null) {
						replyTxtMsg.setContent("还没有绑定要实习账号。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
										+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					}else if( !(session.getAttribute("roleId").toString().equals("1"))){
						String msg="你不是企业用户。\n <a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
								+ weixinMsg.getFromUserName()+ "\'>点击绑定企业用户</a>";
						replyTxtMsg.setContent(msg);
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					}else{
						ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
						CompanyService companyService=(CompanyService)ctx.getBean("companyService");
						//根据企业用户获取companyId
						CompanyInfo companyInfo=companyService.getCompanyInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
						if(companyInfo == null){
							replyTxtMsg.setContent("没有找到你的公司信息。");
							pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
							return;
						}
						getPublishJobs(receivedTextMsg,request, session,pw);
						return;
					}
				}else if ("1".equals(receivedTextMsg.getContent())) {
					ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
					if (session.getAttribute("userId") == null) {
						replyTxtMsg.setContent("还没有绑定要实习账号。\n<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
								+weixinMsg.getFromUserName()+ "\'>点击绑定</a>");
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					}else if( !(session.getAttribute("roleId").toString().equals("1"))){
						String msg="你不是企业用户。\n<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
								+weixinMsg.getFromUserName()+"\'>点击绑定企业用户</a>";
						replyTxtMsg.setContent(msg);
						pw.println(replyTxtMsg.toString());// 回复给微信用户一个带链接的文本消息
						return;
					}else{
						ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
						CompanyService companyService=(CompanyService)ctx.getBean("companyService");
						//根据企业用户获取companyId
						CompanyInfo companyInfo=companyService.getCompanyInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
						String msg="<a href=\'http://www.yaoshixi.com/wx/wxpostjob/"
						+Integer.parseInt(session.getAttribute("userId").toString())+"\'>点我去发布</a>";
						if(companyInfo == null){
							msg="没有找到你的公司信息。";
						}
						replyTxtMsg.setContent(msg);// 回复给微信用户一个带链接的文本消息
						pw.println(replyTxtMsg.toString());
						return;
					}
				}else if("szFore".equals(receivedTextMsg.getContent())){
					ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
					String msg = "发布闪聘：<a href=\'http://www.yaoshixi.com/user/flashHire/"+session.getAttribute("userId")+"\'>点击发布</a>\n\n"
							+"发布微简历：<a href=\'http://www.yaoshixi.com/user/resumeWx/"+session.getAttribute("userId")+"\'>点击编辑</a>\n\n"
							+"";
					replyTxtMsg.setContent(msg);// 回复给微信用户一个带链接的文本消息
					pw.println(replyTxtMsg.toString());
					return;
				}else if("MyDropJob".equals(receivedTextMsg.getContent())){//我投递的职位
					searchUserJobs(receivedTextMsg, request, session, pw);
				}else if("MyJob".equals(receivedTextMsg.getContent())){//我发布的职位
					getPublishJobs(receivedTextMsg,request, session,pw);
				}else if("invite".equals(receivedTextMsg.getContent())){//邀请我的职位
					searchUserInterview(receivedTextMsg, request, session, pw);
				}else if("resume".equals(receivedTextMsg.getContent())){//收到的简历
					receiveResume(receivedTextMsg,request, session,pw);
				}
				Pattern pattern = Pattern.compile("[0-9]*"); 
				if(pattern.matcher(receivedTextMsg.getContent()).matches()){
					searchJobById(receivedTextMsg, request, pw);
				}
				searchJob(receivedTextMsg, request, pw);// 按职位查询工作信息
			}else if("location".equals(weixinMsg.getMsgType())) {
				LocationMessage locMsg = LocationMessage.parse(wxMsgXml);
				serachJobsByLocation(locMsg, request, pw);// 按地理位置查询工作信息
			}
		}catch (DocumentException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}

	/**
	 * 按关键字查询职位
	 * @param txtMsg
	 * @param request
	 * @param pw
	 */
	private void searchJob(TextMessage txtMsg, HttpServletRequest request,
			PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		JobService service = (JobService) ctx.getBean("jobService");
		CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(1, 6, null);
		List<Map<String, Object>> jobList = (service.searhJobsByTerm(null, txtMsg.getContent(), "", "", "", "", "", "", page)).getResults();
		if (jobList == null || jobList.isEmpty()) {
			ReplyTextMessage replyTxtMsg = txtMsg.createReplyTextMessage();
			replyTxtMsg.setContent("没有找到任何职位");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(txtMsg.getToUserName());
		replyImgMsg.setToUserName(txtMsg.getFromUserName());

		for (int i = 0; i < jobList.size(); i++) {
			Map<String,Object> job = jobList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobName").toString());
			// companyId
			String companyId = job.get("companyId").toString();// 获取职位公司id
			// System.out.println(companyId);
			CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = "";
			if(companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}
			if(companyLogo != null && !("".equals(companyLogo))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			}else{
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if(request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/"+"jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString()) + "/0");// 点击图文消息跳转链接
			}else{
				article.setUrl("http://"+ request.getServerName()+ "/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+ "/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}

	private void searchJobById(TextMessage txtMsg, HttpServletRequest request,
			PrintWriter pw){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		JobService service = (JobService) ctx.getBean("jobService");
		//CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		Map<String,Object> job = service.findJobDetailById(Integer.valueOf(txtMsg.getContent()));
		if (job == null || job.isEmpty()) {
			ReplyTextMessage replyTxtMsg = txtMsg.createReplyTextMessage();
			replyTxtMsg.setContent("没有找到任何职位");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(txtMsg.getToUserName());
		replyImgMsg.setToUserName(txtMsg.getFromUserName());

			ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobName").toString());
			// companyId
			// System.out.println(companyId);
			String companyLogo = "";
			if(job.get("companyLogo") != null) {
				companyLogo = job.get("companyLogo").toString(); // 获取公司logo
			}
			if(companyLogo != null && !("".equals(companyLogo))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			}else{
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if(request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/"+"jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString()) + "/0");// 点击图文消息跳转链接
			}else{
				article.setUrl("http://"+ request.getServerName()+ "/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+ "/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		pw.println(replyImgMsg.toString());
	}
	
	
	private void receiveResume(WeixinMessage weixinMsg,
			HttpServletRequest request, HttpSession session, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		UserService userService = (UserService) ctx.getBean("userService");
		List<Map<String,Object>> list = userService.getReceiveResume(userId);
		
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();// 创建回复给用户的文本消息
		
		String count = "";
		if(list.size()<1){
			count = "您还没发布职位！";
		}else{
			for(int i=0;i<list.size();i++){
				if(i>0){
					int j=i-1;
					if(list.get(i).get("jobName").equals(list.get(j).get("jobName"))){
						count = count +list.get(i).get("userName")+"  投递的简历，" +
								"<a href=\'http://www.yaoshixi.com/user/findUserWeixinById/"+list.get(i).get("userId")+"\'>点击查看</a>\n\n";
					}else{
						count = count +"您发布的    "+list.get(i).get("jobName")+"  职位收到："
								+list.get(i).get("userName")+"  投递的简历，" +
								"<a href=\'http://www.yaoshixi.com/user/findUserWeixinById/"+list.get(i).get("userId")+"\'>点击查看</a>\n\n";
					}
				}else{	
					count = count +"您发布的    "+list.get(i).get("jobName")+"  职位收到："
							+list.get(i).get("userName")+"  投递的简历，" +
							"<a href=\'http://www.yaoshixi.com/user/findUserWeixinById/"+list.get(i).get("userId")+"\'>点击查看</a>\n\n";
				}	
			}
		}
		replyTxtMsg.setContent(count);// 回复给微信用户一个带链接的文本消息
		pw.println(replyTxtMsg.toString());
	}
	
	private void shouDaoResume(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		UserService userService = (UserService) ctx.getBean("userService");
		List<Map<String,Object>> list = userService.getReceiveResume(userId);
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(list.size()>0){
			StringBuffer text = new StringBuffer();
			text.append("收到的简历！\n\n");
			text.append("<a href=\'http://www.yaoshixi.com/user/receivedResume/"+userId+"\'>查看      </a>");
			replyTxtMsg.setContent(text.toString());
		}else{
			StringBuffer text2 = new StringBuffer();
			text2.append("您还没有收到的简历！\n\n");
			replyTxtMsg.setContent(text2.toString());
		}
		pw.println(replyTxtMsg.toString());
	}
	
	/**
	 * <p>我投递的简历<br/>
	 * @title deliveryStatus<br/>
	 * @date 2015-3-20 上午10:35:02<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param weixinMsg
	 * @param HttpServletRequest
	 */
	private void deliveryStatus(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		Page<Map<String,Object>> page = new Page<Map<String,Object>>(1, 6, null);
		UserService userService = (UserService) ctx.getBean("userService");
		List<Map<String,Object>> list = userService.getUserJobs(userId,page);
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(list.size()>0){
			StringBuffer text = new StringBuffer();
			text.append("我投递的职位！\n\n");
			text.append("<a href=\'http://www.yaoshixi.com/deliveryStatus/"+userId+"/"+wxId+"\'>查看      </a>");
			replyTxtMsg.setContent(text.toString());
		}else{
			StringBuffer text2 = new StringBuffer();
			text2.append("您还没有投递简历！\n\n");
			replyTxtMsg.setContent(text2.toString());
		}
		pw.println(replyTxtMsg.toString());
	}
	
	/**
	 * <p>我的邀请通知<br/>
	 * @title jobInvite<br/>
	 * @date 2015-3-20 下午12:13:18<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param weixinMsg
	 * @param request
	 * @param session
	 * @param pw
	 * @param wxId
	 */
	private void jobInvite(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		UserService userService = (UserService) ctx.getBean("userService");
		List<Map<String, Object>> list = userService.findInterByUserId(userId);
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(list.size()>0){
			StringBuffer text = new StringBuffer();
			text.append("我的面试通知！\n\n");
			String status="";
			for(int i=0;i<list.size();i++){
				if("0".equals(list.get(i).get("status").toString())){
					status="未查看";
				}else{
					status="已查看";
				}
				text.append(list.get(i).get("companyName")+"\n" +
						"邀请你面试："+list.get(i).get("jobName")+"("+status+")\n\n");
				text.append("<a href=\'http://www.yaoshixi.com/interviewNoticeById/"+list.get(i).get("id")+"\'>查看</a>\n\n");
			}
			replyTxtMsg.setContent(text.toString());
		}else{
			StringBuffer text2 = new StringBuffer();
			text2.append("暂时还没有伯乐发现你，快快分享简历，让大家刮目相看吧！\n\n");
			replyTxtMsg.setContent(text2.toString());
		}
		pw.println(replyTxtMsg.toString());
	}
	
	
	/**
	 * 按地理位置查询职位
	 * @param locMsg
	 * @param request
	 * @param pw
	 */
	private void serachJobsByLocation(LocationMessage locMsg,
			HttpServletRequest request, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		JobService service = (JobService) ctx.getBean("jobService");
		CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(1, 6, null);
		List<Map<String, Object>> jobList = null;
		// 解析位置信息
		String locInfo = locMsg.getLabel(); // 获取位置信息
		for (String area : areas) {
			if ((locInfo.indexOf(area)) != -1) {// 按区域查询
				jobList = (service.searhJobsByLoctionForWx(null,"","",area,"","","","","", page)).getResults();
			}
		}
		if (jobList == null || jobList.size() == 0) {
			for (String city : citys) {// 按城市查询
				if ((locInfo.indexOf(city)) != -1) {
					jobList = (service.searhJobsByLoctionForWx(null,"",city,"","","","","","", page)).getResults();
				}
			}
		}
		if (jobList == null || jobList.isEmpty() || jobList.size() == 0) {
			ReplyTextMessage replyTxtMsg = locMsg.createReplyTextMessage();
			replyTxtMsg.setContent("没有找到任何职位");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(locMsg.getToUserName());
		replyImgMsg.setToUserName(locMsg.getFromUserName());

		for (int i = 0; i < jobList.size(); i++) {
			Map<String,Object> job = jobList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage()
					.createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobName").toString());
			String companyId = job.get("companyId").toString();// 获取职位公司id
			CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = "";
			if (companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}
			if (companyLogo != null && !(companyLogo.equals(""))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			} else {
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if (request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/"+"jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString()) + "/0");// 点击图文消息跳转链接
			} else {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}
	/**
	 * <p>刚关注的文字提示<br/>
	 * @title about<br/>
	 * @date 2015-1-23 上午10:19:47<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	private void about(WeixinMessage weixinMsg, HttpServletRequest request,
			HttpSession session,PrintWriter pw) {
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		//String wxId = weixinMsg.getFromUserName();
		//Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		//System.out.println("刚关注的wxId====="+wxId);
		/*String contents = "欢迎关注要实习™微信公众账号，要实习™旨在为广深两地在校大学生搭建一个寻找实习机会的平台，引领您成长为职业精英！"
				+ "以下指引可以帮助你更好地使用要实习™公众账号的功能:\n"
				+"【绑定账号】：回复“绑定”，建立要实习™账号和微信号关联\n"
				+ "【查询职位】：回复职位关键字，查找目标职位信息\n"
				+ "【通过位置找职位】：使用微信辅助功能，插入你的“位置”，查找附近的实习\n"
				+ "为了方便您投递简历，我们建议您在使用之前绑定要实习账号。\n"
				+"<a href=\'http://www.yaoshixi.com/openLogin/wxLogin.jsp?fromUserName="
				+ weixinMsg.getFromUserName() + "\'>" + "点击绑定" + "</a>"
				+"<a href=\'http://www.yaoshixi.com\'>" + "访问要实习官网" + "</a>";*/
		String contents = "终于等到你，还好我没放弃！\n\n"
				+"点击右下角【要实习】：\n"
				+"60秒搞定简历漂流瓶，发出去让全世界帮你找工作！\n\n"
				+"点击左下角【要招聘】：\n"
				+"手机上的闪聘会，坐等人才到碗里来！";
				/*"<a href=\'http://www.yaoshixi.com/user/resumeWx/"+userId+"/"+wxId+"\'>立刻获得微简历</a>";*/
		replyTxtMsg.setContent(contents);
		pw.println(replyTxtMsg.toString());

	}
	/**
	 * 获取热门职位
	 * @param eventMsg
	 * @param request
	 * @param pw
	 */
	private void getPopularPosts(Integer userId,EventMessage eventMsg,
			HttpServletRequest request, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(request.getSession()
						.getServletContext());
		JobService service = (JobService) ctx.getBean("jobService");
		CompanyService companyService = (CompanyService) ctx
				.getBean("companyService");
		Page<Map<String,Object>> page = new Page<Map<String,Object>>(1, 6, null);
//		List<Map<String, Object>> jobList = service
//				.searhJobsByKeyword("", page);
		List<Map<String, Object>> jobList=service.getPopularJobsForWx(userId,page);
		if (jobList == null || jobList.isEmpty()) {
			ReplyTextMessage replyTxtMsg = eventMsg.createReplyTextMessage();
			replyTxtMsg.setContent("没有找到任何职位");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(eventMsg.getToUserName());
		replyImgMsg.setToUserName(eventMsg.getFromUserName());

		for (int i = 0; i < jobList.size(); i++) {
			Map<String,Object> job = jobList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage()
					.createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobDesc").toString());
			// companyId
			String companyId = job.get("companyId").toString();// 获取职位公司id
			// System.out.println(companyId);
			CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = "";
			if (companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}
			if (companyLogo != null && !(companyLogo.equals(""))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			} else {
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if (request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/0");// 点击图文消息跳转链接
			} else {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}

	/**
	 * <p>发布职位<br/>
	 * @title release<br/>
	 * @date 2015-1-23 上午10:19:14<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	private void release(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		/*ApplicationContext ctx = WebApplicationContextUtils.
				getWebApplicationContext(request.getSession().getServletContext());*/
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		//UserService userService = (UserService) ctx.getBean("userService");
		//List<Map<String, Object>> list = userService.findCompanyByUid(userId);
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		//if(list.size()>0){
			/*System.out.println("发布职位companyId===="+list.get(0).get("companyId"));
			System.out.println("发布职位userId======"+list.get(0).get("id"));*/
		System.out.println("点击发布职位wxId====="+wxId);
			StringBuffer text = new StringBuffer();
			text.append("现在你可以发布招聘职位了！\n\n");
			text.append("<a href=\'http://www.yaoshixi.com/user/flashHire/"+userId+"\'>招聘实习生</a>");
			text.append("\n\n<a href=\'http://www.yaoshixi.com/openLogin/wxBdingSuccess.jsp\'>招聘正式员工</a>");
			//text.append("<a href=\'http://www.yaoshixi.com/user/flashHire/"+list.get(0).get("companyId")+"/"+list.get(0).get("id")+"\'>发布职位</a>");
			replyTxtMsg.setContent(text.toString());
		/*}else{
			StringBuffer text = new StringBuffer();
			text.append("您不是企业用户或企业没有通过审核，暂不能发布职位！请联系要实习\ncs@yaoshixi.com");
		}*/
		pw.println(replyTxtMsg.toString());
	}
	
	/**
	 * <p>我的简历<br/>
	 * @title resumeWx<br/>
	 * @date 2015-1-23 上午10:18:32<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	private void resumeWx(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		ApplicationContext ctx = WebApplicationContextUtils.
				getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		UserService userService = (UserService) ctx.getBean("userService");
		Map<String, Object> map = userService.findByUserId(userId,"1");
		UserBasicInfo basicInfo = userService.findUserBasicInfoByUserId(userId);
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(map.get("userBasicInfo")!=null && map.get("education")!=null){
			/*String gender="";
			UserBasicInfo userInfo = (UserBasicInfo)map.get("userBasicInfo");
			if(userInfo.getGender()==0){
				gender="男";
			}else{
				gender="女";
			}
			EducationExperience educationExperience = (EducationExperience) map.get("education");
			String education="";
			if ("2".equals(educationExperience.getEducation())) {
				education="高中";
			} else if ("3".equals(educationExperience.getEducation())) {
				education="专科";
			} else if ("4".equals(educationExperience.getEducation())) {
				education="本科";
			} else if ("5".equals(educationExperience.getEducation())) {
				education="硕士";
			} else if ("6".equals(educationExperience.getEducation())) {
				education="博士";
			}*/
			
			StringBuffer text = new StringBuffer();
			/*text.append("姓名："+userInfo.getUserName()).append("\n");
			text.append("性别："+gender).append("\n");
			text.append("联系电话："+userInfo.getTelPhone()).append("\n");
			text.append("联系邮箱："+userInfo.getEmail()).append("\n");
			text.append("学校："+educationExperience.getUniversity()).append("\n");
			text.append("学历："+education).append("\n");
			text.append("专业："+educationExperience.getMajor()).append("\n");
			text.append("希望工作城市："+userInfo.getJobCity()).append("\n");
			text.append("\n<a href=\'http://www.yaoshixi.com/user/resumeWx/"+userId+"/"+wxId+"\'>修改简历</a>");*/
			text.append("每一天都是新的自己，简历漂流瓶和你一起！\n\n");
			text.append("<a href=\'http://www.yaoshixi.com/user/resumeWx/"+userId+"\'>更新      </a>");
			text.append("<a href=\'http://www.yaoshixi.com/user/findUserWeixinById/"+userId+"\'>分享     </a>");
			if(basicInfo != null){
				if(basicInfo.getExpose()==1){
					text.append("<a href=\'http://www.yaoshixi.com/reumerStop/"+userId+"/2\'>开始漂流</a>");
				}else{
					text.append("<a href=\'http://www.yaoshixi.com/reumerStop/"+userId+"/1\'>停止漂流</a>");
				}
			}
			replyTxtMsg.setContent(text.toString());
		}else{
			StringBuffer text = new StringBuffer();
			text.append("60秒搞定酷炫微简历，发出去让全世界帮你找工作！").append("\n\n");
			text.append("<a href=\'http://www.yaoshixi.com/user/resumeWx/"+userId+"\'>立刻拥有微简历</a>");
			replyTxtMsg.setContent(text.toString());
		}
		pw.println(replyTxtMsg.toString());
	}
	/**
	 * <p>查看我发布的职位<br/>
	 * @title releasedPosition<br/>
	 * @date 2015-3-17 上午11:38:34<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param weixinMsg
	 * @param request
	 * @param session
	 * @param pw
	 * @param wxId
	 */
	private void releasedPosition(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		CompanyInfo companyInfo=companyService.getCompanyInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
		/*Page<CompanyJob> page = new Page<CompanyJob>(1, 5, null);
		List<CompanyJob> list = companyService.listWeixJobs(companyInfo.getId(), 1, page);*/
		List<Job> list = companyService.findJobByCid(companyInfo.getId());
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(companyInfo != null){
			if(list.size()>0){
				StringBuffer text = new StringBuffer();
				text.append("我发布的职位:\n\n");
				for(int i=0;i<list.size();i++){
					text.append(list.get(i).getJobName()+"\n(阅读数:"+list.get(i).getPageView()+"；分享数:"+list.get(i).getSharetimes()+") ");
					text.append("\n<a href=\'http://www.yaoshixi.com/user/jobDetailWeix/"+list.get(i).getId()+"\'>查看</a>         " +
							"<a href=\"http://www.yaoshixi.com/user/jobDetailWeixYl/"+list.get(i).getId()+"/"+wxId+"\">修改</a>\n\n");
				}
				replyTxtMsg.setContent(text.toString());
			}else{
				StringBuffer text = new StringBuffer();
				text.append("您还没有发布职位！").append("\n\n");
				text.append("<a href=\'http://www.yaoshixi.com/user/flashHire/"+userId+"\'>立刻创建</a>");
				replyTxtMsg.setContent(text.toString());
			}
		}else{
			replyTxtMsg.setContent("您还不是企业用户，没有发布职位。");
		};
		pw.println(replyTxtMsg.toString());
	}
	
	/**
	 * <p>分享简历<br/>
	 * @title FengxWx<br/>
	 * @date 2015-1-23 上午10:17:55<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	/*private void FengxWx(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw,String wxId){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		UserService userService = (UserService) ctx.getBean("userService");
		Map<String, Object> map = userService.findByUserId(userId,"1");
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(map.get("userBasicInfo")!=null && map.get("education")!=null){
			StringBuffer text = new StringBuffer();
			text.append("<a href=\'http://www.yaoshixi.com/user/findUserWeixinById/"+userId+"\'>分享简历</a>");
			replyTxtMsg.setContent(text.toString());
		}else{
			StringBuffer text = new StringBuffer();
			text.append("您还未填写个人资料，请点击下面链接填写您的简历").append("\n");
			text.append("\n<a href=\'http://www.yaoshixi.com/user/resumeWx/"+userId+"/"+wxId+"\'>填写简历</a>");
			replyTxtMsg.setContent(text.toString());
		}
		pw.println(replyTxtMsg.toString());
	}*/
	/**
	 * <p>求职意向<br/>
	 * @title jobIntension<br/>
	 * @date 2015-1-23 上午10:28:17<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	private void jobIntension(WeixinMessage weixinMsg,
			HttpServletRequest request,HttpSession session ,PrintWriter pw){
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		Integer userId = Integer.parseInt(session.getAttribute("userId").toString());
		UserService userService = (UserService) ctx.getBean("userService");
		Map<String, Object> map = userService.findByUserId(userId,"2");
		ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
		if(map.get("userBasicInfo")!=null ){
			UserBasicInfo userInfo = (UserBasicInfo)map.get("userBasicInfo");
			String jobCategory = "无";
			if(userInfo.getJobCategory()==1){
				jobCategory="全职";
			}else if(userInfo.getJobCategory()==2){
				jobCategory="按天";
			}else if(userInfo.getJobCategory()==3){
				jobCategory="按小时";
			}
			StringBuffer text = new StringBuffer();
			text.append("期望的工作性质："+jobCategory).append("\n");
			if(userInfo.getJobCity()==null && userInfo.getCategory()!=null){
				text.append("希望的工作城市：无").append("\n");
				text.append("希望的职位类别："+userInfo.getCategory()).append("\n");
			}else if(userInfo.getJobCity()!=null && userInfo.getCategory()==null){
				text.append("希望的工作城市："+userInfo.getJobCity()).append("\n");
				text.append("希望的职位类别："+"无").append("\n");
			}else if(userInfo.getJobCity()==null && userInfo.getCategory()==null){
				text.append("希望的工作城市：无").append("\n");
				text.append("希望的职位类别："+"无").append("\n");
			}else{	
				text.append("希望的工作城市："+userInfo.getJobCity()).append("\n");
				text.append("希望的职位类别："+userInfo.getCategory()).append("\n");
			}
			text.append("\n<a href=\'http://www.yaoshixi.com/user/jobIntensionWx/"+userId+"\'>" + "修改求职意向" + "</a>");
			replyTxtMsg.setContent(text.toString());
		}else{
			StringBuffer text = new StringBuffer();
			text.append("您还未填写求职意向，请点击下面链接填写您的求职意向").append("\n");
			text.append("\n<a href=\'http://www.yaoshixi.com/user/jobIntensionWx/"+userId+"\'>" + "填写求职意向" + "</a>");
			replyTxtMsg.setContent(text.toString());
		}
		pw.println(replyTxtMsg.toString());
	}
	/**
	 * 查询所以职位
	 * @param eventMsg
	 * @param request
	 * @param pw
	 */
	private void searchAllJobs(EventMessage eventMsg,
			HttpServletRequest request, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		JobService service = (JobService) ctx.getBean("jobService");
		CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		Page<Map<String,Object>> page = new Page<Map<String,Object>>(1, 6, null);
		List<Map<String, Object>> jobList = service.searhJobsByKeyword("", page);
		if (jobList == null || jobList.isEmpty()) {
			ReplyTextMessage replyTxtMsg = eventMsg.createReplyTextMessage();
			replyTxtMsg.setContent("没有找到任何职位,输入职位名称进行查找");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(eventMsg.getToUserName());
		replyImgMsg.setToUserName(eventMsg.getFromUserName());

		for (int i = 0; i < jobList.size(); i++) {
			Map<String,Object> job = jobList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage()
					.createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobDesc").toString());
			// companyId
			String companyId = job.get("companyId").toString();// 获取职位公司id
			// System.out.println(companyId);
			CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = "";
			if (companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}
			if (companyLogo != null && !(companyLogo.equals(""))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			} else {
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if (request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString()) + "/0");// 点击图文消息跳转链接
			} else {
				article.setUrl("http://"+request.getServerName()+ "/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}
	
	/**
	 * 向我推荐
	 * @param eventMsg
	 * @param request
	 * @param pw
	 */
	private void RecommendJobsToMe(EventMessage eventMsg,
			HttpServletRequest request, HttpSession session, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		JobService service = (JobService) ctx.getBean("jobService");
		/*CompanyService companyService = (CompanyService) ctx
				.getBean("companyService");*/
		Page<Map<String,Object>> page = new Page<Map<String,Object>>(1, 6, null);
		List<Map<String, Object>> jobList = null;
		String userId = session.getAttribute("userId").toString();
		if (userId != null) {
			System.out.println("uesrId="+Integer.parseInt(userId));
			jobList = service.RecommendedToMe(Integer.parseInt(userId), page);
		} /*else if (session.getAttribute("usereducation") == null && session.getAttribute("usercity") != null) {
			jobList = service.JobsRecommend(Integer.parseInt((session
					.getAttribute("userId").toString())),
					session.getAttribute("usercity").toString(), null, page);
		}else if (session.getAttribute("usereducation") == null && 
				session.getAttribute("usercity") == null) {
			jobList = service.JobsRecommend(Integer.parseInt((session
					.getAttribute("userId").toString())),
					null, null, page);
		}
		else {
			jobList = service.JobsRecommend(Integer.parseInt((session
					.getAttribute("userId").toString())),
					session.getAttribute("usercity").toString(), session
							.getAttribute("usereducation").toString(), page);
		}*/
		// jobList=service.JobsRecommend(Integer.parseInt((session.getAttribute("userId").toString())),
		// session.getAttribute("usercity").toString(),session.getAttribute("usereducation").toString(),
		// page);
		if (jobList == null || jobList.isEmpty() || jobList.size() == 0) {
			ReplyTextMessage replyTxtMsg = eventMsg.createReplyTextMessage();
			replyTxtMsg.setContent("还没有与你匹配的职位,或者是您还未完善您的求职意向");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(eventMsg.getToUserName());
		replyImgMsg.setToUserName(eventMsg.getFromUserName());

		for (int i = 0; i < jobList.size(); i++) {
			Map<String,Object>job = jobList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobName").toString());
			// companyId
			//String companyId = job.get("companyId").toString();// 获取职位公司id
			// System.out.println(companyId);
			//CompanyInfo companyInfo = companyService
			//		.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = job.get("companyLogo").toString();
			//if (companyInfo != null) {
				//companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			//}
			if (companyLogo != null && !(companyLogo.equals(""))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			} else {
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if (request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/0");// 点击图文消息跳转链接
			} else {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}

	/**
	 * 查询已投职位
	 * @param eventMsg
	 * @param request
	 * @param pw
	 */
	private void searchUserJobs(WeixinMessage weixinMsg,
			HttpServletRequest request, HttpSession session, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		//JobService service = (JobService) ctx.getBean("jobService");
		UserService userService = (UserService) ctx.getBean("userService");
		CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		Page<Map<String,Object>> page = new Page<Map<String,Object>>(1, 6, null);
		List<Map<String, Object>> jobList = userService.getUserJobs(
				Integer.parseInt(session.getAttribute("userId").toString()),page);
		if (jobList == null || jobList.isEmpty()) {
			ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
			replyTxtMsg.setContent("你还没有投递职位");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(weixinMsg.getToUserName());
		replyImgMsg.setToUserName(weixinMsg.getFromUserName());

		for (int i = 0; i < jobList.size(); i++) {
			Map<String,Object> job = jobList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
			article.setTitle(job.get("jobName").toString());
			article.setDescription(job.get("jobName").toString());
			// companyId
			String companyId = job.get("companyId").toString();// 获取职位公司id
			// System.out.println(companyId);
			CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = "";
			if (companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}
			if (companyLogo != null && !(companyLogo.equals(""))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			} else {
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			if (request.getSession().getAttribute("userId") == null) {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString()) + "/0");// 点击图文消息跳转链接
			} else {
				article.setUrl("http://"+request.getServerName()+"/jobDetailOnWx/"
						+Integer.parseInt(job.get("id").toString())+"/"
						+Integer.parseInt(request.getSession().getAttribute("userId").toString()));// 点击图文消息跳转链接
			}
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}
	
	/*public void findJobs(EventMessage eventMsg,
			HttpServletRequest request, HttpSession session) throws Exception{
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(request.getSession()
						.getServletContext());
		UserAction userAction = (UserAction) ctx.getBean("userAction");
		Integer userId = Integer.valueOf(session.getAttribute("userId").toString());
		System.out.println("userId========"+userId);
		userAction.loginFind(userId);
	}*/
	/**
	 * 查询用户收到的面试通知
	 * @param eventMsg
	 * @param request
	 * @param pw
	 */
	private void searchUserInterview(WeixinMessage weixinMsg,
			HttpServletRequest request, HttpSession session, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		// JobService service = (JobService) ctx.getBean("jobService");
		// UserService userService=(UserService)ctx.getBean("userService");
		//CompanyService companyService = (CompanyService) ctx.getBean("companyService");
		WxService wxService = (WxService) ctx.getBean("wxService");
		Page<Map<String,Object>> page = new Page<Map<String,Object>>(1, 6, null);
		List<Map<String, Object>> interviewList = wxService.findInterByUserId(
				Integer.parseInt(session.getAttribute("userId").toString()),page);
		if (interviewList.size() <1 || interviewList.isEmpty()) {
			ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
			replyTxtMsg.setContent("还没有你的面试通知");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(weixinMsg.getToUserName());
		replyImgMsg.setToUserName(weixinMsg.getFromUserName());

		for (int i = 0; i < interviewList.size(); i++) {
			Map<String,Object> interview = interviewList.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
			String companyName = "";
			if(interview.get("companyName") != null && !"".equals(interview.get("companyName"))){
				companyName = interview.get("companyName").toString();
			}
			String jobName = "";
			if(interview.get("jobName") != null && !"".equals(interview.get("jobName"))){
				jobName = interview.get("jobName").toString();
			}
			article.setTitle(companyName+"邀您面试");
			if(!"".equals(jobName) && !jobName.isEmpty()){
				article.setDescription(companyName+"邀您面试"+jobName);
			}else{
				String content = "";
				if(interview.get("content")!= null && !"".equals(interview.get("content"))){
					content = interview.get("content").toString();
				}
				article.setDescription(companyName+"邀您面试"+content);
			}
			String interviewId = interview.get("id").toString();
			//Map<String,Object> map = wxService.findInterById(Integer.parseInt(interviewId));// 获取面试信息
			// 获取公司信息
			//String companyId = map.get("companyId").toString();// 获取职位公司id
			//CompanyInfo companyInfo = companyService.getCompanyInfoByCompanyId(Integer.parseInt(companyId));// 获取公司信息
			String companyLogo = "";
			if(interview.get("companyLogo")!=null && !"".equals(interview.get("companyLogo"))){
				companyLogo = interview.get("companyLogo").toString();
			}
			/*if (companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}*/
			if (!companyLogo.isEmpty() && !"".equals(companyLogo)) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			}else{
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			article.setUrl("http://"+request.getServerName()+"/"+"user/interviewNoticeByWx/"
						+ Integer.parseInt(interviewId));// 点击图文消息跳转链接
			replyImgMsg.getArticleList().add(article);
		}
		pw.println(replyImgMsg.toString());
	}
	/**
	 * 获取企业发布的职位
	 * @param eventMsg
	 * @param request
	 * @param session
	 * @param pw
	 */
	private void getPublishJobs(WeixinMessage weixinMsg,
			HttpServletRequest request, HttpSession session, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		CompanyService companyService=(CompanyService)ctx.getBean("companyService");
		//根据企业用户获取companyId
		CompanyInfo companyInfo=companyService.getCompanyInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(weixinMsg.getToUserName());
		replyImgMsg.setToUserName(weixinMsg.getFromUserName());
		if(companyInfo != null){
			Page<CompanyJob> page = new Page<CompanyJob>(1, 5, null);
			//获取企业发布在线（1表示在线）的职位
			List<CompanyJob> list = companyService.listWeixJobs(companyInfo.getId(), 1, page);
			if (list.size()<1) {
				ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
				replyTxtMsg.setContent("没有找到职位，您还没有发布任何职位。");
				pw.println(replyTxtMsg.toString());
				return;
			}
			for (int i = 0; i < list.size(); i++) {
				CompanyJob job = list.get(i);
				ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
				article.setTitle(job.getJobName()+"["+job.getCity()+"]");
	//					+DateUtil.dateFormat("yyyy-MM-dd", job.getPublishTime()));
				article.setDescription(job.getJobName()+"["+job.getCity()+"]");
	//					+DateUtil.dateFormat("yyyy-MM-dd", job.getPublishTime()));
				String companyLogo = "";
				if (companyInfo != null) {
					companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
				}
				if (companyLogo != null && !(companyLogo.equals(""))) {
					article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
				} else {
					article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
				}
				article.setUrl("http://"+request.getServerName()+"/user/jobDetailWeix/"+job.getId());
				replyImgMsg.getArticleList().add(article);
			}
		
			if(list.size()==5){
				ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
				article.setTitle("查看更多职位");
				article.setDescription("查看更多职位");
				String companyLogo = "";
				if (companyInfo != null) {
					companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
				}
				if (companyLogo != null && !"".equals(companyLogo)) {
					article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
				}else{
					article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
				}
				article.setUrl("http://"+request.getServerName()+"/company/job/indexOnWx/"
						+Integer.parseInt(session.getAttribute("userId").toString()));
				//company/resume/jobResume/739
				replyImgMsg.getArticleList().add(article);
			}								
		}else{
			ReplyTextMessage replyTxtMsg = weixinMsg.createReplyTextMessage();
			replyTxtMsg.setContent("您还不是企业用户，没有发布职位。");
			pw.println(replyTxtMsg.toString());
			return;
		}
		pw.println(replyImgMsg.toString());
	}
	
	/*private void getPublishJobs(EventMessage txtMsg,
			HttpServletRequest request, HttpSession session, PrintWriter pw) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		CompanyService companyService=(CompanyService)ctx.getBean("companyService");
		//根据企业用户获取companyId
		CompanyInfo companyInfo=companyService.getCompanyInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
		Page<CompanyJob> page = new Page<CompanyJob>(1, 5, null);
		//获取企业发布在线（1表示在线）的职位
		List<CompanyJob> jobs=(companyService.listJobs(companyInfo.getId(), 1, page)).getResults();
		if (jobs == null || jobs.isEmpty()) {
			ReplyTextMessage replyTxtMsg = txtMsg.createReplyTextMessage();
			replyTxtMsg.setContent("没有找到简历，您还没有发布任何职位。");
			pw.println(replyTxtMsg.toString());
			return;
		}

		ReplyImageMessage replyImgMsg = new ReplyImageMessage();
		replyImgMsg.setFromUserName(txtMsg.getToUserName());
		replyImgMsg.setToUserName(txtMsg.getFromUserName());

		for (int i = 0; i < jobs.size(); i++) {
			CompanyJob job = jobs.get(i);
			ReplyImageMessage.Article article = new ReplyImageMessage().createArticle();
			article.setTitle(job.getJobName()+"["+job.getCity()+job.getArea()+"]");
//					+DateUtil.dateFormat("yyyy-MM-dd", job.getPublishTime()));
			article.setDescription(job.getJobName()+"["+job.getCity()+job.getArea()+"]");
//					+DateUtil.dateFormat("yyyy-MM-dd", job.getPublishTime()));
			
			String companyLogo = "";
			if (companyInfo != null) {
				companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
			}
			if (companyLogo != null && !(companyLogo.equals(""))) {
				article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
			} else {
				article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
			}
			
			article.setUrl("http://"+request.getServerName()+"/company/resume/jobResumeOnWx/"
					+job.getId()+"/"+Integer.parseInt(session.getAttribute("userId").toString()));
			replyImgMsg.getArticleList().add(article);
		}
		
	if(jobs.size()==5){
		ReplyImageMessage.Article article = new ReplyImageMessage()
		.createArticle();
		article.setTitle("查看更多职位");
		article.setDescription("查看更多职位");
		String companyLogo = "";
		if (companyInfo != null) {
			companyLogo = companyInfo.getCompanyLogo(); // 获取公司logo
		}
		if (companyLogo != null && !(companyLogo.equals(""))) {
			article.setPicUrl("http://"+request.getServerName()+"/"+companyLogo); // 图片链接
		} else {
			article.setPicUrl("http://"+request.getServerName()+"/res/upload/logo/defaultlogo.png");
		}
		article.setUrl("http://"+request.getServerName()+"/"+"company/job/indexOnWx/"
				+Integer.parseInt(session.getAttribute("userId").toString()));
		//company/resume/jobResume/739
		replyImgMsg.getArticleList().add(article);
	}
		pw.println(replyImgMsg.toString());
}*/
	

	private void setSessionValue(String wxId, ServletContext servletContext,
			HttpSession session) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		UserService userService = (UserService) ctx.getBean("userService");
		Login login = new Login(); 
		System.out.println("测试wxId=="+wxId);
		login = userService.findUserByWxId(wxId); // 查看是否绑定用户
		if (login == null) {
			String access_token = getAccessToken(servletContext);
			System.out.println("access_token=="+access_token);
			String urlForUserInfo = "https://api.weixin.qq.com/cgi-bin/user/info?" +
					"access_token="+access_token+"&openid="+wxId+"&lang=zh_CN";
			JSONObject jsonObject = HttpRequestUtil.httpRequest(urlForUserInfo, EnumMethod.GET.name(), null);
			System.out.println("用户信息====="+jsonObject);
			String userBase = jsonObject.toString();
			Login login2 = new Login();
			String userName = "";
			if(userBase.indexOf("nickname") != -1){
				byte[] nicknameBate = Base64.encodeToByte(jsonObject.getString("nickname"));
				userName = Base64.decodeToString(nicknameBate);
				System.out.println("姓名===="+userName);
			}
			if(userBase.indexOf("sex") != -1){
				String sex = jsonObject.getString("sex");
				if("1".equals(sex)){
					login2.setNum(0);
				}else if("2".equals(sex)){
					login2.setNum(1);
				}
			}
			String city = "";
			if(userBase.indexOf("city") != -1){
				city = jsonObject.getString("city");
			}
			String headimgurl = "";
			if(userBase.indexOf("headimgurl") != -1){
				headimgurl = jsonObject.getString("headimgurl");
			}
			login2.setActiveStatus(1);
			login2.setRoleId(2);
			login2.setRegistId(wxId);
			userService.insertWxUser(login2,userName,city,headimgurl);
			Login logins = userService.findUserByWxId(wxId);
			session.setAttribute("userId", logins.getId());
			session.setAttribute("email", logins.getEmail());
			session.setAttribute("roleId", logins.getRoleId());
			UserBasicInfo userBasicInfo = userService.findUserBasicInfoByUserId(logins.getId());
			if (userBasicInfo != null) {
				session.setAttribute("userName", userBasicInfo.getUserName());
				session.setAttribute("usercity", userBasicInfo.getCity());
				//session.setAttribute("usereducation", userBasicInfo.getEducation());
			}
			if (logins.getRoleId() == 1) {
				CompanyInfo companyInfo = userService.getCompanyInfoOf(logins.getId());
				if (companyInfo != null) {
					session.setAttribute("companyId", companyInfo.getId());
					session.setAttribute("certifyStatus",companyInfo.getCertifyStatus());
				}
			}
		}else{
			UserBasicInfo userBasicInfodd = userService.findUserBasicInfoByUserId(login.getId());
			if(userBasicInfodd.getHeadImg()==null || "".equals(userBasicInfodd.getHeadImg())){
				String access_token = getAccessToken(servletContext);
				System.out.println("access_token=="+access_token);
				String urlForUserInfo = "https://api.weixin.qq.com/cgi-bin/user/info?" +
						"access_token="+access_token+"&openid="+wxId+"&lang=zh_CN";
				JSONObject jsonObject = HttpRequestUtil.httpRequest(urlForUserInfo, EnumMethod.GET.name(), null);
				System.out.println("用户信息====="+jsonObject);
				if(jsonObject.toString().indexOf("headimgurl") != -1){
					if(jsonObject.getString("headimgurl") != null && !"".equals(jsonObject.getString("headimgurl"))){
						String headimgurl = jsonObject.getString("headimgurl");
						System.out.println("headimgurl====="+headimgurl);
						userService.updateImge(userBasicInfodd.getUserId(), headimgurl);
					}
				}
			}
			session.setAttribute("userId", login.getId());
			session.setAttribute("email", login.getEmail());
			session.setAttribute("roleId", login.getRoleId());
			UserBasicInfo userBasicInfo = userService.findUserBasicInfoByUserId(login.getId());
			if (userBasicInfo != null) {
				session.setAttribute("userName", userBasicInfo.getUserName());
				session.setAttribute("usercity", userBasicInfo.getCity());
				//session.setAttribute("usereducation", userBasicInfo.getEducation());
			}
			if (login.getRoleId() == 1) {
				CompanyInfo companyInfo = userService.getCompanyInfoOf(login.getId());
				if (companyInfo != null) {
					session.setAttribute("companyId", companyInfo.getId());
					session.setAttribute("certifyStatus",companyInfo.getCertifyStatus());
				}
			}
		}
		
	}
	
	
	/**
	 * 获取用户消息
	 */
	private String getPostContent(HttpServletRequest request)
			throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(), "utf-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		return sb.toString();
	}
	/**
	 * 获取access_token
	 * @param appid 凭证
	 * @param appsecret 密钥
	 * @return
	 */
	public String getAccessToken(ServletContext servletContext) {
		String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
		String appid = "wx916479acee4084e2";
		String appsecret = "fce2f0468dc63bf05ade483a08bd6931";
		String access_token = "";
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		UserService userService = (UserService) ctx.getBean("userService");
		List<AccessToken> list = userService.getAccesstoin(appid);
		if(list.size()<1){
			String requestUrl = access_token_url.replace("APPID", appid).replace("APPSECRET", appsecret);
			/*System.err.println(requestUrl);
			try {
				access_token = HttpUtil.doGet(requestUrl);
			} catch (Exception e) {
				System.out.println("error");
			}
			access_token = access_token.substring(access_token.indexOf("access_token"), access_token.indexOf("}")).split("\"")[2];*/
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
	
}

