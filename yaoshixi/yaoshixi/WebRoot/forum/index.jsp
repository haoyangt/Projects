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
<title>论坛</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script> 

<script type="text/javascript">
var matter = "";
var type = "职业大视野";
$(document).ready(function(){
		$("#indexSy").removeClass("licurrent");
		$("#companys").removeClass("licurrent");
		$("#Resume").removeClass("licurrent");
		$("#release").removeClass("licurrent");
		$("#manage").removeClass("licurrent");
		$("#forum").addClass("licurrent");
		matter = $("#search_input").val();
		$.ajax({
			type:'POST',
			url:'forum/index',
			data:{'title':matter,'type':type},
			dataType:'html',
			success:function(html) {
				$("#forumList").html(html);
			}
		});
	});
	
	function page(pageNum,ps) {
		var offset =  ((pageNum-1)*(ps));
		$.ajax({
			type:'POST',
			url:'forum/index',
			data:{'pageNum':pageNum,'pager.offset':offset},
			dataType:'html',
		    success:function(html) {
		    	$("#forumList").html(html);
		    }
		});
	}
	function castAbout(){
		matter = $("#search_input").val();
		$.ajax({
			type:'POST',
			url:'forum/index',
			data:{'title':matter,'type':type},
			dataType:'html',
			success:function(html) {
				$("#forumList").html(html);
			}
		});
	}
	function clickToLoadJobList(a){
		//var url = $(a).attr("href");
		$(".qieh").removeClass("st");
		$(a).parent(".qieh").addClass("st");
		//ajaxLoadHtml(url, {}, "#companyJobListDiv");
		type = $(a).text();
		$.ajax({
			type:'POST',
			url:'forum/index',
			data:{'title':'','type':type},
			dataType:'html',
			success:function(html) {
				$("#forumList").html(html);
			}
		});
		return false;
	}
</script>
</head>

<body  class="body_cs"> 
<div id="body">
	
	<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
	
   <div id="main"> 
	<!-- 左边导航 -->
	<%@include file="/banner_zw.jsp" %>
    
    <div class="container">
    	
        
        <div class="kt_zw">
       		<!-- <div class="login_top fl">
            	<div class="lt_title fb_float_f">话题</div><div class="fb_xinzw"><a href="user/addTopicInput" class="ltx_a">发布新话题</a></div>
            </div> -->
            <div class="search_n">
            	<input id="search_input2"  type="text" placeholder="请输入话题关键字" value="" tabindex="1" name="kd" >
    			<input id="search_button" class="search_button" onclick="castAbout();"  type="button" value="搜索">
    		</div>
    		<div class="wfb_zw" style="margin-top:10px;">
            	 <div class="qieh st">
             		<a onclick="clickToLoadJobList(this);">职业大视野</a>
	             </div>
	             <div class="qieh">
	             	<a onclick="clickToLoadJobList(this);">智慧职场</a>
	             </div>
	             <div class="qieh">
	             	<a onclick="clickToLoadJobList(this);">职场精英路</a>
	             </div>
	             <div class="qieh">
            		<a onclick="clickToLoadJobList(this);">大学生资讯</a>
            	</div>
            	<div class="qieh">
            		<a onclick="clickToLoadJobList(this);">创业新世界</a>
            	</div>
            	<div class="qieh">	
            		<a onclick="clickToLoadJobList(this);">名企大揭密</a>
            	</div>
            	<div class="qieh">
		             <a onclick="clickToLoadJobList(this);">广深大吃喝</a>
		         </div>
		         <div class="qieh">
		            <a onclick="clickToLoadJobList(this);">你问我答</a>
		         </div>
		         <div class="qieh">
		           <a onclick="clickToLoadJobList(this);">租房攻略</a>
		         </div>
		         <div class="qieh">
		           <a onclick="clickToLoadJobList(this);">实习大闯关</a>
		         </div>
		         <div class="qieh">
		           <a onclick="clickToLoadJobList(this);">闲谈职场</a>
		         </div>
		         <div class="qieh">
		           <a onclick="clickToLoadJobList(this);">备战校招</a>
		         </div> 
		    </div>
            <div class="wfb_zw" style="margin-top:10px;">
            
            	<div class="tex" id="forumList">
            	
            	</div>
            
            </div>
            
           <div style="clear:both"></div>
        </div>
    
    </div>
    
    <%@include file="/footer.jsp" %>
    <%-- <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %> --%>
    
</div>
 <div style="clear:both"></div>
</div>
</body>
</html>
