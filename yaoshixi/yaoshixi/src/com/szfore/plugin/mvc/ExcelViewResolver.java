package com.szfore.plugin.mvc;

import java.util.Locale;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractCachingViewResolver;

public class ExcelViewResolver extends AbstractCachingViewResolver implements Ordered{
	
	private int order = Integer.MAX_VALUE - 1;
	
	@Override
	protected View loadView(String viewName, Locale locale) throws Exception {
		if(ExcelView.EXCEL_VIEW.equals(viewName)){
			return new ExcelView();
		}
		return null;
	}
	
	public void setOrder(int order) {
		this.order = order;
	}

	@Override
	public int getOrder() {
		return order;
	}
}
