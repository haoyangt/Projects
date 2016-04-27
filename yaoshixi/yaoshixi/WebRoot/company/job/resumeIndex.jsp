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
<title>我发布的职位-要实习-专注于实习生招聘的互联网平台</title>
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
        
        <div class="kt_zw">
       		<div class="login_top fl">
            	<div class="kt_title fb_float_f">我收到的简历</div><div class="fb_xinzw"><a href="company/job/addEdit.jsp" class="fb_zw_a">发布新职位</a></div>
            </div>
            <div class="wfb_zw">
            	<div class="bann">
            		<div class="qieh st">
            			<a href="company/job/list/1" onclick="return clickToLoadJobList(this);">在线职位简历</a>
            		</div>
            		<div class="qieh">
            			<a href="company/job/list/2" onclick="return clickToLoadJobList(this);">下线职位简历</a>
            		</div>
            	</div>
            
            	<div class="wfb_zwlist" id="companyJobListDiv" >
            		<!-- 职位列表 -->
            		<script type="text/javascript">
            			$(document).ready(function(){
            				var status = '${empty status ? 1 : status}';
            				var url = 'company/job/resume/' + status;
            				ajaxLoadHtml(url, {}, "#companyJobListDiv");
            			});
            		</script>
                </div>
            </div>
            
           <div style="clear:both"></div>
        </div>
    
    </div>
    
    <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %>
    
 </div>
 <div style="clear:both"></div>
</div>
<script type="text/javascript">
	//分页js
	function page(pageNum,ps) {
		var offset =  ((pageNum-1)*(ps));
		var status = '${empty status ? 1 : status}';
		var url = 'company/job/resume/' + status;
		var data = {'pageNum':pageNum,'pager.offset':offset};
		ajaxLoadHtml(url, data, "#companyJobListDiv");
	}
	
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
</body>
</html>
