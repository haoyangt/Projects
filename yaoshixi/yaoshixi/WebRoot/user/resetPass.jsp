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
		
		function validatePass(){
			var pass = $("#password").val();
			var pass2 = $("#confirm_password").val();
			if(pass==pass2){
				//校验通过
				return false;
			}else{
				//校验失败
				return "两次密码不一样";
			}
		}
		
		 function updatepass() {
	 		var pass = document.getElementById("password").value;
	 		 document.getElementById("password").value = hex_md5(pass);
	 	} 
		 
		function submitType(){
			var pass = $("#password").val();
			var pass2 = $("#confirm_password").val();
			if(pass==pass2 && pass!='' && pass!=null){
				$("#subm").click();
			}else{
				$("#SpanText").text("两次密码不一样");
			}
		}
	</script>
</head>

<body  class="body_cs">
<div  style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');height: 100%;">
	<div class="zhank"></div>
	
 	<div class="login" style="margin-top: 100px;">
 	<div class="step_ps"><div class="step1"><span>1</span>输入邮箱地址————<span>2</span>邮箱验证————<span>3</span>重置密码</div></div>
 	
    <form action="resetPassWord" method="post" onsubmit="return updatepass();" style="float:left;padding-left:80px;">
        <div class="login_top">邮件地址：${email } <input name="email" id="email" value="${email }" type="hidden"></div>
        <div class="login_top">
        	<input type="password" name="password" id="password" validate="required::请输入密码" placeholder="请输入新密码" class="login_input login_input_w" />
        </div>
        <div class="login_top">
        	<input  type="password" id="confirm_password" funValidate="validatePass()" placeholder="请确认新密码" class="login_input login_input_w" />
        </div>
           <span id="SpanText" style="color: red;"></span>
       	<div class="login_top">
       		<input type="submit" id="subm" style="display:none"/>
       		<input type="button" onclick="submitType()" value="提交" class="btn_style1 btn_w">
        </div>
    </form>
    	
    <div style="clear:both;"></div>
 </div>
 
 </div>
 </div>
</body>
</html>

