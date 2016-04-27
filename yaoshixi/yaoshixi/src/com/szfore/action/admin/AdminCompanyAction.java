package com.szfore.action.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import jodd.typeconverter.Convert;
import jodd.util.ArraysUtil;
import jodd.util.StringUtil;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szfore.model.CompanyInfo;
import com.szfore.model.Job;
import com.szfore.model.Login;
import com.szfore.model.RecordChart;
import com.szfore.plugin.Page;
import com.szfore.plugin.mvc.ExcelData;
import com.szfore.plugin.mvc.ExcelView;
import com.szfore.plugin.mvc.FileVariable;
import com.szfore.service.CompanyService;
import com.szfore.service.JobService;
import com.szfore.service.LoginService;
import com.szfore.service.UserService;
import com.szfore.util.DateUtil;
import com.szfore.util.Excel2003Util;
import com.szfore.util.ListUtil;
import com.szfore.utils.MD5Util;

@Controller
@RequestMapping("/admin/company")
public class AdminCompanyAction {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private JobService jobService; 
	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public String index(Page<Map<String, Object>> page,
						Map<String, Object> datas){
		if(page != null && ArraysUtil.contains(new int[]{0,3}, page.getNumPerPage())){
			page.setNumPerPage(15);
		}
		page = companyService.companyPage(page);
		
		/*List<Map<String, Object>> results = page.getResults();
		
		List<Integer> ids = ListUtil.extractPropertyOfBeans(results, "id", Integer.class);
		List<Map<String, Object>> legalJobList = companyService.legalJobCount(ids);
		List<Map<String, Object>> illegalJobList = companyService.illegalJobCount(ids);
		List<Map<String, Object>> allJobList = companyService.allJobCount(ids);
		Map<Object, Map<String, Object>> legalJobMap = ListUtil.listToMap(legalJobList, "companyid");
		Map<Object, Map<String, Object>> illegalJobMap = ListUtil.listToMap(illegalJobList, "companyid");
		Map<Object, Map<String, Object>> allJobMap = ListUtil.listToMap(allJobList, "companyid");
		for (Map<String, Object> map : results) {
			Object id = map.get("id");
			Map<String, Object> legalMap = legalJobMap.get(id);
			Map<String, Object> illegalMap = illegalJobMap.get(id);
			Map<String, Object> allMap = allJobMap.get(id);
			
			int legal = legalMap == null ? 0 : Convert.toIntValue(legalMap.get("cnt"));
			int illegal = illegalMap == null ? 0 : Convert.toIntValue(illegalMap.get("cnt"));
			int all = allMap == null ? 0 : Convert.toIntValue(allMap.get("cnt"));
			
			map.put("legal", legal);
			map.put("illegal", illegal);
			map.put("all", all);
		}*/
		//page.setResults(results);
		datas.put("page", page);
		return "/admin/company/index";
	}
	
	@RequestMapping("/uLogin")
	public String uLogin(Page<Map<String, Object>> page,
						Map<String, Object> datas){
		page = userService.findUserAll(page);
		datas.put("page", page);
		return "/admin/user/uLogin";
	}
	/**
	 * <p>学生统计用户数量<br/>
	 * @title uRecordChart<br/>
	 * @date 2014-4-9 下午5:23:38<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param userName
	 * @param page
	 * @param datas
	 * @return
	 */
	@RequestMapping("/uRecordChart")
	public String uRecordChart(HttpServletRequest request,String responseTime,
			Page<Map<String, Object>> page,Map<String, Object> datas){
		page=userService.findUserCount(responseTime,page);
		datas.put("page", page);
		datas.put("responseTime", responseTime);
		return "/admin/user/uRecordChart";
	}
	/**
	 * <p>企业统计用户数量<br/>
	 * @title enterpriseRecord<br/>
	 * @date 2014-4-24 上午10:21:37<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param responseTime
	 * @param page
	 * @param datas
	 * @return
	 */
	@RequestMapping("/enterpriseRecord")
	public String enterpriseRecord(HttpServletRequest request,String responseTime,
			Page<Map<String, Object>> page,Map<String, Object> datas){
		page=userService.findUserCount(responseTime,page);
		datas.put("page", page);
		datas.put("responseTime", responseTime);
		return "/admin/company/enterpriseRecord";
	}
	/**
	 * <p>查看公司职位的发布时间和信息以及投递量<br/>
	 * @title postRecord<br/>
	 * @date 2014-4-14 下午3:18:36<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param request
	 * @param startTime
	 * @param endTime
	 * @param page
	 * @return
	 */
	@RequestMapping("/postRecord")
	public String postRecord(HttpServletRequest request,String startTime,String endTime,String companyName,
			Page<Map<String, Object>> page,Map<String, Object> datas){
		page.setResults(jobService.postRecord(startTime, endTime,companyName, page));
		datas.put("page", page);
		datas.put("startTime", startTime);
		datas.put("endTime", endTime);
		datas.put("companyName", companyName);
		return "/admin/user/postRecord";
	}
	@RequestMapping("/postRecordExcel")
	public String postRecordExcel(){
		//exportExcel(jobService.postRecord(startTime, endTime, page));
		return "/admin/user/postRecordExcel";
	}

