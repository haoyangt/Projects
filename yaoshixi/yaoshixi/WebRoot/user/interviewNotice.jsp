<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body  class="body_cs" onload="index">
<div id="body">
	
    <div class="container">
    	公司名称：${companyName}<br/>
    	公司规模：${scale}<br/>
    	公司从事的领域：${filedes}<br/>
    	职位名称：${jobName }<br/>
    	招聘人数：${employ}<br/>
    	工作城市：${city}<br/>
    	薪资待遇：${payment}<br/>
    	面试时间：${interviewTime }<br/>
    	面试地点：${place }<br/>
    	联系人：${contactPerson }<br/>
    	联系电话：${contactPhone }<br/>
    	内容：${content }
    </div>
    
 </div>
 <div style="clear:both"></div>

</body>
</html>
