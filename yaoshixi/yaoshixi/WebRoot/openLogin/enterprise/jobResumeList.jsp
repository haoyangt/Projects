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
<link href="res/css/weixin.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="weixin_body">
	<div class="main_j">
	
        <div id="companyJobListDiv">
       </div>
  
  </div>
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
	require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
		
		$.ajax({
			type:'POST',
			url:'company/resume/listOnWx/${jobId}/0',
			data: {},
			dataType:'html',
		    success:function(html) {
		    	$("#companyJobListDiv").html(html);
		    }
		});
	});
	
	function clickToLoadJobList(a)
	{
		var url = $(a).attr("href");
		$(".qieh").removeClass("st");
		$(a).parent(".qieh").addClass("st");
		ajaxLoadHtml(url, {}, "#companyJobListDiv");
		return false;
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
