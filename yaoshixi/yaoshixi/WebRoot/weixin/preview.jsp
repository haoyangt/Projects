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
<title>我是${companyName}，你是我渴望的${jobName}吗？一次转发更多机会</title>		
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
	<div class="page page-1-1 page-current">
		<div class="wrap shouy" >
            <div class="t1-ly qq pt-page-moveFromTop">职位来源：
            <a href="/c/indexPhone/${companyId }" style="color:#fff;text-decoration: underline;">
            	<c:if test="${companyShortName=='' || companyShortName==null }">
            		${companyName } 
            	</c:if> 
            	<c:if test="${companyShortName!='' && companyShortName!=null }">
            		${companyShortName } 
            	</c:if> 
            </a>
            <c:if test="${authentication==2 }">
	            <img style="vertical-align: middle; margin-left:10px;" src="/res/weixin/preview/img/v.png" width="20"> (点击公司查看详情)
	           	<div style="font-size:12px;color:#FFF45C">该公司已通过实名认证</div>
           	</c:if>
           	<c:if test="${authentication==1 }">
           		(点击公司查看详情)
           	</c:if>
            <div style="overflow: hidden;" class="qq pt-page-moveFromTop"> <img style="vertical-align: middle;float:left; margin-right:10px;" src="/res/weixin/preview/img/weizhaopin.png" width="25"><span>${jobName }</span></div>
             <div style="height:1px; background-color:#1d72de; width:100%; margin-top:5px; "></div>
            </div>
          <%--   <div  class="t1-title qq pt-page-moveFromTop"> <img style="vertical-align: middle; margin-right:10px;" src="/res/weixin/preview/img/weizhaopin.png" width="25">${jobName }</div>
            	<div class="qq pt-page-moveFromTop" style="height:1px; background-color:#1d72de; width:90%; margin-top:5px; position:absolute; left:5%; top:15%;"></div>
            --%>
            <div class="t1-s1 qq pt-page-fade2"> <img src="/res/weixin/preview/img/ad.png" width="35"><br/>工作城市：${city} </div>
            <div class="line1 qq pt-page-fade2"></div>
            <div class="t1-s2 qq pt-page-fade2"> <img src="/res/weixin/preview/img/renminbi.png" width="25"><br/>${payment }</div>				
            <div class="line2 qq pt-page-fade2"></div>
            <div class="t1-s3 qq pt-page-fade2"> <img src="/res/weixin/preview/img/gongzuo.png" width="35"><br/>
           		工作性质：
           		<c:if test="${workTime=='' && jobs.workTime==null }">未提供</c:if>
	     		<c:if test="${workTime==1 }">全职</c:if>
	     		<c:if test="${workTime==2 }">实习兼职</c:if>
	     		<c:if test="${workTime==3 }">实习兼职</c:if>
           	</div>
            <div class="line3 qq pt-page-fade2"></div>
            <div class="t1-s4 qq pt-page-fade2"> <img src="/res/weixin/preview/img/zhuan.png" width="35"><br/>
   	         	学历要求：
	       		<c:if test="${educationalReq == 1 }">不限</c:if>
	            <c:if test="${educationalReq == 2 }">高中</c:if>
	            <c:if test="${educationalReq == 3 }">大专</c:if>
	            <c:if test="${educationalReq == 4 }">本科</c:if>
	            <c:if test="${educationalReq == 5 }">硕士</c:if>
	            <c:if test="${educationalReq == 6 }">博士</c:if>
            </div>
            <!-- <div style="position: absolute;bottom: 0px;width:100%;left:50%;margin-left:-50%;color:#CC6600;font-size: 22px;text-align: center;"><a href="/weixin/yuanjs.jsp">远界管理咨询有限公司</a></div> -->
		  <img class="icon pt-page-moveIconUp" src="/res/weixin/preview/img/icon_up.png" />
                 
		</div>
	</div>
	<div class="page page-2-1 hide">
	<div class="wrap">
			<div class="bbtt">职位诱惑</div>
			<div id="temptation"></div>
		   
           <img class="icon pt-page-moveIconUp" src="/res/weixin/preview/img/icon_up.png" />
		</div>
		
	</div>
	<div class="page page-3-1 hide">
		<div class="wrap">
			<div class="bbtt">职位要求</div>
			<div id="jobRequest"></div>
		   
            <img class="icon pt-page-moveIconUp" src="/res/weixin/preview/img/icon_up.png" />
		</div>
	</div>
	<div class="page page-4-1 hide">
		<div class="wrap">
			<div class="bbtt">工作内容</div>
			<div id="jobDesc"></div>
		  
                <img class="icon pt-page-moveIconUp" src="/res/weixin/preview/img/icon_up.png" />
			</div>
	</div>
	<div class="page page-5-1 hide">
				<div class="wrap">
					<div class="ftop-con">
						<p><span class="fenxiang">分享：${sharetimes}次</span></p>
						<p><span class="chakan">浏览：${pageView}次</span></p>
						<p><span class="kong">招聘：还在招人哟</span></p>
					</div>
					  <div  style="background-color: rgba(172,213,152,0.3);width: 60px;height: 40px;position: absolute;top: 27%;left: 50%;margin-left: -30px;"></div>
                    
   				</div>
			</div> 
    <div class="page page-6-1 hide">
		<div class="wrap">
		<div class="ftop"><span class="fenxiang">${sharetimes}次</span><span class="chakan">${pageView}次</span><span class="kong">还在招人哟</span></div>
		<%-- <div class="text">
				${companyName }<br>
				 招聘${jobName }  薪资${payment }
                	</div>  --%>
			<!-- <img class="img_1 hide pt-page-moveCircle" src="/res/weixin/preview/img/logox.png" />  -->
			<!-- <div style=" position: absolute;left:10%;line-height:25px; text-align:left;  width:80%; top:30%; font-size: 14px; color:#666">
				分享到朋友圈或让好友转发，<br>
				让招聘飞一会，坐等人才到碗里来
			</div> -->
			<div style="text-align:center; position:absolute;top:12%; width:90%; left:50%; margin-left:-45%;"> 
					<div style="line-height:25px;margin:5px 0; color:#666">你是我要找的牛人吗？</div>
	
						<%-- <c:if test="${sessionScope.roleId !=1}"> --%>
							<c:if test="${diliverStatus != 1 }">
								<%-- <c:if test="${jobType=='招聘正式员工'}">
									<input name="" type="button" id="toudi" onclick="" value="正式投递简历" class="inputfb">
								</c:if> --%>
								<%-- <c:if test="${jobType=='招聘实习生'}"> --%>
                   					<input name="" type="button" id="toudi" onclick="btnDiliver('${id}')" value="投递简历" class="inputfb">
								<%-- </c:if> --%>
                   			</c:if>
                   			<c:if test="${diliverStatus == 1 }">
                   				<input name="" type="button" value="已投递" class="inputfb">
                   			</c:if> 
                   		<%-- </c:if> --%>
                   		<%-- <c:if test="${sessionScope.roleId ==1}">
                   		企业用户不可以投递！
                   		</c:if>  --%>
                   	<div style="line-height:20px;margin:5px 0;font-size:12px; color:#0060A6">
                   	你也可以把简历发送到以下<br/>邮箱：<a href="mailto:${email }">${email }</a><br/>电话咨询：<a href="tel:${phone }">${phone }（点击拨打）</a></div>
                   <div style="line-height:25px;margin:5px 0;color:#666">如果不是，转出去，<br>把机会给更适合的人好吗？</div>
                   		<input name="" id="yaoq" type="button" onclick="shareDialog()" value="帮我分享" class="inputfb">
      
                   </div>
                    <div style="position:absolute; top:70%; width:80%; left:50%; margin-left:-40%; overflow: hidden; ">
                  <div style="float:left;width: 110px;padding-right: 5px;padding-left: 10px;"> <img style="width:100%" src="/res/images/wxEwm.jpg" /></div>
                   <div style="line-height:25px;margin:5px 0;">长按二维码，免<br/>费制作你的闪聘</div>
                   <input name="" type="button" onclick="shareDialogsc()" value="收藏职位" class="inputfb">
                  </div>
                 
         <div style="position: absolute;bottom: 0px;width:100%;left:50%;margin-left:-50%;color:#CC6600;font-size: 12px;text-align: center;">&copy;远界科技技术支持</div>
			
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

