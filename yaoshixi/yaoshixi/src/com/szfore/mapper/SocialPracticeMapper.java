/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.SocialPractice;

/**
 * <p><br/>
 * @className SocialPracticeMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-4-30 下午5:32:28<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface SocialPracticeMapper {

	void insertSocial(@Param("socialPractice")SocialPractice socialPractice);
	
	void deleteSocial(@Param("id")int id);
	
	List<Map<String, Object>> findByUserId(@Param("userId")int userId);
	
	void updateById(@Param("socialPractice")SocialPractice socialPractice);
	
	Map<String, Object> findByUid(@Param("userId")int userId);
}
