<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
function preview(oper){  
	if (oper < 10){  
		bdhtml=window.document.body.innerHTML;//获取当前页的html代码  
		sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域  
		eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域  
		prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html  
		prnhtmlprnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html  
		window.document.body.innerHTML=prnhtml;  
		window.print();  
		window.document.body.innerHTML=bdhtml;  
	} else {  
		window.print();  
	}  
}  
</script>
<style type="text/css">
.available {
	color:#000000
}
.invailable {
	color:#cccccc
}
@media print {
.noprint { display: none;color:green }
} 
</style>
<!--startprint1-->
<div id="body">
	    <div style="margin:0 auto;padding:50px 20px;width: 750px;min-height:720px;line-height:30px;position: relative;">
	   		<div><img src="http://www.yaoshixi.com/res/images/logo.png" width="121" height="140"/></div>
	   		<p style="font-size:16px;color:#666666;padding:10px 0 20px;">免费发职位，百万优秀大学生简历，就在要实习™。如果职位已招满，请点击这里关闭职位。</p>
            <div style="color:#000;padding:10px 0;font-size:30px;">${userBasicInfo.userName }<label style="font-size:20px;color:#666666;padding-left:20px;">(${userBasicInfo.gender==0?"男":"女" })</label></div>
          	 <div style="float:left;">
          	 	
	           <c:if test="${declaration != '' && declaration != null && declaration != 'hh'}">
               <div style="float:left;width:750px;margin-bottom:30px;">
		           <div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">求职宣言</div>
                 	</div>
		             	 <div style="position: relative;overflow: hidden;min-height: 35px;">
		             		<div style="float:left;">${declaration}</div>
		             	</div>
	           </div>
	           </c:if>
	           </div>
	           <div style="float:left;width:750px;margin-bottom:30px;">
                    <div style="position: relative;overflow: hidden;min-height: 35px;color:#666666;">
                    	<div style="float:left;">
                            <p><%-- <label>${university}</label> • <label>${major}</label> • <label>
                       				<c:if test="${education==2 }">高中 </c:if>
                               	 	<c:if test="${education==3 }">大专 </c:if>
                               	 	<c:if test="${education==4 }">本科 </c:if>
                               	 	<c:if test="${education==5 }">硕士</c:if>
                               	 	<c:if test="${education==6 }">博士</c:if> --%>
                               	<label>所在城市：${userBasicInfo.city}</label> • <label>出生年月：<fmt:formatDate value="${userBasicInfo.birthDay }" pattern="yyyy-MM-dd"/></label></p>
                            <p>
								<label>手机：${userBasicInfo.telPhone }</label>
							</p>
						    <p>
								<label>邮箱：${userBasicInfo.email }</label>
							</p>
							
                        </div>
                        <div style="float:right;width:200px; text-align:center;">
                        	<c:if test="${userBasicInfo.headImg=='' || userBasicInfo.headImg ==null}"><img  src="http://www.yaoshixi.com/res/images/cor.png" width="134" height="125"></c:if>
                        	<c:if test="${userBasicInfo.headImg!='' && userBasicInfo.headImg !=null}"><img src="http://www.yaoshixi.com/user/getHeadPhoto?ImgPath=${userBasicInfo.headImg }" width="134" height="125"></c:if>
                        </div>
                        <div style="clear:both;">
                        	<p>
								<label>自我描述：${userBasicInfo.selfDescription}</label>
							</p>
                        </div>
                    </div>
                
               </div>
             
             <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">教育经历</div>
                 	</div>
                 	<c:forEach items="${education }" var="education">
	                    <div style="float:left;margin-bottom: 20px;width:100%">
	                         <table width="100%">
	                             <tr><td width="100px" style="padding-right:10px;color:#b3b2b2;line-height: 15px;" rowspan="2">
	                             <p><label><fmt:formatDate value="${education.enterUniversityYear }" pattern="yyyy-MM-dd"/> 至</label></p>
	                           		<p><label><fmt:formatDate value="${education.endUniversityYear }" pattern="yyyy-MM-dd"/></label></p>
	                           		</td><td style="color:#58667B">${education.university}&nbsp;&nbsp;${education.major}&nbsp;&nbsp;
	                           			<c:if test="${education.education==2 }">高中 </c:if>
	                               	 	<c:if test="${education.education==3 }">大专 </c:if>
	                               	 	<c:if test="${education.education==4 }">本科 </c:if>
	                               	 	<c:if test="${education.education==5 }">硕士</c:if>
	                              		<c:if test="${education.education==6 }">博士</c:if></td></tr>
	                              	<tr><td>${education.majorAbility}</td></tr>
	                         </table>
	                    </div>
                    </c:forEach>
             </div>
             <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">社团实践</div>
                 	</div>
                 <c:forEach items="${social }" var="social">
                    <div style="float:left;margin-bottom: 20px;width:100%">
                         <table width="100%">
                             <tr><td width="100px" style="padding-right:10px;color:#b3b2b2;line-height: 15px;" rowspan="2">
                             <p><label style="height: 10px"><fmt:formatDate value="${social.starDayNum }" pattern="yyyy-MM-dd"/> 至</label></p>
                           		<p><label style="height: 10px"><fmt:formatDate value="${social.endDayNum }" pattern="yyyy-MM-dd"/></label></p>
                           		</td><td style="color:#58667B">职位:${social.position }&nbsp;&nbsp;学校:${social.school }&nbsp;&nbsp;</td></tr>
                              	<tr><td>活动内容:${social.activityContent }</td></tr>
                         </table>
                    </div>
                 </c:forEach>   
             </div>
             <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">实习经历</div>
                 	</div>
                <c:forEach items="${experience }" var="experience">	
                    <div style="float:left;margin-bottom: 20px;width:100%">
                         <table width="100%">
                             <tr><td width="100px" style="padding-right:10px;color:#b3b2b2;line-height: 15px;" rowspan="2" >
                             <p><label><fmt:formatDate value="${experience.ksTime }" pattern="yyyy-MM-dd"/> 至</label></p>
                           		<p><label><fmt:formatDate value="${experience.jsTime }" pattern="yyyy-MM-dd"/></label></p>
                           		</td><td style="color:#58667B">公司:${experience.sxCompanyName }&nbsp;&nbsp;职位:${experience.sxPosition }&nbsp;&nbsp;</td></tr>
                              	<tr><td>实习内容:${experience.sxConut }</td></tr>
                         </table>
                    </div>
               </c:forEach>      
             </div>
              <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">校内奖励</div>
                 	</div>
                 <c:forEach items="${award }" var="award">
                    <div style="float:left;margin-bottom: 20px;width:100%">
                         <table width="100%">
                             <tr><td width="100px" style="padding-right:10px;color:#b3b2b2;line-height: 10px;" >
                                 <p><label><fmt:formatDate value="${award.rewardTime }" pattern="yyyy-MM-dd"/></label></p>
                           		</td><td style="color:#58667B">活动奖项:${award.schoolReward }&nbsp;&nbsp;学校:${award.seminary }</td></tr>
                         </table>
                    </div>
                  </c:forEach>  
             </div>
              <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">职业技能</div>
                 	</div>
                 	<div style="width:200px;font-size: 16px;padding-left:110px;">语言能力</div>
                <c:forEach items="${vocational }" var="vocational">
                 	<div style="width:80%;padding-left:110px;line-height: 24px;">
                     	<p style="color:#58667B">${vocational.language }</p>
                    	<p>听说：${vocational.hearOf }  读写：${vocational.readWrite } 
	                    	<c:if test="${vocational.language == '英语' || vocational.language == '日语'}">
	                    		${vocational.grade }
	                    	</c:if>
	                    	<c:if test="${vocational.language == '英语'}">
	                    	${vocational.score }
	                    	</c:if>
                    	</p>
                     </div>
                </c:forEach>	
                     <!-- <div style="width:100%;padding-left:110px;margin-bottom:10px;">
                     	<p style="color:#58667B">日语</p>
                    	<p>听说：熟练  读写：良好 二级</p>
                     </div> -->
                     
                    <div style="width:100px;font-size: 16px;padding-left:110px;">IT技能</div>
                     <div style="width:80%;padding-left:110px;line-height: 24px;">
                     	<p style="color:#58667B">精通的技能</p>
                     	<c:forEach items="${itSkillJt }" var="itSkillJt">
                    		${itSkillJt.skill}&nbsp;&nbsp;
                    	</c:forEach>
                     </div>
                     <div style="width:100%;padding-left:110px;line-height: 20px;">
                     	<p style="color:#58667B">熟悉的技能</p>
                     	<c:forEach items="${itSkillPt }" var="itSkillPt">
                    		${itSkillPt.skill }&nbsp;&nbsp;
                    	</c:forEach>	 
                     </div>
                    
             </div>
             	<%--  <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 16px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:100px;">专业能力</div>
                 	</div>
                    <div style="padding-left:10px; position: relative;overflow: hidden;min-height: 35px;">
                    	<div style="float:left;">
                            <p style="padding-right:40px;">${majorAbility}</p>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
               </div> --%>
               
                 <%-- <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 16px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:100px;">特长</div>
                 	</div>
                    <div style="padding-left:10px; position: relative;overflow: hidden;min-height: 35px;">
                    	<div style="float:left;"> 
                            <p style="padding-right:40px;">${speciality}</p>
                            
                        </div>
                        <div style="clear:both;"></div>
                    </div>
               </div> --%>
            <%--   <div style="float:left;width:750px;margin-bottom:30px;">
                 	<div style="background-image: url(http://www.yaoshixi.com/res/images/jlnx_03.png);background-repeat:repeat-x;background-position: left center;margin-bottom:10px;font-size: 18px;font-weight:bold;">
                 		<div style="background-color:#FFF;width:110px;">简历附件</div>
                 	</div>
                    <div style="padding-left:10px; position: relative;overflow: hidden;min-height: 35px;">
                    	<div style="float:left;">
                            <p style="padding-right:40px;">
                            	<c:if test="${adjunct=='' || adjunct ==null}">还未上传简历附件</c:if>
   	     						<c:if test="${adjunct!='' && adjunct !=null}"><a href="http://www.yaoshixi.com/user/getFileDown?filePath=${accessory}" id="accessory">${adjunct}</a></c:if>
                            </p>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
               </div> --%>
              
           <!-- <div style="clear:both"></div> -->
    </div>
	    
	    <!-- 二维码扫一扫 -->
	  <%--   <%@include file="/scanner.jsp" %> --%>
	 <div style="clear:both"></div>
<!--endprint1--> 
	<div><INPUT onclick=javascript:preview(1) type=button value=打印 name=button_print class=noprint /></div>
</div>