var jobRequest = '${jobRequest}';
if(jobRequest != "" && jobRequest != null){
	var ds = jobRequest.split(",");
	var str = "";
	for(var i=0;i<ds.length;i++){
		/* if(i<ds.length-1){
		str = str +"<div class=\"t4-tag"+(Number(i)+1)+" hide qq pt-page-moveFromRight3\"><table><tr><td>"+ds[i]+"</td></tr></table></div>"+
		"<div class=\"line"+(Number(i)+1)+" qq hide pt-page-fade2\"></div>";
		}else{
			str = str +"<div class=\"t4-tag"+(Number(i)+1)+" hide qq pt-page-moveFromRight3\"><table><tr><td>"+ds[i]+"</td></tr></table></div>";
		} */
		str = str +"<div class=\"t4-tag"+(Number(i)+1)+" hide qq pt-page-moveFromRight3\"><table><tr><td>"+ds[i]+"</td></tr></table></div>";
	}
	document.getElementById("jobRequest").innerHTML=str; 
}
var temptation = '${temptation}';
if(temptation != "" && temptation != null){
	var fs = temptation.split(",");
	var std = "";
	for(var j=0;j<fs.length;j++){
		/*  if(j<fs.length-1){
			std=std +"<div class=\"t4-tag"+(Number(j)+1)+" hide qq pt-page-fade2\"><table><tr><td>"+fs[j]+"</td></tr></table></div>"+
			"<div class=\"line"+(Number(j)+1)+" qq hide pt-page-fade2\"></div>";
			}else{
				std=std +"<div class=\"t4-tag"+(Number(j)+1)+" hide qq pt-page-fade2\"> <table><tr><td>"+fs[j]+"</td></tr></table></div>";
			}  */
		 std=std +"<div class=\"t4-tag"+(Number(j)+1)+" hide qq pt-page-fade2\"> <table><tr><td>"+fs[j]+"</td></tr></table></div>";
	}
	document.getElementById("temptation").innerHTML=std; 
}
var jobDesc = '${jobDesc}';
if(jobDesc != "" && jobDesc != null){
	var gs = jobDesc.split(",");
	var stg = "";
	for(var n=0;n<gs.length;n++){
		stg=stg+"<div class=\"t4-tag"+(Number(n)+1)+" hide qq pt-page-scaleUp\"><table><tr><td>"+gs[n]+"</td></tr></table></div>";
	}
	document.getElementById("jobDesc").innerHTML=stg; 
}

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
	if('${sessionScope.userId}'!='' && ratio!='' && userName!='' && email!='' && quantity>0){
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
		window.location.href="/weixin/login.jsp";
	}else if('${sessionScope.companyId}' == '${companyId}'){
		alert("不能投递自己发布的职位");
	}/*else if(ratio=='' || ratio==null || userName=='' || userName==null || email=='' || email==null){
		alert("你的简历不够完善，暂不能投递简历，请先完善简历");
		if('${sessionScope.userId}'!=''){
			window.location.href="/user/resumeWx/"+${sessionScope.userId};
		};
	}*/else if(quantity<=0){
		alert("您今天可投递的简历量已满");
	}
	
}
function shareDialog(){
	 $("#share").show();
}
function closeDialog(){
	$("#share").hide();
}
function shareDialogsc(){
	 $("#sharesc").show();			
}
function closeDialogsc(){
	$("#sharesc").hide();
}
var userName = '';
if('${companyShortName}'=='' || '${companyShortName}'=='null'){
	userName = '${companyName}';
}else{
	userName = '${companyShortName}';
}
var jobId = '${id }';
var jobName = '${jobName}';
var url = location.href;
$.ajax({
	type:'POST',
	url:'/weixin/approve',
	data:{"url":url},
	dataType:'html',
	success:function(jsons) {
		var json = JSON.parse(jsons);
		wx.config({
		    debug: false,
		    appId: 'wx916479acee4084e2',
		    timestamp: json.timestamp,
		    nonceStr: json.nonceStr,
		    signature: json.signature,
		    jsApiList: ['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage',
		      'onMenuShareQQ','onMenuShareWeibo','hideMenuItems','showMenuItems',
		      'hideAllNonBaseMenuItem','showAllNonBaseMenuItem','translateVoice',
		      'startRecord','stopRecord','onRecordEnd','playVoice','pauseVoice',
		      'stopVoice','uploadVoice','downloadVoice','chooseImage','previewImage',
		      'uploadImage','downloadImage','getNetworkType','openLocation','getLocation',
		      'hideOptionMenu','showOptionMenu','closeWindow','scanQRCode','chooseWXPay',
		      'openProductSpecificView','addCard','chooseCard','openCard'
		    ]
		});
	}
});
</script>
<script src="/res/weixin/preview/js/domeJob.js"></script>
</html>
