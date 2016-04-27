package com.szfore.plugin.mvc;

import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.szfore.util.ActionUtil;

public class ExcelView extends AbstractView{
	public static final String EXCEL_VIEW = "excel";
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ExcelData excelData = getExcelModel(model);
		
		ActionUtil.downloadXLSFile(excelData.getFileName(), excelData.getDatas(), request, response);
	}

	public ExcelData getExcelModel(Map<String, Object> model) throws Exception
	{
		for (Entry<String, Object> entry : model.entrySet()) 
		{
			Object value = entry.getValue();
			if(value instanceof ExcelData)
			{
				return (ExcelData)value;
			}
		}
		throw new Exception("没有设置Excel的内容");
	}
}
