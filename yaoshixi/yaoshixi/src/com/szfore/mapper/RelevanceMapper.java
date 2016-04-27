/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;


import org.apache.ibatis.annotations.Param;

import com.szfore.model.Relevance;

/**
 * <p><br/>
 * @className RelevanceMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-4-2 下午3:16:09<br/>
 * </p>
 * RelevanceMapper
 * @author yejian
 * @version v1.0.0
 */
public interface RelevanceMapper {

	public Relevance getUserRelevance(@Param("userId")Integer userId, @Param("companyId")Integer companyId,@Param("status")Integer status,@Param("jobId")Integer jobId);
	
	public void saveRelevance(@Param("userId")Integer userId, @Param("companyId")Integer companyId, @Param("status")Integer status,@Param("content")String content,@Param("jobId")Integer jobId);
	
	public void updateRelevance(@Param("userId")Integer userId, @Param("companyId")Integer companyId, @Param("status")Integer status,@Param("content")String content,@Param("jobId")Integer jobId);
}
