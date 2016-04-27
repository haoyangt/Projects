package com.szfore.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.plugin.Page;
import com.szfore.service.ListService;
@Controller
public class ListAction {

	@Autowired
	private ListService listService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/list")
	public String list(String mapper, String queryName, String viewName, @ModelAttribute("page") Page page, Map<String, Object> data)
	{
		if(queryName != null)
		{
			data.put("page", listService.list(page, mapper, queryName));
			return viewName;
		}
		
		data.put("page", listService.list(page, mapper));
		return viewName;
	}
}
