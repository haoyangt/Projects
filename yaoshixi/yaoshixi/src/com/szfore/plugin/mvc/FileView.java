package com.szfore.plugin.mvc;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.view.AbstractView;
import com.szfore.util.ActionUtil;

public class FileView extends AbstractView {

	public static final String FILE_VIEW_PREFIX = "file:";
	
	private String viewName;
	
	public FileView(String viewName)
	{
		this.viewName = viewName;
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception 
	{
		File file = getOutputFile();
		ActionUtil.downloadFile(request, response, file);
	}

	protected File getOutputFile() throws Exception 
	{
		Integer beginIndex = viewName.indexOf(FILE_VIEW_PREFIX) + FILE_VIEW_PREFIX.length();
		String filePath = viewName.substring(beginIndex).trim();
		File file = new File(filePath);
		if(file.exists())
		{
			return file;
		}
		throw new Exception("下载的文件不存在： " + filePath);
	}
}
