package com.szfore.plugin.mvc;

import java.util.Locale;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractCachingViewResolver;

public class FileViewResolver extends AbstractCachingViewResolver implements Ordered{
	
	private int order = Integer.MAX_VALUE;
	
	@Override
	protected View loadView(String viewName, Locale locale) throws Exception {
		if(viewName.startsWith(FileView.FILE_VIEW_PREFIX))
		{
			return new FileView(viewName);
		}
		return null;
	}

	@Override
	public int getOrder(){
		return this.order;
	}

	public void setOrder(int order) {
		this.order = order;
	}
}
