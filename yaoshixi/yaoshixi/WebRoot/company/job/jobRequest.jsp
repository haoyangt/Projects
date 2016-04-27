<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.conceal{
		display: none;
	}
</style>
</head>

<body>
   <div class="uni">
   	<ul style="float:left;width:100%">
     	<li style="width:22%;"><input type="button" id="xlxz" value="学历性质" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="xls" value="学历" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="njyq" value="年级要求" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="jbjn" value="需具备的技能" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="zyqq" value="要求专业" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="gzyh" value="实习时间要求" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="xbyq" value="性别要求" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="qtyq" value="其他要求" class="gzsz"/></li>
	</ul>
	<ul style="float:left;width:100%">
		<li class="xlxz" style="width:47%;display: none;"><a href='javascript:void(0);'>学历性质:全日制</a></li>
   		<li class="xlxz" style="width:47%;display: none;"><a href='javascript:void(0);'>学历性质:非全日制</a></li>
   		<li class="xlxz" style="width:47%;display: none;"><a href='javascript:void(0);'>学历性质:不限</a></li>
   		
   		<li class="xls" style="width:47%;display: none;"><a href='javascript:void(0);'>学历要求:专科以上</a></li>
   		<li class="xls" style="width:47%;display: none;"><a href='javascript:void(0);'>学历要求:本科以上</a></li>	
   		<li class="xls" style="width:47%;display: none;"><a href='javascript:void(0);'>学历要求:不限</a></li>
   		
   		<li class="njyq" style="width:47%;display: none;"><a href='javascript:void(0);'>年级要求:大一</a></li>
   		<li class="njyq" style="width:47%;display: none;"><a href='javascript:void(0);'>年级要求:大二</a></li>
   		<li class="njyq" style="width:47%;display: none;"><a href='javascript:void(0);'>年级要求:研一</a></li>
   		<li class="njyq" style="width:47%;display: none;"><a href='javascript:void(0);'>年级要求:研二</a></li>	
   		<li class="njyq" style="width:47%;display: none;"><a href='javascript:void(0);'>年级要求:不限</a></li>
   		
   		<li class="jbjn" style="width:47%;display: none;"><a href='javascript:void(0);'>需具备的技能:IT</a></li>
   		<li class="jbjn" style="width:47%;display: none;"><a href='javascript:void(0);'>需具备的技能:语言</a></li>
   		
   		<li class="zyqq" style="width:47%;display: none;"><a href='javascript:void(0);'>要求专业:新闻</a></li>
   		<li class="zyqq" style="width:47%;display: none;"><a href='javascript:void(0);'>要求专业:中文</a></li>
   		<li class="zyqq" style="width:47%;display: none;"><a href='javascript:void(0);'>要求专业:市场营销</a></li>
   			
   		<li class="xbyq" style="width:47%;display: none;"><a href='javascript:void(0);'>性别:男</a></li>
   		<li class="xbyq" style="width:47%;display: none;"><a href='javascript:void(0);'>性别:女</a></li>
   		<li class="xbyq" style="width:47%;display: none;"><a href='javascript:void(0);'>性别:不限</a></li>
   		
   		<li class="qtyq" style="width:47%;display: none;"><a href='javascript:void(0);'>需要出差</a></li>	
   		<li class="qtyq" style="width:47%;display: none;"><a href='javascript:void(0);'>需要调配</a></li>	
		
		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：1周</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：2周</a></li>
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：3周</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：4周</a></li>
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：5周</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：6周</a></li>
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：7周</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：8周</a></li>
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：9周</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：10周</a></li>
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：11周</a></li>	
   		<li class="gzyh" style="width:47%;display: none;"><a href='javascript:void(0);'>实习时间：12周</a></li>
   		
   	</ul>
   
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
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		
		$('a').each(function () { 
    	    $(this).click(function(){  
    	    	var dialog = top.dialog;
    	    	dialog.get("artBoxForJobRequest").data.jobRequest = $(this).html();
    	    	dialog.get("artBoxForJobRequest").close();
    	    });  
    	}); 
		$("#xlxz").click(function(){
			condition("xlxz");
		});
		$("#xls").click(function(){
			condition("xls");
		});
		$("#njyq").click(function(){
			condition("njyq");
		});
		$("#jbjn").click(function(){
			condition("jbjn");
		});
		$("#zyqq").click(function(){
			condition("zyqq");
		});
		$("#gzyh").click(function(){
			condition("gzyh");
		});
		$("#xbyq").click(function(){
			condition("xbyq");
		});
		$("#qtyq").click(function(){
			condition("qtyq");
		});
		function condition(dd){
			$(".xlxz").hide();
			$(".xls").hide();
			$(".njyq").hide();
			$(".jbjn").hide();
			$(".zyqq").hide();
			$(".gzyh").hide();
			$(".xbyq").hide();
			$(".qtyq").hide();
			
			$("."+dd+"").show();
		}
	});
</script>
</html>