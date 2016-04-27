package com.szfore.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.AccessToken;
import com.szfore.model.Login;
import com.szfore.model.OAuthVO;
import com.szfore.plugin.Page;
import com.szfore.plugin.QueryList;
/**
 * 登录
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 28, 2013
 */
public interface LoginMapper {

	Login login(@Param("email")String email);
	
	Login loginByCom(@Param("email")String email);
	
	Login loginUser(@Param("email")String email);
	
	Login findUserByEmail(@Param("email") String email);
	
	Login findUserById(@Param("userId") Integer userId);
	
	void insertUser(@Param("login")Login login);
	
	void updateUserLoginInfo(@Param("userId")int userId);
	/**
	 * 激活账号
	 * @param registId
	 * @param userId
	 */
	void activeUserAccount(@Param("registId")String registId,@Param("userId")int userId);
	
	Login findLoginByUserId(@Param("userId")int userId);
	/*
	 * 新增2014-03-24
	 */
	Login findLoginByJoinId(@Param("joinId")String joinId);
	
	@SuppressWarnings("rawtypes")
	@QueryList("list")
	List list(@Param("page")Page<Map> page, @Param("name")String name);

	public List<Map<String, Object>> findUserIdsByUsername(@Param("list")List<String> emailList);
	
	OAuthVO selectOAuthUser(@Param("joinId")String joinId);
	OAuthVO selectOAuthUserByUser(@Param("userId")Integer userId);
	OAuthVO oAuthAccessToken(@Param("userId")Integer userId,@Param("accessToken")String accessToken);
	
	
	OAuthVO findOAuthByJobId(@Param("jobId")Integer jobId);
	
	void insertOAuthUser(@Param("joinId")String joinId, @Param("userId")int userId, @Param("nickName")String nickName, @Param("accessToken")String accessToken,@Param("type")Integer type);
	
	
	void deleteOAuthUserByUser(@Param("userId")int userId);
	void updateOAuthUser(@Param("joinId")String joinId, @Param("userId")int userId);//微信绑定新的账号
	
	
	void deleteOAuthUserByJoinId(@Param("joinId")String joinId);
	void updateOAuthUserForNewWxId(@Param("joinId")String joinId, @Param("userId")int userId);//用户被新的微信号绑定
	
	void updateByEmail(@Param("email")String email,@Param("password")String password);
	/**
	 * <p>根据用户id修改email<br/>
	 * @title updateByUserId<br/>
	 * @date 2014-3-25 下午12:27:42<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param email
	 * @param userId
	 */
	void updateByUserId(@Param("email")String email,@Param("userId")int userId);
	/**
	 * <p>根据userId修改用户权限<br/>
	 * @title updateRoleId<br/>
	 * @date 2014-4-2 上午9:44:22<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId
	 */
	void updateRoleId(@Param("userId")int userId);
	
	public  List<AccessToken> getAccessToken(@Param("corpId")String corpId);
	
	public  List<Map<String,Object>> getTicket(@Param("corpId")String corpId);
	
	public List<AccessToken> getAccesstoinByCorpId(@Param("corpId")String corpId);
	
	public void updateAccesstion(@Param("access_token")String access_token,
			@Param("expires_in")Date expires_in,@Param("corpId")String corpId);
	
	public void updateTicket(@Param("ticket")String ticket,
			@Param("expires_in")Date expires_in,@Param("corpId")String corpId);
	
	public void addAccesstion(@Param("access_token")String access_token,
			@Param("expires_in")Date expires_in,@Param("corpId")String corpId);
	
	public List<Map<String, Object>> findCompanyByUid(@Param("userId")int userId);
}
