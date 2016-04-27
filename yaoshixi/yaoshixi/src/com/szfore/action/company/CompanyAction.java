package com.szfore.action.company;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import jodd.io.FileUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szfore.action.company.vo.CompanyIndexData;
import com.szfore.action.company.vo.CompanyJob;
import com.szfore.mapper.CompanyMapper;
import com.szfore.mapper.InternMapper;
import com.szfore.mapper.RelevanceMapper;
import com.szfore.mapper.TagCompanyMapper;
import com.szfore.mapper.UserBasicInfoMapper;
import com.szfore.model.CompanyInfo;
import com.szfore.model.Intern;
import com.szfore.model.Job;
import com.szfore.model.Relevance;
import com.szfore.model.UserBasicInfo;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.FileVariable;
import com.szfore.plugin.mvc.RequestBean;
import com.szfore.plugin.mvc.SessionValue;
import com.szfore.service.CompanyService;
import com.szfore.util.DWZUtil;
import com.szfore.util.ImageCut;

@Controller
@RequestMapping("/company")
public class CompanyAction {
	
	public static final String UPLOAD_LOGO_DIR = "res/upload/logo/";
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private TagCompanyMapper tagCompanyMapper;
	@Autowired
	private RelevanceMapper relevanceMapper;
	@Autowired
	private InternMapper internMapper;
	@Autowired
	private UserBasicInfoMapper userBasicInfoMapper;
	/**
	 * 我的公司首页
	 */
	@RequestMapping("/index")
	public String index(@SessionValue("userId")Integer userId, 
						@SessionValue("companyId")Integer companyId,
						Map<String, Object> data)
	{
		CompanyIndexData companyIndexData = companyService.load(companyId); 
		
		data.put("company", companyIndexData);
		data.put("isCompany", true);
		
		return "company/index";
	}
	
	@RequestMapping("/jobList")
	public String jobList(@SessionValue("companyId")Integer companyId, @ModelAttribute("page")Page<CompanyJob> page)
	{
		companyService.listJobs(companyId, Job.STATUS_ONLINE, page);
		return "company/jobList";
	}
	
	/**
	 * 添加公司信息
	 */
	@RequestMapping("/add")
	public String add(@SessionValue("userId")Integer userId, 
			@RequestBean("companyInfo") CompanyInfo companyInfo){
		System.out.println("companyName="+companyInfo.getCompanyName());
		companyInfo.setUserId(userId);
		companyInfo.setCreateDate(new Date());
		if("2000人以上".equals(companyInfo.getScale())){
			companyInfo.setFamous(1);
		}else if("500-2000人".equals(companyInfo.getScale())){
			companyInfo.setFamous(2);
		}else if("150-500人".equals(companyInfo.getScale())){
			companyInfo.setFamous(3);
		}else if("50-150人".equals(companyInfo.getScale())){
			companyInfo.setFamous(4);
		}else if("15-50人".equals(companyInfo.getScale())){
			companyInfo.setFamous(5);
		}else if("少于15人".equals(companyInfo.getScale())){
			companyInfo.setFamous(6);
		}else{
			companyInfo.setFamous(7);
		}
		companyInfo.setCertifyStatus(0);
		if(companyMapper.getCompanyInfoOf(userId)==null){
			companyMapper.addCompany(companyInfo);
			request.getSession().setAttribute("companyId", companyInfo.getId());
			request.getSession().setAttribute("userName", companyInfo.getCompanyName());
			request.getSession().setAttribute("certifyStatus", CompanyInfo.STATUS_UN_CERTIFY);
		}else{
			companyMapper.updateCompanyByUserId(companyInfo);
			
			UserBasicInfo userBasicInfo = new UserBasicInfo();
			userBasicInfo.setUserId(userId);
			userBasicInfo.setEmail(companyInfo.getEmail());
			userBasicInfo.setUserName(companyInfo.getCompanyName());
			userBasicInfoMapper.updateUserBasicInfo(userBasicInfo);
			
			request.getSession().setAttribute("companyId", companyInfo.getId());
			request.getSession().setAttribute("userName", companyInfo.getCompanyName());
			request.getSession().setAttribute("certifyStatus", CompanyInfo.STATUS_UN_CERTIFY);
		}
		return "company/certifyInfo";
	}
	
