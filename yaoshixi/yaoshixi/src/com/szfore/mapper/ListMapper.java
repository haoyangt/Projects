package com.szfore.mapper;

import java.util.List;
import java.util.Map;

import com.szfore.plugin.Page;

public interface ListMapper {
	
	@SuppressWarnings("rawtypes")
	List list(Page<Map> page);
}
