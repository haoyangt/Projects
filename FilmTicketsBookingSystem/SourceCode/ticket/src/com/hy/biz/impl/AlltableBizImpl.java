package com.hy.biz.impl;

import java.util.List;

import com.hy.biz.IAlltableBiz;
import com.hy.dao.IAlltableDao;
import com.hy.dao.impl.AlltableDaoImpl;

public class AlltableBizImpl implements IAlltableBiz {
	private IAlltableDao ad;
	public AlltableBizImpl() {
		super();
		ad=new AlltableDaoImpl();
	}
	@Override
	public List<String> displayAllTablename() {
		// TODO Auto-generated method stub
		return ad.displayAllTableName();
	}
	@Override
	public List<Object> getAllData(String table) {
		// TODO Auto-generated method stub
		return ad.selectAllData(table);
	}
	@Override
	public void updateAllDate(String info) {
		// TODO Auto-generated method stub
		ad.updateAllData(info);
	}

}
