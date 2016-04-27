package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.Reply;
import com.szfore.plugin.Page;

/**
 * 回复mapper
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 9, 2013
 */
public interface ReplyMapper {

	void insertReply(@Param("reply") Reply reply);
	
	List<Map<String,Object>> findAllReply(@Param("topicId")int topicId,@Param("page")Page page);
}
