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
   		<li><a href='javascript:void(0);' name="gz">广州</a></li>
		<li><a href='javascript:void(0);' name="sz">深圳</a></li>
		<!-- <li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li>
		<li><a href='javascript:void(0);'>杭州</a></li> -->
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
		$('a').each(function () { 
    	    $(this).click(function(){  
    	    	var dialog = top.dialog;
    	    	dialog.get("artBoxForjobCity").data.jobCity = $(this).html();
    	    	dialog.get("artBoxForjobCity").data.jobCityId = $(this).attr('name');
    	    	dialog.get("artBoxForjobCity").close();
    	    });  
    	}); 
	});
	
	
</script>
</html>