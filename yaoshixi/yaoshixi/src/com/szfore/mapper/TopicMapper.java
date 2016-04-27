package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.Topic;
import com.szfore.plugin.Page;

/**
 * 论坛话题
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 9, 2013
 */
public interface TopicMapper {

	void insertTopic(@Param("topic")Topic topic);
	
	void deleteTopic(@Param("topicId")int topicId);
	
	Map<String,Object> findTopicById(@Param("topicId")int topicId);
	
	@SuppressWarnings("rawtypes")
	List<Map<String,Object>> findAllTopic(@Param("title")String title,@Param("type")String type,@Param("page")Page page);
}
