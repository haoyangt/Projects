<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<c:if test="${jobId != null && jobId != ''}">
	<div class="bann" id="headline" style="margin-top:20px;">
	     <div id="DclJl" class="qieh">
			<a onclick="clickToLoadJobList(this,0);">待处理的简历(${dcl })</a>
		</div>
		<div id="Zgtsl" class="qieh">
			<a onclick="clickToLoadJobList(this,6);">已转给同事(${zts })</a>
		</div>
		<div id="TzMs" class="qieh">
			<a onclick="clickToLoadJobList(this,8);">已通知面试简历(${tzms })</a>
		</div>
		<div id="yily" class="qieh">
			<a onclick="clickToLoadJobList(this,7);">已录用(${yly })</a>
		</div>
		<div id="bxkk" class="qieh">
			<a onclick="clickToLoadJobList(this,9);">备选(${bx })</a>
		</div>
		<div id="yjvjde" class="qieh">
			<a onclick="clickToLoadJobList(this,4);">已拒绝简历(${yjj })</a>
		</div>
		<div id="wclide" class="qieh">
			<a onclick="clickToLoadJobList(this,5);">未处理(${wcl })</a>
		</div>   
	</div>
</c:if>
<div class="s_l" id="companyJobListDiv">
	<c:forEach var="resume" items="${page.results }" varStatus="index">
	<c:if test="${resume.status==0}">
	   <div class="fl" style="margin-bottom:10px;background-color:#91CEBE;">
	</c:if>
	<c:if test="${resume.status!=0}">
		<div class="fl" style="margin-bottom:10px;">
	</c:if>		   
	   		<div class="fl" style="padding:10px;">
				<a target="_blank" href="user/examine/${resume.userId }/${resume.jobId}">
		    		<c:if test="${resume.headImg=='' || resume.headImg ==null}"><img src="http://www.yaoshixi.com/res/images/cor.png" width="70" height="70"></c:if>
					<c:if test="${resume.headImg!='' && resume.headImg !=null}"><img src="http://www.yaoshixi.com/user/getHeadPhoto?ImgPath=${resume.headImg}" width="70" height="70"></c:if>
				</a>
	   		</div>
	   		<div class="fl" style="width:640px">
		    	<p><a target="_blank" href="user/examine/${resume.userId }/${resume.jobId}" class="hover_g f18">${resume.userName }的简历</a>
		    		<span class="color_c">
		    		<c:if test="${resume.status==0}">未查看</c:if>
		    		<c:if test="${resume.status==1}">已查看</c:if>
		    		<c:if test="${resume.status==2}">已下载</c:if>
		    		<c:if test="${resume.status==4}">已拒绝</c:if>
		    		<c:if test="${resume.status==8}">已通知面试</c:if>
		    		<c:if test="${resume.status==6}">已转给同事</c:if>
		    		<c:if test="${resume.status==7}">已录用</c:if>
		    		<c:if test="${resume.status==5}">未处理</c:if>
		    		<c:if test="${resume.status==9}">备选</c:if>
		    		</span>
		    		<span class="da"><fmt:formatDate value="${resume.diliverTime }" pattern="yyyy-MM-dd " type="date"/></span>
		    	</p>
		    	<p>
			    	<c:if test="${resume.userName!='' && resume.userName!=null }">${resume.userName}/</c:if> 
			    	<c:if test="${resume.gender==0 }">男</c:if>
			    	<c:if test="${resume.gender==1 }">女</c:if>/
			    	<c:if test="${resume.birthDay!='' && resume.birthDay!=null}">${resume.birthDay}/</c:if>
			    	所居城市:
			    	<c:if test="${resume.city!='' && resume.city!=null}">${resume.city}</c:if>
		    	</p>
		    	<p>
			    	<c:if test="${resume.university=='' || resume.university==null}">未提供大学</c:if>
			    	<c:if test="${resume.university!='' && resume.university!=null}">${resume.university}</c:if>· 
			    	<c:if test="${resume.education=='' || resume.education==null}">未提供学历</c:if>
			    	<c:if test="${resume.education==2 }">高中 </c:if>
					<c:if test="${resume.education==3 }">专科 </c:if>
					<c:if test="${resume.education==4 }">本科 </c:if>
					<c:if test="${resume.education==5 }">硕士</c:if>
					<c:if test="${resume.education==6 }">博士</c:if>
			    	<c:if test="${resume.jobCity!='' && resume.jobCity!=null}">|希望的工作所在城市:${resume.jobCity}</c:if>
			    	<c:if test="${resume.category!='' && resume.category!=null}">|希望的职位类别:${resume.category}</c:if>
			    	<c:if test="${resume.timeAvailable==1 }">|希望的工作性质:全职</c:if>
			    	<c:if test="${resume.timeAvailable==2 }">|希望的工作性质:按天</c:if>
			    	<c:if test="${resume.timeAvailable==3 }">|希望的工作性质:按小时</c:if>
		    	</p>
		    	<p >应聘：<a target="_blank" href="jobDetail/${resume.jobId }" class="hover_g">${resume.jobName }</a></p>
	    	
		<c:if test="${resume.interQuestionsOne != null && resume.interQuestionsOne != '' && resume.interQuestionsOne != '1、' }">
			<p>职位问题：<br>
	       			${resume.interQuestionsOne }<br>
	       			${resume.answerOne }<br>
	       		<c:if test="${resume.interQuestionsTwo !=null && resume.interQuestionsTwo !='' && resume.interQuestionsTwo !='2、' }">
	       			${resume.interQuestionsTwo }<br>
	       			${resume.answerTwo }<br>
	       		</c:if>	
	       		<c:if test="${resume.interQuestionsThree !=null && resume.interQuestionsThree !='' && resume.interQuestionsThree !='3、' }">
	       			${resume.interQuestionsThree }<br>
	       			${resume.answerThree }<br>
	       		</c:if>
	       		<c:if test="${resume.interQuestionsFour !=null && resume.interQuestionsFour !='' && resume.interQuestionsFour !='4、' }">	
	       			${resume.interQuestionsFour }<br>
	       			${resume.answerFour }<br>
	       		</c:if>
	       		<c:if test="${resume.interQuestionsFive !=null && resume.interQuestionsFive !='' && resume.interQuestionsFive !='5、' }">
	       			${resume.interQuestionsFive }<br>
	       			${resume.answerFive }
	       		</c:if>	
	   		</p>
		</c:if>   
		<div class="color_c fl">
	    		<c:if test="${resume.status!=4}">
	   		    	<c:if test="${resume.hire=='' || resume.hire==null}">还未录用</c:if>
					<c:if test="${resume.hire==1}">已录用</c:if>
					<c:if test="${resume.hire==2}">已离职</c:if>
				</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${resume.hire!='' && resume.hire!=null}">
					<c:if test="${resume.content ==null || resume.content =='' }">还未评价</c:if>
					<c:if test="${resume.content !=null && resume.content !='' }">职员对您公司的评价：${resume.content }</c:if>
				</c:if>
			</div>      		
			<div  class="fr jl_link">
		<c:if test="${resume.status!=8 && resume.status!=4 && resume.status!=7}">
				<a href="javascript:void(0)" id="tz">通知面试
					<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
		</c:if>	 
		<c:if test="${resume.status!=6 && resume.status!=4 && resume.status!=7}">
				<a href="javascript:void(0)" id="ts">转给同事
					<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
		</c:if>
			    <a href="javascript:void(0)" id="dy">打印
			    	<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
			    </a>
			    
				<a href="javascript:void(0)" id="yx">转到邮箱
					<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
			<c:if test="${resume.status!=7 && resume.status!=4}">
				<a href="javascript:void(0)" id="ly">录用
					<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
			</c:if>
			<c:if test="${resume.hire!='' && resume.hire!=null}"> 
				<a href="javascript:void(0)" id="pl">评论
					<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
			</c:if>
			<c:if test="${resume.status != 9 && resume.status != 8 && resume.status!=7 && resume.status!=4}"> 
				<a href="javascript:void(0)" id="bx">备选
					<input type="hidden" id="userId" value="${resume.userId }"/>
	   		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	   		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	   		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	   		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
			</c:if>
			<c:if test="${resume.status!=4 && resume.status!=7}"> 
				<a href="javascript:void(0)" id="jj">拒绝
					<input type="hidden" id="userId" value="${resume.userId }"/>
	  		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
	  		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
	  		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
	  		    	<input type="hidden" id="email" value="${resume.email }"/>
				</a>
			</c:if>
			</div>
	    </div>
	  </div>
	</c:forEach>