	@RequestMapping("/exportExcels")
	public String exportExcels(String name,String startTime,String endTime,
			Map<String, Object> data){
		//exportExcel(name,jobService.postRecord(startTime, endTime, page));
		List<Map<String, Object>> chargeList = jobService.postRecordExcel(startTime, endTime);
		if(chargeList == null || chargeList.isEmpty())
		{
			data.put("errorMessage", "暂时没有费用支出项，导出失败");
			return "exportError";
		}
		 String[] columnNames = {"发布时间","地区","公司名称","公司简介","联系电话","HR邮箱","发布职位",
	    		   "接收简历量","职位浏览量","激活码","激活码状态"};
		 String[] properties = {"publishTime", "city", "companyName", "companyDesc", "phone", "email",
				 "jobName","count","pageView","cdkey","cdkeyStatus"};
		 String fileName = name+".xls";
		 data.put("excelData", new ExcelData(fileName, columnNames, properties, chargeList));
		//return "{\"msg\":\"已成功导出到D盘\", \"status\": \"200\"}";
		return ExcelView.EXCEL_VIEW;
	}
	
	@RequestMapping("/import")
	public String importCompany(){
		return "/admin/company/import";
	}
	@RequestMapping("/upload")
	public String uploadCompany(
			@FileVariable("xls")File xls,
			Map<String, Object> viewData){
		if(xls == null){
			return "/admin/company/result";
		}
		List<Map<String, String>> datas = Excel2003Util.readExcelToList(xls, 2, "#end");
		//获取已存在的用户userId
		//List<String> usernameList = ListUtil.extractPropertyOfBeans(datas, "G", String.class);
		//List<Map<String, Object>> userIdList = loginService.findUserIdsByUsername(usernameList); 
		//Map<Object, Map<String, Object>> userIdMap = ListUtil.listToMap(userIdList,"email");
		
		//获取已存在的companyId
		List<String> companyNameList = ListUtil.extractPropertyOfBeans(datas, "B", String.class);
		List<Map<String, Object>> existCompanyList = companyService.getCompanyByName(companyNameList);
		Map<Object, Map<String, Object>> existComanyMap = ListUtil.listToMap(existCompanyList, "companyName");
		
		List<Map<String, String>> errorList = new ArrayList<Map<String, String>>();
		for (Map<String, String> map : datas) {
			//Integer userId = getUserId(map, userIdMap, errorList);//由于导入企业时，不一定存在了该企业在要实习的负责人，所以这项不必填，留空即可
			Integer comanyInfoId = insertCompanyInfo(map, null, existComanyMap,errorList);
			insertTag(comanyInfoId, map);
			insertJob(comanyInfoId,map);
		}
		viewData.put("errorList", errorList);
		return "/admin/company/result";
	}
	
