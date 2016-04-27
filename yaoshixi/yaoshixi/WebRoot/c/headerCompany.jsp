<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% response.setHeader("Cache-Control","no-store");%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function searchCompanyByTag(target) {
	target.className = "a_condition_current";
	document.getElementById("tag").value = target.innerHTML == "全部"?"":target.innerHTML;
	var tag = document.getElementsByName("tag_company");
	for ( var i = 0; i < tag.length; i++) {
		if(tag[i] === target) {
		} else {
			tag[i].className = "";
		}
	}
	
	document.getElementById("submit").click();
}


</script>
</head>
<!-- 头部登录  -->
<div class="a_login">
 <div class="lg_main">
    <div class="search"  style="position: relative;">
    	<form action="c/model" method="post" onsubmit="return submitData(this);">
    		<input id="city" name="city" type="hidden" value=""/>
    		<input id="scale" name="scale" type="hidden" value=""/>
			<input id="nature" name="nature" type="hidden" value=""/>
			<input id="field" name="field" type="hidden" value=""/>	
			<input id="tag" name="tag" type="hidden" value=""/>	
	        <ul>
	            <li><a href="javascript:void(0);" class="xia_list" onclick="showPanel();">&nbsp;&nbsp;</a></li>
	            <li>
		            <div class="search_border">
			            <input name="companyName" type="text" value="${companyName }" class="input_float"  placeholder="请输入公司名称" > 
			            <input id="submit" name="" type="submit" value="">
		            </div>
	            </li>
	        </ul>
	        <div style="position: absolute; top:45px; left:0; 
	        	width:1280px; height:380px;display: none; 
	        	background-color: #fff;
	        	border-left: 1px solid rgb(217, 217, 217);
	        	border-right: 1px solid rgb(217, 217, 217);
	        	border-bottom: 1px solid rgb(217, 217, 217);"
	        	 id="panel">	        
				<%@ include file="/c/companyCondition.jsp" %>
			</div>
	    </form>
    </div>
    <div class="logo"><img src="res/images/logo.png" width="188" height="30"></div>
 	 <div class="a_login_1">
	 	<%-- <div style="line-height:22px;padding:3px;float:left;">
		 	<c:if test="${sessionScope.email != null }">
		 		欢迎您：${sessionScope.email }   <a href="user/loginout">退出</a>
		 	</c:if>
	 	</div>--%>
	 	<c:if test="${sessionScope.email != null }">
	 	<div class="nd">
 			<ul class="ul-n">
 				<li class="b-c"><a  id="userMsg">消息</a></li>
 				<li class="ww b-c">
 					<a href="javascript:void(0);" class="xik"><i class="xl"></i>${sessionScope.userName}</a>
 					<div class="user-stuff">
			 			<ul>
			 				<li><a href="user/resume">我的简历</a></li>
			 				<li class="bor-top"><a href="company/job/addEdit" >发布职位</a></li>
			 				<li><a href="#">我的招聘</a></li>
			 				<li class="bor-top"><a href="user/loginout">退出</a></li>
			 			</ul>
			 		</div>
 				</li>
 			</ul>
 		
 		</div>
	 	</c:if>
	 	<c:if test="${sessionScope.email == null }">
	 		<ul>
		    	<li><a href="login.jsp">登录/注册</a></li>
		    </ul>
	 	</c:if> 
 		
 		
 		
 		
   </div>
 </div>
 
</div>
<div class="ption_f">
	
</div>
<script type="text/javascript">
$(document).ready(function(){	
	$(".user-stuff").css("display", "none");
	$(".ww").hover(function(){
		$(".user-stuff").css("display", "block");
		$(".xik").addClass("xim"); 
	}, function(){
		 
		$(".user-stuff").css("display", "none");
		$(".xik").removeClass("xim");
	});
	});
	//引入模块
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		
		$('#userMsg').click(function() { 
				showMsg();
		});
		
		function showMsg() {
			art({
				title: '通知',
				url: 'user/findReceiveResumeMsg',
				cancel: false,
				quickClose: true,
				width: 300,
			}).show(document.getElementById('userMsg'));
		}

	});
	
	function genKeyord(city) {
		var keyword = $("#keyword").val().trim();
		keyword= keyword +"#"+city;
		$.ajax({
			type:'POST',
			url:'indexModel',
			data:{"keyword":keyword},
			dataType:'html',
			success:function(html) {
				$("#jobsContent").html();
				$("#jobsContent").html(html);
			}
		});
	}
</script>
</html>
