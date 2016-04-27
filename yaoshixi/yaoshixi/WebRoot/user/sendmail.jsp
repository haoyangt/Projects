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
	<div class="sendmail">
        <div class="smail">
        	<h1><img src="http://www.yaoshixi.com/res/images/logo.png" width="121" height="140"></h1>
        	<p>${email }，您好！</p>
        	<p>欢迎加入<b>要实习™</b>网。</p>
       		<p>请点击以下链接完成邮箱验证，也可以将该链接复制到浏览器地址栏内直接访问：<br/>
				<a href="${validateUrl }" class="h_b_under">${validateUrl }</a> 
			</p>
           <br/>
            <p>衷心祝愿您可以在<b>要实习™</b>网找到满意的工作！</p>
            <p style="text-align:right">要实习</p>
            <p style="text-align:right">${registDate }</p>
            <div class="hr"></div>
            <p>要实习：<a href="http://www.yaoshixi.com" class="h_b_under">http://www.yaoshixi.com</a></p>
            <img src="http://www.yaoshixi.com/res/images/welRegister.png" width="580" height="260">
        </div>

	</div>
</body>
</html>
