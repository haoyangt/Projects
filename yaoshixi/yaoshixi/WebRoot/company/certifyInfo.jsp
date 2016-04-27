<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>开通招聘-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>

</head>

<body  class="body_cs">
<div id="body">
	
	<!-- 顶部 LOGO、登录部分  -->
  	<%@include file="/header.jsp" %>
	
	<div id="main">
		<!-- 左边导航 -->
		<%@include file="/banner.jsp" %>	

	    <div class="container">
	    	<div  class="adver"></div>
	        
	        <div class="kt_zw">
	       		<div class="login_top">
	            	<div class="kt_title">开通招聘服务</div>
	            </div>
	            <p class="login_top" style="font-size:18px;">您提交的公司信息正在审核中，请耐心等待。</p>
		          	
	           <div style="clear:both"></div>
	        </div>
	    
	    </div>
    <%@include file="/scanner.jsp" %>
 </div>
 <div style="clear:both"></div>
</div>
</body>
</html>
