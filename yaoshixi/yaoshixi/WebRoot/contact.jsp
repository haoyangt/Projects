<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>联系我们-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>
</head>

<body  class="body_cs">
		
		<!-- 顶部 LOGO、登录部分  -->
		<%@include file="/header.jsp" %>
 <div id="main">
	   
	   	<!-- 左边导航 -->
		<%@include file="/banner.jsp" %>
	   
	    <div class="container">
        <div class="contact_s">
        	<h1>联系我们</h1>
        	<br/>
        	
        	<div class="intro">
	        	<div class="intro_title">关于我们</div>
				<p>要实习招聘网站由深圳市远界管理咨询有限公司创立，旨在为广深两地在校大学生搭建一个寻找实习的平台。要实习不仅提供全方位的实习招聘信息，还为应聘大学生提供客观的行业信息，包括行业薪酬、企业评价等。要实习从学生出发，为他们提供个性化，人性化以及专业化的实习信息服务。要实习更会为在网站上应聘成功的学生提供法律保障以及实习证明，记录他们整个大学生涯的实习历程。要实习不仅是大学生的一个求职平台，更是学生培养经济独立、就业意识的一个良好渠道。</p>
   				<p>我们是一个专为大学生服务的年轻团队，我们用责任来做这件事，致力于为大学生打造最优秀的互联网招聘平台。</p>
        	</div>
        	<div class="intro">
        		<div class="intro_title">合作方式</div>
	        	<div class="qt_ss">
	        	<p>客服邮箱：<a href="mailto:cs@yaoshixi.com">cs@yaoshixi.com</a></p> 
	            <p>商务合作：<a href="mailto:bc@yaoshixi.com">bc@yaoshixi.com</a></p>  
			    <p>HR邮箱：<a href="mailto:hr@yaoshixi.com">hr@yaoshixi.com</a></p>
	        	</div>
        	</div>
        	<div class="intro">
        		<div class="intro_title">联系方式</div>
	        	<div class="qt_ss">
	        	<p>地址：深圳市福田区深南路与彩田路交汇处东方新天地广场第一栋C座6层605B</p> 
	        	</div>
        	</div>
        </div>
        
    
    </div>
	    
	  <%--   <!-- 二维码扫一扫 -->
	    <%@include file="/scanner.jsp" %> --%>
	    
	  <%@include file="/footer.jsp" %>
 	<div style="clear:both"></div>
	 </div>
</body>
<script src="res/js/require.js"></script>
</html>