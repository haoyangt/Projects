<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%= basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="res/resources/jquery.zclip.js"></script>
<script type="text/javascript" src="res/resources/jquery.min.js"></script>
<script type="text/javascript" src="res/resources/jquery.zclip.min.js"></script>
<style type="text/css">
body{ font-size:12px; line-height:22px;}
</style>
<script type="text/javascript">
function copyToClipBoard(){ 
    var clipBoardContent=""; 
    clipBoardContent = document.getElementById('shareUrl').value;
    if (window.clipboardData){
    	window.clipboardData.setData("Text",clipBoardContent);
    	alert("复制成功"); 
    }else{
    	alert("复制失败了,浏览器不支持，请手动复制一下链接然后分享给你的好友吧..."); 
    }
} 
	function closeWindow() {
		var dialog = top.dialog;
		dialog.get("artBoxForResume").close();
	}
</script>
</head>

<body>
 <form class="tb_int" id="interviewForm">
 <div style="text-indent:28px;">
	<table style="text-indent:28px;">
		<tr><td>邀请规则
          	<ol>
          		<li>成功邀请一个用户注册并激活，每日投递数即可增加 1 个;</li>
          	</ol>
        </td></tr>
		<c:if test="${inviteRegister !=null && inviteRegister !=''}">
			<tr><td><strong>您今天可投递的简历量已满,复制以下链接邀请朋友注册可以增加投递简历的机会：</strong></td></tr>
			<tr><td><input type="text" id="shareUrl" style="width:320px;height:36px;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" value="${inviteRegister }">
				<input type="button" id="copyUrl" onclick="copyToClipBoard();" value="复制"></td></tr>
			<tr><td><span >若点击复制无效，请手动复制链接</span></td></tr>
			<tr><td align="right"><input class="btn_cancel" type="button" onclick="closeWindow();" value="关闭"/></td></tr>
		</c:if>
		<c:if test="${inviteRegister ==null || inviteRegister ==''}">
			<tr><td><strong>复制以下链接邀请朋友注册可以增加投递简历的机会：</strong></td></tr>
			<tr><td><input type="text" id="shareUrl" style="width:320px;height:36px;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" value="http://www.yaoshixi.com/inviteRegister/${sessionScope.userId }">
					<input type="button" id="copyUrl" onclick="copyToClipBoard();" value="复制">
			</td></tr>
			<tr><td><span >若点击复制无效，请手动复制链接</span></td></tr>
		</c:if>
	</table>
</div>
</form>
</body>
</html>