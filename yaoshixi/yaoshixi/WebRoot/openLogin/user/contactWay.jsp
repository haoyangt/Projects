<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn" class="no-js">
<head>
<meta http-equiv="Content-Type">
<meta content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>我是${userBasicInfo.userName }-要实习</title>	
<link rel="shortcut icon" href="/res/images/favicon.ico">	
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">        
<link rel="stylesheet" type="text/css" href="/res/jianl/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/res/jianl/css/index.css" />
<link rel="stylesheet" type="text/css" href="/res/jianl/css/animations.css" />
<link rel="stylesheet" type="text/css" href="/res/jianl/css/load.css" /> 
</head>
<body>
    <div id="loading">
     	<div class="spinner">
  			<div class="double-bounce1"></div>
  			<div class="double-bounce2"></div>
		</div>
	</div>
		<div id="content" style="display:none">
             <div class="page page-9-1 page-current">
				<div class="wrap">
					<div class="ftop"><span class="fenxiang">${userBasicInfo.sharetimes}次</span><span class="chakan">${userBasicInfo.viewCount}次</span><span class="kong">还在找工作哟</span></div>
	
					<div class="text">
						<div id="dianhyoux" <c:if test="${userBasicInfo.expose != 2}"> style="display: none;"</c:if>>
							 电话：<a href="tel:${userBasicInfo.telPhone }">${userBasicInfo.telPhone }</a>直接邀请我吧！<br>
							邮箱：<a href="mailto:${userBasicInfo.email }">${userBasicInfo.email }</a>直接邀请我吧！<br><br>
						</div>
						<!-- 我是你的实习生吗？<br>如果不是，转出去，<br>让我去看看更大的世界好吗？ -->
                   </div>
                   <div style="text-align:center; position:absolute;top:70%; width:60%; left:20%;"> 
                   		<input name="" id="yaoq" type="button" onclick="invite('${userBasicInfo.userId}','${userBasicInfo.email}')" value="发邀请" class="inputfb">
                   </div>
				</div>
			</div> 
    </div>
    <div id="share" onClick="closeDialog()">
    	<div class="shareImg"></div>
    </div>		
    <div id="sharesc" onClick="closeDialogsc()">
    	<div class="shouchang"></div>
 </div>
</body> 
<script src="/res/jianl/js/zepto.min.js"></script>
<script src="/res/jianl/js/touch.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
document.onreadystatechange = loading; 

function loading(){
	if(document.readyState == "complete"){ 
		$("#loading").hide();
		$("#content").show();
		//playbksound();
	}
}

function invite(uId,email){
	if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/weixin/login.jsp";
	}else{
		if('${sessionScope.roleId}'==1){
			if('${sessionScope.userId}' == uId){
				alert("不能邀请自己");
			}else{
				window.location.href="/company/resume/inteWeixYaoQing/"+uId+"/"+email;
			}
		}else{
			alert("暂只支持企业用户发送邀请！");
		}
	}
}


function onBridgeReady(){
	 WeixinJSBridge.call('hideOptionMenu');
}

if (typeof WeixinJSBridge == "undefined"){
  if( document.addEventListener ){
      document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
  }else if (document.attachEvent){
      document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
      document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
  }
}else{
  onBridgeReady();
}
</script>
</html>

