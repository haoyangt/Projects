<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>


<c:forEach items="${page.results }" var="jobs" varStatus="idxStatus"> 
       <div class="jobs_one">
  	  	 <table style="width:350px;height:110px;">

  	  	 	<tr><td rowspan="3" width="120px" align="center">
  	  	 	<a target="_blank" href="c/index/${jobs.companyId }" class="ggs" style="width:110px;">
	   			<div class="com_img">
	   				<img src="${jobs.companyLogo }" width="110" height="110">
	   			</div>
	   		  	<div class="com_info">
		          <%-- <h3>${jobs.companyShortName }</h3> --%>
		          <c:if test="${jobs.companySlogan ==null || jobs.companySlogan =='' }">
		          	<p style="padding-top: 30px;">${jobs.companyDesc }</p>
		          </c:if>
		          <c:if test="${jobs.companySlogan !=null && jobs.companySlogan !='' }">
		          	<p style="padding-top: 30px;">${jobs.companySlogan }</p>
		          </c:if>
		        </div>
	   		</a>
  	  	 	</td>
  	  	 	<td><div  style="width:220px;overflow:hidden; text-overflow:ellipsis;white-space:nowrap;">
  	  	 	<label><a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16">${jobs.jobName }</a></label> </div></td></tr>
  	  	 	<tr><td>
  	  	 		<c:if test="${jobs.workTime=='' && jobs.workTime==null }">未提供</c:if>
           		<c:if test="${jobs.workTime==1 }">全职</c:if>
           		<c:if test="${jobs.workTime==2 }">按天</c:if>
           		<c:if test="${jobs.workTime==3 }">按小时</c:if>
			</td></tr>
  	  	 	<tr><td><div  style="width:220px;overflow:hidden; text-overflow:ellipsis;white-space:nowrap;">
  	  	 		<c:if test="${jobs.addr == '' || jobs.addr == null || jobs.addr == '无' }">未提供</c:if>
           		<c:if test="${jobs.addr != null && jobs.addr != '' && jobs.addr != '无' }">${jobs.addr}</c:if></div>
           	</td></tr>
  	  	 </table>
  	  </div>
</c:forEach>
<!-- <script type="text/javascript" charset="utf-8">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab',
		lazyload: 'res/js/jquery.lazyload.min'
	},
	shim: {
		'lazyload': {
			deps: ['jquery'],
			exports: 'lazyload'
		}
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe", "lazyload"], function($, artLab, art){	
	jQuery(document).ready(function ($) {
        $("img").lazyload({
            placeholder: "http://jileiba.com/wp-includes/images/loading03.gif",
            effect: "fadeIn"
        });
    });
});
</script> -->