	@RequestMapping("/saveEdit")
	public String saveEdit(@SessionValue("companyId") Integer companyId, 
			@RequestBean("companyInfo")CompanyInfo companyInfo, Map<String, Object> data){
		companyInfo.setId(companyId);
		companyMapper.updateCompanyById(companyInfo);
		CompanyIndexData companyIndexData = companyService.load(companyId);
		data.put("company", companyIndexData);
		if(companyInfo.getGrowthStage()!=null && !"".equals(companyInfo.getGrowthStage())){
			return "company/growthStage";
		}else if(companyInfo.getFounder()!=null && !"".equals(companyInfo.getFounder())){
			return "company/founder";
		}else if(companyInfo.getBusinessLicense()!=null){
			return "company/businLice";
		}else if(companyInfo.getCompanyName()!=null && !"".equals(companyInfo.getCompanyName())){
			return "company/nameAndIntro";
		}else{
			return "company/addressInfo";
		}
	}
	
	@RequestMapping("/uploadLicense")
	@ResponseBody
	public String uploadLicense(@FileVariable("logo")File logo) throws Exception
	{
		//按照图片的设置大小生成
		ImageCut.scale(logo.getAbsolutePath(), logo.getAbsolutePath(), 3000, 3000);
		//String LogoName = URLEncoder.encode(logo.getName(), "utf-8");
		String destPath = getContextPath() + UPLOAD_LOGO_DIR+logo.getName();
		FileUtil.move(logo.getAbsolutePath(), destPath);
		BufferedImage src = ImageIO.read(new File(destPath));;
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("imgW", src.getWidth());
		data.put("imgH", src.getHeight());
		src.flush();
		return DWZUtil.success(logo.getName(), data);
	}

	@RequestMapping("/uploadLogo")
	@ResponseBody
	public String uploadLogo(@FileVariable("logo")File logo) throws Exception
	{
		//按照图片的设置大小生成
		ImageCut.scale(logo.getAbsolutePath(), logo.getAbsolutePath(), 300, 300);
		//String LogoName = URLEncoder.encode(logo.getName(), "utf-8");
		String destPath = getContextPath() + UPLOAD_LOGO_DIR+logo.getName();
		FileUtil.move(logo.getAbsolutePath(), destPath);
		BufferedImage src = ImageIO.read(new File(destPath));;
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("imgW", src.getWidth());
		data.put("imgH", src.getHeight());
		src.flush();
		return DWZUtil.success(logo.getName(), data);
	}
	
	@RequestMapping("/saveLogo")
	@ResponseBody
	public String saveLogo(@SessionValue("companyId")Integer companyId, 
			String photoName, 
			Integer x,
			Integer y, 
			Integer width, 
			Integer height){
		if(x==null || y==null || width==null || height==null){
			x=0;
			y=0;
			width=168;
			height=168;
		}
		String srcPhotoPath = getContextPath() + UPLOAD_LOGO_DIR + photoName;
		ImageCut.abscut(srcPhotoPath, srcPhotoPath, x, y, width, height);
		
		CompanyInfo companyInfo = new CompanyInfo();
		companyInfo.setId(companyId);
		companyInfo.setCompanyLogo(UPLOAD_LOGO_DIR + photoName);
		companyMapper.updateCompanyById(companyInfo);
		
		return DWZUtil.success("保存成功", photoName);
	}
	
	@RequestMapping("/addTag")
	@ResponseBody
	public String addTag(@SessionValue("companyId")Integer companyId, String tagName)
	{
		if(companyService.addTag(companyId, tagName))
		{
			return DWZUtil.success("添加成功");
		}
		
		return DWZUtil.fail("添加失败");
	}
	
