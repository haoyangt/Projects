package com.szfore.service;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.szfore.mapper.InterviewNoticeMapper;
import com.szfore.mapper.UserFeedbackMapper;
import com.szfore.model.UserFeedback;
import com.szfore.plugin.Page;

/**
 * 跟微信相关操作
 * @author wangliqiang
 * email:wanglq@szfore.com
 * 20,03,2014
 */
@Service
public class WxService {
	@Autowired
    private InterviewNoticeMapper interviewNoticeMapper;
	@Autowired
	private UserFeedbackMapper feedbackMapper;
	/**
	 * 查询用户面试通知
	 * @param userId
	 * @param page
	 * @return
	 */
	public List<Map<String,Object>> findInterByUserId(Integer userId,
			Page<Map<String,Object>> page){
		return interviewNoticeMapper.findInterviewNoticeByWx(userId, page);
	}
	
	
	public Map<String, Object> findInterById(Integer id){
		return interviewNoticeMapper.findInterviewNoticeById(id);
	}
	/**
	 * 保存用户反馈内容
	 * @param userFeedback
	 */
	public void insertUserFeedback(UserFeedback userFeedback){
		feedbackMapper.insertUserFeedback(userFeedback);
	}
	
	
	
}
