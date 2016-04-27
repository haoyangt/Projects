package com.szfore.action.weixin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.EducationExperienceMapper;
import com.szfore.mapper.LoginMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.EducationExperience;
import com.szfore.model.Login;
import com.szfore.model.UserBasicInfo;


@Controller
@RequestMapping("/wx")
public class WxAction 
{
	@Autowired
	private HttpSession session;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	@Autowired
	private EducationExperienceMapper educationExperienceMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private LoginMapper loginMapper;
	
	@RequestMapping("/showpostjob")
	public String showpostjob()
	{
		return "openLogin/enterprise/postjob";
	}
	
	
	@RequestMapping("/showpostjobwith")
	public String showpostjobwith()
	{
		return "openLogin/enterprise/postjobwith";
	}
	
	@RequestMapping("/wxpostjob/{userId}")
	public String wxpostjob(@PathVariable("userId")Integer userId)
	{
		Login login=loginMapper.findLoginByUserId(userId);
		setSessionValue(login);
		return "openLogin/enterprise/postjob";
	}
	
	private void setSessionValue(Login login) {
		session.setAttribute("userId", login.getId());
		session.setAttribute("email", login.getEmail());
		session.setAttribute("roleId", login.getRoleId());
		session.setAttribute("num", login.getNum());
		UserBasicInfo userBasicInfo = userBasicInfoMapper.findUserBasicInfoByUserId(login.getId());
		if (userBasicInfo != null) {
			session.setAttribute("userName", userBasicInfo.getUserName());
			session.setAttribute("userEmail",userBasicInfo.getEmail());
			session.setAttribute("quantityHH", userBasicInfoMapper.findQuantity(login.getId()));
			session.setAttribute("quantity", userBasicInfo.getQuantity());
		}
		List<EducationExperience> list = educationExperienceMapper.getByUserId(login.getId());
		if(list.size()>0){
			session.setAttribute("university", list.get(0).getUniversity().toString());
		}
		/*OAuthVO oAuthVO = loginMapper.oAuthAccessToken(login.getId(),"sina microblog");
		if(oAuthVO!=null){
			session.setAttribute("accessToken", oAuthVO.getAccessToken());
		}*/
		if (login.getRoleId() == 1) {
			CompanyInfo companyInfo = companyMapper.getCompanyInfoOf(login.getId());
			if (companyInfo != null) {
				session.setAttribute("companyId", companyInfo.getId());
				session.setAttribute("certifyStatus",companyInfo.getCertifyStatus());
			}
		}
	}
	
}
