<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
	$.ajax({
		type:'POST',
		url:'friendLieb',
		dataType:'html',
		success:function(html) {
			$("#friendLie").html(html);
		}
	});
</script>
</head>
<body>
<div id="body">
	<div id="main">
		<div id="friendLie"></div>
	</div>	
</div>
</body>
</html>