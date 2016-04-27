package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.CompanyInfo;
import com.szfore.plugin.Page;

public interface CompanyMapper {

	List<CompanyInfo> findAll(@Param("page")Page<Map<String,Object>> page);
	
	List<CompanyInfo> findAllSan();
	
	CompanyInfo getCompanyInfoByCompanyId(@Param("companyId")Integer companyId);
	
	CompanyInfo getByCompName(@Param("companyName")String companyName);
	
	List<CompanyInfo> searchCompany(@Param("list")List<Integer> list,@Param("page")Page<CompanyInfo> page);

	void addCompany(@Param("companyInfo")CompanyInfo companyInfo);
	/**
	 * addExcel
	 * excel导入添加
	 * @param companyInfo
	 */
	void addExcel(@Param("companyInfo")CompanyInfo companyInfo);

	CompanyInfo getCompanyInfoOf(@Param("userId")Integer userId);

	CompanyInfo getCompanyByJobId(@Param("jobId")Integer jobId);
	
	void updateCompanyById(@Param("companyInfo")CompanyInfo companyInfo);

	void updateCompanyByUserId(@Param("companyInfo")CompanyInfo companyInfo);
	
	List<Map<String, Object>> reviewPage(@Param("page")Page<Map<String, Object>> page);
	
	List<Map<String, Object>> authentication(@Param("page")Page<Map<String, Object>> page);

	int reviewPass(@Param("companyId")Integer companyId);

	int authenticationPass(@Param("companyId")Integer companyId);
	
	List<Map<String, Object>> companyPage(@Param("page")Page<Map<String, Object>> page);

	List<Map<String, Object>> jobCount(@Param("status") int status,@Param("ids")List<Integer> ids);
	/**
	 * <p>手机端首页显示5个公司的信息<br/>
	 * @title getTopCompanysPhone<br/>
	 * @date 2014-7-22 下午4:49:25<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @return
	 */
	List<Map<String, Object>> getTopCompanys();
	/**
	 * <p>手机端首页显示6个公司的信息<br/>
	 * @title getTopCompanysPhone<br/>
	 * @date 2014-7-22 下午4:49:25<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @return
	 */
	List<Map<String, Object>> getTopCompanysPhone();
	
	int addCompanyList(@Param("list")List<CompanyInfo> companyInfoList);

	List<Map<String, Object>> getCompanyByName(@Param("list")List<String> comanyNameList);
	
	List<CompanyInfo> getCompanyByTerm(@Param("city")String city,
			@Param("companyScale")String companyScale,
			@Param("companyNature")String companyNature,
			@Param("companyIndustry")String companyIndustry,
			@Param("companyName")String companyName, 
			@Param("majorList")String majorList, 
			@Param("authentication")Integer authentication,
			@Param("page")Page<Map<String,Object>> page);
	
	List<CompanyInfo> getCompanyByTermPhone(@Param("city")String city,
			@Param("companyScale")String companyScale,
			@Param("companyNature")String companyNature,
			@Param("companyField")String companyField,
			@Param("companyName")String companyName, 
			@Param("authentication")Integer authentication,
			@Param("num")Integer num);
	
	
	List<CompanyInfo> getTuigCompanyByPhone(@Param("city")String city,
			@Param("companyScale")String companyScale,
			@Param("companyNature")String companyNature,
			@Param("companyField")String companyField,
			@Param("companyName")String companyName, 
			@Param("authentication")Integer authentication,
			@Param("num")Integer num);
	
	/**
	 * <p>根据激活码查找公司信息<br/>
	 * @title getCompanyBycdkey<br/>
	 * @date 2014-4-1 上午11:31:01<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param cdkey
	 * @return
	 */
	List<CompanyInfo> getCompanyBycdkey(@Param("cdkey")String cdkey);
	/**
	 * <p>根据激活码修改公司邮箱<br/>
	 * @title updateByCdkey<br/>
	 * @date 2014-4-1 下午12:05:48<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param cdkey
	 * @param email
	 */
	void updateByCdkey(@Param("cdkey")String cdkey,@Param("email")String email,@Param("userId")int userId);
	/**
	 * <p>根据用户email查看该用户是否已关联公司<br/>
	 * @title getCompanyByEmail<br/>
	 * @date 2014-4-1 下午4:10:53<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @return
	 */
	List<CompanyInfo> getCompanyByEmail(@Param("email")String email);
	
	void updateBusinessLicense(@Param("companyInfo")CompanyInfo companyInfo);
	
	void updateUserIdById(@Param("companyId")Integer companyId,@Param("userId")Integer userId);
}
