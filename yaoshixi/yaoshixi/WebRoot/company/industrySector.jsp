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
   		<li><a href='javascript:void(0);' name="it">IT行业</a></li>
   		<li><a href='javascript:void(0);' name="finance">金融行业</a></li>
		<li><a href='javascript:void(0);' name="professional">专业服务</a></li>
		<li><a href='javascript:void(0);' name="education">教育培训行业</a></li>
		<li><a href='javascript:void(0);' name="consumable">消费品行业</a></li>
		<li><a href='javascript:void(0);' name="culture">文化传媒行业</a></li>
   		<li><a href='javascript:void(0);' name="building">建筑/房地产</a></li>
		<li><a href='javascript:void(0);' name="trade">贸易物流行业</a></li>
		<li><a href='javascript:void(0);' name="manufacturing">制造工业</a></li>
		<li><a href='javascript:void(0);' name="medical">医疗/卫生</a></li>
   		<li><a href='javascript:void(0);' name="service">服务业</a></li>
		<li><a href='javascript:void(0);' name="other">其他</a></li>
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
    	    	dialog.get("artBoxForIndustrySector").data.industrySector = $(this).html();
    	    	dialog.get("artBoxForIndustrySector").data.industrySectorId = $(this).attr('name');
    	    	dialog.get("artBoxForIndustrySector").close();
    	    });  
    	}); 
	});
	
	
</script>
</html>