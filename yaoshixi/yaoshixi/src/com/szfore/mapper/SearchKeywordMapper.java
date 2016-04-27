package com.szfore.mapper;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.SearchKeyword;

/**
 * 关键字搜索
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public interface SearchKeywordMapper {

	void insertKeyword(@Param("kName")String kName);
	
	//SearchKeyword findKeyword(@Param("keyword")String keyword);
	SearchKeyword findKeyword(@Param("kName")String keyword);//wlq修改
	
	void updateKeywordCount(@Param("kId")int kId);
	
}
