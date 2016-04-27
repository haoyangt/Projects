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
<div id="body">
	
	<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
	
   <div id="main">
   
   	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>
   
    <div class="container">
    	<div  class="adver"></div>
        <div class="verify">
        	<h1>验证邮箱，完成注册</h1>
        	<p>我们已经将验证邮箱发送至邮箱：<font style="color: red;">${email }</font></p>
       		<p>点击邮件内的链接即可完成注册，并可使用要实习网所有功能</p>
       		<p>
       			<a target="_blank" href="http://mail.${domain }" class="hover_b">邮箱登陆</a>
       			<!-- <a target="_blank" href="http://mail.163.com" class="hover_b">163邮箱登陆</a>
       			<a target="_blank" href="http://mail.126.com" class="hover_b">126邮箱登陆</a> -->
       		</p>
            <hr/>
            <h2>没有收到验证邮件，怎么办？</h2>
            <p>邮箱填写错误：<a href="user/regist.jsp" style="color: red;">换个邮箱重新注册</a></p>
            <p>看看是否在邮箱的垃圾邮件，广告邮件目录里</p>
            <p>稍等几分钟，若还未收到验证邮件，<a href="user/resendEmail/${email }/${registId}/${userId}" class="hover_b">重新发送验证邮件</a></p>
            <p style="color: red;">${msg }<p>
        </div>
           <div style="clear:both"></div>
         </div>
    
    <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %>
    
 </div>
 <div style="clear:both"></div>
</div>
</body>
</html>
