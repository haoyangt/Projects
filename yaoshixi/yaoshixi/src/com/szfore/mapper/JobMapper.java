package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.action.company.vo.CompanyJob;
import com.szfore.model.Job;
import com.szfore.model.UserBasicInfo;
import com.szfore.plugin.Page;

/**
 * 职位mapper
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 28, 2013
 */
public interface JobMapper{

	void insertJob(@Param("job")Job job);
	
	List<Map<String,Object>> findAllJobs(@Param("ids")String ids, @Param("page")Page<Map<String,Object>> page);

	void save(@Param("job")Job job);
	/**
	 * saveExcel
	 * excel导入添加工作信息
	 * @param job
	 */
	void saveExcel(@Param("job")Job job);

	List<Integer> getJobIdsOf(@Param("companyId")Integer companyId);
	
	List<CompanyJob> list(@Param("companyId")Integer companyId, @Param("status")Integer status, @Param("page")Page<CompanyJob> page);
	
	List<CompanyJob> listPhone(@Param("companyId")Integer companyId, @Param("status")Integer status);
	
	List<CompanyJob> listBySize(@Param("companyId")Integer companyId, @Param("status")Integer status, @Param("size")Integer size);

	Job getJobOf(@Param("jobId")Integer jobId);

	void modify(@Param("job")Job job);

	void modifyStatusOf(@Param("companyId")Integer companyId, @Param("jobId")Integer jobId, @Param("status")Integer status);

	Integer getJobNumBy(@Param("companyId")Integer companyId, @Param("jobId")Integer jobId);
	/**
	 * 根据工作id查询工作信息
	 * @param jobId
	 * @return
	 */
	Map<String,Object> findJobsById(@Param("jobId")int jobId);

	void delete(@Param("companyId")Integer companyId, @Param("jobId")Integer jobId);
	/**
	 * <p>职位上线10天后改为下线<br/>
	 * @title deleteByTime<br/>
	 * @date 2014-4-3 下午5:17:03<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	void deleteByTime();
	
	/**
	 * <p>根据职位状态查找发布时间超过10天的职位信息<br/>
	 * @title findByTime<br/>
	 * @date 2014-4-17 上午11:40:05<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @return
	 */
	List<Map<String,Object>> findByTime();
	/**
	 * <p>查找公司未处理的简历有多少份<br/>
	 * @title findResumeUnprocessed<br/>
	 * @date 2014-8-5 下午3:53:11<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @return
	 */
	List<Map<String,Object>> findResumeUnprocessed();
	/**
	 * <p>每周一8:00自动执行方法，提醒HR发布的职位上一周的浏览次数，有多少简历待处理<br/>
	 * @title jobDetailsByEmail<br/>
	 * @date 2015-3-16 下午2:04:47<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 */
	List<Map<String,Object>> findJobDetails();
	
	/**
	 * 查找企业用户收到的简历信息
	 * @param userId
	 * @return
	 */
	List<Map<String,Object>> findReceiveResumeMsg(@Param("userId")int userId);
	/**
	 * 根据公司id查询工作职位信息
	 * @param companyId 公司id
	 * @return
	 */
	List<Job> getJobByCid(@Param("companyId")Integer companyId);
	/**
	 * 根据职位名称查询职位信息
	 * @param jobName 职位名称
	 * @param city 城市
	 * @param xueli 学历
	 * @param jobCategory 工作性质
	 * @param releaseTime 发布时间
	 * @param scope  薪资
	 * @return
	 */
	List<Job> getJobByTerm(@Param("jobName")String jobName,
			@Param("xueli")String xueli,@Param("jobCategory")String jobCategory,
			@Param("releaseTime")String releaseTime,@Param("scope")String scope,
			@Param("attrValue")String attrValue,
			@Param("areaValue")String areaValue,
		    @Param("page")Page<Map<String,Object>> page);
	
