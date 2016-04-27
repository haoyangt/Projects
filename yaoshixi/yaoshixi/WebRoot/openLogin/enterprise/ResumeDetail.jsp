<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/weixin.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/skeleton.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.available {
	color:#000000
}
.invailable {
	color:#cccccc
}

.tjlx {
	position: fixed;
	bottom: 0;
	background-color: #7BC4F4;
	color: #FFF;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	line-height: 30px;
	width: 100%;
}
.tjlx a{margin-right:10px;}
</style>
</head>
<body>
	<div class="weixin_body">
	<div class="main_j">
	    
		            		    	<div class="fl" style="margin-bottom:50px;">
		            		    	<div class="fl" style="margin-bottom:10px;width:100%">
		            		    	<div style="width:100%">
		            		    	 	<%-- <div class="fr" style="padding:10px;">
			            		    		<a target="_blank" href="user/previewOnWx/${resume.userId }/${resume.jobId}/${resume.email }">
				            		    		<c:if test="${resume.headImg=='' || resume.headImg ==null}"><img src="http://www.yaoshixi.com/res/images/cor.png" width="70" height="70" ></c:if>
												<c:if test="${resume.headImg!='' && resume.headImg !=null}"><img src="http://www.yaoshixi.com/user/getHeadPhoto?ImgPath=${resume.headImg}" width="70" height="70"></c:if>
											</a>
			            		    	</div> --%>
			            		    	
			            		    	<div style="line-height:35px;margin-bottom:10px;">
			            		    		 <div style="color:#000;padding:10px 0;font-size:30px;">${userBasicInfo.userName }
			            		    		 <label style="font-size:20px;color:#666666;padding-left:20px;">
			            		    		 (${userBasicInfo.gender==0?"男":"女" })
			            		    		 </label>
			            		    		 </div>
			            		    	</div>
			            		    	
			<div style="float:left;margin-bottom:30px;">
                    <div style="position: relative;overflow: hidden;min-height: 35px;color:#666666;">
                          <div class="headimg">
                        	<c:if test="${userBasicInfo.headImg=='' || userBasicInfo.headImg ==null}"><img  src="http://www.yaoshixi.com/res/images/cor.png" width="134" height="125"></c:if>
                        	<c:if test="${userBasicInfo.headImg!='' && userBasicInfo.headImg !=null}"><img src="http://www.yaoshixi.com/user/getHeadPhoto?ImgPath=${userBasicInfo.headImg }" width="134" height="125"></c:if>
                        </div>
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
      
                        <div style="clear:both;">
							<p>
								<label>自我描述：${userBasicInfo.selfDescription}</label>
							</p>
						</div>	
                       
                    </div>
                
               </div>
		            		    	
		            		   <div class="sj_jl">
		            		    		<div class="jlbg">
					                 		<div class="jlt">教育经历</div>
					                 	</div>
					                    <c:forEach items="${education }" var="education">
						                    <div style="float:left;margin-bottom: 20px;width:100%">
						                         <table width="100%">
						                              <tr><td width="80px" style="padding-right:8px;color:#b3b2b2;line-height: 15px;font-size:14px;" rowspan="2" >
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
					             
					              <%--  <div class="sj_jl">
					                 	<div class="jlbg">
					                 		<div class="jlt">专业能力</div>
					                 	</div>
					                    <div style="padding-left:10px; position: relative;overflow: hidden;min-height: 35px;">
					                    	<div style="float:left;">
					                            <p style="padding-right:40px;">${majorAbility}</p>
					                        </div>
					                        <div style="clear:both;"></div>
					                    </div>
					               </div> --%>
					              <div class="sj_jl">
					             		<div class="jlbg">
					                 		<div class="jlt">社团实践</div>
					                 	</div>
					                    <c:forEach items="${social }" var="social">
						                    <div style="float:left;margin-bottom: 20px;width:100%">
						                         <table width="100%">
						                              <tr><td width="80px" style="padding-right:8px;color:#b3b2b2;line-height: 15px;font-size:14px;" rowspan="2" >
						                             <p><label style="height: 10px"><fmt:formatDate value="${social.starDayNum }" pattern="yyyy-MM-dd"/> 至</label></p>
						                           		<p><label style="height: 10px"><fmt:formatDate value="${social.endDayNum }" pattern="yyyy-MM-dd"/></label></p>
						                           		</td><td style="color:#58667B">职位:${social.position }&nbsp;&nbsp;学校:${social.school }&nbsp;&nbsp;</td></tr>
						                              	<tr><td>活动内容:${social.activityContent }</td></tr>
						                         </table>
						                    </div>
						                 </c:forEach> 
					             </div> 
					             
					              <div class="sj_jl">
					             		<div class="jlbg">
					                 		<div class="jlt">实习经历</div>
					                 	</div>
					                     <c:forEach items="${experience }" var="experience">	
						                    <div style="float:left;margin-bottom: 20px;width:100%">
						                         <table width="100%">
						                             <tr><td width="80px" style="padding-right:8px;color:#b3b2b2;line-height: 15px;font-size:14px;" rowspan="2" >
						                             <p><label> <fmt:formatDate value="${experience.ksTime }" pattern="yyyy-MM-dd"/>至</label></p>
						                           		<p><label><fmt:formatDate value="${experience.jsTime }" pattern="yyyy-MM-dd"/></label></p>
						                           		</td><td style="color:#58667B">公司:${experience.sxCompanyName }&nbsp;&nbsp;职位:${experience.sxPosition }&nbsp;&nbsp;</td></tr>
						                              	<tr><td>实习内容:${experience.sxConut }</td></tr>
						                         </table>
						                    </div>
						               </c:forEach>  
					             </div> 
					             
					             
					               <div class="sj_jl">
					              		<div class="jlbg">
					                 		<div class="jlt">校内奖励</div>
					                 	</div>
					                    <c:forEach items="${award }" var="award">
						                    <div style="float:left;margin-bottom: 20px;width:100%">
						                         <table width="100%">
						                              <tr><td width="80px" style="padding-right:8px;color:#b3b2b2;line-height: 15px;font-size:14px;">
						                                 <p><label><fmt:formatDate value="${award.rewardTime }" pattern="yyyy-MM-dd"/></label></p>
						                           		</td><td style="color:#58667B">活动奖项:${award.schoolReward }&nbsp;&nbsp;学校:${award.seminary }</td></tr>
						                         </table>
						                    </div>
						                  </c:forEach>  
					             </div> 
					             
					               <div class="sj_jl">
					              		<div class="jlbg">
					                 		<div class="jlt">职业技能</div>
					                 	</div>
					                 	<div style="width:200px;font-size: 16px;padding-left:90px;font-weight: bold;">语言能力：</div>
					                 	<c:forEach items="${vocational }" var="vocational">
						                 	<div style="padding-left:90px;line-height: 20px;">
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
					                     
					             		 <c:if test="${itSkillJt!='' && itSkillJt!=null}">   
						                    <div style="width:100px;font-size: 16px;padding-left:90px;font-weight: bold;">IT技能：</div>
						                     <div style="padding-left:90px;line-height: 15px;">
						                     	<p style="color:#58667B">精通的技能</p>
						                     	<c:forEach items="${itSkillJt }" var="itSkillJt">
						                    		${itSkillJt.skill}&nbsp;&nbsp;
						                    	</c:forEach>
						                     </div>
						                </c:if>     
						                <c:if test="${itSkillPt!='' && itSkillPt!=null}">   
						                     <div style="padding-left:90px;line-height: 15px;">
						                     	<p style="color:#58667B">熟悉的技能</p>
						                     	<c:forEach items="${itSkillPt }" var="itSkillPt">
						                    		${itSkillPt.skill }&nbsp;&nbsp;
						                    	</c:forEach>	 
						                     </div>
						                </c:if>   
					                     
					             </div> 
					             
					              
					              <%-- <div class="sj_jl">
					                 	<div class="jlbg">
					                 		<div class="jlt">技术特长</div>
					                 	</div>
					                    <div style="padding-left:10px; position: relative;overflow: hidden;min-height: 35px;">
					                    	<div style="float:left;">
					                            <p style="padding-right:40px;">${speciality}</p>
					                        </div>
					                        <div style="clear:both;"></div>
					                    </div>
					               </div> --%>
					             
					              <%-- <div class="sj_jl">
					                 	<div class="jlbg">
					                 		<div class="jlt">自我描述</div>
					                 	</div>
					                    <div style="padding-left:10px; position: relative;overflow: hidden;min-height: 35px;">
					                    	<div style="float:left;">
					                            <p style="padding-right:40px;">${selfDescription}</p>
					                        </div>
					                        <div style="clear:both;"></div>
					                    </div>
					        		</div> --%>
					        		
					       
					        </div>
		    </div></div>
		    <div style="clear:both"></div>
		    </div>    
	    <!-- 二维码扫一扫 -->
	   <%--  <%@include file="/scanner.jsp" %> --%>
	   
