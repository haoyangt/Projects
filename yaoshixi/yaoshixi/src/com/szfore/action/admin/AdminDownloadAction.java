package com.szfore.action.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.util.ActionUtil;

@Controller
@RequestMapping("/admin/download")
public class AdminDownloadAction {
	
	private final static Map<Integer, String> moduleMap = new HashMap<Integer, String>();
	static{
		moduleMap.put(1, "企业批量导入模版.xls");
	}
	
	@RequestMapping("/module/{id}")
	public void module(
			@PathVariable("id")Integer id,
			HttpServletRequest request,
			HttpServletResponse response){
		
		ActionUtil.downloadModuleFile(moduleMap.get(id), request, response);
	}
}
