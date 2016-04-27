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
<title>我是${companyName}-要实习</title>		
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">        
<link rel="stylesheet" type="text/css" href="/res/weixin/preview/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/preview/css/index.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/preview/css/animations.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/preview/css/load.css" /> 
</head>
<body>
<div id="loading">
   	<div class="spinner">
		<div class="double-bounce1"></div>
		<div class="double-bounce2"></div>
	</div>
</div>
<div id="content" style="display:none">
    <div class="page page-5-1 page-current">
		<div class="wrap">
		<div class="ftop"><span class="fenxiang">${sharetimes}次</span><span class="chakan">${pageView}次</span><span class="kong">还空缺哟</span></div>
		<div class="text">
				${companyName }<br>
				 招聘${jobName }  薪资${payment }
                	</div> 
			<img class="img_1 hide pt-page-moveCircle" src="/res/weixin/preview/img/logox.png" /> 
			<div style=" position: absolute;left:10%;line-height:25px; text-align:left;  width:80%; top:30%; font-size: 14px; color:#666">
				分享到朋友圈或让好友转发，<br>
				让招聘飞一会，坐等人才到碗里来
			</div>
			
			<c:if test="${sessionScope.roleId !=1}">
				<div style="text-align:center; position:absolute;top:85%; width:40%; left:5%;"> 
					<c:if test="${diliverStatus == 1 }">
							<input name="" type="button" value="已投递" class="inputfb">
					</c:if>
					<c:if test="${diliverStatus != 1 }"> 
							<button name="" id="toudi" onclick="btnDiliver('${id}')" class="inputfb">投递简历</button>
					</c:if> 
				</div>
				
                  <div style="text-align:center; position:absolute;top:85%; width:40%; left:55%;"> 
                  	<button name="" onclick="bock()" class="inputfb">返回</button>
                  </div>
 					<!-- <div style="text-align:center; position:absolute;top:85%; width:30%; left:30%;left:65%;"> 
 						<input name="" type="button" onclick="shareDialog()" value="分享" class="inputfb">
 					</div> -->
 			</c:if>	
 			<c:if test="${sessionScope.roleId ==1}">
 				<!-- <div style="text-align:center; position:absolute;top:85%; width:30%; left:5%;"> 
                  	<input name="" type="button" onclick="shareDialogsc()" value="收藏" class="inputfb">
                  </div> -->
                  <div style="text-align:center; position:absolute;top:78%; width:50%; left:26%;">企业用户不可以投递！</div>
 					<div style="text-align:center; position:absolute;top:85%; width:100%; left:0%;"> 
 						<button name="" onclick="bock()" class="inputfb">返回</button>
 					</div>
 			</c:if> 
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
<script src="/res/weixin/preview/js/zepto.min.js"></script>
<script src="/res/weixin/preview/js/touch.js"></script>
<script src="/res/weixin/preview/js/index.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
document.onreadystatechange = loading; 

function loading(){
	if(document.readyState == "complete"){ 
		$("#loading").hide();
		$("#content").show();
	};
};

function btnDiliver(jobId){
	var ratio = '${sessionScope.university}';
	var userName = '${sessionScope.userName}';
	var email = '${sessionScope.userEmail}';
	var quantity = '${sessionScope.quantityHH}';
	if('${sessionScope.userId}'!='' && '${sessionScope.roleId}' != '1' && ratio!='' && userName!='' && email!='' && quantity>0){
		if(jobId != null && jobId != '' ){
			$.ajax({
				type:'POST',
				url:'/user/diliverResumeWxWjl',
				data:{"jobId":jobId,"terrace":1},
				dataType:'json',
				success:function(json) {
					alert(json.msg);
					if(json.msg=='简历投递成功'){
						$("#toudi").val("已投递");
						$("#toudi").attr("onclick","");
					}
				}
			}); 
			//window.location.href="/user/declarationPhone/"+jobId;
		}else{
			alert("该职位已投递！");
		}
	}else if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/m/login.jsp";
	}else if('${sessionScope.roleId}' == '1'){
		alert("企业用户暂不能投递简历");
	}/*else if(ratio=='' || ratio==null || userName=='' || userName==null || email=='' || email==null){
		alert("你的简历不够完善，暂不能投递简历，请先完善简历");
		if('${sessionScope.userId}'!=''){
			window.location.href="/user/resumeWx/"+${sessionScope.userId};
		};
	}*/else if(quantity<=0){
		alert("您今天可投递的简历量已满");
	}
	
}

function bock(){
	history.back();
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
