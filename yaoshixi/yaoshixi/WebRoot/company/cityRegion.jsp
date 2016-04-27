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
</head>

<body>
   <div class="uni" id="gz" style="display: none">
   	<ul>
   		<li><a href='javascript:void(0);' >荔湾</a></li>
   		<li><a href='javascript:void(0);' >越秀</a></li>
		<li><a href='javascript:void(0);' >海珠</a></li>
		<li><a href='javascript:void(0);' >天河</a></li>
   		<li><a href='javascript:void(0);' >白云</a></li>
		<li><a href='javascript:void(0);' >黄埔</a></li>
   		<li><a href='javascript:void(0);' >番禺</a></li>
		<li><a href='javascript:void(0);' >花都</a></li>
		<li><a href='javascript:void(0);' >南沙</a></li>
		<li><a href='javascript:void(0);' >萝岗</a></li>
		<li><a href='javascript:void(0);' >增城市</a></li>
		<li><a href='javascript:void(0);' >从化市</a></li>
		<li><a href='javascript:void(0);' >不限区域</a></li>
   	</ul>   
   </div>
   <div class="uni" id="sz" style="display: none">
   	<ul>
   		<li><a href='javascript:void(0);' >罗湖</a></li>
   		<li><a href='javascript:void(0);' >福田</a></li>
		<li><a href='javascript:void(0);' >南山</a></li>
		<li><a href='javascript:void(0);' >盐田</a></li>
		<li><a href='javascript:void(0);' >宝安</a></li>
		<li><a href='javascript:void(0);' >龙岗</a></li>
		<li><a href='javascript:void(0);' >光明</a></li>
		<li><a href='javascript:void(0);' >龙华</a></li>
		<li><a href='javascript:void(0);' >坪山</a></li>
		<li><a href='javascript:void(0);' >大鹏</a></li>
		<li><a href='javascript:void(0);' >不限区域</a></li>
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
		$("div#"+dialog.get("artBoxForCityRegion").data.currentCityId).css('display','block');
		$('a').each(function () { 
    	    $(this).click(function(){  
    	    	dialog.get("artBoxForCityRegion").data.currentArea = $(this).html();
    	    	dialog.get("artBoxForCityRegion").close();
    	    });  
    	}); 
	});
	
	
</script>
</html>