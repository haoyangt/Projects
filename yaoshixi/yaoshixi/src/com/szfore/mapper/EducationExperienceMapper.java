/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.EducationExperience;

/**
 * <p><br/>
 * @className EducationExperienceMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-5-6 上午11:55:19<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface EducationExperienceMapper {

	void AddEducationExperience(@Param("educationExperience")EducationExperience educationExperience);
	
	void deleteEducation(@Param("id")int id);
	
	List<EducationExperience> getByUserId(@Param("userId")int userId);
	
	EducationExperience getMaxByUid(@Param("userId")int userId);
	
	void updeteEducationExperience(@Param("educationExperience")EducationExperience educationExperience);
}
