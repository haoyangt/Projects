/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.SchoolRewards;

/**
 * <p><br/>
 * @className SchoolRewardsMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-5-4 下午4:34:45<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface SchoolRewardsMapper {

	void insertSchoolRewar(@Param("schoolRewards")SchoolRewards schoolRewards);
	
	void deleteSchoolRewar(@Param("id")int id);
	
	List<Map<String, Object>> findByUserId(@Param("userId")int userId);
	
	void updateById(@Param("schoolRewards")SchoolRewards schoolRewards);
	
	Map<String, Object> findByUid(@Param("userId")int userId);
}
