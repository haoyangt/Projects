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
<script charset="utf-8" src="res/KindEditor/kindeditor-min.js"></script>
<script charset="utf-8" src="res/KindEditor/lang/zh_CN.js"></script>
<!-- <style type="text/css">
	form {
		margin: 0;
	}
	textarea {
		display: block;
	}
</style> -->
<script type="text/javascript">
    var topicId = '${id}';
    
	 $(function(){
		 
		/*  var userId = '${sessionScope.userId}';
		 if(userId == "" || userId == null) {
			 $("#content").attr("readonly", "readonly");
		 }
		  */
		$.ajax({
			type:'POST',
			url:'forum/replyList',
			dataType:'html',
			data:{'topicId':topicId},
			success:function(html) {
				$("#list").html(html);
			}
		});
	}); 
	 var pageNum,ps;
	 function page(pageNum,ps) {
		 this.pageNum = pageNum;
		 this.ps = ps;
		var offset =  ((pageNum-1)*(ps));
		$.ajax({
			type:'POST',
			url:'forum/replyList',
			data:{'pageNum':pageNum,'pager.offset':offset,'topicId':topicId},
			dataType:'html',
		    success:function(html) {
		    	$("#list").html(html);
		    }
		});
	}
	 
    var pid = 0;
    var name;
    function reply() {
    	var replyContent = $("#content").val();
    	if(replyContent.substring(replyContent.indexOf("：")+1) == "") {
    		alert("请输入回复信息");
    		return;
    	}
    	/* var replyContent="";
    	if(pid != 0) {
    		replyContent = "回复@"+name+":";
    	} */
    	$.ajax({
    		type:'POST',
    		url:'user/addReply',
    		data:{'topicId':topicId,'pid':pid,'replyContent':replyContent},
    	    dataType:'json',
    	    success:function(json) {
    	    	alert(json.msg);
    	    	if(json.msg=='登录后，才能发布回复'){
    	    		window.location.href="login.jsp";	
    	    	}else if(json.msg=="请先完善您的个人信息，才能发布回复"){
    	    		window.location.href="user/resume";
    	    	}else{
	    	    	$("#content").val("");
	    	    	page(pageNum,ps); 
    	    	}
    	    }
    	});
    }
    
    function replySb(pid,name) {
    	this.pid = pid;
    	this.name = name;
    	$("#content").focus();
    	$("#content").val("回复@"+name+"：");
    }
    
    var editor;
    KindEditor.ready(function(K) {
		K.create('textarea[name="content"]', {
			afterChange : function() {
				K('.word_count1').html(this.count());
				K('.word_count2').html(this.count('text'));
			}
		});
	});

  
</script>
	
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
            	<div class="fl f16" >
            		<a href="forum/index.jsp">论坛首页</a><code> > </code><a href="forum/index.jsp">话题</a>  ${title }
            	</div><div class="fr" style="width:200px;"><a href="user/addTopicInput" class="ltx_a">发布新话题</a></div>
            </div>
            <div class="lt_con">
                <h2>${title }</h2>
                <div><span class="c7">${userNames }</span> · <span class="c9">${myfn:friendlyTime(publishTime)}</span><a onClick="replySb(${id},'${userNames }');" class="fr h_y" >回复</a></div>
                <div class="ht_nei">${content }</div>
                <div class="tzhf">帖子回复</div>
                <div class="huif" id="list">
                	
                </div>
                <div class="wfb_zw" >
	                <form id="form">
	                	<p class="login_top">
	                	<textarea id="content" style="width:786px;height:280px;"></textarea> 
	                	</p>
	                	<!-- <p style="color: red;float: right;margin-bottom:10px;">您当前输入了 <span class="word_count2">0</span> 个字符。<p><br> -->
	                	<p style="text-align:right;margin-bottom:10px;">
	                	<input type="button" onclick="reply();" value="发表回复" class="btn_style1"></p>
	                </form>
            	</div>
            </div>
           <div style="clear:both"></div>
        </div>
    </div>
    
   <%--  <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %> --%>
    
 </div>
 <div style="clear:both"></div>
</div>
</body>
</html>
