<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>搜索职位-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/js/require.js"></script>
<style type="text/css">
	.current{background-color: #66B3E0;color:#FFF;}
	.current a{color:#FFF}
</style>
</head>
<body>
<!-- 顶部 LOGO、登录部分  -->
<%@include file="/header.jsp" %>
	
<div id="main">
  	<!-- 左边导航 -->
<%@include file="/banner.jsp" %>
	<div class="container">
	     <form action="" method="post" onsubmit="return search();">
	        <div id="search_box">
    	<div class="re-dropdown-layout">
                    <div class="re-dropdown" title="全职">
                        <span>职位</span>
                        <i class="caret"></i>
                    </div>
                </div>
		        <input id="search_input" name="keywords"  type="text" placeholder="请输入公司名称或职位名称"  value="" tabindex="1" name="kd" >
	    	    <input id="submit" type="button" class="search_button" onclick="genKeyordsy();" value="搜工作">
    	    </div>
	   	</form>
	   	<div class="com_fei">
	   	  <div style="padding-left:47px;float:left;margin-top:10px;">
	   		<div class="fl" style="width:100%;height: 40px;">
	   			<b style="float:left;">职位区域：</b>
				<input name="area" id="jobArea" type="text" readonly="readonly"  placeholder="职位所在区域" class="login_input kt_input_w login_input_bg" >
				<input type="hidden" id="jobAreaValue"> 
			</div>
			<div class="fl" style="width:100%;height: 40px;">
			  <b style="float:left;">职位类别：</b>
			  <input name="category" id="jobAttr" type="text" readonly="readonly"  placeholder="职位类别" class="login_input kt_input_w login_input_bg" >
			  <input type="hidden" id="jobAttrValue">
			</div>
			<div class="fl" style="width:100%">
				<b style="float:left;">月薪范围：</b>
				<ul id="pay">	
			   		<li><a id="unlimited2" onclick="pay('');">不限</a></li>
			   		<li><a id="unlimited2" onclick="pay('面议');">面议</a></li>
			   		<li><a id="2k" onclick="pay('0-1000元');">0-1000元</a></li>
			   		<li><a id="5k" onclick="pay('1001-3000元');">1001-3000元</a></li>	
			   		<li><a id="10k" onclick="pay('3001-5000元');">3001-5000元</a></li>
			   		<li><a id="15k" onclick="pay('5000以上');">5000以上</a></li>
		   	    </ul>
		   	 </div>
		   	 <div class="fl" style="width:100%">
				 <b style="float:left;">最低学历：</b>
				<ul id="education">	
		   			<li><a id="unlimited3" onclick="education('1');">不限</a></li>
		   			<li><a id="gz" onclick="education('2');">高中</a></li>
		   			<li><a id="zk" onclick="education('3');">专科</a></li>
		   			<li><a id="bk" onclick="education('4');">本科</a></li>
		   			<li><a id="ss" onclick="education('5');">硕士</a></li>
		   			<li><a id="bs" onclick="education('6');">博士</a></li>
		   	   </ul>
			</div>
			<div class="fl" style="width:100%">
				<b style="float:left;">工作性质：</b>
				<ul id="jobCategory">	
			   		<li><a id="unlimited4" onclick="jobCategorys('');">不限</a></li>
			   		<li><a id="qz" onclick="jobCategorys('1');">全职</a></li>
			   		<li><a id="jz" onclick="jobCategorys('2');">按天</a></li>
			   		<li><a id="sx" onclick="jobCategorys('3');">按小时</a></li>
		   	   </ul>
	   	   </div>
		  <div class="fl" style="width:100%">
			   <b style="float:left;">发布时间：</b>
			 	<ul id="releaseTime">	
			   		<li><a id="unlimited5" onclick="releaseTimes('');">不限</a></li>
			   		<li><a id="now" onclick="releaseTimes('0');">今天</a></li>
			   		<li><a id="3day" onclick="releaseTimes('2');">3天内</a></li>
			   		<li><a id="work" onclick="releaseTimes('6');">一周内</a></li>
		   	   </ul>
		 </div>
		 </div>
		</div>	
       	<div class="hot_zw">
           <div id="jobsContent"></div>
        </div>
 	
 	</div>
     <%@include file="/footer.jsp" %>
 	<div style="clear:both"></div>
</div>
</body>
<script type="text/javascript">
var keyword = '';//职位名称
var scope = ''; //薪资
var xueli = ''; //学历
var jobCategory='';//工作性质
var releaseTime = '';//发布时间
var jobAttrValue ="";//职位类别
var jobAreaValue ="";//职位区域
keyword = "<%=request.getParameter("keyword") %>";
jobAttrValue = "<%=request.getParameter("jobAttrValue") %>";

require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
	top.dialog = art;
	$("#unlimited1").addClass("current");
	$("#unlimited2").addClass("current");
	$("#unlimited3").addClass("current");
	$("#unlimited4").addClass("current");
	$("#unlimited5").addClass("current");
	$('#workplace li').click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$("#unlimited1").removeClass("current");
	});
	$('#pay li').click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$("#unlimited2").removeClass("current");
	});
	$('#education li').click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$("#unlimited3").removeClass("current");
	});
	$('#jobCategory li').click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$("#unlimited4").removeClass("current");
	});
	$('#releaseTime li').click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$("#unlimited5").removeClass("current");
	});
	if(keyword != 'null' && keyword != ''){
		$("#search_input").val(keyword);
	}
	if(jobAttrValue != 'null' && jobAttrValue != ''){
		$("#jobAttr").val(jobAttrValue);
	}
	$.ajax({
		type:'POST',
		url:'indexModelall',
		data:{"jobName":keyword,"jobAreaValue":jobAreaValue,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope,"jobAttrValue":jobAttrValue},
		dataType:'html',
		success:function(html) {
			$("#jobsContent").html(html);
		}
	});
	//职位类别
	$("#jobAttr").click(function(){
		var _jobAttrValue ;
		if($('#jobAttrValue').val() !== "") {
			_jobAttrValue = $('#jobAttrValue').val().split(",");
		} else {
			_jobAttrValue = [];
		}
		art({
			id: 'artBoxForJobAttr',
			title: "选择职位类别（最多选择3项）",
			data: {jobAttr:"", jobAttrValue:_jobAttrValue},
			url: 'job/jobAttr.jsp',
			quickClose: true,
			cancel: true,
			cancelValue: '搜索',
			width: 550,
			height:260,
			onclose:function(){
				$("#jobAttr").val(this.data.jobAttr);
				$("#jobAttrValue").val(this.data.jobAttrValue);
				
				jobAttrValue = this.data.jobAttrValue.toString();
				ajaxSearchJob();
			}
		}).show(document.getElementById('jobAttr'));
	});
	
	//职位区域
	$("#jobArea").click(function(){
		var _jobAreaValue ;
		if($('#jobAreaValue').val() !== "") {
			_jobAreaValue = $('#jobAreaValue').val().split(",");
		}else{
			_jobAreaValue = [];
		}
		art({
			id: 'artBoxForJobArea',
			title: "选择职位区域（最多选择3项）",
			data: {jobArea:"", jobAreaValue:_jobAreaValue},
			url: 'job/jobArea.jsp',
			quickClose: true,
			cancel: true,
			cancelValue: '搜索',
			width: 550,
			height:260,
			onclose:function(){
				$("#jobArea").val(this.data.jobArea);
				$("#jobAreaValue").val(this.data.jobAreaValue);
				
				jobAreaValue = this.data.jobAreaValue.toString();
				ajaxSearchJob();
			}
		}).show(document.getElementById('jobArea'));
	});
});	

