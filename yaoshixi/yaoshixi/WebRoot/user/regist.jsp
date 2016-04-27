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
    <form action="user/regist" method="post" id="form" onsubmit="return validate();" >
    	<div class="login_top ing">
    	<input type="hidden" name="roleId" id="roleId" value="2">
    	<input type="hidden" name="userId" id="userId" value="${userId }">
    	<span class="login_btnx login_btnx_b" >我是学生</span> <span class="login_btnx login_btnx_b">企业HR</span>
    	</div>
    	<div class="login_top" id="companys" style="display: none;">请输入公司名称：
        	<input  type="text" placeholder="请输入公司名称" name="companyName" value="" validate="companyName::请输入公司名称" onblur="validateEmail();" id="companyName" class="login_input login_input_w" >
        	<span id="companySpan" style="color: red;"></span>
        </div>
        <div class="login_top">请输入邮箱地址：
        	<input  type="text" placeholder="请输入常用邮箱" name="email" value="" validate="email::请输入邮箱地址" onblur="validateEmail();" id="email" class="login_input login_input_w" >
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
    <div class="login_right">
    	<p>已有要实习网账号</p>
        <p><a href="login.jsp">直接登录&nbsp;&nbsp;<img src="res/images/zjdl.png" width="17" height="17" style="vertical-align:middle" ></a></p><br/>
      <p>使用以下账号直接登录</p>
      	<div class="login_top">
      		<!-- <wb:login-button type="3,2" onlogin="login" onlogout="logout">登录按钮</wb:login-button> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="openLogin/qq.jsp" target="_blank" ><img style="height: 26px;width: 26px;"src="res/images/QQ.png" ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="openLogin/sinaMicroblog.jsp" target="_blank" ><img style="height: 26px;width: 26px;" src="res/images/xlangWo.png" ></a>
      </div>
        <%@include file="/scanner.jsp" %>
    </div>
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
				document.getElementById("companys").style.display="block";
				$("#protocol").attr("href","user/cProtocol.jsp");
			} else {
				$("#roleId").val(2);
				document.getElementById("companys").style.display="none";
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
	$("#regisetes").click(function(){
		validateEmailes();
	});
	function validateEmailes() {
		var email = $("#email").val();
		var password = $("#password").val();
		var companyName = $("#companyName").val();
		var szReg=/(^1[0-9]{10}$)|(^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)/;
		var ssd= szReg.test(email);
		if(email != ''){
			if(!ssd) {
				$("#emailSpan").text("邮箱格式输入不正确");
				return;
			}
		}else{
			$("#emailSpan").text("邮箱不能为空");
			return;
		}
		if(password == ""){
			$("#pwdSpan").text("密码不能为空");
			return;
		}
		if($("#roleId").val() == 1){
			if(companyName==""){
				$("#companySpan").text("公司不能为空");
				return;
			}
		}
		if(!document.getElementById("checklabel").checked){
			$("#hint").text("需同意要实习用户协议");
			return;
		}
		$.ajax({
			type:'POST',
			url:"user/validateEmail",
			data:{'email':email,"companyName":companyName},
			dataType:"json",
			success:function(json) {
				if(json.msg =='您申请的邮箱已注册'){
					createArtBox("邮箱已存在", "regiset/1","");
					$("#emailSpan").html(json.msg);
				}else if(json.msg =='您申请的公司已经被导入，请通过邮箱cs@yaoshixi.com联系我们询问激活码'){
					createArtBox("您申请的公司已经被导入", "regiset/2","");
					$("#companySpan").html(json.msg);
				}else{
					$("#submits").click();
				}
			}
		});
	}
});
function validateEmail() {
	var email = $("#email").val();
	if(email == "") {
		return;
	}
	$.ajax({
		type:'POST',
		url:"user/validateEmail",
		data:{'email':email,"companyName":companyName},
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