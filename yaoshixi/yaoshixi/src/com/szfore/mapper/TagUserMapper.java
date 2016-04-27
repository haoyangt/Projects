package com.szfore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szfore.model.TagUser;

/**
 * 用户标签
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 29, 2013
 */
public interface TagUserMapper {

   void insertTagUser(@Param("tagUser")TagUser tagUser);
   
   void deltagUser(@Param("tagUser")TagUser tagUser);
   
   void deleteTagUserById(@Param("id")int id);
   
   public List<TagUser> findTagUser(@Param("userId")int userId);
}
