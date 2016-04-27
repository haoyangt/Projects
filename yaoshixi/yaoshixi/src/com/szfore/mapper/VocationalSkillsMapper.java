/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.SchoolRewards;
import com.szfore.model.VocationalSkills;

/**
 * <p><br/>
 * @className VocationalSkillsMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-5-4 下午5:55:07<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface VocationalSkillsMapper {

	void insertVocational(@Param("vocationalSkills")VocationalSkills vocationalSkills);
	
	List<Map<String, Object>> findByUserId(@Param("userId")int userId);
	
	void updateById(@Param("vocationalSkills")VocationalSkills vocationalSkills);
	
	void deleteById(@Param("id")int id);
	
	Map<String, Object> findByUid(@Param("userId")int userId);
}
