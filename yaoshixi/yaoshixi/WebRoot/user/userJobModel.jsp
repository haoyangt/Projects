<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
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
			width: 600
		});
		return artBox.show();
	}
	$("a#commentCompany").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
   	    	var userIdes = a_diliver.children("input[id='userIdes']").val();
   	    	var companyIdes = a_diliver.children("input[id='companyIdes']").val();
   	    	var jobIdes = a_diliver.children("input[id='jobIdes']").val();
		/* var userIdes=$("#userIdes").val();
		var companyIdes=$("#companyIdes").val();
		var jobIdes=$("#jobIdes").val(); */
		createArtBox("评论企业", "commentCompany/"+userIdes+"/"+companyIdes+"/"+jobIdes);
	});
});	
});

</script>
<c:forEach items="${page.results }" var="userJob">
	<div class="jl_one">
       	<div class="fbzw_name">
           	<div class="fbzw_l"><a target="_blank" href="jobDetail/${userJob.id}" class="hover_b f16">${userJob.jobName }</a>[${userJob.city } ${userJob.area }]</div>
            <div class="fbzw_r"><fmt:formatDate value="${userJob.diliverTime }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
           </div>
           <div class="fbzw_name">
				<div class="fbzw_l">${userJob.companyName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${userJob.status==0}">已投递</c:if>
		    		<c:if test="${userJob.status==1}">已查看</c:if>
		    		<c:if test="${userJob.status==2}">已下载</c:if>
		    		<c:if test="${userJob.status==3}">感兴趣</c:if>
		    		<c:if test="${userJob.status==4}">已拒绝</c:if>
		    	</div>
	    		<div class="fbzw_r" >
               		<a id="commentCompany" class="btn_style1" style="width: 80px;">评论该公司
               		<input type="hidden" id="userIdes" value="${userJob.userId }">
               		<input type="hidden" id="companyIdes" value="${userJob.companyId}">
               		<input type="hidden" id="jobIdes" value="${userJob.id}">
               		</a>
               </div>
           </div>
           <div class="fbzw_name">
	    		<c:if test="${userJob.hire=='' || userJob.hire==null}">还未录用</c:if>
				<c:if test="${userJob.hire==1}">已录用</c:if>
				<c:if test="${userJob.hire==2}">已离职</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${userJob.content=='' || userJob.content==null}">企业还未评价</c:if>
				<c:if test="${userJob.content!='' && userJob.content!=null}">企业对您在该职位的评价：${userJob.content }</c:if>
           </div>
    </div>
</c:forEach>
<%@ include file="/pager.jsp"%>