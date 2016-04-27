package com.szfore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.Intern;
import com.szfore.model.InterviewNotice;
import com.szfore.plugin.Page;

public interface InternMapper {

	@SuppressWarnings("rawtypes")
	List<Intern> listIntern(Page page);

	Intern findIntern(@Param("companyId")Integer companyId, 
					  @Param("userId")Integer userId);

	void saveEvaluationOf(@Param("companyId")Integer companyId, 
						  @Param("userId")Integer userId, 
						  @Param("content")String content,
						  @Param("commentStatus")Integer commentStatus);
	/**
	 * 查找所有的实习经历
	 * @param userId
	 * @return
	 */
	List<Intern> findAllInterns(@Param("userId")int userId);
	
	List<Intern> findByStatus(@Param("userId")int userId,@Param("commentStatus")int commentStatus);
	
	void saveInternAll(@Param("in")Intern in);
	
	List<Intern> findEntry(@Param("companyId")Integer companyId, 
			  @Param("userId")Integer userId,@Param("jobId")Integer jobId);
	
	List<Intern> findE(@Param("userId")Integer userId,@Param("jobId")Integer jobId);
}
