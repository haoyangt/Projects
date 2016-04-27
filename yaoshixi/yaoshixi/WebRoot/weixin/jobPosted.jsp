<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head lang="zh-cn">
<meta charset="UTF-8">
<title id="tit">要实习</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <embed src="http://www.linklearn.cn/firmanage/assets/zwlphbh.mp3" type="audio/mpeg" autostart="true" loop="true"></embed>  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="/res/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/res/assets/css/amui.all.min.css"/>
<link rel="stylesheet" href="/res/assets/css/app.css"/>
<link rel="stylesheet" href="/res/css/jquery-ui.css">
<link href="/res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/res/jquery/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="/res/validate/js/validate.js"></script>
<script src="/res/js/jquery-ui.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	height: 100%;
	min-height: 100%;
	overflow: hidden;
	 font-size:20px;
}
body{
  overflow:hidden;
}
.ss{display: none !important;}
#page {
	height: 100%;
	display: block;
	width: 100%;
	background-color: #F7F7F7;
	position: absolute;
	left:0;
}
.default {
	-webkit-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
	-webkit-transform: translate(100%, 0);
	-ms-transform: translate(100%, 0);
	transform: translate(100%, 0);
}
.dd {
	height:560px;
	min-height:460px;
	 overflow:hidden;
	width:100%;
	position:relative;
	
}
.dd .next {
	-webkit-transform: translate(0%, 0);
}
.dd .previous {
	-webkit-transform: translate(100%, 0);
	-ms-transform: translate(100%, 0);
	transform: translate(100%, 0);
}
.hidestyle {
	display: none;
}
.astyle {
	padding: 10px 20px;
	background-color: #333;
	color: #FFF;
	z-index: 20;
	display: block;
	width:100px;
	margin:0 auto;
	text-align: center;
}