</div>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
		top.dialog = art;
		var status = '${status}';
		if(status ==0 ){
			$("#DclJl").addClass("st");
		}else if(status ==8 ){
			$("#TzMs").addClass("st");
		}else if(status ==6){
			$("#Zgtsl").addClass("st");
		}else if(status ==7){
			$("#yily").addClass("st");
		}else if(status ==9){
			$("#bxkk").addClass("st");
		}else if(status ==4){
			$("#yjvjde").addClass("st");
		}else if(status ==5){
			$("#wclide").addClass("st");
		}
		function createArtBox(title, url, data) {
			var artBox = art({
				id: 'artBoxForResume',
				title: title,
				data: data,
				url: url,
				quickClose: false,
				width: 600
			});
			return artBox.show();
		}
		
		$("a#tz").each(function () { 
			var a_diliver = $(this);
			a_diliver.click(function(){  
    	    	var userId = a_diliver.children("input[id='userId']").val();
    	    	var jobId = a_diliver.children("input[id='jobId']").val();
    	    	var email = a_diliver.children("input[id='email']").val();
    	    	createArtBox("通知面试", "company/resume/interview/"+userId+"/"+jobId+"/"+email);
    	    });  
    	}); 
			
			$("a#ts").each(function () { 
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	var artBox = art({
	    				id: 'artBoxForResume',
	    				title: "转发给同事",
	    				data: {"userId": userId,"jobId":jobId},
	    				url: "company/resume/forward.jsp",
	    				quickClose: false,
	    				width: 600
	    			});
	    			artBox.show();
	    	    });  
	    	}); 
			
			$("a#dy").each(function () { 
	    	    $(this).click(function(){  
    				var userId = $(this).children("input[id='userId']").val();
	    	    	//createArtBox("打印", "company/resume/print/"+userId);
	    	    	var artBox = art({
	    				id: 'artBoxForResume',
	    				title: "打印",
	    				data: {userId: userId},
	    				url: "company/resume/print/"+userId,
	    				quickClose: false,
	    				width: 1000
	    			});
	    			artBox.show();
	    	    });  
	    	}); 
			
			$("a#yx").each(function () { 
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	$.ajax({
	    				type:'POST',
	    				url:'company/resume/emailResumeToHr',
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
	    	    	createArtBox("录用", "company/resume/contract/"+userId+"/"+jobId+"/"+jobName+"/"+email);
	    	    });  
	    	}); 
			$("a#pl").each(function () {
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var companyId = $(this).children("input[id='companyId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	createArtBox("评论职员", "company/commentUser/"+userId+"/"+companyId+"/"+jobId);
	    	    });  
	    	});
			$("a#bx").each(function () {
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	$.ajax({
	    				type:'POST',
	    				url:'company/resume/alternative',
	    				data:{'userId':userId,'jobId':jobId},
	    				dataType:'json',
	    				success:function(json) {
	    					artLab.msg(json.msg);
	    				}
	    			});
	    	    });  
	    	});
			$("a#jj").each(function () {
	    	    $(this).click(function(){  
	    	    	var userId = $(this).children("input[id='userId']").val();
	    	    	var jobId = $(this).children("input[id='jobId']").val();
	    	    	var email = $(this).children("input[id='email']").val();
	    	    	createArtBox("拒绝", "company/resume/turnDown/"+userId+"/"+jobId+"/"+email);
	    	    });  
	    	}); 
	});	
</script>