	private void insertJob(
			Integer comanyInfoId, 
			Map<String, String> map) {
		if(comanyInfoId == null){
			return;
		}
		//from column O. 
		for (int i = 17; i < map.size(); i+=12) {
			if(StringUtil.isBlank(map.get(Excel2003Util.COLUMNS[i]))){
				continue;
			}
			if("#end".equals(map.get(Excel2003Util.COLUMNS[i]))){
				break;
			}
			//插入职位
			//K-R
			//职位名称1	所属部门	工作性质	时间要求	实习时间段要求	薪资范围	学历要求	其他要求
			Job job = new Job();
			job.setCompanyId(comanyInfoId);
			job.setJobName(map.get(Excel2003Util.COLUMNS[i]));
			System.out.println(i + "=="+map.get(Excel2003Util.COLUMNS[i]));
			job.setJobDesc(map.get(Excel2003Util.COLUMNS[i+1]));
			if("全职".equals(map.get(Excel2003Util.COLUMNS[i+2]))){
				job.setWorkTime("1");
			}else if("按天".equals(map.get(Excel2003Util.COLUMNS[i+2]))){
				job.setWorkTime("2");
			}else if("按小时".equals(map.get(Excel2003Util.COLUMNS[i+2]))){
				job.setWorkTime("3");
			} else {
				//格式不对，默认为全职
				job.setWorkTime("1");
			}
			//job.setWorkTimeInterval(map.get(Excel2003Util.COLUMNS[i+4]));
			job.setPayment(map.get(Excel2003Util.COLUMNS[i+3]));
			if("不限".equals(map.get(Excel2003Util.COLUMNS[i+4]))){
				job.setEducationalReq("1");
			}else if("高中".equals(map.get(Excel2003Util.COLUMNS[i+4]))){
				job.setEducationalReq("2");
			}else if("专科".equals(map.get(Excel2003Util.COLUMNS[i+4]))){
				job.setEducationalReq("3");
			}else if("本科".equals(map.get(Excel2003Util.COLUMNS[i+4]))){
				job.setEducationalReq("4");
			}else if("硕士".equals(map.get(Excel2003Util.COLUMNS[i+4]))){
				job.setEducationalReq("5");
			}else if("博士".equals(map.get(Excel2003Util.COLUMNS[i+4]))){
				job.setEducationalReq("6");
			} else {
				//格式不对，默认为不限
				job.setEducationalReq("1");
			}
			if(!"".equals(map.get(Excel2003Util.COLUMNS[i+5])) && map.get(Excel2003Util.COLUMNS[i+5])!=null){
				job.setEmploy(Integer.valueOf(map.get(Excel2003Util.COLUMNS[i+5])));
			}
			job.setOtherReq(map.get(Excel2003Util.COLUMNS[i+6]));
			job.setJobRequest(map.get(Excel2003Util.COLUMNS[i+7]));
			job.setCity(map.get(Excel2003Util.COLUMNS[i+8]));
			job.setArea(map.get(Excel2003Util.COLUMNS[i+9]));
			job.setTemptation(map.get(Excel2003Util.COLUMNS[i+10]));
			job.setCategory(map.get(Excel2003Util.COLUMNS[i+11]));
			job.setStatus(1);
			job.setPublishTime(new Date());
			if(!"".equals(job.getJobName()) && job.getJobName()!=null){
				jobService.saveExcel(job);
				//记录新增职位
				RecordChart recordChart = new RecordChart();
				recordChart.setNewJobs(1);
				recordChart.setResponseTime(new Date());
				List<RecordChart> list = userService.findByTime(DateUtil
						.dateFormat("yyyy-MM-dd", new Date()));
				if (list.size() > 0) {
					userService.updateRecordChart(
							DateUtil.dateFormat("yyyy-MM-dd", new Date()),
							recordChart);
				} else {
					userService.insertRecordChart(recordChart);
				}
				//记录新增职位
			}
		}
	}
	private Integer getUserId(
			Map<String, String> map,
			Map<Object, Map<String, Object>> userIdMap,
			List<Map<String, String>> errorList){
		String email = map.get("E");
		if(StringUtil.isBlank(email)){
			Map<String, String> error = new HashMap<String, String>();
			error.put("no", map.get("C"));
			error.put("msg", "未填写负责人帐号");
			errorList.add(error);
			return null;
		}
		Map<String, Object> tmpMap = userIdMap.get(email);
		Integer userId = tmpMap == null ? -1 : Convert.toInteger(tmpMap.get("id"),-1);
		if(userId == -1){
			Login login = new Login();
			login.setEmail(email);
			login.setPassword(MD5Util.getMD5("123456"));
			login.setRegistId(MD5Util.getMD5(email));
			login.setRoleId(Login.ROLE_COMPANY);
			login.setActiveStatus(1);
			
			userId = loginService.insertLogin(login);
			Map<String, Object> loginMap = new HashMap<String, Object>();
			
			loginMap.put("id", userId);
			loginMap.put("email", email);
			userIdMap.put(email, loginMap);
		}
		if(userId == -1){
			Map<String, String> error = new HashMap<String, String>();
			error.put("no", map.get("C"));
			error.put("msg", "插入负责人帐号失败");
			errorList.add(error);
			userId = null;
		}
		return userId;
	}
	private Integer insertCompanyInfo(
			Map<String, String> map,
			Integer userId,
			Map<Object, Map<String, Object>>existComanyMap,
			List<Map<String, String>> errorList){
//		if(userId == null){
//			return null;
//		}
		//A    C-J
		//公司城市     公司全称	   公司简称   公司简介  网站    联系电话    接收简历邮箱	    公司地址	公司性质	 行业领域   公司专业   公司规模    发展阶段  公司标签
		String comanyName = map.get("B");
		if(existComanyMap.containsKey(comanyName)){
			System.out.println("公司已经存在，请手动修改信息，不支持导入更新");
			return Convert.toInteger(existComanyMap.get(comanyName).get("id"),null);
		}
		
		System.out.println("A===" + map.get("A"));
		System.out.println("B===" + map.get("B"));
		System.out.println("C===" + map.get("C"));
		System.out.println("D===" + map.get("D"));
		System.out.println("E===" + map.get("E"));
		System.out.println("F===" + map.get("F"));
		System.out.println("G===" + map.get("G"));
		System.out.println("H===" + map.get("H"));
		System.out.println("I===" + map.get("I"));
		System.out.println("J===" + map.get("J"));
		System.out.println("K===" + map.get("K"));
		System.out.println("L===" + map.get("L"));
		System.out.println("M===" + map.get("M"));
		System.out.println("N===" + map.get("N"));
		System.out.println("P===" + map.get("P"));
		System.out.println("O===" + map.get("O"));
		System.out.println("Q===" + map.get("Q"));
		CompanyInfo companyInfo = new CompanyInfo();
		companyInfo.setCity(map.get("A"));
		companyInfo.setCompanyName(map.get("B"));
		companyInfo.setCompanyShortName(map.get("C"));
		companyInfo.setCompanySlogan(map.get("D"));
		companyInfo.setCompanyDesc(map.get("E"));
		companyInfo.setHomePage(map.get("F"));
		companyInfo.setPhone(map.get("G"));
		companyInfo.setEmail(map.get("H"));
		companyInfo.setAddr(map.get("I"));
		companyInfo.setNature(map.get("J"));
		companyInfo.setFiledes(map.get("K"));
		companyInfo.setMajor(map.get("L"));
		companyInfo.setScale(map.get("M"));
		companyInfo.setGrowthStage(map.get("N"));
		if(!"".equals(map.get("Q")) && map.get("Q") != null && !"无".equals(map.get("Q"))){
			companyInfo.setCompanyLogo("res/upload/logo/"+map.get("Q"));
		}else{
			companyInfo.setCompanyLogo("res/upload/logo/defaultlogo.png");
		}
		if(!"".equals(map.get("P")) && map.get("P") != null){
			companyInfo.setFamous(Integer.valueOf(map.get("P")));
		}
		companyInfo.setCertifyStatus(1);
		companyInfo.setCreateDate(new Date());
		String uuid = randomString(11);//随机生成激活码
		//System.out.println(uuid);
		companyInfo.setCdkey(uuid);
		companyService.addCompanyExcel(companyInfo);
		if(companyInfo.getId() == 0){
			Map<String, String> error = new HashMap<String, String>();
			error.put("no", map.get("B"));
			error.put("msg", "插入负责人帐号失败");
			errorList.add(error);
			return null;
		}
		Map<String, Object> comanyInfoMap = new HashMap<String, Object>();
		comanyInfoMap.put("id", companyInfo.getId());
		existComanyMap.put(comanyName, comanyInfoMap);
		return companyInfo.getId();
	}
	
