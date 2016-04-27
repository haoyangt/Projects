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
<title>要请实习生-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:'POST',
		url: "company/job/invitation",
		data: {},
		dataType:'html',
	    success:function(html) {
	    	$("#invitationSubpage").html(html);
	    }
	});
});	
</script>
</head>

<body  class="body_cs">
<div id="body" >
	
	<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
	
   <div id="main">
	<!-- 左边导航 -->
	<%@include file="/banner_zw.jsp" %>
    
    <div class="container">
        <div class="kt_zw">
            <div class="wfb_zw">
            	<div class="tt_bg">邀请面试</div>
            	<div class="s_l" id="invitationSubpage">
            		
             	</div>
           <div style="clear:both"></div>
        </div>
    
    </div>
   
    
 </div>
  <%@include file="/footer.jsp" %>
    <%-- <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %> --%>
 <div style="clear:both"></div>
</div></div>
</body>
</html>
