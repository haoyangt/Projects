<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/jstl.jsp" %>
<!-- <!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="res/images/favicon.ico">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	if(roleIds==1){
		$("#releaseNew").show();
	}else{
		$("#myResumes").show();
	}
});
function threwResume(id){
	if(roleIds != 1 && roleIds != 2){
		window.location.href="login.jsp";
	}else{
		displayStatus(id);
		$.ajax({
			type:'POST',
			url:'user/jobList',
			dataType:'html',
			success:function(html) {
				$("#main").html(html);
			}
		});
	}	
}
function fbTopic(id){
	if(roleIds != 1 && roleIds != 2){
		window.location.href="login.jsp";
	}else{
		displayStatus(id);
		$.ajax({
			type:'POST',
			url:'user/addTopicInput',
			dataType:'html',
			success:function(html) {
				$("#main").html(html);
			}
		});
	}
}
</script>
<!-- </head> -->
<!-- 左边导航  -->
<div class="header">
<%--  <div class="logo_h">
  <input type="hidden" id="roleId" value="${roleId}">
 	<a href="index"><img src="res/images/logo.gif" /></a>
 </div> --%>
  <div class="banner">
   		<ul class="reset" id="navheader">
   			<li id="releaseNew" style="display: none;"><p style="line-height: 35px;padding-left:10px;color:#007dd1">发布职位</p>
		   		<div class="zhi_li">
		   		   <a href="company/job/addEdit" id="PostedJobNew">发布新职位</a>
	               <a href="company/job/index" id="myPostedJob">我发布的职位</a>
	               <a href="company/job/invitation.jsp" id="InviteIntern">邀请实习生</a>
		   		</div>
   			</li>
   			<li id="myResumes" style="display: none;"><p style="line-height: 35px;padding-left:10px;color:#007dd1">我的简历</p>
   				<div class="zhi_li">
   					<a href="user/resume" id="myResumeTwo">我的简历</a>
                    <a href="user/jobList" id="myPosition">我投递的职位</a>
   				</div>
   			</li>
   			<li ><p style="line-height: 35px;padding-left:10px;color:#007dd1">论坛</p>
   				<div class="zhi_li">
   					<a href="user/addTopicInput" id="myResumeTwo">发布新话题</a>
   				</div>
   			</li>
   		</ul>
    </div> 
    <c:if test="${roleId==2}">
	    <div class="ban_wex">当前每日投递量：${sessionScope.quantity }份</div>
	    <div class="sha_wex" style="height: 10px;"></div>
	   	<div class="sha_wex" style="height: 40px;"><a  target="_blank" href="user/quantityFull.jsp" style="text-decoration:underline;">邀请好友，提升投递量</a> </div>
    </c:if>
    <div class="ban_wex">扫一扫</div>
    <div class="sha_wex"><img src="res/images/wxEwm.jpg" width="168px"/></div>
    
    <!-- <div class="ban_sina">
    	<iframe width="100%" height="120" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=120&fansRow=2&ptype=1&speed=0&skin=9&isTitle=1&noborder=1&isWeibo=0&isFans=0&uid=3971198910&verifier=c19c1e0f&dpc=1"></iframe>
    </div> -->
</div>
<!-- </html> -->
