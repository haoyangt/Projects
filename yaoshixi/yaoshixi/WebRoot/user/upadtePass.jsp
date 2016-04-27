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
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			validateUtil.init($(document));
		});
		
	</script>
</head>

<body  class="body_cs">
<div  style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');height: 100%;">
	<div class="zhank"></div>
	
 	<div class="login" style="margin-top: 100px;">
 	<div class="step_ps"><div class="step1"><span>1</span>输入邮箱地址</div><div class="step2">————<span>2</span>邮箱验证————<span>3</span>重置密码</div></div>
 	
    <form action="updatepasses" method="post" onsubmit="return validateUtil.validateForm(this);" style="padding-left:80px;">
        <div class="login_top"><input name="email" validate="email::请输入注册时使用的邮箱" id="email" type="text"  placeholder="请输入注册时使用的邮箱" class="login_input login_input_w" ></div>
        <font style="color: red;">${msg }</font>
        <div class="login_top"><input type="submit" value="找回密码" class="btn_style1 btn_w"></div>
    </form>
    	
 
   
    <div style="clear:both;"></div>
 </div>
 
 </div>
 </div>
</body>
</html>

