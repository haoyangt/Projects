<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<% response.setHeader("Cache-Control","no-store");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script> 
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=1862990248" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var roleIds = '${sessionScope.roleId}';
$(document).ready(function(){
	if(roleIds==1){
		$("#manage").show();
		$("#release").show();
		$("#ssue").show();
		$("#Recruitment").show();
		$("#myCompany").show();
	}else{
		$("#Resume").show();
		$("#myResume").show();
	}
}); 

function loginoutJS() {
	if(QC.Login.check()) {
		QC.Login.signOut();
	}
	document.getElementById("loginoutBtn2").click();
	if(WB2.checkLogin()){
		WB2.logout();
	}
}	
function indexFo(){
	$("#main").load("main.jsp");
}
function companyIndes(){
	$.ajax({
		type:'POST',
		url:'c/index',
		dataType:'html',
		success:function(html) {
			$("#main").html(html);
		}
	});
}
function userResume(id){
	if(roleIds != 1 && roleIds != 2){
		window.location.href="login.jsp";
	}else{
		displayStatus(id);
		$.ajax({
			type:'POST',
			url:'user/resume',
			dataType:'html',
			success:function(html) {
				$("#main").html(html);
			}
		});
	}	
}

function postedJob(id){
	displayStatus(id);
	$.ajax({
		type:'POST',
		url:'company/job/addEdit',
		dataType:'html',
		success:function(html) {
			$("#main").html(html);
		}
	});
}
function forum(){
	$.ajax({
		type:'POST',
		url:'forum/TopicIndex',
		dataType:'html',
		success:function(html) {
			$("#main").html(html);
		}
	});
}
function myJob(id){
	displayStatus(id);
	$.ajax({
		type:'POST',
		url:'company/job/index',
		dataType:'html',
		success:function(html) {
			$("#main").html(html);
		}
	});
}
function companyHome(id){
	displayStatus(id);
	$.ajax({
		type:'POST',
		url:'company/index',
		dataType:'html',
		success:function(html) {
			$("#main").html(html);
		}
	});
}
function displayStatus(id){
	$("#indexSy").removeClass("licurrent");
	$("#companys").removeClass("licurrent");
	$("#Resume").removeClass("licurrent");
	$("#release").removeClass("licurrent");
	$("#manage").removeClass("licurrent");
	$("#forum").removeClass("licurrent");
	$("#"+id+"").addClass("licurrent");
}
</script>
</head>
<!-- 头部登录  -->
 <div id="d1" class="a_login" >
 <div class="lg_main">
    <!-- <div class="search">
        <ul>
            <li><a class="xia_list">&nbsp;&nbsp;</a></li>
            <a id="ycbq" target="_blank" href="searchJobs.jsp" ></a>
            <li><div class="search_border"><input name="keyword" id="keyword" type="text" class="input_float"  placeholder="请输入职位名称"> <input onclick="genKeyord('');" type="button"></div></li>
        </ul>
    </div>
    <div class="logo"><img src="res/images/logo.png" width="188" height="30"></div> -->
 	<div style="width:100%;">
 	<a href="" class="logo"></a>
 	  <ul class="me_ul" id="daohang">
	 	   <li id="indexSy"><a href="index.jsp">首页</a></li>
	 	   <li id="companys"><a id="hotCompany" href="c/index" >公司</a></li>
	 	   <li id="Resume" style="display: none;"><a href="user/resume">我的简历</a></li>
	 	   <li id="release" style="display: none;"><a href="company/job/addEdit">职位发布</a></li>
	 	   <li id="manage" style="display: none;"><a href="company/index">公司主页</a></li>
	 	   <li id="forum"><a href="forum/TopicIndex" >论坛</a></li>
	 	   <li id="bangzhu"><a href="help.jsp" >帮助</a></li>
 	  </ul>
 	
 	<input type="hidden" id="roleIds" value="${sessionScope.roleId}">
<c:if test="${sessionScope.userId != null && sessionScope.userId != ''}">
 	  <div class="login_bg2">
	 	<div class="nd">
 			<ul class="ul-n">
 				<li class="b-c" ><a class="" id="userMsg"><!-- <img src="res/images/xiaoxi.png" style="margin-top:5px;"> -->消息
 					<c:if test="${sessionScope.num != '' && sessionScope.num !=null}">
 						<span style="color:#DC3836" id="num">(${sessionScope.num})</span>
 					</c:if>
 				</a></li>
 				<li style="padding:0 5px"><div style="border-right:1px solid #FFF;height:25px;"></div></li>
 				<li class="ww" style="width:50px; text-align: center;">
					<c:if test="${roleId==1}">
						我的
					</c:if>
					<c:if test="${roleId==2}">
	 					<c:if test="${sessionScope.userName !=null && sessionScope.userName !=''}">
							${sessionScope.userName}
						</c:if>
						<c:if test="${sessionScope.userName ==null || sessionScope.userName ==''}">
							<a href="javascript:void(0);" class="xik"><i class="xl"></i>
								请完善您的简历信息
							</a>
						</c:if>
					</c:if>
 					<div class="user-stuff" style="display: none;">
			 			<ul>
			 				<li id="myResume" style="display: none;"><a href="user/resume" >我的简历</a></li>
			 				<li id="myCompany" style="display: none;"><a href="company/index">公司主页</a></li>
			 				<li class="bor-top" id="ssue" style="display: none;"><a href="company/job/addEdit">发布职位</a></li>
			 				<li id="Recruitment" style="display: none;"><a href="company/job/index">我的招聘</a></li>
			 				<li class="bor-top"><a id="loginoutBtn" onclick="loginoutJS()" >退出</a>
			 					<a id="loginoutBtn2" style="display: none;" href='user/loginout'>退出</a>
			 				</li>
			 			</ul>
			 		</div>
 				</li>
 			</ul>
 		
 		</div>
	 	
 		</div>
 		
 		
</c:if>
	 	<c:if test="${sessionScope.userId == null || sessionScope.userId ==''}">

	 <div class="login_bg2">
	 		<a class="lg_c" href="login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a class="lg_c" href="user/regist.jsp">注册</a>
		</div>

		
	</c:if> 
	
 </div>
 </div>
</div> 
<!-- <div class="ption_f">
	
</div> -->
<script src="res/js/require.js"></script>
<script type="text/javascript">
	//引入模块
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		$(".ww").hover(function(){
			$(".user-stuff").css("display", "block");
			$(".xik").addClass("xim"); 
		}, function(){
			$(".user-stuff").css("display", "none");
			$(".xik").removeClass("xim");
		});

		$("#userMsg").click(function(){
			var roId = $("#roleIds").val();
			$("#num").text("");
			if(roId==1){
				showMsg();
			}else{
				showPerson();
			}
		});

		$('#daohang li').click(function(){
			$(this).addClass("licurrent").siblings().removeClass("licurrent");
			//$("#unlimited1").removeClass("current");
		});
		/* $('#daohang li').hover(function(){
			$(this).addClass("licurrent").siblings().removeClass("licurrent");
			//$("#unlimited1").removeClass("current");
		}); */
	   	function showMsg() {
			art({
				title: '通知',
				url: 'user/findReceiveResumeMsg',
				cancel: false,
				quickClose: true,
				width: 300,
			}).show(document.getElementById('userMsg'));
		}
		
		function showPerson() {
			art({
				title: '通知',
				url: 'user/findReceivePerson',
				cancel: false,
				quickClose: true,
				width: 300,
			}).show(document.getElementById('userMsg'));
		}
	});
	
	
</script>
</html>
