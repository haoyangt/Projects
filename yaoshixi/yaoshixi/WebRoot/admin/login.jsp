<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%= basePath%>">  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>要实习后台</title>
<link href="res/admin/index.css" rel="stylesheet" type="text/css">
<link href="res/admin/page.css" rel="stylesheet" type="text/css">
<link href="res/admin/slider.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="res/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="res/admin/jquery.anythingslider.js"></script>
<script type="text/javascript" src="res/admin/jquery.easing.1.2.js"></script>
<script type="text/javascript">

function formatText(index, panel) {
	return index + "";
}
$(function() {
	$('.anythingSlider').anythingSlider({
		easing : "easeInOutExpo", // Anything other than "linear" or "swing" requires the easing plugin
		autoPlay : true, // This turns off the entire FUNCTIONALY, not just if it starts running or not.
		delay : 3000, // How long between slide transitions in AutoPlay mode
		startStopped : false, // If autoPlay is on, this can force it to start stopped
		animationTime : 600, // How long the slide transition takes
		hashTags : true, // Should links change the hashtag in the URL?
		buildNavigation : false, // If true, builds and list of anchor links to link to each slide
		pauseOnHover : true, // If true, and autoPlay is enabled, the show will pause on hover
		startText : "Go", // Start text
		stopText : "Stop", // Stop text
		navigationFormatter : formatText // Details at the top of the file on this use (advanced use)
	});

	$("#slide-jump").click(function() {
		$('.anythingSlider').anythingSlider(6);
	});

});
function LoadPage() {
	if (document.getElementById("j_username").value.length >= 6) {
		document.getElementById("j_password").focus();
	} else {
		document.getElementById("j_username").focus();
	}
}

function userlogincheck(form) {
	
	var $form = $(form);
	var $errorMsg = $("#errorMsg");
	var $username = $("#j_username");
	var $password = $("#j_password");
	$errorMsg.html("");
	if ($.trim($username.val()) == "") {
		$errorMsg.html("请输入用户名!");
		$username.val("");
		$username.focus();
		return false;
	}
	if ($.trim($password.val()) == "") {
		$errorMsg.html("请输入密码!");
		$password.val("");
		$password.focus();
		return false;
	}
	$.ajax({
		type : 'POST',
		url : "admin/login/login",
		data : {username : $username.val(),password : $password.val()},
		dataType : "json",
		cache : false,
		success : function(json) {
			if (json.statusCode == '200') {
				var urltmp = "<%=basePath%>" + "admin/index/index";
				window.location = urltmp;
			} else {
				$errorMsg.html("用户名或密码不正确！");
				$password.val("");
				$username.focus();
			}
		},
		error : function() {
			$errorMsg.html("网络故障，请重试!");
		}
	});
	return false;
}
</script>

</head>

<body>
<div class="logo" style="margin-top:30px;">
		<h1>要实习后台</h1>
	<!-- <img src="javascript:void(0);" style="margin-top:20px;" /> -->
</div>
<FORM action="admin/login/login" name="form1" onsubmit="return userlogincheck(this);" method="post" >
	<div class="login_window">
		<div style="float:left; margin-top:35px; margin-left:50px; background:url(res/admin/images/login_bg2.jpg) no-repeat; background-position:22px 0px;
		width:460px; height:258px;">
			<div class="anythingSlider">
				<div class="wrapper">
					<ul>
						<li>
							<img src="res/admin/images/ad1.jpg"/>
						</li>
						<li>
							<img src="res/admin/images/ad2.jpg"/>
						</li>
						<li>
							<img src="res/admin/images/ad3.jpg"/>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="login_right">
			<div style="height:20px;">
				<img src="res/admin/images/denglu.gif" style="float:left;"/>
				<div style="float:left; height:15px; margin-top:5px; margin-left:10px;" class="dd2"></div>

			</div>
			<div style=" height:34px; line-height:34px; margin-top:19px;" class="dt1">
				账 号:
				<input type="text" id="j_username" name="login"  style="WIDTH: 180px"
				onblur="this.style.borderColor='#dcdcdc'"
				onFocus="this.select();this.style.borderColor='#239fe3'"
				autocomplete="on" value="" />
			</div>
			<div style=" height:34px; line-height:34px; margin-top:10px;" class="dt1">
				密 码:
				<input type="password" id="j_password" name="token"
				style="WIDTH: 180px"
				onFocus="this.select();this.style.borderColor='#239fe3'"
				onblur="this.style.borderColor='#dcdcdc'" />
			</div>
			<div style=" height:36px; margin-top:10px;">
				<input type="submit" value="" class="btn_login" style=" margin-left:45px;_margin-left:38px; float:left" />
				<div class="msg" id="errorMsg" style="display:;"></div>
			</div>

			<div style="height:20px; width:220px; overflow:hidden;"></div>
		</div>
	</div>
</FORM>
<style>
	.body_ft a {
		color: #4D4D4D
	}
	.body_ft a:hover {
		text-decoration: none;
	}
</style>
<div style="height: 0px; clear: both; overflow: hidden;"></div>
<div class="body_ft dd2" style="margin-top: 30px; ">
	<a
	href="http://www.szfore.com" target="_blank">技术支持：深圳市远界管理咨询有限公司</a>
	| <a href="http://www.szfore.com" target=_blank><font color=gray>www.szfore.com</font></a>
</div>
</body>
</html>