function genKeyordsy(){
	ajaxSearchJob();
}
function workplace(city2){
	city = city2;
	ajaxSearchJob();
}
function pay(_scope){
	scope = _scope;
	ajaxSearchJob();
}
function education(xueli2){
	xueli = xueli2;
	ajaxSearchJob();
}
function jobCategorys(jobCategory2){
	jobCategory = jobCategory2;
	ajaxSearchJob();
}
function releaseTimes(releaseTime2){
	releaseTime = releaseTime2;
	ajaxSearchJob();
}

function ajaxSearchJob() {
	keyword = $("#search_input").val();
	$.ajax({
		type:'POST',
		url:'indexModelall',
		data:{"jobName":keyword,"jobAreaValue":jobAreaValue,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope,"jobAttrValue":jobAttrValue},
		dataType:'html',
		success:function(html) {
			$("#jobsContent").html(html);
		}
	});
}

function search(){
	genKeyordsy();
	return false;
}

function page(pageNum,ps) {
	var offset =  ((pageNum-1)*(ps));
	keyword = $("#search_input").val();
	$.ajax({
		type:'POST',
		url:'indexModelall',
		data:{"jobName":keyword,"jobAreaValue":jobAreaValue,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope,"jobAttrValue":jobAttrValue},
		dataType:'html',
	    success:function(html) {
	    	$("#jobsContent").html(html);
	    }
	});
}
</script>
</html>