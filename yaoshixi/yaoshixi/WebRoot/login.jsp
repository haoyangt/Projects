<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>

<!DOCTYPE html>
<html lang="en" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>登录-要实习-专注于实习生招聘的互联网平台</title>
<link rel="shortcut icon" href="http://www.yaoshixi.com/res/images/favicon.ico">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=1862990248" type="text/javascript" charset="utf-8"></script>	
	<script type="text/javascript">
		$(function(){
			validateUtil.init($(document));
			if(WB2.checkLogin()){
				WB2.logout();
			}
			
		});
		
		function userLogin () {
	 		var pass = document.getElementById("password").value;
	 		 document.getElementById("password").value = hex_md5(pass);
	 	}
		function login(o){
			$.ajax({
				type:'POST',
				url:'user/sinaLogin',
				data:{'sinaId':o.id,'sinaName':o.screen_name},
				success:function() {
					window.location.href="index.jsp";
				}
			});
		}
	</script>
</head>

<body  class="body_cs">
<div  style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');background-repeat: no-repeat;height: 100%;">
	<div class="zhank"></div>
	
 	<div class="login" style="margin-top: 100px;">
 	<div class="login_left">
    <form action="user/login" method="post" onsubmit="return validateUtil.validateForm();">
        <div class="login_top"><input type="text" name="email" id="email"  validate="email::请输入常用邮箱"  placeholder="请输入常用邮箱" class="login_input login_input_w" ></div>
        <div class="login_top"><input type="password" name="password"  id="password" validate="required::请输入密码" placeholder="请输入密码" class="login_input login_input_w"></div>
        <div class="login_top" style="color: red;">${msg }</div>
        <div class="login_top">
        	<input name="check" type="checkbox" id="checklabel" value="" checked><label for="checklabel">记住我</label>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="user/upadtePass.jsp">忘记密码</a> 
        </div>
        <div class="login_top"><input type="submit" onclick="userLogin();" value="登录" class="btn_style1 btn_w"></div>
    </form>
    	
    </div>
    <div class="login_right">
    	<p>还没有要实习网账号</p>
        <p><a href="user/regist.jsp">立即注册&nbsp;&nbsp;<img src="res/images/zjdl.png" width="17" height="17" style="vertical-align:middle" ></a></p>
        <p><a href="company/activate.jsp">使用激活码激活&nbsp;&nbsp;<img src="res/images/zjdl.png" width="17" height="17" style="vertical-align:middle" ></a></p><br/><br/>
      <p>使用以下账号直接登录</p>
      <div class="login_top">
      		<!-- <wb:login-button type="3,2" onlogin="login" onlogout="logout">登录按钮</wb:login-button> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="openLogin/qq.jsp" target="_blank" ><img style="height: 26px;width: 26px;"src="res/images/QQ.png" ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="openLogin/sinaMicroblog.jsp" target="_blank" ><img style="height: 26px;width: 26px;" src="res/images/xlangWo.png" ></a>
      </div>
         <%@include file="/scanner.jsp" %>
    </div>
    <div style="clear:both;"></div>
 </div>
 
 </div>
 </div>
</body>
</html>