	private static Random randGen = null;
	private static char[] numbersAndLetters = null;
	/**
	 * <p>产生随机字符串<br/>
	 * @title randomString<br/>
	 * @date 2014-4-15 下午5:13:46<br/>
	 * @author yejian<br/>
	 * @version v1.0.0
	 * @param length 字符串长度
	 * @return
	 */
	public static final String randomString(int length) {
	         if (length < 1) {
	             return null;
	         }
	         if (randGen == null) {
	                randGen = new Random();
	                numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
	                   "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                  //numbersAndLetters = ("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                 }
	         char [] randBuffer = new char[length];
	         for (int i=0; i<randBuffer.length; i++) {
	             randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
	          //randBuffer[i] = numbersAndLetters[randGen.nextInt(35)];
	         }
	         return new String(randBuffer);
	}
	
	private void insertTag(Integer comanyInfoId,Map<String, String> map){
		if(comanyInfoId == null){
			return;
		}
		//J
		String tags = map.get("O");
		if(StringUtil.isNotBlank(tags)){
			String[] tagArr = StringUtil.split(tags, "#");
			for (String tag : tagArr) {
				System.out.println("插入公司标签====" + tag);
				companyService.addTag(comanyInfoId, tag);
			}
		}
	}
	
	/**  
     * 数据库导出至Excel表格  
   */   
    public static void exportExcel(String name , List<Map<String,Object>> list){     
       // 准备设置excel工作表的标题     
       String[] title = {"发布时间","地区","公司名称","公司简介","联系电话","HR邮箱","发布职位",
    		   "接收简历量","职位浏览量","激活码","激活码状态"};     
       try {     
            // 获得开始时间     
            long start = System.currentTimeMillis();     
           // 输出的excel的路径     
            String filePath = "d:\\"+name+".xls";     
            // 创建Excel工作薄     
            WritableWorkbook wwb;     
           // 新建立一个jxl文件,即在e盘下生成testJXL.xls     
            OutputStream os = new FileOutputStream(filePath);     
            wwb=Workbook.createWorkbook(os);      
          // 添加第一个工作表并设置第一个Sheet的名字     
          WritableSheet sheet = wwb.createSheet("职位投递记录", 0);     
            Label label;     
            for(int i=0;i<title.length;i++){     
                // Label(x,y,z) 代表单元格的第x+1列，第y+1行, 内容z     
              // 在Label对象的子对象中指明单元格的位置和内容     
               label = new Label(i,0,title[i]);     
               // 将定义好的单元格添加到工作表中     
              sheet.addCell(label);     
           }     
           // 下面是填充数据     
            /*    
             * 保存数字到单元格，需要使用jxl.write.Number  
             * 必须使用其完整路径，否则会出现错误  
             * */   
              
            /*ProductDao dao=new ProductDaoImpl();  
            List<Product> list=dao.queryAll();  */
            for(int i=0;i<list.size();i++){  
               // 填充产品编号     s
            	label = new Label(0,i+1,String.valueOf(list.get(i).get("publishTime")));     
                sheet.addCell(label);     
                // 填充产品名称     
                label = new Label(1,i+1,(String) list.get(i).get("city"));     
                sheet.addCell(label); 
                label = new Label(2,i+1,(String) list.get(i).get("companyName"));     
                sheet.addCell(label); 
                label = new Label(3,i+1,(String) list.get(i).get("companyDesc"));     
                sheet.addCell(label); 
                label = new Label(4,i+1,(String) list.get(i).get("phone"));     
                sheet.addCell(label); 
                label = new Label(5,i+1,(String) list.get(i).get("email"));     
                sheet.addCell(label); 
                label = new Label(6,i+1,(String) list.get(i).get("jobName"));     
                sheet.addCell(label); 
                jxl.write.Number measure = new jxl.write.Number(7,i+1,Integer.valueOf(String.valueOf(list.get(i).get("count"))));     
                sheet.addCell(measure);   
                jxl.write.Number type = new jxl.write.Number(8,i+1,Integer.valueOf(String.valueOf(list.get(i).get("pageView"))));     
                sheet.addCell(type);   
                label = new Label(9,i+1,(String) list.get(i).get("cdkey"));     
                sheet.addCell(label); 
                if("1".equals(list.get(i).get("cdkeyStatus"))){
                	sheet.addCell(new Label(10, i+1, "已使用")); 
			    }else{
			    	sheet.addCell(new Label(10, i+1, "未使用"));
			    }
            }    
           // 写入数据     
           wwb.write();     
            // 关闭文件     
           wwb.close();     
            long end = System.currentTimeMillis();     
           System.out.println("----完成该操作共用的时间是:"+(end-start)/1000);     
        } catch (Exception e) {     
            System.out.println("---出现异常---");     
            e.printStackTrace();     
        }     
    }     
    
