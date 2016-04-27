package com.szfore.plugin.mvc;

import java.util.List;
import java.util.Map;

public class ExcelData {

	private String[] columnNames;
	private String fileName;
	private String[] properties;
	private List<Map<String, Object>> datas;
	
	public ExcelData(String fileName, String[] columnNames, 
					 String[] properties, List<Map<String, Object>> datas)
	{
		this.columnNames = columnNames;
		this.fileName = fileName;
		this.properties = properties;
		this.datas = datas;
	}
	
	public Object[][] getDatas() 
	{
		Object[][] rows = new Object[datas.size() + 1][columnNames.length];
		
		setColumnNames(rows);
		
		setColumnDatas(rows);
		
		return rows;
	}

	private void setColumnDatas(Object[][] rows) 
	{
		for (int j = 0; j < datas.size(); j++) 
		{
			Map<String, Object> dataMap = datas.get(j);
			Object[] row = rows[j + 1]; 
			for (int i = 0; i < properties.length; i ++) 
			{
				row[i] = dataMap.get(properties[i]);
			}
		}
	}

	private void setColumnNames(Object[][] rows) 
	{
		Object[] row = rows[0];
		for (int i = 0; i < row.length; i++) 
		{
			row[i] = columnNames[i]; 
		}
	}

	public String getFileName() 
	{
		return fileName;
	}


}
