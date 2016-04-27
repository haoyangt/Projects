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
		function updatepass() {
	 		var pass = document.getElementById("password").value;
	 		 document.getElementById("password").value = hex_md5(pass);
	 	}
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
		
		function submitType(){
			var pass = $("#password").val();
			var pass2 = $("#confirm_password").val();
			var cdkey = $("#cdkey").val();
			var email = $("#email").val();
			if(pass==pass2 && pass!='' && pass!=null && cdkey!='' && email!='' && cdkey!=null && email!=null && cdkey!='请输入激活码' && email!='请输入公司邮箱'){
				$("#subm").click();
			}else if(pass!=pass2){
				$("#SpanText").text("两次密码不一样！");
			}else{
				$("#SpanText").text("带*号栏没有填写完整！");
			}
		}
	</script>
</head>
<body  class="body_cs">
<div  style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');height: 100%;">
	<div class="zhank"></div>
 	<div class="login" style="margin-top: 100px;">
 	<div class="step_ps"><div class="step1"><span>1</span>输入激活码和公司邮箱地址</div><div class="step2">——<span>2</span>邮箱验证——<span>3</span>激活成功</div></div>
 	
    <form action="activationCode" method="post" onsubmit="return updatepass();" style="padding-left:80px;float:left">
    	<div class="login_top">
    		请输入激活码:
    		<input name="cdkey" validate="cdkey::请输入激活码" id="cdkey" type="text"  placeholder="请输入激活码" class="login_input login_input_w" style="width: 286px;" >
    	</div>
        <div class="login_top">
       		 请输入公司邮箱:
        	<input name="email" validate="email::请输入公司邮箱" id="email" type="text"  placeholder="请输入公司邮箱" class="login_input login_input_w" style="width: 272px;" ></div>
       <div class="login_top">
       		请输入密码:
        	<input type="password" name="password" id="password" validate="required::请输入密码" placeholder="请输入密码" class="login_input login_input_w" />
        </div>
        <div class="login_top">
        	请确认密码:
        	<input  type="password" id="confirm_password" funValidate="validatePass()" placeholder="请确认密码" class="login_input login_input_w" />
        </div>
        
        <font id="SpanText" style="color: red;">${msg }</font>
        <div class="login_top">
        	<input type="submit" id="subm" style="display:none"/>
        	<input type="button" onclick="submitType()" value="激活" class="btn_style1 btn_w">
        </div>
    </form>
    	
 
   
    <div style="clear:both;"></div>
 </div>
 
 </div>
 </div>
</body>
</html>

