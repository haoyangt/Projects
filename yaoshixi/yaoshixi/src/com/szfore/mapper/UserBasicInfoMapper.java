package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.Job;
import com.szfore.model.UserBasicInfo;
import com.szfore.plugin.Page;
/**
 * 用户基本信息
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public interface UserBasicInfoMapper {

	UserBasicInfo findUserBasicInfoByUserId(@Param("userId")int userId);
	
	List<UserBasicInfo> findByUserId(@Param("userId")int userId);
	
	void insertUserBasicInfo(@Param("userBasicInfo")UserBasicInfo userBasicInfo);
	
	void updateUserBasicInfo(@Param("userBasicInfo")UserBasicInfo userBasicInfo);
	
	void updateAccessory(@Param("userId")Integer userId,@Param("accessory")String accessory);
	
	void updateQuantity(@Param("userId")Integer userId);
	
	void updateQuaWx(@Param("userId")Integer userId,@Param("num")int num);
	/**
	 * <p>查询所有注册用户信息<br/>
	 * @title findUserAll<br/>
	 * @date 2014-3-27 下午2:55:36<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @return
	 */
	public List<Map<String, Object>> findUserAll(@Param("page")Page<Map<String, Object>> page);
	
	public List<Map<String, Object>> findDeliveryRecord(@Param("page")Page<Map<String, Object>> page);
	
	public List<Map<String, Object>> findInvitation(@Param("companyId")int companyId,@Param("page")Page<Map<String, Object>> page);
	
	
	public List<Map<String, Object>> resumeUser(@Param("userId")int userId,
			@Param("companyId")int companyId,@Param("status")int status,@Param("page")Page<Map<String, Object>> page);
	
	public List<Map<String, Object>> findSchoolfellow(@Param("companyId")int companyId,@Param("userId")int userId);
	/**
	 * <p>查找用户当天能投递简历的数量<br/>
	 * @title findQuantity<br/>
	 * @date 2014-6-3 上午11:53:57<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @return
	 */
	public Integer findQuantity(@Param("userId")int userId);
	
	public Integer findAllUserNum();
	/**
	 * <p>更改用户简历是否公开<br/>
	 * @title updateExpose<br/>
	 * @date 2014-8-4 上午10:54:51<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @param num
	 */
	public void updateExpose(@Param("userId")int userId,@Param("num")int num);
	
	List<Map<String, Object>> findTuijUser(@Param("job")Job job);
	
	public void updateImge(@Param("userId")int userId,@Param("imge")String imge);
	
	public void updateByUserId(@Param("userId")int userId);
	
	public void updateByUserIdFx(@Param("userId")int userId);
	/**
	 * <p>查询我收到的简历<br/>
	 * @title findReceiveResume<br/>
	 * @date 2015-3-16 上午10:44:00<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 * @return
	 */
	public List<Map<String,Object>> findReceiveResume(@Param("userId")int userId);
}
