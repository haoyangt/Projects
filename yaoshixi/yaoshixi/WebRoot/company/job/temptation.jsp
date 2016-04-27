<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.conceal{display: none;}
	.current{background-color: #66B3E0;color:#FFF;}
	.current a{color:#FFF}
</style>
</head>

<body>
   <div class="uni">
   	<ul style="float:left;width:100%">
     	<li style="width:22%;"><input type="button" id="xcfl" value="薪酬福利" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="shfl" value="社会福利" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="gsgl" value="公司管理" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="gzyh" value="工作诱惑" class="gzsz"/></li>
   	</ul>
   	<ul style="float:left;width:100%">
		<li class="xcfl" style="width:47%;display: none;"><a href='javascript:void(0);'>年底分红</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a href='javascript:void(0);'>年底双薪</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>股票期权</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>绩效奖金</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>年度分红</a></li>	
   		<li class="xcfl" style="width:47%;display: none;"><a href='javascript:void(0);'>15-16薪</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a href='javascript:void(0);'>每年调薪</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>专项奖金</a></li>
   		<li class="xcfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>高薪</a></li>
   		
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>五险一金</a></li>	
   		<li class="shfl" style="width:47%;display: none;"><a href='javascript:void(0);'>六险两金</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a href='javascript:void(0);'>带薪年假</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a href='javascript:void(0);'>午餐补助</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>节日礼物</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>包车接送</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>通讯津贴</a></li>	
   		<li class="shfl" style="width:47%;display: none;"><a href='javascript:void(0);'>交通补贴</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>住房补贴</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>年度旅游</a></li>
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>定期体检</a></li>	
   		<li class="shfl" style="width:47%;display: none;"><a  href='javascript:void(0);'>电脑补助</a></li>	
   		
   		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>领导好</a></li>	
   		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>帅哥多</a></li>	
   		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>美女多</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>岗位晋升</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>扁平管理</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>管理规范</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>CBD</a></li>	
   		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>世界500强</a></li>	
   		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>注重实力</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>名企</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>公平晋升</a></li>
		<li class="gsgl" style="width:47%;display: none;"><a  href='javascript:void(0);'>中国企业500强</a></li>
		
		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>弹性工作</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>创意发挥</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>任意创新</a></li>
		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>一周三天</a></li>
		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>服装自由</a></li>
		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>网上办公</a></li>
		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>技能培训</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>资格培训</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>可转正</a></li>
		<li class="gzyh" style="width:47%;display: none;"><a  href='javascript:void(0);'>包食宿</a></li>
		
   	</ul>
   
   </div>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		var dialog = top.dialog;
		var jobAttrValue = dialog.get("artBoxForTemptation").data.jobAttrValue;
		var aArray = $("a");
		
		for ( var i = 0; i < jobAttrValue.length; i++) {
			for ( var j = 0; j < aArray.length; j++) {
				if(jobAttrValue[i] ===  aArray[j].innerHTML) {
					$(aArray[j]).addClass('current');
				} 
			}
		}
		
		$('a').each(function () { 
			$(this).click(function(){
    	    	var del = false;
    	    	for ( var i = 0; i < jobAttrValue.length; i++) {
					if(jobAttrValue[i] ===  $(this).html()) {
						jobAttrValue.splice(i,1);
						del = true;
						$(this).removeClass("current");
					} 
				}
    	    	/* if(jobAttrValue.length < 3) { */
    	    		if(del !== true) {
    	    			jobAttrValue.push($(this).html());
    					$(this).addClass("current");
    	    		}
				/* }   */
    	    	//dialog.get("artBoxForTemptation").data.jobAttrValue = jobAttrValue;
    	    	/* for ( var k = 0; k < jobAttrValue.length; k++) {
    	    		dialog.get("artBoxForTemptation").data.temptation += ((k == jobAttrValue.length - 1)?" ":";");
				} */
    	    });  
			dialog.get("artBoxForTemptation").data.jobAttrValue = jobAttrValue;
	    	//dialog.get("artBoxForTemptation").data.temptation = jobAttrValue.toString();
    	}); 
		$("#xcfl").click(function(){
			condition("xcfl");
		});
		$("#shfl").click(function(){
			condition("shfl");
		});
		$("#gsgl").click(function(){
			condition("gsgl");
		});
		$("#gzyh").click(function(){
			condition("gzyh");
		});
		function condition(dd){
			$(".xcfl").hide();
			$(".shfl").hide();
			$(".gsgl").hide();
			$(".gzyh").hide();
			
			$("."+dd+"").show();
		}
	});
</script>
</html>