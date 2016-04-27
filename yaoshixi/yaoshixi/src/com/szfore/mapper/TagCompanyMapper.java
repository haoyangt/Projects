package com.szfore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.TagCompany;
import com.szfore.plugin.Page;

/**
 * 用户标签
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public interface TagCompanyMapper {
	
   List<TagCompany> selectTagCompanyByCompanyId(@Param("companyId")int companyId);

   void insertTagCompany(@Param("tagCompany")TagCompany tagCompany);
   
   void deleteTagCompany(@Param("tagCompany")TagCompany tagCompany);
   
   void deleteTagCompanyById(@Param("id")int id);

   Integer tagNumOf(@Param("companyId")Integer companyId, @Param("tagName")String tagName);

   List<String> listCandidateTag(@Param("page")Page<String> page);
}
