/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.ItSkill;

/**
 * <p><br/>
 * @className ItSkillMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-5-7 下午4:39:13<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface ItSkillMapper {

	List<ItSkill> findByUserId(@Param("userId")int userId,@Param("familiarity") int familiarity);
	
	void insertItSkill(@Param("itSkill")ItSkill itSkill);
	
	void updateById(@Param("itSkill")ItSkill itSkill);
	
	void deleteById(@Param("id")int id);
}
