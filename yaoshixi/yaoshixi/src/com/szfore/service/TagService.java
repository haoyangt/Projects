package com.szfore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.szfore.mapper.TagCompanyMapper;
import com.szfore.model.TagCompany;
/**
 * 跟标签相关的操作
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
@Service
@Transactional(propagation=Propagation.REQUIRED)
public class TagService {

	@Autowired
	private TagCompanyMapper tagCompanyMapper;
	
	
	public List<TagCompany> getTagCompanyByCompanyId(int companyId) {
		return tagCompanyMapper.selectTagCompanyByCompanyId(companyId);
	}
	
}
