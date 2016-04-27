<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>绑定结果</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
@media screen and (max-width:600px) {
.weixin_log {
	width: 100%;
     }
}

</style>
</head>
<body>
<div class="weixin_log" >
	<c:if test="${flag == 0}">
		   <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">绑定成功</a>
		    </div>
	</c:if>
	<c:if test="${flag == 1}"> 
		   <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">已重新绑定</a>
		    </div>
	</c:if> 
	<c:if test="${flag == 2}"> 
		   <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">已重新绑定</a>
		   </div>
	</c:if>
	<c:if test="${flag == 3}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">已重新绑定</a>
		   </div>
	</c:if> 
	<c:if test="${flag == 4}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">已绑定</a>
		   </div>
	</c:if> 
	
	<c:if test="${flag == 5}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">修改成功</a>
		   </div>
	</c:if> 
	<c:if test="${flag == 6}"> 
		    <div class="weixin_l" style="padding: 20px 20px 270px 20px;margin-top:50px;background-color: #EEECE9;width: 100%;">
		    	<a class="bdcg" style="width: 250px;">修改成功，我们已自动为您在要实习官网上注册了登录账户<br>登录账户为您的联系邮箱<br>默认密码为:000000，登录要实习网站完成您更详细的简历</a>
		   </div>
	</c:if> 
	<c:if test="${flag == 7}"> 
		    <div class="weixin_l" style="padding: 20px 20px 240px 20px;margin-top:50px;background-color: #EEECE9;width: 100%;">
		    	<a class="bdcg" style="width: 250px;">
		    	恭喜你已经成功创建！你可以：<br>
                ①将简历漂出去，让全世界帮你找工作！<br>
                ②返回菜单，在【职位搜索】看看心仪企业吧！
                </a>
		   </div>
	</c:if>
	<c:if test="${flag == 8}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">恭喜你，职位发布成功！</a>
		   </div>
	</c:if>
	<c:if test="${flag == 9}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 110px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">恭喜你，提交成功！</a>
		   </div>
	</c:if>
	<c:if test="${flag == 10}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">你已提交成功，无需重复提交！</a>
		   </div>
	</c:if>
	
	<c:if test="${flag == 11}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">你不能编辑他人的简历！</a>
		   </div>
	</c:if>
	
	<c:if test="${flag == 12}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">你不能编辑他人发布的职位！</a>
		   </div>
	</c:if>
	
	<c:if test="${flag == 13}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">你不能获取他人信息！</a>
		   </div>
	</c:if>
	<c:if test="${flag == 44}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 50px;margin-top:50px;background-color: #EEECE9;">
		    	<a class="bdcg">简历漂流瓶的主人已经被他的伯乐找到了！谢谢你们的帮助，恭喜他吧！</a>
		   </div>
	</c:if>
	<c:if test="${flag == '' || flag == null}"> 
		    <div class="weixin_l" style="padding: 20px 20px 20px 40px;margin-top:50px;background-color: #EEECE9;height: 80px;">
		    	<a style="background-position: left center;background-repeat: no-repeat;display: block; height: 32px;padding-left: 10px;width: 98%;line-height:32px; color:#0079e0;">该功能正在内测，将很快推出，敬请期待。</a>
		   </div>
	</c:if>
</div>

</body>
</html>