.slider-box{ background:#F0EFEB; font-family:Microsoft Yahei; padding-bottom:10px}
 .slider-box .item{ padding:10px}
 .slider-box .item .tag, .slider-box .item .slider, .slider-box .item .val{ float:left; margin-right:18px}
 .slider-box .item .slider{ width:400px}
 .slider-box .item .slider div{ background:#8FBF0B; border:none; height:0.5em; margin-top:0.5em}
 .slider-box .item .slider div .ui-slider-handle{ background:#F4F3F1; width:1em; height:1em; border-radius:1em}
 .slider-box .item .val input{ border:none; border-bottom:1px solid #ABADA8; background:none; padding:0.1em 1em; color:#E4531C; font-weight:bold; font-size:1em; width:5em; text-align:center}
 .clr{ clear:both}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	validateUtil.init($(document));
	var isTouch = ('ontouchstart' in document.documentElement) ? 'touchstart' : 'onclick', _on = $.fn.on;
	$.fn.on = function(){
        arguments[0] = (arguments[0] === 'onclick') ? isTouch: arguments[0];
        return _on.apply(this, arguments); 
	};
	var width=document.documentElement.clientWidth;
	$(".dd").width(width);
	
	 $("#budget").slider({
		   min: 1000,
		   max: 3000,
		   step: 100,
		   animate:true, 
		   value: $('input[name="budget"]').val(),
		   slide: function( event, ui ) {
		    $('input[name="budget"]').val(ui.value);
		   }
		  });
		  $("#days").slider({
		   min: 3000,
		   max: 5000,
		   step: 100,
		   animate:true, 
		   value: $('input[name="days"]').val(),
		   slide: function( event, ui ) {
		    $('input[name="days"]').val(ui.value);
		   }
		  });
	
}); 
function getNext(currentObj, clazz){
	var $This = $(currentObj);
	var $next = $This.next();
	//alert(falg);
		if($next.hasClass(clazz)){
			return $next;
		}else{
			return getNext($next, clazz);
		}
}
function pageNet(name,ss){
	if(name == "jobName"){
		var jobName = $("#jobName").val();
		if(jobName==""){
			$("#hint").text("带*号必填");
			return;
		}else{
			$("#hint").text("");
		}
		if(!document.getElementById("checklabel").checked){
			alert("需同意要实习用户协议");
			return;
		}
	}
	 var $div = $(ss).parent();
	 var $n = getNext($div, "ddgg");
	 $div.addClass("hidestyle");
	 $div.removeClass("ddgg");
	 $div.removeClass("default");
	 $div.removeClass("next");
	 $div.attr("id","");
	 $n.removeClass("next");
	 $n.removeClass("previous");
	 $n.addClass("next");
	 $n.removeClass("hidestyle");
	// window.location.href = "#Top";
}
</script>
</head>
<body>
<div class="dd">  
<form action="/questionnaire/view/dati" name="form1" method="post" class="form-div">
<fieldset>
  <input type="hidden" id="qnaireId" name="qnaireId" value="${qnaire.qnaireId}"/>
	<!-- <div id="page" class="pagedds"> 
		<a class="a-next am-btn am-btn-primary am-btn-block am-btn-lg" onclick="pageNet('为公司招实习生',this);">为公司招实习生</a>
		<a class="a-next am-btn am-btn-primary am-btn-block am-btn-lg" onclick="pageNet('为自己招实习生',this);">为自己招实习生</a>
	</div> --> 
  
	<div id="page"  > 
		<div style="padding-top: 68px;padding-bottom: 20px;padding-left: 8px;">
	    	<input type="text" id="jobName" name="jobName" validate="required::请输入职位名称" placeholder="请输入职位名称" style="height: 48px;width: 96%;" class="login_input kt_input_w">
	    	<font id="hint" style="color: red;font-size: 14px;text-align: left;"></font>
	    	<div style="text-align: 8px;padding-top: 28px;">
	        	<label><input type="checkbox" id="checklabel" checked>我已阅读并同意<span class="login_color"><a id="protocol" target="_blank" href="/user/pProtocol.jsp">《要实习用户协议》</a></span></label> 
	        </div>
        </div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('jobName',this);" >下一步</a>
  	</div>
  
   <div id="page" class="default hidestyle ddgg"> 
		<div style="text-align: center;padding-top: 68px;padding-bottom: 20px;">选择工作城市：
	    	<div style="text-align: 8px;padding-top: 28px;">
	    		<a class="am-btn am-btn-success am-btn-xs">深圳</a>
	    		<a class="am-btn am-btn-success am-btn-xs">广州</a>
	    		<a class="am-btn am-btn-success am-btn-xs">珠海</a>
	        </div>
        </div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('',this);" >下一步</a>
  	</div>
  	
  	<div id="page" class="default hidestyle ddgg"> 
		<div style="text-align: center;padding-top: 68px;padding-bottom: 20px;">选择薪资范围(月):
	    	<div style="text-align: 8px;padding-top: 28px;">
	    		<div class="slider-box">
				  	<div class="item">
				   		<div class="tag">最低薪资：</div>
				   			<div class="slider" style="width: 100%">
				    			<div id="budget" ></div>
				   			</div>
				   		<div class="val" ><input value="1500" name="budget" disabled="disabled" /></div>
				  	</div>
				  	<div class="clr"></div>
			  		<div class="item">
				   		<div class="tag">最高薪资：</div>
				   		<div class="slider" style="width: 100%">
				    		<div id="days" ></div>
				   		</div>
				   		<div class="val" ><input value="3500" name="days" disabled="disabled" /></div>
				  	</div>
				  	<div class="clr"></div>
			 	</div>
	    	
	    	
	    		<!-- 最低薪资
	    		<input type="text" name="payment" validate="required::请输入最低薪资" placeholder="请输入最低薪资" style="height: 48px;width: 96%;" class="login_input kt_input_w">
	    		最高薪资
	    		<input type="text" name="payment" validate="required::请输入最高薪资" placeholder="请输入最高薪资" style="height: 48px;width: 96%;" class="login_input kt_input_w"> -->
	        </div>
        </div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('',this);" >下一步</a>
  	</div>
  	
  	<div id="page" class="default hidestyle ddgg"> 
		<div style="text-align: center;padding-top: 68px;">职位学历要求:
	    	<div style="text-align: 8px;padding-top: 28px;">
	    	<input type="radio" name="educationalReq" value="2" id="RadioGroup3_1" style="display: none;">
	    		<a class="am-btn am-btn-success am-btn-xs">不限</a> 
	    		<a class="am-btn am-btn-success am-btn-xs">专科</a>
	    		<a class="am-btn am-btn-success am-btn-xs">本科</a>
	    		<a class="am-btn am-btn-success am-btn-xs">研究生</a>
	        </div>
        </div>
        <div style="text-align: center;padding-top: 48px;padding-bottom: 40px;">工作性质:
	    	<div style="text-align: 8px;padding-top: 28px;">
	    		<input type="radio" name="workTime" value="2" id="RadioGroup1_1" style="display: none;">
	    		<a class="am-btn am-btn-success am-btn-xs">全职</a> 
	    		<a class="am-btn am-btn-success am-btn-xs">兼职</a>
	        </div>
        </div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('',this);" >下一步</a>
  	</div>
  	
  	<div id="page" class="default hidestyle ddgg"> 
		<div style="text-align: center;padding-top: 18px;padding-bottom: 20px;background-color: #E2E2E2;">请为职位选择标签:
	    	<div style="text-align: 8px;padding-top: 18px;">
	    		<input type="text" placeholder="贴上自定义的标签（不超过6个字）" style="height: 48px;width: 72%;" class="login_input kt_input_w">
	    		<a class="am-btn am-btn-success am-btn-xs">贴上</a>
	        </div>
        </div>
        <div style="padding-top: 18px;padding-bottom: 20px;">
        	<a class="am-btn am-btn-xs">沟通能力强</a><a class="am-btn am-btn-xs">身高1米8</a>
        	<a class="am-btn am-btn-xs">2年工作经验</a><a class="am-btn am-btn-xs">只要男生</a>
        	<a class="am-btn am-btn-xs">熟悉办公软件</a><a class="am-btn am-btn-xs">表达能力良好</a>
        	<a class="am-btn am-btn-xs">性别不限</a><a class="am-btn am-btn-xs">只要女生</a>
        </div>
        <div style="padding-top: 6px;padding-bottom: 6px; background-color: #E2E2E2;">
        	<label><div class="am-icon-hand-o-right" style="padding-left: 8px;padding-right: 10px;"></div>小提示:摇一摇可以随机贴标签哟&nbsp;&nbsp;<a class="am-btn am-btn-success am-btn-xs">已贴</a></label>
        </div>
        <div style="height: 12px;"></div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('',this);" >下一步</a>
  	</div>
  	
  	<div id="page" class="default hidestyle ddgg"> 
    		<div class="am-form-group" style="padding-left: 4px;padding-right: 4px;">
		      <label for="doc-ta-1">工作内容(内容尽量精简,可分条填写):</label>
		      <textarea name="jobDesc" id="jobDesc" placeholder="请输入该职位的描述"  cols="10" rows="5"  style="width: 98%;"></textarea>
   			</div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="" >再增加一条</a>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('',this);" >下一步</a>
  	</div>
  	
  	<div id="page" class="default hidestyle ddgg"> 
    		<div class="am-icon-meh-o am-icon-lg" style="text-align: center;padding-top: 16px;padding-bottom: 36px;"><br><br>
    		恭喜!你的职位已经创建成功,你可以
   			</div>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="" >预览</a>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="" >分享</a>
   		<a class="a-next am-btn am-btn-success am-btn-block am-btn-lg" onclick="pageNet('',this);" >再发布一个职位</a>
  	</div>
  </fieldset>	
</form>
</div>  
</body>
</html>