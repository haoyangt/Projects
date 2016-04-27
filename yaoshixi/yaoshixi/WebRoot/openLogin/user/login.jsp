<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<base href="<%= basePath%>">
<title></title>
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
      <h3>登&nbsp;&nbsp;&nbsp;&nbsp;录</h3>
    </header>
    <section class="login">
    <form action="user/loginCompany" method="post">
	     <div class="jj">
	       <input name="email" id="email" type="text" value="${email }" class="txtname" validate="email::请输入常用邮箱" placeholder="请输入登录邮箱地址">
	       <p></p>
	       <input type="hidden" name="password" id="passwordHide">
	       <input id="password" type="password" class="txtpwd" validate="required::请输入密码" placeholder="请输入密码">
	       <p id="spanTex">${msg }</p>
	     </div>
	    <div class="jj">
	    	<input type="submit" id="tijiaoDr" style="display: none;">
	    	<p style="color:#007DD1;font-size:12px;">登录  联系你的牛人（已在要实习网站注册的用户可通用账号密码）</p>
	    	<input type="button" onclick="userLogin()" class="btnlg" value="登录 联系你的牛人">
	    </div>
	    <div class="jj">
	        <p style="color:#007DD1;font-size:12px;">第一次来？60秒创建简历漂流瓶 （抓住机会只要60秒）</p>
	    	<a href="/openLogin/user/regist.jsp"><input type="button" class="btnlg" value="第一次来？60秒创建简历漂流瓶"></a>
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
 	if(pass != "" && email != ""){
 		document.getElementById("passwordHide").value = hex_md5(pass);
 		$("#tijiaoDr").click();
 	}else{
 		$("#spanTex").text("邮箱或密码不能为空！");
 	}
}
	
</script>
</body>
</html>