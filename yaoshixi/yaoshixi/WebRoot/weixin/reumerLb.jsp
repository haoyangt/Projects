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
<title>收到的简历</title>
<link rel="stylesheet" href="/res/amazeui/css/amazeui.min.css">
<link rel="stylesheet" href="/res/amazeui/css/app.css">
<script src="/res/amazeui/js/zepto.min.js"></script> 
<script src="/res/amazeui/js/amazeui.js"></script> 
<script src="/res/amazeui/js/app.js"></script>
</head>
<body>
<div data-am-widget="tabs" class="am-tabs am-tabs-default">
	<ul class="am-tabs-nav am-cf">
	  <li class="am-active"> <a href="[data-tab-panel-0]">全部简历</a> </li>
	  <li class=""> <a href="[data-tab-panel-1]">已通知面试</a> </li>
	  <li class=""> <a href="[data-tab-panel-2]">待定</a> </li>
	  <li class=""> <a href="[data-tab-panel-3]">不合适</a> </li>
	</ul>
	<div class="am-tabs-bd">
	  	<div data-tab-panel-0 class="am-tab-panel am-active">
	    	<ul class="am-list am-list-border">
	    		<c:forEach items="${receivedResume }" var="jobs" varStatus="idxStatus"> 
	      		<li><a href="/user/findUserDestById/${jobs.userId }/${jobs.jobId}">
		      		${jobs.userName}—${jobs.university }
					<p class="wjdate">可实习${jobs.monthReady }个月，每周${jobs.workReady }天</p>
		      		<p class="am-text-truncate">投递的职位：${jobs.jobName }</p></a></li>
	      		</c:forEach>
	    	</ul>
	  	</div>
	  	<div data-tab-panel-1 class="am-tab-panel ">
	     	<ul class="am-list am-list-border">
	     	<c:forEach items="${receivedResume }" var="jobs" varStatus="idxStatus">
	     		<c:if test="${jobs.status==8 }">
	      		<li><a href="/user/findUserDestById/${jobs.userId }/${jobs.jobId}">
	      			${jobs.userName}—${jobs.university }
					<p class="wjdate">可实习${jobs.monthReady }个月，每周${jobs.workReady }天</p>
		      		<p class="am-text-truncate">投递的职位：${jobs.jobName }</p></a></li>
	    		</c:if>
	    	</c:forEach>
	    	</ul>
	   	</div>
	   	<div data-tab-panel-2 class="am-tab-panel ">
	     	<ul class="am-list am-list-border">
	     	<c:forEach items="${receivedResume }" var="jobs" varStatus="idxStatus">
	     		<c:if test="${jobs.status==9 }">
	      		<li><a href="/user/findUserDestById/${jobs.userId }/${jobs.jobId}">
	      			${jobs.userName}—${jobs.university }
					<p class="wjdate">可实习${jobs.monthReady }个月，每周${jobs.workReady }天</p>
		      		<p class="am-text-truncate">投递的职位：${jobs.jobName }</p></a></li>
	    		</c:if>
	    	</c:forEach>
	    	</ul>
	   	</div>
	   	<div data-tab-panel-3 class="am-tab-panel ">
	     	<ul class="am-list am-list-border">
	     	<c:forEach items="${receivedResume }" var="jobs" varStatus="idxStatus">
	     		<c:if test="${jobs.status==4 }">
	     		<li><a href="/user/findUserDestById/${jobs.userId }/${jobs.jobId}">
	      			${jobs.userName}—${jobs.university }
					<p class="wjdate">可实习${jobs.monthReady }个月，每周${jobs.workReady }天</p>
		      		<p class="am-text-truncate">投递的职位：${jobs.jobName }</p></a></li>
	    		</c:if>
	    	</c:forEach>
	    	</ul>
	   	</div>
	</div>
</div>	
</body>
</html>