</div>
<div class="tjlx">	
											    <%-- <a href="javascript:void(0)" id="dy">打印预览
											    	<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
											    </a> --%>
												<a href="javascript:void(0)" id="yx">转到邮箱
													<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
												</a>
												
												<a href="javascript:void(0)" id="ts">转给同事
													<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
												</a>
												<a href="javascript:void(0)" id="tz">通知面试
													<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
												</a>
												<br/>
												<a href="javascript:void(0)" id="ly">录用
													<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
												</a>
												<a href="javascript:void(0)" id="pl">评论
													<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
												</a>
												<a href="javascript:void(0)" id="jj">拒绝
													<input type="hidden" id="userId" value="${userIdFor }"/>
						            		    	<input type="hidden" id="companyId" value="${companyIdFor }"/>
						            		    	<input type="hidden" id="jobId" value="${jobIdFor }"/>
						            		    	<input type="hidden" id="jobName" value="${jobNameFor }"/>
						            		    	<input type="hidden" id="email" value="${emailFor }"/>
												</a>
										</div>
										
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
		top.dialog = art;
		function createArtBox(title, url, data) {
			var artBox = art({
				id: 'artBoxForResume',
				title: title,
				data: data,
				url: url,
				quickClose: true,
				width: 360
			});
			return artBox.show();
		}
		
		$("a#tz").each(function () { 
			var a_diliver = $(this);
			a_diliver.click(function(){  
    	    	var userId = a_diliver.children("input[id='userId']").val();
    	    	var jobId = a_diliver.children("input[id='jobId']").val();
    	    	var email = a_diliver.children("input[id='email']").val();
    	    	createArtBox("通知面试", "company/resume/interviewOnWx/"+userId+"/"+jobId+"/"+email); 
    	    });  
    	}); 
			
			$("a#ts").each(function () { 
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var artBox = art({
	    				id: 'artBoxForResume',
	    				title: "转发给同事",
	    				data: {userId: userId},
	    				url: "openLogin/ProcessingResumes/forward.jsp",
	    				quickClose: true,
	    				width: 320
	    			});
	    			artBox.show();
	    	    });  
	    	}); 
			
			/*  $("a#dy").each(function () { 
	    	    $(this).click(function(){  
    				var userId = $(this).children("input[id='userId']").val();
    				var companyId = $(this).children("input[id='companyId']").val();
	    	    	createArtBox("打印预览", "company/resume/printOnWx/"+userId+"/"+companyId);
	    	    });  
	    	});  */
			
			$("a#yx").each(function () { 
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	$.ajax({
	    				type:'POST',
	    				url:'company/resume/emailResumeToHrOnWx/'+userId,
	    				data:{"userId": userId},
	    				dataType:'json',
	    				success:function(json) {
							if(json.status = 200) {
	    						
	    					} else {
	    						
	    					}
	    					artLab.msg(json.msg);
	    				}
	    			});
	    	    });  
	    	}); 
			
			$("a#ly").each(function () { 
	    	    $(this).click(function(){ 
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	var jobName = $(this).children("input[id='jobName']").val();
	    	    	var email = $(this).children("input[id='email']").val();
	    	    	createArtBox("录用", "company/resume/contractOnWx/"+userId+"/"+jobId+"/"+jobName+"/"+email);
	    	    });  
	    	}); 
			$("a#pl").each(function () {
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var companyId = $(this).children("input[id='companyId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	createArtBox("评论职员", "company/commentUserOnWx/"+userId+"/"+companyId+"/"+jobId);
	    	    });  
	    	});
			$("a#jj").each(function () {
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	var email = $(this).children("input[id='email']").val();
	    	    	createArtBox("拒绝", "company/resume/turnDownOnWx/"+userId+"/"+jobId+"/"+email);
	    	    });  
	    	}); 
	});	
</script>
</body>
</html>