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
<title>激活-要实习-专注于实习生招聘的互联网平台</title>
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
	function login () {
 		var pass = document.getElementById("password").value;
 		 //document.getElementById("password").value = hex_md5(pass);
 		 $("#register").click();
 	}
	</script>
</head>

<body  class="body_cs">
<div  style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');height: 100%;">
	<div class="zhank"></div>
	
 	<div class="login" style="margin-top: 100px;">
 	<div class="step_ps"><div class="step1"><span>1</span>输入激活码和公司邮箱地址——<span>2</span>邮箱验证——<span>3</span>激活成功</div></div>
 	<form action="user/login" method="post" onsubmit="return validateUtil.validateForm();">
 	 <div style="float:left;width:500px;padding-left:80px;">
     <h2>恭喜您激活${companyName }成功</h2>
 	 	 <input type="hidden"  name="email" id="email" value="${email }">
       	 <input type="hidden" name="password"  id="password" value="${passWord }" >
       		<p>
       			<input type="submit" style="display: none;" id="register" value="登录" >
       			<a target="_blank" onclick="login()" class="hover_b">点击登陆要实习</a>
       		</p>
    	</div>
    </form>
    <div style="clear:both;"></div>
 </div>
 
 </div>
 </div>
</body>
</html>

