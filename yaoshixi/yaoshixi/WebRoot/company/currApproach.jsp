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
   <div class="uni">
   	<ul>
   		<li><a href='javascript:void(0);' >微信</a></li>
   		<li><a href='javascript:void(0);' >微博</a></li>
		<li><a href='javascript:void(0);' >朋友推荐</a></li>
		<li><a href='javascript:void(0);' >校园论坛（公告）</a></li>
		<li><a href='javascript:void(0);' >其他</a></li>
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
		$("a").each(function () { 
    	    $(this).click(function(){  
    	    	top.dialog.get("artBoxForCurrApproach").data.currApproach = $(this).html();
    	    	top.dialog.get("artBoxForCurrApproach").close();
    	    }); 
		});    
	});
	
	
</script>
</html>