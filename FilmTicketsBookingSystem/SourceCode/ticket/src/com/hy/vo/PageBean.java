package com.hy.vo;

import java.util.ArrayList;
import java.util.List;

public class PageBean {

	private int totalRows;
	private int totalPages;
	private int currentPage;
	private int pageSize;
	@SuppressWarnings("rawtypes")
	private List data = new ArrayList();
	
	
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	public int getTotalPages() {
		return totalRows%pageSize==0 ? totalRows/pageSize : totalRows/pageSize + 1;
	}
	
	
}
