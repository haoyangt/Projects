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
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="res/KindEditor/themes/default/default.css" />
<link rel="stylesheet" href="res/KindEditor/plugins/code/prettify.css" />
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script charset="utf-8" src="res/KindEditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="res/KindEditor/kindeditor.js"></script>
<script charset="utf-8" src="res/KindEditor/plugins/code/prettify.js"></script>
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
            <div class="wfb_zw" >
            <div class="tt_bg">发表新话题</div>
            	<div class="tex" >
            		<form action="user/addTopic" name="example" method="post">
            			<h3 class="login_top">标题：</h3>
            			<p class="login_top"><input class="login_input login_input_w" type="text" id="title" name="title" validate="required::请输入标题"  placeholder="标题"></p>
            			<h3 class="login_top ">类别：</h3>
            			<div class="login_top"><input id="category" class="login_input kt_input_w login_input_bg" validate="required::请选择类别" style="width: 300px" name="type" placeholder="类别"></div>
            			<h3 class="login_top">内容：</h3>
            			<textarea name="content" id="content" style="width:735px;height:400px;visibility:hidden;"></textarea> 
            			<p style="color: red;float: right;">您当前输入了 <span class="word_count2">0</span> 个字符。<p>
            			<p><span id="pwdSpan" style="color: red;"></span></p>
            			<p style="text-align:right;width:450px;margin-top:20px">
	            			<input class="btn_style1" style="display: none;" type="submit" id="tijiao" value="提交">
	            			<input class="btn_style1" type="button" onclick="submits()" value="提交">
	            			<input class="btn_cancel" type="button" onclick="cancel()" value="取消">
            			</p>
            		</form>
            	</div>
            </div>
           <div style="clear:both"></div>
        </div>
    </div>
    <%@include file="/footer.jsp" %>
   <%--  <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %> --%>
    
</div>
 <div style="clear:both"></div>
</div>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab',
			placeholder: 'res/js/placeholder',
			ajaxfileupload: 'res/js/ajaxfileupload'
		},
		shim: {
			'ajaxfileupload': {
				deps: ['jquery'],
				exports: 'ajaxfileupload'
			}
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe", "placeholder", "ajaxfileupload"], function($, artLab, art, placeholder, ajaxfileupload){
		top.dialog = art;
		$(function(){
			validateUtil.init($(document));
		});
		$("#category").click(function(){
			art({
				id: 'artBoxForCategory',
				title: "选择话题类别",
				data: {category:""},
				url: 'forum/category.jsp',
				quickClose: true,
				cancel: false,
				width: 310,
				height:200,
				onclose:function(){
					$("#category").val(this.data.category);
				}
			}).show(document.getElementById('category'));
		});
		
	});
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			afterChange : function() {
				/* K('.word_count1').html(this.count()); */
				K('.word_count2').html(this.count('text'));
			},
			uploadJson:'forum/upload_json.jsp',
			urlType:'absolute',
			resizeType : 1,
			allowFlashUpload : true,
			allowImageUpload : true,
			allowMediaUpload : true,
			filterMode : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image','flash','insertVideo','insertfile','link','table']
		});
	});
	function cancel(){
		window.location.href="<%=request.getContextPath()%>/forum/index.jsp";
	}
	
	function submits(){
		var title = $("#title").val();
		var category = $("#category").val();
		if(title!='' && title!=null && category!=null && category!=''){
			if(!editor.isEmpty()){
				$("#tijiao").click();
			}else{
				$("#pwdSpan").text("发表内容不能为空");
			}
		}else{
			$("#pwdSpan").text("带*号内容不能为空");
		}
	}
</script>
</html>
