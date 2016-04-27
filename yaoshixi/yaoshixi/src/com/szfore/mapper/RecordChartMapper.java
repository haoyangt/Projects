/*
 * $id$
 * Copyright (C) 2014 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.RecordChart;
import com.szfore.plugin.Page;

/**
 * <p><br/>
 * @className RecordChartMapper.java<br/>
 * @packageName com.szfore.mapper<br/>
 * @date 2014-4-9 下午5:12:52<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public interface RecordChartMapper {

	public List<Map<String, Object>> findUserCount(@Param("responseTime")String responseTime,@Param("page")Page<Map<String, Object>> page);
	
	public List<RecordChart> findByTime(@Param("responseTime")String responseTime);
	
	void insertRecordChart(@Param("recordChart")RecordChart recordChart);
	
	void updateRecordChart(@Param("responseTime")String responseTime,@Param("recordChart")RecordChart recordChart);
}
