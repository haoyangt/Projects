/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.Experience;

/**
 * <p><br/>
 * @className ExperienceMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-5-4 下午1:59:16<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface ExperienceMapper {

	void interExperience(@Param("experience")Experience experience);
	
	void deleteExperience(@Param("id")int id);
	
	List<Map<String, Object>> findByUserId(@Param("userId")int userId);
	
	Map<String, Object> findByUid(@Param("userId")int userId);
	
	void updateById(@Param("experience")Experience experience);
}
