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
<title>收到的简历-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.available {
	color:#000000
}
.invailable {
	color:#cccccc
}
</style>

</head>

<body  class="body_cs">
<div id="body" >
	
	<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
	
   <div id="main">
	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>
    
    <div class="container">
        
        <div class="kt_zw">
            <div class="wfb_zw">
            <div class="tt_bg">我收到的简历</div>
                <!-- <div class="bann" id="headline" style="margin-top:20px;">
            		
            	</div> -->
           		<div id="companyJobListDiv">
           			                 
           		</div>
           <div style="clear:both"></div>
        </div>
    
    </div>
   
    
 </div>
  <%@include file="/footer.jsp" %>
   <%--  <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %> --%>
 <div style="clear:both"></div>
</div></div>
</body>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
		$.ajax({
			type:'POST',
			url: "company/resume/resumeStatus/${jobId}/0",
			data: {},
			dataType:'html',
		    success:function(html) {
		    	$("#companyJobListDiv").html(html);
		    }
		});
	});
	
	function clickToLoadJobList(a,num){
		/* $(this).addClass("current").siblings().removeClass("current");
		$("#unlimited2").removeClass("current");
		//var url = $(a).attr("href");
		$("#DclJl").removeClass("st");
		$("#TzMs").addClass("st");
		//ajaxLoadHtml(url, {}, "#companyJobListDiv");
		//return false; */
		$.ajax({
			type:'POST',
			url: "company/resume/resumeStatus/${jobId}/"+num,
			data: {},
			dataType:'html',
		    success:function(html) {
		    	$("#companyJobListDiv").html(html);
		    }
		});
	}
	
	function ajaxLoadHtml(url, data, target)
	{
		$.ajax({
			type:'POST',
			url: url,
			data: data,
			dataType:'html',
		    success:function(html) {
		    	$(target).html(html);
		    }
		});
	}
</script>
</html>
