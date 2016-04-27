package com.szfore.action.forum;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jodd.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.mapper.ReplyMapper;
import com.szfore.mapper.TopicMapper;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.SessionValue;
/**
 * 
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 9, 2013
 */

@Controller
@RequestMapping("forum")
public class ForumAction{

	@Autowired
	private TopicMapper topicMapper;
	@Autowired
	private ReplyMapper replyMapper;
	
	@SuppressWarnings({ "rawtypes", "unchecked" }) 
	@RequestMapping("/index")
	public String index(HttpRequest request,String title,String type,@ModelAttribute("page")Page page) {
		System.out.println("type=="+type);
		System.out.println("title=="+title);
		page.setResults(topicMapper.findAllTopic(title,type,page));
		return "forum/indexModel";
	}
	
	/*@RequestMapping("/addTopic")
	public String addTopic(@SessionValue("userId")Integer userId, @ModelAttribute("topic")Topic topic) {
		if(userId == null) {
			return "login";
		}
		topic.setUserId(userId);
		topic.setPublishTime(new Date());
		topicMapper.insertTopic(topic);
		return "forum/index";
	}*/
	
	@RequestMapping("/topicDetail/{topicId}")
	public String topicDetail(@SessionValue("userId")Integer userId,HttpServletRequest request,HttpSession session, @PathVariable("topicId")int topicId,Map<String,Object> data) {
		/*if(userId == null) {
			session.setAttribute("requestURL", request.getRequestURL());
		}*/
		data.putAll(topicMapper.findTopicById(topicId));
		return "forum/indexlist";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" }) 
	@RequestMapping("/replyList")
	public String replyList(int topicId,@ModelAttribute("page")Page page) {
		page.setResults(replyMapper.findAllReply(topicId, page));
		return "forum/replylist";
	}
	
	/*@RequestMapping("/addReply")
	public void addReply(HttpServletResponse response,@SessionValue("userId") Integer userId,int topicId,int pid,String replyContent) {
		Reply reply = new Reply();
		if(userId == null) {
			JsonUtils.toJson(response, "登录后，才能发布回复");
			return;
		}
		reply.setUserId(userId);
		reply.setTopicId(topicId);
		reply.setPid(pid);
		reply.setReplyTime(new Date());
		reply.setReplyContent(replyContent);
		replyMapper.insertReply(reply);
		JsonUtils.toJson(response, "回复成功");
	}*/
	
	@RequestMapping("/TopicIndex")
	public String addTopicInput() {
		return "forum/index";
	}
	
}
