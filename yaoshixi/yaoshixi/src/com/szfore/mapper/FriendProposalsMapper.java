/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.FriendProposals;
import com.szfore.model.IpLogged;
import com.szfore.plugin.Page;

/**
 * <p><br/>
 * @className FriendProposalsMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-7-9 下午4:08:23<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface FriendProposalsMapper {

	void saveFriendProp(@Param("friendProposals")FriendProposals friendProposals);
	
	public List<Map<String, Object>> findProposalsAll(@Param("page")Page<Map<String, Object>> page,@Param("id")Integer id);
	
	FriendProposals findFriendByName(@Param("uesrName")String userName);
	
	FriendProposals findFriendById(@Param("id")Integer id);
	
	void updateFriendById(@Param("id")Integer id);
	
	IpLogged findLoggedByIp(@Param("ip")String ip);
	
	void insertLogged(@Param("ipLogged")IpLogged ipLogged);
}
