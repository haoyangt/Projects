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
        	<p>亲爱的  ${email }，您好！</p>
       		<p>要实习已经收到了你的找回密码请求，请点击以下链接重置密码。<br/>
				<a href="${validateUrl }" class="h_b_under">${validateUrl }</a> 
			</p>
           <br/>
            <p style="text-align:right">要实习</p>
            <p style="text-align:right">${registDate }</p>
            <div class="hr"></div>
            <p>要实习：<a href="http://www.yaoshixi.com" class="h_b_under">http://www.yaoshixi.com</a></p>
        </div>

	</div>
</body>
</html>
