<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- <meta name="renderer" content="webkit">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI"/>
<meta name="msapplication-TileColor" content="#0e90d2"> -->
<title>投递状态</title>
<link rel="stylesheet" href="/res/amazeui/css/amazeui.min.css">
<link rel="stylesheet" href="/res/amazeui/css/app.css">
<script src="/res/amazeui/js/zepto.min.js"></script> 
<script src="/res/amazeui/js/amazeui.js"></script> 
<script src="/res/amazeui/js/app.js"></script>
</head>
<body>
<div data-am-widget="tabs" class="am-tabs am-tabs-default">
	<ul class="am-tabs-nav am-cf">
	  <li class="am-active"> <a href="[data-tab-panel-0]">全部投递</a> </li>
	  <li class=""> <a href="[data-tab-panel-1]">面试通知</a> </li>
	  <li class=""> <a href="[data-tab-panel-2]">不合适</a> </li>
	</ul>
	<div class="am-tabs-bd">
	  	<div data-tab-panel-0 class="am-tab-panel am-active">
	    	<ul class="am-list am-list-border">
	    		<c:forEach items="${jobList }" var="jobs" varStatus="idxStatus"> 
		      			<li>
		      				<a href="/jobDetailPhone/${jobs.id }">
				      		${jobs.jobName}
							<p class="wjdate">公司：${jobs.companyName }</p>
				      		<p class="am-text-truncate">发布时间：${myfn:friendlyTime(jobs.publishTime)}发布</p>
			      			</a>
			      		</li>
	      		</c:forEach>
	    	</ul>
	  	</div>
	  	<div data-tab-panel-1 class="am-tab-panel ">
	     	<ul class="am-list am-list-border">
	     	<c:forEach items="${jobList}" var="jobs" varStatus="idxStatus">
	     		<c:if test="${jobs.status==8 }">
		      		<li>
		      				<a href="/jobDetailPhone/${jobs.id }">
				      		${jobs.jobName}
							<p class="wjdate">公司：${jobs.companyName }</p>
				      		<p class="am-text-truncate">发布时间：${myfn:friendlyTime(jobs.publishTime)}发布</p>
			      			</a>
			      		</li>
	    		</c:if>
	    	</c:forEach>
	    	</ul>
	   	</div>
	   	<div data-tab-panel-2 class="am-tab-panel ">
	     	<ul class="am-list am-list-border">
	     	<c:forEach items="${jobList}" var="jobs" varStatus="idxStatus">
	     		<c:if test="${jobs.status==4 }">
		      		<li>
		      				<a href="/jobDetailPhone/${jobs.id }">
				      		${jobs.jobName}
							<p class="wjdate">公司：${jobs.companyName }</p>
				      		<p class="am-text-truncate">发布时间：${myfn:friendlyTime(jobs.publishTime)}发布</p>
			      			</a>
			      		</li>
	    		</c:if>
	    	</c:forEach>
	    	</ul>
	   	</div>
	</div>
</div>	
</body>
</html>
