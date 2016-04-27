<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<!--自己编写css -->
<link href="res/assets/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="res/assets/css/panel_demo.css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<!--组件依赖css begin-->
 <link rel="stylesheet" type="text/css" href="res/assets/css/widget/gotop/gotop.css" />
<link rel="stylesheet" type="text/css" href="res/assets/css/widget/panel/panel.css"/>
<link rel="stylesheet" type="text/css" href="res/assets/css/widget/panel/panel.default.css" />
<!--皮肤文件，若不使用该皮肤，可以不加载-->
<!--组件依赖css end-->
<!--组件依赖js begin-->
<script type="text/javascript" src="res/assets/js/dist/zepto.js"></script>
<script type="text/javascript" src="res/assets/js/core/gmu.js"></script>
<script type="text/javascript" src="res/assets/js/core/event.js"></script>
<script type="text/javascript" src="res/assets/js/core/widget.js"></script>
<script type="text/javascript" src="res/assets/js/extend/fix.js"></script>
<script type="text/javascript" src="res/assets/js/extend/touch.js"></script>
<script type="text/javascript" src="res/assets/js/extend/throttle.js"></script>
<script type="text/javascript" src="res/assets/js/extend/event.scrollStop.js"></script>
<script type="text/javascript" src="res/assets/js/extend/event.ortchange.js"></script>
<script type="text/javascript" src="res/assets/js/extend/matchMedia.js"></script>
<script type="text/javascript" src="res/assets/js/widget/panel/panel.js"></script>
<script type="text/javascript" src="res/assets/js/widget/gotop/gotop.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<!--组件依赖js end-->

</head>

<body >
<div id="page">
  <div class="cont">
    <header>
      <input name="" id="reveal-left" class="menu" type="button" >
      <h3>注&nbsp;&nbsp;&nbsp;&nbsp;册</h3>
    </header>
    <section class="login">
    <form action="user/registCompany" method="post">
    <input type="hidden" name="roleId" id="roleId" value="1">
     <span id="qiye" class="btnspan son">企业HR</span>
	     <div class="jj">
	     	<input name="companyName" value="${companyName }" id="companyName" type="text" class="txtname" validate="companyName::请输入公司名称" placeholder="请输入公司名称">
	     	<p></p>
	     	<input name="companyShortName" value="${companyShortName }" id="companyShortName" type="text" class="txtname" validate="companyShortName::请输入公司简称" placeholder="请输入公司简称">
	     	<p></p>
	       <input name="email" id="email" value="${email }" type="text" class="txtname" validate="email::请输入常用邮箱" placeholder="请输入注册邮箱地址">
	       <p></p>
	       <input name="password" id="password" type="password" class="txtpwd" validate="required::请输入密码" placeholder="请输入密码">
	       <p id="spanTex">${msg }</p>
	     </div>
	    <div class="jj">
	    	<input type="submit" id="tijiaoDr" style="display: none;">
	    	<input name="" type="button" onclick="userLogin()" class="btnlg" value="注&nbsp;&nbsp;&nbsp;&nbsp;册">
	    </div>
    </form>
    </section>
    
    
    <footer>
     <p>&copy; 粤ICP备10202188号-4</p>
    </footer>
     <div id="gotop"></div>
  </div>
  <div class="panel">
    <a href="m/index.jsp"><h3>要实习</h3></a>
    <ul class="panel-dir">
      <li><a href="m/index.jsp">首页</a></li>
      <li><a href="#">公司</a></li>
      <li><a href="m/jobIndex.jsp">职位</a></li>
    </ul>
  </div>
</div>
<script type="text/javascript">
$(function ($) {
    $('.panel').panel({
        contentWrap: $('.cont')
    });
    $('#reveal-left').on('click', function () {
        $('.panel').panel('toggle', 'reveal', 'left');
    });
}(Zepto));

 //创建组件
$("#gotop").gotop();
$(function(){
	validateUtil.init($(document));
});
function userLogin() {
	var pass = document.getElementById("password").value;
	var email = document.getElementById("email").value;
	var companyName = document.getElementById("companyName").value;
	var companyShortName = document.getElementById("companyShortName").value;
	if(companyName == ""){
		$("#spanTex").text("公司名称不能为空！");
		return;
	}
	var a=/^.{1,6}$/;
	if(companyShortName == ""){
		$("#spanTex").text("公司简称不能为空！");
		return;
	}else if(!a.test(companyShortName)){
		$("#spanTex").text("公司简称必须是1-6位！");
		return;
	}
 	if(pass != "" && email != ""){
 		document.getElementById("password").value = hex_md5(pass);
 		$("#tijiaoDr").click();
 	}else{
 		$("#spanTex").text("邮箱或密码不能为空！");
 	}
}

function role(n){
	$("#roleId").val(n);
	if(n=='1'){
		$("#qiye").addClass('son');
		$("#xues").removeClass('son');
	}else{
		$("#qiye").removeClass('son');
		$("#xues").addClass('son');
	}
	
}	
</script>
</body>
</html>