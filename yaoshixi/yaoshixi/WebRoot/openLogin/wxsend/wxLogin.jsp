<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>登陆——要实习</title>
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script>
	
	<script type="text/javascript">
		$(function(){
			validateUtil.init($(document));
		});
		
		function login () {
	 		var pass = document.getElementById("password").value;			/* 密码 */
	 		document.getElementById("password").value = hex_md5(pass);		/*加密密码*/
	 	}
		
	</script>
<style type="text/css">
@media screen and (max-width:600px) {
.weixin_log {
	width: 100%;
}
}
</style>
</head>
<body>
<div class="weixin_log">
	<div class="weixin_l">
	<h2>要实习</h2>
	<form action='/user/wxLoginFor' method="post" onsubmit="return validateUtil.validateForm(this);">
	        <div class="login_top"><input name="email" validate="email::请输入常用邮箱" id="email" type="text" onblur="validateEmail();" placeholder="请输入常用邮箱" class="login_input" style="height:40px;width:100%"></div>
	        <div class="login_top"><input  name="password"  id="password" validate="required::请输入密码" type="password" onblur="validatePwd();" placeholder="请输入密码" class="login_input" style="height:40px;width:100%"></div>
	  
		   <div class="login_top" style="color: red;">${msg}</div>
		  
	        
		   
	        <div class="login_top"><input type="submit" onclick="login();" value="登陆" class="btn_style1" style="-webkit-appearance:none;width:100%;padding:0;height:40px;" ></div>
	 </form>
	</div>
</div>
</body>
</html>