<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<meta property="wb:webmaster" content="0b8bc29c69e3fafd"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册-要实习-专注于实习生招聘的互联网平台</title>
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=1862990248" type="text/javascript" charset="utf-8"></script>
</head>

<body  class="body_cs">
<div style="height: 100%;">
	<div style="background-image: url('res/images/login_bg2.png');height: 100%;">
	<div class="zhank"></div>
 	<div class="login" style="margin-top: 100px;">
 	<div class="login_left">
	    <form action="user/companyRegist" method="post" id="form" onsubmit="return validate();" >
	    	<div class="login_top ing">
	    	<input type="hidden" name="roleId" id="roleId" value="1">
	    	<input type="hidden" name="companyId" id="companyId" value="${companyId }">
	    	<font style="color: red;">由于您还未注册要实习用户，暂不能直接登录查看，请先注册！</font>
	    	
	    	</div>
	        <div class="login_top">邮箱地址：
	        	<input  type="text" placeholder="请输入常用邮箱" name="email" value="${email }" readonly="readonly" validate="email::请输入邮箱地址" onblur="validateEmail();" id="email" class="login_input login_input_w" >
	        	<span id="emailSpan" style="color: red;"></span>
	        </div>
	        <div class="login_top">请输入密码：
	        	<input type="password" placeholder="请输入密码" name="password"  id="password" validate="required::请输入密码"  class="login_input login_input_w">
	        	<span id="pwdSpan" style="color: red;"></span>
	        </div>
	        <font id="hint" style="color: red;">${msg }</font>
	        <div class="login_top">
	        	<input name="check" type="checkbox" id="checklabel" value="" checked><label >我已阅读并同意<span class="login_color"><a id="protocol" target="_blank" href="user/pProtocol.jsp">《要实习用户协议》</a></span></label> </div>
	        <div class="login_top">
	        	<input type="submit" id="submits" value="注册" style="display: none;">
	        	<input type="button"  id="regisetes" value="注册" class="btn_style1 btn_w">
	        </div>
	    </form>
    </div>
    <!-- <div class="login_right">
    	<p>已有要实习网账号</p>
        <p><a target="_blank" href="login.jsp">直接登录&nbsp;&nbsp;<img src="res/images/zjdl.png" width="17" height="17" style="vertical-align:middle" ></a></p><br/>
      <p>使用以下账号直接登录</p>
      	<div class="login_top">
      		<wb:login-button type="3,2" onlogin="login" onlogout="logout">登录按钮</wb:login-button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="openLogin/qq.jsp" target="_blank" ><img style="height: 26px;width: 26px;"src="res/images/QQ.png" ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="openLogin/sinaMicroblog.jsp" target="_blank" ><img style="height: 26px;width: 26px;" src="res/images/xlangWo.png" ></a>
      </div>
    </div> -->
   <%@include file="/scanner.jsp" %>
    <div style="clear:both"></div>
 </div>
 </div>
 </div>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
	$(function(){
		validateUtil.init($(document));
	});

	$(document).ready(function(){	
		$("div.ing span:first").removeClass("login_btnx_b");
		$("div.ing span:first").addClass("login_btnx_s");
		
		//click
		$("div.ing span").click(function(){
			$("div.ing span").removeClass("login_btnx_s");
			$("div.ing span").addClass("login_btnx_b");
			$(this).addClass("login_btnx_s");
			if($("div.ing span").attr("class")=='login_btnx login_btnx_b') {
				$("#roleId").val(1);
				$("#protocol").attr("href","user/cProtocol.jsp");
			} else {
				$("#roleId").val(2);
				$("#protocol").attr("href","user/pProtocol.jsp");
			}
		});
		//hover
		
	});
	function createArtBox(title, url, data) {
		var artBox = art({
			id: 'artBoxForResume',
			title: title,
			data: data,
			url: url,
			quickClose: true,
			width: 400
		});
		return artBox.show();
	}
	function validateEmail() {
		var email = $("#email").val();
		var password = $("#password").val();
		var roleId = $("#roleId").val();
		if(email == "") {
			$("#emailSpan").text("邮箱不能为空");
			return;
		}
		if(password == ""){
			$("#pwdSpan").text("密码不能为空");
			return;
		}
		if(!document.getElementById("checklabel").checked){
			$("#hint").text("需同意要实习用户协议");
			return;
		}
		$.ajax({
			type:'POST',
			url:"user/validateEmail",
			data:{'email':email},
			dataType:"json",
			success:function(json) {
				if(json.msg!=''){
					createArtBox("邮箱已存在", "regiset","");
				}else{
					$("#submits").click();
					/* if(roleId==2){
						var dialog = top.dialog;
						dialog.get("artBoxForResume").close();
					} */
				}
				$("#emailSpan").html(json.msg);
			}
		});
	}
	$("#regisetes").click(function(){
		validateEmail();
	});
});
function validateEmail() {
	var email = $("#email").val();
	if(email == "") {
		return;
	}
	$.ajax({
		type:'POST',
		url:"user/validateEmail",
		data:{'email':email},
		dataType:"json",
		success:function(json) {
			$("#emailSpan").html(json.msg);
		}
	});
}
		
function validate() {
	var form = $("#form");
	if(!validateUtil.validateForm(form)){
		return false;
	}
	var emailMsg = $("#emailSpan").html();
	var pwdMsg = $("#pwdSpan").html();
	if(emailMsg != "" || pwdMsg != "") {
		return false;
	} 
	encrypt();
}

 function encrypt() {
		var pass = document.getElementById("password").value;
		document.getElementById("password").value = hex_md5(pass);
} 
</script>
</html>