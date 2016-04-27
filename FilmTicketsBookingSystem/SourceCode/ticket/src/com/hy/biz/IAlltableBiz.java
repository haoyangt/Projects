package com.hy.biz;

import java.util.List;

public interface IAlltableBiz {
	public abstract List<String> displayAllTablename();
	public abstract List<Object> getAllData(String table);
	public abstract void updateAllDate(String info);
}