	/**
	 * wlq新增
	 * 根据职位名称查询职位信息
	 * @param jobName 职位名称
	 * @param city 城市
	 * @param area 区域
	 * @param xueli 学历
	 * @param jobCategory 工作性质
	 * @param releaseTime 发布时间
	 * @param scope  薪资
	 * @return
	 */
	List<Job> getJobByLocationForWx(@Param("jobName")String jobName,@Param("city")String city,@Param("area")String area,
			@Param("xueli")String xueli,@Param("jobCategory")String jobCategory,
			@Param("releaseTime")String releaseTime,@Param("scope")String scope,
			@Param("josAttrList")List<String> jobAttrList,
		    @Param("page")Page<Map<String,Object>> page);
	/**
	 * 根据用户所在城市和学历向用户推荐职位
	 * @param userId
	 * @param page
	 * @return
	 */
	List<Job> getJobsRecommend(@Param("city")String city,@Param("educationalReq")String educationalReq,
			@Param("page")Page<Map<String,Object>> page);
	/**
	 * <p>根据用户希望工作城市和希望职位类别和学历向用户推荐职位<br/>
	 * @title getJobsRed<br/>
	 * @date 2014-4-21 下午5:00:59<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userBasicInfo
	 * @param keys
	 * @param page
	 * @return
	 */
	List<Job> getJobsRed(@Param("userBasicInfo")UserBasicInfo userBasicInfo,
			@Param("keys")String keys,@Param("page")Page<Map<String,Object>> page);
	
	List<Job> getJobsRedSan(@Param("userBasicInfo")UserBasicInfo userBasicInfo,@Param("keys")String keys);
	
	List<Map<String,Object>> getJobsRedSanPhone(@Param("userBasicInfo")UserBasicInfo userBasicInfo,@Param("keys")String keys);
	
	/**
	 * <p>根据传的num参数返回num条最新的职位信息<br/>
	 * @title getNewestJob<br/>
	 * @date 2014-3-28 上午9:54:40<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param num
	 * @param page
	 * @return
	 */
	List<Map<String,Object>> getNewestJob(@Param("num")Integer num, @Param("page")Page<Map<String,Object>> page);
	
	List<Map<String,Object>> getJobByTime(@Param("startTime")String startTime,@Param("endTime")String endTime,@Param("companyName")String companyName,@Param("page")Page<Map<String, Object>> page);
	
	List<Map<String,Object>> getJobByTimeExcel(@Param("startTime")String startTime,@Param("endTime")String endTime);
	
	List<Map<String,Object>> findCompanyByJid(@Param("jobId")Integer jobId);
	
	void updatePageView(@Param("jobId")Integer jobId);
	
	
	void updateSharetimes(@Param("jobId")Integer jobId);
	/**
	 * 微信端查询热门职位
	 * @return
	 */
	List<Map<String, Object>> getPopularJobsForWx(@Param("userId")Integer userId,@Param("page")Page<Map<String,Object>> page);
	
	void interCookies();
	
	List <Job> findHotJobsSan(@Param("userId")Integer userId);
	
	List <Job> findHotJobs(@Param("userId")Integer userId,@Param("page")Page<Map<String,Object>> page);
	
	List <Map <String,Object>> findHotJobsSanPhone(@Param("userId")Integer userId);
	
	List <Map <String,Object>> findAllJobsSanPhone(@Param("userId")Integer userId);
	
	List <Map <String,Object>> findAllJobsPhone(@Param("userId")Integer userId,
			@Param("num")Integer num,@Param("CjName")String CjName,@Param("city")String city,
			@Param("xueli")String xueli,@Param("jobCategory")String jobCategory,
			@Param("releaseTime")String releaseTime,@Param("scope")String scope);
	
	List <Map <String,Object>> findhotJobsPhone(@Param("userId")Integer userId,
			@Param("num")Integer num,@Param("CjName")String CjName,@Param("city")String city,
			@Param("xueli")String xueli,@Param("jobCategory")String jobCategory,
			@Param("releaseTime")String releaseTime,@Param("scope")String scope);
	
	public Integer findAllJobNum();
	
	
	public List<Job> findJobByCid(@Param("companyId")Integer companyId,@Param("id")Integer id);
	
	public List<Map<String,Object>> findJobReunm(@Param("userId")Integer userId);
	
	public void updateweixById(@Param("job")Job job);
	
}
