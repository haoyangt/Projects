<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>公司列表-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script> 
<script type="text/javascript">
var keywordds = "<%=request.getParameter("keyword") %>";
$(document).ready(function(){
		$("#bangzhu").removeClass("licurrent");
		$("#indexSy").removeClass("licurrent");
		$("#forum").removeClass("licurrent");
		$("#Resume").removeClass("licurrent");
		$("#release").removeClass("licurrent");
		$("#manage").removeClass("licurrent");
		$("#companys").addClass("licurrent");
		$.ajax({
			type:'POST',
			url:'c/model',
			data:{"companyName":keywordds},
			dataType:'html',
			success:function(html) {
				$("#cPanel").html(html);
			}
		});
	});
	
	function page(pageNum,ps) {
		var offset =  ((pageNum-1)*(ps));
	 	$.ajax({
			type:'POST',
			url:'c/model',
			data:{'pageNum':pageNum,'pager.offset':offset},
			cache:false,
			dataType:'html',
		    success:function(html) {
		    	$("#cPanel").html(html);
		    }
		}); 
	}
	
</script>
</head>
<body >
<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
<!-- 顶部 LOGO、登录部分  -->
   <div id="main"> 
   
   	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>	
	<div class="container">
    	<%@ include file="/c/companyCondition.jsp" %>   
	      <div class="gs_zw" id="cPanel">
	      </div>
    </div>
    <%@include file="/footer.jsp" %>
     <%-- <!-- 二维码扫一扫 -->
	    <%@include file="/scanner.jsp" %> --%>
</div>
</body>
</html> 