  /*  public String dds(){
	List<Map<String, Object>> chargeList = chargeManager.list(trainProjectId);
			
			if(chargeList == null || chargeList.isEmpty())
			{
				data.put("errorMessage", "暂时没有费用支出项，导出失败");
				return "exportError";
			}
			
			TrainProjectVo project = trainProjectManager.getOf(trainProjectId);
			
			String[] columnNames = {"事项", "金额", "时间", "登记人", "发票", "备注"};
			String[] properties = {"title", "money", "chargeTime", "name", "invoice", "mark"};
			String fileName = project.getTitle() + "项目--费用支出明细.xls";
			
			List<Map<String, Object>> datas = MobileResult.create(chargeList, properties)
														  .formatDateValue("yyyy-MM-dd HH:mm", "chargeTime")
														  .replaceValue(Charge.INVOICE_MAP, "invoice")
														  .getResultList();
			
			data.put("excelData", new ExcelData(fileName, columnNames, properties, datas));
			
			return ExcelView.EXCEL_VIEW;

    }*/
    
    @RequestMapping("deliveryRecord")
    public String deliveryRecord(Page<Map<String, Object>> page,
			Map<String, Object> datas){
    	page = userService.findDeliveryRecord(page);
		datas.put("page", page);
		return "/admin/user/deliveryRecord";
    }
}
