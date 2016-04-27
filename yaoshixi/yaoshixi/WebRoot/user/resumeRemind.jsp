<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%= basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function closeWindow() {
		var dialog = top.dialog;
		dialog.get("artBoxForResume").close();
	}
</script>
</head>
<body>
<div style="overflow: hidden;padding-bottom: 45px;background: none repeat scroll 0% 0% #F4F4F4;position: relative;">
 	<p>您好!您共有未处理简历${sessionScope.num}份哦！点击此处链接查看应聘者简历直接进行挑选吧！</p><br>
 	<div align="center"><a target="_blank" href="company/job/index" ><span style="color: #007DD1">查看</span></a></div>
 	<div style="float: right;"><input class="btn_style1" type="button" onclick="closeWindow();"  value="确定"/></div>
</div>	
</body>
</html>