	@RequestMapping("/removeTag")
	@ResponseBody
	public String removeTag(@SessionValue("companyId")Integer companyId, String tagName)
	{
		if(companyService.removeTag(companyId, tagName))
		{
			return DWZUtil.success("删除成功");
		}
		return DWZUtil.fail("删除失败");
	}
	
	@RequestMapping("/candidateTag")
	public String loadCndidateTag(@ModelAttribute("page")Page<String> page)
	{
		List<String> candidateTags = tagCompanyMapper.listCandidateTag(page);
		page.setResults(candidateTags);
		return "company/candidateTag";
	}
	
	private String getContextPath() 
	{
		return request.getServletContext().getRealPath("/");
	}
	
	@RequestMapping("/jobComment/{userId}/{status}/{companyId}")
	public String jobComment(HttpServletRequest request,@PathVariable("userId")int userId,
			@PathVariable("status")int status,@PathVariable("companyId")int companyId,Map<String,Object> data){
		
		return "";
	}
	
	/**
	 * <p>公司评论用户判断是否录用而决定调用的页面<br/>
	 * @title companyRelevance<br/>
	 * @date 2014-4-3 上午9:53:38<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param userId 用户id
	 * @param companyId 公司id
	 * @param jobId 职位id
	 * @param data
	 * @return
	 */
	@RequestMapping("/commentUser/{userId}/{companyId}/{jobId}")
	public String companyRelevance(@PathVariable("userId")int userId,@PathVariable("companyId")int companyId ,@PathVariable("jobId")int jobId ,Map<String,Object> data) {
		 Relevance relevance = relevanceMapper.getUserRelevance(userId, companyId,1,jobId);
		 List<Intern> list = internMapper.findEntry(companyId, userId, jobId);
		 if(list.size()>0){
			 if(relevance!=null){
				 data.put("content", relevance.getContent());
			 }
			 data.put("uId", userId);
			 data.put("cId", companyId);
			 data.put("jobId", jobId);
		 }else{
			 data.put("msg", "您还未录用该职员");
		 }
		return "user/commentUser";
	}
	@RequestMapping("/commentUserOnWx/{userId}/{companyId}/{jobId}")
	public String companyRelevanceOnWx(@PathVariable("userId")int userId,@PathVariable("companyId")int companyId ,@PathVariable("jobId")int jobId ,Map<String,Object> data) {
		 Relevance relevance = relevanceMapper.getUserRelevance(userId, companyId,1,jobId);
		 List<Intern> list = internMapper.findEntry(companyId, userId, jobId);
		 if(list.size()>0){
			 if(relevance!=null){
				 data.put("content", relevance.getContent());
			 }
			 data.put("uId", userId);
			 data.put("cId", companyId);
			 data.put("jobId", jobId);
		 }else{
			 data.put("msg", "您还未录用该职员");
		 }
		return "openLogin/ProcessingResumes/commentUser";
	}
	/**
	 * <p>保存用户和企业的评价方法<br/>
	 * @title saveRelevance<br/>
	 * @date 2014-4-3 上午10:20:50<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param uId 用户id
	 * @param cId 企业id
	 * @param status 1为公司对用户的评价，2为用户对公司的评价
	 * @param content 评价内容
	 * @param jobId 职位id
	 * @return
	 */
	@RequestMapping("/SubmitReviewes")
	@ResponseBody
	public String SubmitReviewes(HttpServletRequest request,int uId,int cId,int status,String content,int jobId){
		Relevance relevance = relevanceMapper.getUserRelevance(uId, cId,status,jobId);
		if(relevance!=null){
			relevanceMapper.updateRelevance(uId, cId, status, content,jobId);
		}else{
			relevanceMapper.saveRelevance(uId, cId,status,content,jobId);
		}
		return "{\"msg\":\"评论成功！\", \"status\": \"200\"}";
	}
	
}
