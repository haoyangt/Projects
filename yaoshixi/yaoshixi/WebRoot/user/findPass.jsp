<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>找回密码-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body  class="body_cs">
<div  style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');height: 100%;">
	<div class="zhank"></div>
 	<div class="login" style="margin-top: 100px;">
 	<div class="step_ps"><div class="step1"><span>1</span>输入邮箱地址————<span>2</span>邮箱验证</div><div class="step2">————<span>3</span>重置密码</div></div>
     <div style="float:left;width:500px;padding-left:80px;">
        	<h2>验证邮箱，找回密码</h2>
        	<p>密码重置邮件已发送至你的邮箱：<font style="color: red;">${email }</font></p>
       		<p>
       			<a target="_blank" href="http://mail.${domain }" class="hover_b">登陆邮箱查看</a>
       		</p>
    	</div>
    <div style="clear:both;"></div>
 </div>
 </div>
 </div>
</body>
</html>

