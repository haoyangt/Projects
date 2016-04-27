package com.hy.dao;

import java.util.List;

public interface IAlltableDao {
	public abstract List<String> displayAllTableName();
	public abstract List<Object> selectAllData(String table);
	public abstract void updateAllData(String info);
}
