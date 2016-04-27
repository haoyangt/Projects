<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file="/jstl.jsp" %>

<c:forEach var="resume" items="${page.results }" varStatus="idxStatus">
		            		    	<div class="fl" style="margin-bottom:10px;">
		            		    	<div class="fl" style="padding:10px;">
		            		    		<a target="_blank" href="user/previewByuId/${resume.userId }">
			            		    		<c:if test="${resume.headImg=='' || resume.headImg ==null}"><img src="http://www.yaoshixi.com/res/images/cor.png" width="70" height="70"></c:if>
											<c:if test="${resume.headImg!='' && resume.headImg !=null}"><img src="http://www.yaoshixi.com/user/getHeadPhoto?ImgPath=${resume.headImg}" width="70" height="70"></c:if>
										</a>
		            		    	</div>
		            		    	<div class="fl" style="width:630px">
			            		    	<p><a target="_blank" href="user/previewByuId/${resume.userId }" class="hover_g f18">${resume.userName }的简历</a>
			            		    	<span class="da"><fmt:formatDate value="${resume.diliverTime }" pattern="yyyy-MM-dd " type="date"/></span></p>
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
			            		    	<div class="color_c fl">
			            		    		<c:if test="${resume.status!=4}">
					            		    	<c:if test="${resume.hire=='' || resume.hire==null}">还未录用</c:if>
												<c:if test="${resume.hire==1}">已录用</c:if>
												<c:if test="${resume.hire==2}">已离职</c:if>
											</c:if>
											<c:if test="${resume.status==4}">已拒绝</c:if>
										</div>
										<div  class="fr jl_link">
												<a href="javascript:void(0)" id="tz">邀请面试
													<input type="hidden" id="userId" value="${resume.userId }"/>
						            		    	<input type="hidden" id="companyId" value="${resume.companyId }"/>
						            		    	<input type="hidden" id="jobId" value="${resume.jobId }"/>
						            		    	<input type="hidden" id="jobName" value="${resume.jobName }"/>
						            		    	<input type="hidden" id="email" value="${resume.email }"/>
												</a>
										</div>
		            		    	</div>
		            		    	</div>
	            		</c:forEach>
  		<%@ include file="/pager.jsp"%>
  		
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
			quickClose: false,
			width: 600
		});
		return artBox.show();
	}
	
	$("a#tz").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var uId = a_diliver.children("input[id='userId']").val();
	    	var email = a_diliver.children("input[id='email']").val();
	    	createArtBox("通知面试", "company/resume/interviewYaoQing/"+uId+"/"+email);
	    });  
	}); 
});

function page(pageNum,ps) {
	var offset =  ((pageNum-1)*(ps));
	$.ajax({
		type:'POST',
		url:'company/job/invitation',
		data:{'pageNum':pageNum,'pager.offset':offset},
		dataType:'html',
	    success:function(html) {
	    	$("#invitationSubpage").html(html);
	    }
	});
}
</script>