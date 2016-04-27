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
	.current{background-color: #66B3E0;color:#FFF;}
	.current a{color:#FFF}
</style>
</head>

<body>
   <div class="uni" >
     <div id="shenzhen" style="float:left;border-bottom:1px solid #CCC;margin-bottom:10px;" >
      <b style="float:left;height:60px;">深圳：</b>
   	  <ul>
   		<li><a href="javascript:void(0);">宝安</a></li>
		<li><a href="javascript:void(0);">南山</a></li>
		<li><a href='javascript:void(0);'>福田</a></li>
		<li><a href='javascript:void(0);'>罗湖</a></li>
		<li><a href='javascript:void(0);'>龙岗</a></li>
		<li><a href='javascript:void(0);'>盐田</a></li>
		<li><a href='javascript:void(0);'>光明</a></li>
		<li><a href='javascript:void(0);'>龙华</a></li>
		<li><a href='javascript:void(0);'>坪山</a></li>
		<li><a href='javascript:void(0);'>大鹏</a></li>
		<li><a href='javascript:void(0);'>不限区域</a></li>
   	 </ul>
   </div>
   <div id="guangzhou" style="float:left;">
     <b style="float:left; height:60px;">广州：</b>
   	 <ul>
   		<li><a href='javascript:void(0);'>荔湾</a></li>
		<li><a href='javascript:void(0);'>越秀</a></li>
		<li><a href='javascript:void(0);'>海珠</a></li>
		<li><a href='javascript:void(0);'>天河</a></li>
		<li><a href='javascript:void(0);'>白云</a></li>
		<li><a href='javascript:void(0);'>黄埔</a></li>
		<li><a href='javascript:void(0);'>番禺</a></li>
		<li><a href='javascript:void(0);'>花都</a></li>
		<li><a href='javascript:void(0);'>南沙</a></li>
		<li><a href='javascript:void(0);'>萝岗</a></li>
		<li><a href='javascript:void(0);'>增城</a></li>
		<li><a href='javascript:void(0);'>从化</a></li>
		<li><a href='javascript:void(0);'>不限区域</a></li>
   	 </ul>
   </div>
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
		var jobAreaValue = dialog.get("artBoxForJobArea").data.jobAreaValue;
		var aArray = $("a");
		
		for ( var i = 0; i < jobAreaValue.length; i++) {
			for ( var j = 0; j < aArray.length; j++) {
				if(jobAreaValue[i] ===  aArray[j].innerHTML) {
					$(aArray[j]).addClass('current');
				} 
			}
		}
		
		$('a').each(function () {
    	    $(this).click(function(){
    	    	var _value = $(this).html();
    	    	var del = false;
    	    	
    	    	for ( var i = 0; i < jobAreaValue.length; i++) {
					if(jobAreaValue[i] ===  _value) {
						jobAreaValue.splice(i,1);
						del = true;
						$(this).removeClass("current");
					} 
				}
    	    	if(jobAreaValue.length < 3) {
    	    		if(del !== true) {
    	    			jobAreaValue.push(_value);
    					$(this).addClass("current");
    	    		}
				} else {
					dialog.get("artBoxForJobArea").title("选择职位类别（提示：所选类别不能超过3个）");
				}
    	    	
    	    	dialog.get("artBoxForJobArea").data.jobAreaValue = jobAreaValue;
    	    	dialog.get("artBoxForJobArea").data.jobArea = "";
    	    	for ( var k = 0; k < jobAreaValue.length; k++) {
    	    		dialog.get("artBoxForJobArea").data.jobArea += jobAreaValue[k] + ((k == jobAreaValue.length - 1)?"":"｜");
				}
    	    	
    	    });  
    	});
		dialog.get("artBoxForJobArea").data.jobAreaValue = jobAreaValue;
    	dialog.get("artBoxForJobArea").data.jobArea = jobAreaValue.toString();
	});
	
</script>
</html>