package com.szfore.mapper;



import org.apache.ibatis.annotations.Param;

import com.szfore.model.UserFeedback;


/**
 * 用户反馈
 * @author Wanglq
 * email:wanglq@szfore.com
 * April 1, 2014
 */
public interface UserFeedbackMapper{

	void insertUserFeedback(@Param("userFeedback")UserFeedback userFeedback);
	
	
}
