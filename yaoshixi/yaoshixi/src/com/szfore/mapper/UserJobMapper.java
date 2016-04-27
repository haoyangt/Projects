package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.UserJob;
import com.szfore.plugin.Page;

/**
 * 简历投递
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 28, 2013
 */
public interface UserJobMapper{

	void insertUserJob(@Param("userJob")UserJob userJob);
	
	/**
	 * 查询条件参数 page.params = {jobIds, status}
	 */
	@SuppressWarnings("rawtypes")
	List<Map<String, Object>> getUserJobOf(Page page);
	
	List<Map<String, Object>> getUserJobByStatus(@Param("status")Integer status, 
			@Param("jobId")Integer jobId,@Param("page")Page<Map<String, Object>> page);
	
	List<Map<String, Object>> TalentJobByStatus(@Param("status")Integer status, 
			@Param("companyId")Integer companyId,@Param("page")Page<Map<String, Object>> page);
	
	List<Map<String,Object>> getUserJobs(@Param("page")Page<Map<String, Object>> page,
			@Param("userId")Integer userId);
 
	List<Map<String,Object>> getDeliverJob(@Param("userId")Integer userId);
	
	void updateStatusOf(@Param("userId")Integer userId, @Param("jobId")Integer jobId, 
			@Param("status")Integer status);
	
	void updateStatus(@Param("jobId")Integer jobId, @Param("status")Integer status);
	
	Integer getUserJobNumBy(@Param("userId")Integer userId, @Param("jobId")Integer jobId);

	List<Map<String, Object>> searchUserBy(@Param("name")String name, 
			@Param("companyId")Integer companyId);
	
	List<Map<String, Object>> getUserJobCompanyBy(@Param("page")Page<Map<String, Object>> page,
			@Param("userId")Integer userId, @Param("companyId")Integer companyId);
	/**
	 * <p>企业HR在5天内没有点击浏览简历,将状态改为5<br/>
	 * @title updateStatus<br/>
	 * @date 2014-4-8 下午4:38:48<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param status
	 */
	void updateStar(@Param("star")Integer star);
	
	List<UserJob> findByUidJidStr(@Param("userId")Integer userId,
			@Param("jobId")Integer jobId, @Param("status")Integer status);
	
	Integer getUjobConByJid(@Param("jobId")Integer jobId);
	
	UserJob findStatus(@Param("userId")Integer userId, @Param("jobId")Integer jobId);
	
	List<UserJob> findByStatus(@Param("jobId")Integer jobId,@Param("status")Integer status,
			@Param("page")Page<Map<String, Object>> page);
	
	List<Map<String, Object>> findUserJobByTime();
	
	Map<String, Object> getCountByJobId(@Param("jobId")Integer jobId);
}
