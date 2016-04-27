package com.szfore.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.model.Login;
import com.szfore.model.UserBasicInfo;

@Repository
public class LoginService {

	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	public List<Map<String, Object>> findUserIdsByUsername(
			List<String> emailList) {
		if(emailList== null || emailList.isEmpty()){
			return new ArrayList<Map<String,Object>>();
		}
		return loginMapper.findUserIdsByUsername(emailList);
	}
   
	public Integer insertLogin(Login login) {
		if(login == null){
			return -1;
		}
		loginMapper.insertUser(login);
		if(login.getId() == 0){
			return -1;
		}
		UserBasicInfo userBasicInfo = new UserBasicInfo();
		userBasicInfo.setUserId(login.getId());
		userBasicInfoMapper.insertUserBasicInfo(userBasicInfo);
		
		/*Resume resume = new Resume();
		resume.setUserId(login.getId());
		resumeMapper.insertResume(resume);*/
		
		return login.getId();
	}
}
