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
   		<li><a href='javascript:void(0);'>职业大视野</a></li>
		<li><a href='javascript:void(0);'>智慧职场</a></li>
		<li><a href='javascript:void(0);'>职场精英路</a></li>
		<li><a href='javascript:void(0);'>大学生资讯</a></li>
		<li><a href='javascript:void(0);'>创业新世界</a></li>
		<li><a href='javascript:void(0);'>闲谈职场</a></li>
		<li><a href='javascript:void(0);'>名企大揭密</a></li>
		<li><a href='javascript:void(0);'>广深大吃喝</a></li>
		<li><a href='javascript:void(0);'>你问我答</a></li>
		<li><a href='javascript:void(0);'>租房攻略</a></li>
		<li><a href='javascript:void(0);'>实习大闯关</a></li>
		<li><a href='javascript:void(0);'>备战校招</a></li>
   		<!-- <li><a href='javascript:void(0);'>实习心得分享</a></li>
		<li><a href='javascript:void(0);'>找实习机会</a></li> -->
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
    	    	dialog.get("artBoxForCategory").data.category = $(this).html();
    	    	dialog.get("artBoxForCategory").close();
    	    });  
    	}); 
	});
	
	
</script>
</html>