<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<style>
.bdcgx{
background-position: left center;
background-repeat: no-repeat;
display: block; height: 32px;
padding-left: 40px;width: 100px;
line-height:32px; color:#0079e0;}
</style>

 <script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>

<script type="text/javascript">

function linkTo(url){
	window.location.href=url;
}


</script>
<c:if test="${empty page.results}">
<div style="width: 100%;">
<div class="weixin_l" style="padding: 20px 20px 40px 90px;margin-top:50px;background-color: #EEECE9;">
<a class="bdcgx">该职位没有收到任何简历！</a> </div>
</div>
</c:if>
<c:forEach var="resume" items="${page.results }" varStatus="index">

   							  <div class="jl_lists" onclick="linkTo('user/examineOnWx/${resume.userId }/${resume.jobId}/${resume.email}/${resume.jobName }/${resume.companyId }');" >
									<div class="fl" style="width:100%;">
										<div class="fl" style="padding-right:10px;">
											<a target="_blank"  style="display: block;">
												<c:if test="${resume.headImg=='' || resume.headImg ==null}"><img src="http://www.yaoshixi.com/res/images/cor.png" width="70" height="70" ></c:if>
											<c:if test="${resume.headImg!='' && resume.headImg !=null}"><img src="http://www.yaoshixi.com/user/getHeadPhoto?ImgPath=${resume.headImg}" width="70" height="70"></c:if>
											</a>
										</div>
										
										<div class="fl" >
										    <p style="line-height:35px;">
			            		    		<a target="_blank"  style="display: block;" class="f18">
			            		    			<c:if test="${resume.userName!='' && resume.userName!=null }">${resume.userName}</c:if>
			            		    			<span style="font-size: 14px">（<c:if test="${resume.gender==0 }">男</c:if>
				            		    	<c:if test="${resume.gender==1 }">女</c:if> • 
				            		    	<c:if test="${resume.birthDay!='' && resume.birthDay!=null}">
				            		    	<%-- ${resume.birthDay}不显示出生日期，显示多少岁即可 --%>
				            		    	<span id="ages">
				            		    		
    		    		 						<fmt:formatDate value="${resume.birthDay}" pattern="yyyy/MM " type="date"/> 
    		    		 					</span> •
				            		    	</c:if>
				            		    	<c:if test="${resume.city!='' && resume.city!=null}">${resume.city}</c:if>）
				            		    	</span>
			            		    		</a>
			            		    	</p>
			            		    	<p><span style="color:#bbbbbb">投递时间：<fmt:formatDate value="${resume.diliverTime }" pattern="yyyy-MM-dd " type="date"/></span></p>
									</div>
								</div>
		            		    	<div class="fl" style="width:100%;">
			            		    	<p>
											<label>${resume.telPhone } • ${resume.email }</label>
										</p>
			            		    	<p>
			            		    	<label class="color_b">学历：</label>
			            		    	<c:if test="${resume.university=='' || resume.university==null}">未提供大学 | </c:if>
			            		    	<c:if test="${resume.university!='' && resume.university!=null}">${resume.university} | </c:if>
			            		    	<c:if test="${resume.education=='' || resume.education==null}">未提供学历</c:if>
			            		    	<c:if test="${resume.education==2 }">高中 </c:if>
               	 						<c:if test="${resume.education==3 }">专科 </c:if>
               	 						<c:if test="${resume.education==4 }">本科 </c:if>
               	 						<c:if test="${resume.education==5 }">硕士</c:if>
               	 						<c:if test="${resume.education==6 }">博士</c:if></p><p>

			            		    	<c:if test="${resume.jobCity!='' && resume.jobCity!=null}"><label class="color_b">意向城市：</label>${resume.jobCity}</c:if></p><p>
			            		    	<c:if test="${resume.category!='' && resume.category!=null}"><label class="color_b">意向职位：</label>${resume.category}</c:if>
				            		    	<c:if test="${resume.timeAvailable==1 }">|希望的工作性质:全职</c:if>
				            		    	<c:if test="${resume.timeAvailable==2 }">|希望的工作性质:按天</c:if>
				            		    	<c:if test="${resume.timeAvailable==3 }">|希望的工作性质:按小时</c:if>
			            		    	</p>
		<c:if test="${resume.interQuestionsOne != null && resume.interQuestionsOne != '' && resume.interQuestionsOne != '1、' }">
		<p><!-- 职位问题： -->
       			${resume.interQuestionsOne }<br>
       			${resume.answerOne }<br>
       		<c:if test="${resume.interQuestionsTwo !=null && resume.interQuestionsTwo !='' && resume.interQuestionsTwo  != '2、'}">
       			${resume.interQuestionsTwo }<br>
       			${resume.answerTwo }<br>
       		</c:if>	
       		<c:if test="${resume.interQuestionsThree !=null && resume.interQuestionsThree !='' && resume.interQuestionsThree != '3、'}">
       			${resume.interQuestionsThree }<br>
       			${resume.answerThree }<br>
       		</c:if>
       		<c:if test="${resume.interQuestionsFour !=null && resume.interQuestionsFour !='' && resume.interQuestionsFour != '4、'}" >	
       			${resume.interQuestionsFour }<br>
       			${resume.answerFour }<br>
       		</c:if>
       		<c:if test="${resume.interQuestionsFive !=null && resume.interQuestionsFive !='' && resume.interQuestionsFive != '5、'}">
       			${resume.interQuestionsFive }<br>
       			${resume.answerFive }
       		</c:if>	
   		</p>
	</c:if>   
		            		    	</div>
		       
		        </div>
		    				
		   
	    </c:forEach>

