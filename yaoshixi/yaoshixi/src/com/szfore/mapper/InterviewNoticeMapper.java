package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.InterviewNotice;
import com.szfore.plugin.Page;

/**
 * 面试通知表
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Jan 14, 2014
 */
public interface InterviewNoticeMapper {

	void insertInterviewNotice(@Param("in")InterviewNotice in);
	/**
	 * 查找用户的收到的面试通知
	 * @return
	 */
	List<Map<String,Object>> findInterviewNotice(@Param("userId")int userId);
	
	List<Map<String,Object>> findInterYaoQing(@Param("userId")int userId,
			@Param("jobId")int jobId);
	
	List<InterviewNotice> findInterview(@Param("userId")int userId,@Param("jobId")int jobId);
	/**
	 * 更改已经阅读面试通知的状态
	 * @param id
	 */
	void updateStatus(@Param("id")int id);
	/**
	 * 根据id查找通知的详细信息
	 * @param id
	 * @return
	 */
	Map<String,Object> findInterviewNoticeById(@Param("id")int id);
	
	Map<String,Object> findInterByUserId(@Param("userId")Integer userId,
			@Param("jobId")Integer jobId);
	//wlq新添
	List<Map<String,Object>> findInterviewNoticeByWx(@Param("userId")int userId,
			@Param("page")Page<Map<String,Object>> page);
	
	List<Map<String,Object>> findIntervBywx(@Param("userId")int userId);
	
}
