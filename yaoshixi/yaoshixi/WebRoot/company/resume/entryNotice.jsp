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

<body  class="body_cs">
	<div class="sendmail">
        <div class="smail">
        	<h1><img src="http://www.yaoshixi.com/res/images/logo.png" width="121" height="140"></h1>
        	<p>${emails }.com，您好！</p>
        	<p>${companyNames} 入职通知：</p>
       		<p>入职时间：${hireDates }${hour }&nbsp;&nbsp;&nbsp;&nbsp;入职地址：${userAddress }<br/></p>
       		<p>联系人：${userNames }&nbsp;&nbsp;&nbsp;&nbsp;联系电话：${userPhones }<br/></p>
       		<p>入职职位：${jobNames }<br/></p>
           <br/>
            <p>衷心祝愿您可以在${companyNames}工作满意！</p>
            <p style="text-align:right">要实习</p>
            <p style="text-align:right">${registDate }</p>
            <div class="hr"></div>
            <p>要实习：<a href="http://www.yaoshixi.com" class="h_b_under">http://www.yaoshixi.com</a></p>
        </div>

	</div>
	
</body>
</html>