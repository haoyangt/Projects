<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<title>我是${userBasicInfo.userName }，正在找工作</title>
<style>
body{ background-color:#FFF; font-size:14px; margin:0; padding:0;}
a { color:#999; text-decoration:none;}
.header{ text-align:center;padding-top:10px; background-color:#09F; width:100%;}
.header .tx{ border-radius:100px; border:3px solid #FFF;}
.header p{ color:#FFF; padding:0; line-height:25px; margin:0;}
.phone{padding-left:20px; color:#FFF; background:url(/res/amazeui/images/iconfont-snimicshouji.png) no-repeat left center; background-size:20px; display:inline-block; line-height:30px;}
.mail{padding-left:23px;color:#FFF;  background:url(/res/amazeui/images/iconfont-youxiang.png) no-repeat left center; background-size:20px; display:inline-block; line-height:30px;}
.address{padding-left:20px;color:#FFF;  background:url(/res/amazeui/images/iconfont-dizhi.png) no-repeat left center; background-size:20px; display:inline-block; line-height:30px;}
ul{ margin:0; padding:0}
ul li{ list-style-type:none;padding:10px; line-height:22px; border-bottom:1px solid #e2e2e2; overflow: hidden;}
.header a{ margin-right:10px;}
ul li span{color:#999;}
.footer{ position:fixed; bottom:0; border-top:1px solid #CCC; background-color:rgba(86,86,86,0.8); width:100%; text-align:center;padding:10px 0;}
.footer a{ padding:5px 10px; font-size:1.2em; border-radius:3px; display:inline-block; background-color:#649AE1;color:#FFF; margin:0 10px;}
</style>
</head>

<body>
<div class="header">
<c:if test="${fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn')}">
	 <img width="100" class="tx" src="${userBasicInfo.headImg}"> 
</c:if>
<c:if test="${!fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn') && userBasicInfo.headImg !=''}">
	<img width="100" class="tx" src="/user/getHeadPhoto?ImgPath=${userBasicInfo.headImg}"> 
</c:if>
<c:if test="${userBasicInfo.headImg == '' || userBasicInfo.headImg == null}">
	<img width="100" class="tx" src="/res/jianl/img/t.jpg" />
</c:if> 
<p>${userBasicInfo.userName }</p>

<a  href="tel:${userBasicInfo.telPhone }" class="phone">${userBasicInfo.telPhone }</a><a  href="mailto:${userBasicInfo.email }" class="mail">${userBasicInfo.email }</a><a class="address">${userBasicInfo.city }</a>

</div>
<!--<p><img src="images/iconfont-fangzi.png" width="20" style="vertical-align:middle; margin-right:5px">深圳市深圳大学</p>
<p><img src="images/iconfont-diannaoduan.png" width="18" style="vertical-align:middle;margin-right:5px">软件技术专业/二年级</p>-->
<ul>
<li>学校：<span style="float:right">${education.university}</span></li>
<li>专业/年级：<span style="float:right">${education.major}/${education.grade}</span></li>
<li>可实习时间：<span style="float:right">
	每周星期
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周一')}">1,</c:if>
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周二')}">2,</c:if>
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周三')}">3,</c:if>
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周四')}">4,</c:if>
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周五')}">5,</c:if>
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周六')}">6,</c:if>
	 <c:if test="${fn:contains(userBasicInfo.workReady,'周日')}">7</c:if>
	 实习   
</span></li>
<li>可实习月份：<span style="float:right;width:70%; text-align: right;">
	每年
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'一月')}">1,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'二月')}">2,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'三月')}">3,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'四月')}">4,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'五月')}">5,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'六月')}">6,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'七月')}">7,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'八月')}">8,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'九月')}">9,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'十月')}">10,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'十壹月')}">11,</c:if>
    	<c:if test="${fn:contains(userBasicInfo.monthReady,'十贰月')}">12</c:if>
   	月可实习
</span></li>
<li>可实习场所：<span style="float:right">
	<c:if test="${fn:contains(userBasicInfo.jobCity, '需居家办公')}">需居家办公</c:if>
  	<c:if test="${fn:contains(userBasicInfo.jobCity, '在公司办公')}">在公司办公</c:if>
  	<c:if test="${!fn:contains(userBasicInfo.jobCity, '在公司办公') && !fn:contains(userBasicInfo.jobCity, '需居家办公')}">
  		未填写
  	</c:if>
</span></li>
 </ul>
<ul style=" margin-bottom:50px;">

<li style="background-color:#EC6F5A;color:#FFF; font-size:16PX;">个人特征</li>
<li>技能：<span>${userBasicInfo.skill}</span></li>
<li>证书：<span>${userBasicInfo.certificate}</span></li>
<li>经历：<span>${userBasicInfo.experience}</span></li>
<li>爱好：<span>${userBasicInfo.hobby}</span></li>
<li>特征：<span>
	<c:forEach items="${tagUsers}" var="tagUsers" varStatus="s">
		<c:if test="${!s.last}">
			${tagUsers.tagName},
		</c:if>
		<c:if test="${s.last}">
			${tagUsers.tagName}
		</c:if>
	</c:forEach>
</span></li>


</ul>
<div class="footer">
<a onclick="fayaoq('${userBasicInfo.userId}','${userBasicInfo.email}')">通知面试</a>
<a onclick="Pending('${userBasicInfo.userId}','${jobId}')" style="background-color:#f8b730">待定</a>
<a onclick="turnDown('${userBasicInfo.userId}','${jobId}','${userBasicInfo.email}')" style="background-color:#e43619">不合适</a>
</div>
<script type="text/javascript" src="/res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
function fayaoq(uId,email){
	if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/m/login.jsp";
	}else{
		if('${sessionScope.roleId}'==1){
			window.location.href="/company/resume/inteWeixYaoQing/"+uId+"/"+email;
		}else{
			alert("暂只支持企业用户发送邀请！");
		}
	}
}
function Pending(userId,jobId){
	if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/m/login.jsp";
	}else{
		alert(1232);
		$.ajax({
			type:'POST',
			url:'/company/resume/alternative',
			data:{'userId':userId,'jobId':jobId},
			dataType:'json',
			success:function(json) {
				alert(json.msg);
			}
		});
	}
}

function turnDown(userId,jobId,email){
	if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/m/login.jsp";
	}else{
		if('${sessionScope.roleId}'==1){
			window.location.href="/company/resume/turnDown/"+userId+"/"+jobId+"/"+email;
		}else{
			alert("暂只支持企业用户发送拒绝！");
		}
	}
}
</script>
</body>
</html>
