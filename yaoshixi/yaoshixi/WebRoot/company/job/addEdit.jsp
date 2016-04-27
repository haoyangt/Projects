<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>发布新职位-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<link href="res/jqslider/jqslider.css" rel="stylesheet" type="text/css" />
<link href="res/ueditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">

<script src="res/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" charset="utf-8" src="res/ueditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="res/ueditor/editor_api.js"></script>
<script type="text/javascript" src="res/ueditor/lang/zh-cn/zh-cn.js"></script>


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
           <div class="tt_bg">发布新职位</div>
            <div class="kt_bo">
           
	          <form action="company/job/addJob" method="post" style="padding-left:20px;">
	           	
	           	<div class="ktname_b">职位名称</div>
	            <p class="login_top"><input name="jobName" id="jobName" type="text" placeholder="请输入职位名称，如：行政实习生" validate="required::请输入职位名称" class="login_input kt_input_w register_input_w"></p>
	           	<div class="ktname_b">招聘人数</div>
	            <p class="login_top"><input name="employ" id="employ" type="text" placeholder="请输入要招聘的人数，如：2，若干请填写：0" validate="required::请输入招聘的人数" class="login_input kt_input_w"></p>
	            
	            <div class="ktname_b">工作性质</div>
	            <p class="login_top">
	              <label>
	                <input type="radio" name="workTime" checked="checked" value="1" id="RadioGroup1_0">全职
		          </label>
		          <label>
		            <input type="radio" name="workTime" value="2" id="RadioGroup1_1">按天
		          </label>
		          <label>
		             <input type="radio" name="workTime" value="3" id="RadioGroup1_2">按小时
		          </label>
	            </p>
	            
	            <div class="ktname_b">工作城市</div>
	            <p class="login_top">
	            <input name="city" id="currentCity" type="text" readonly="readonly"  placeholder="请选择城市" validate="required::请选择城市" class="login_input kt_input_w login_input_bg" value="${currentCity}">
	            <input id="currentCityId" type="hidden" >
	            </p>
	            <div class="ktname_b">区域</div>
	            	<p class="login_top"><input name="area" id="currentArea" type="text" readonly="readonly"  placeholder="请选择区域" validate="required::请选择区域" class="login_input kt_input_w" value="${currentArea}"></p>
	            <div class="ktname_b">职位类别</div>
		            <p class="login_top"><input name="category" id="jobAttr" type="text" readonly="readonly"  placeholder="请选择职位类别" validate="required::请选择职位类别" class="login_input kt_input_w login_input_bg" value="${currentArea}"></p>
	            <div class="ktname_b">薪资范围</div>
	            	<p class="login_top" style="height:50px"><input name="payment" id="payment" type="text" readonly="readonly"  placeholder="请选择薪资范围" validate="required::请选择薪资范围" class="login_input kt_input_w login_input_bg" value="${payment}"></p>
	            <div class="ktname_b">最低学历</div>
	            	<p class="login_top">
	            <label>
	                <input type="radio" name="educationalReq" checked="checked" value="1" id="RadioGroup3_0">不限
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="2" id="RadioGroup3_1">高中
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="3" id="RadioGroup3_2">大专
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="4" id="RadioGroup3_3">本科
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="5" id="RadioGroup3_4">硕士
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="6" id="RadioGroup3_5">博士
	            </label>
	            </p>
				
	            <div class="ktname_b">职位诱惑<span class="kt_font_x">(双击输入框可以选择)</span></div>
	            <p class="login_top"><textarea name="temptation" id="temptation" type="text" style="height: 60px;" placeholder="请描述该职位对实习生的诱惑" ></textarea></p>
	             
	            <div class="ktname_b">职位描述<span class="kt_font_x">（分条描述该职位的工作职责，任务要求等）</span></div>
	            <p class="login_top"><textarea name="jobDesc" id="jobDesc" placeholder="请输入该职位的描述"  cols="10" rows="5"></textarea>
	            </p>
	            
	            <div class="ktname_b">任职要求<span class="kt_font_x">（双击输入框可以选择选项，单击输入框可输入内容）</span></div>
	            <p class="login_top"><textarea name="jobRequest" id="jobRequest" placeholder="请输入该职位的能力要求" cols="10" rows="5"></textarea></p>
	            
	            <div class="ktname_b">其他要求<span class="kt_font_x"></span></div>
	            <p class="login_top"><textarea name="otherReq" id="otherReq" placeholder="请输入该职位的其他要求" cols="10" rows="5"></textarea></p>
	            
	            <div class="ktname_b">提出问题<span class="kt_font_x"></span></div>
	            <p class="login_top">
	            <a class="a_add" onclick="showAdd();">&nbsp;&nbsp;</a>
	            	<input type="text" name="interQuestionsOne" id="interQuestionsOne" class="login_input kt_input_w" style="display: none;" value="1、">
	            	<input type="text" name="interQuestionsTwo" id="interQuestionsTwo" class="login_input kt_input_w" style="display: none;" value="2、">
	            	<input type="text" name="interQuestionsThree" id="interQuestionsThree" class="login_input kt_input_w" style="display: none;" value="3、">
	            	<input type="text" name="interQuestionsFour" id="interQuestionsFour" class="login_input kt_input_w" style="display: none;" value="4、">
	            	<input type="text" name="interQuestionsFive" id="interQuestionsFive" class="login_input kt_input_w" style="display: none;" value="5、">
	            </p>
	            
	            <span id="Span" style="color: red;"></span>
	            <div class="login_top" style="margin-top:10px;">
		           <input type="submit" id="issuei" value="发布" style="display: none;">
		            <input type="button" value="发布" onclick="release()" class="btn_style1">
		            <input type="button" onclick="backHome()" value="取消" class="btn_cancel">
	            </div>
	            
	           </form>
    
   			 </div>
    	
           <div style="clear:both"></div></div>
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
	 $(function() {  
		 	$("#bangzhu").removeClass("licurrent");
		 	$("#forum").removeClass("licurrent");
			$("#companys").removeClass("licurrent");
			$("#indexSy").removeClass("licurrent");
			$("#Resume").removeClass("licurrent");
			$("#manage").removeClass("licurrent");
			$("#release").addClass("licurrent");
			validateUtil.init($(document));
	        $("input").keypress(function (e) {  
	            var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;  
	            if (keyCode == 13) {  
	                for (var i = 0; i < this.form.elements.length; i++) {  
	                    if (this == this.form.elements[i]) break;  
	                }  
	                i = (i + 1) % this.form.elements.length;  
	                this.form.elements[i].focus();  
	                return false;  
	            } else {  
	                return true;  
	            }  
	    	}); 
	 });
	$("#payment").click(function(){
		art({
			id: 'artBoxForCompensation',
			title: "选择薪资范围",
			data: {payment:""},
			url: 'company/job/compensation.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:80,
			onclose:function(){
				$("#payment").val(this.data.payment);
			}
		}).show(document.getElementById('payment'));
	});
	
	$("#temptation").dblclick(function(){
		var _jobAttrValue ;
		if($('#temptation').val() !== "") {
			_jobAttrValue = $('#temptation').val().split(";");
		} else {
			_jobAttrValue = [];
		}
		art({
			id: 'artBoxForTemptation',
			title: "选择职位诱惑",
			data: {temptation:"",jobAttrValue:_jobAttrValue},
			url: 'company/job/temptation.jsp',
			quickClose: true,
			cancel: true,
			cancelValue: '确定',
			width: 460,
			height:268,
			onclose:function(){
				/* var ss=$("#temptation").val();
				if(ss=='' || ss==null){
					ss=this.data.temptation;
				}else{
					ss=ss+"  "+this.data.temptation;
				} */
				$("#temptation").val(this.data.jobAttrValue);
			}
		}).show(document.getElementById('temptation'));
	});
	
	$("#jobRequest").dblclick(function(){
		art({
			id: 'artBoxForJobRequest',
			title: "选择任职要求",
			data: {jobRequest:""},
			url: 'company/job/jobRequest.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:268,
			onclose:function(){
				var ss=$("#jobRequest").val();
				if(ss=='' || ss==null){
					ss=this.data.jobRequest;
				}else{
					ss=ss+"  "+this.data.jobRequest;
				}
				$("#jobRequest").val(ss);
			}
		}).show(document.getElementById('jobRequest'));
	});
	//职位类别
	$("#jobAttr").click(function(){
		art({
			id: 'artBoxForJobAttr',
			title: "选择职位类别（最多选择3项）",
			data: {jobAttr:""},
			url: 'job/category.jsp',
			quickClose: true,
			cancel: true,
			cancelValue: '确定',
			width: 550,
			height:260,
			onclose:function(){
				$("#jobAttr").val(this.data.jobAttr);
			}
		}).show(document.getElementById('jobAttr'));
	});
	
	$("#currentCity").click(function(){
		art({
			id: 'artBoxForCurrentCity',
			title: "选择所在城市",
			data: {currentCityId:"",currentCity:""},
			url: 'company/currentCity.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:80,
			onclose:function(){
				$("#currentCity").val(this.data.currentCity);
				$("#currentCityId").val(this.data.currentCityId);
				openCompanyMajorWindow();
			}
		}).show(document.getElementById('currentCity'));
	});
	$("#currentArea").click(function(){
		openCompanyMajorWindow();
	});
	function openCompanyMajorWindow() {
		//console.log($("#currentCityId").val());
		if($("#currentCityId").val() != "") {
			art({
				id: 'artBoxForCityRegion',
				title: "选择区域",
				data: {currentCityId: $("#currentCityId").val(), currentArea:""},
				url: 'company/cityRegion.jsp',
				quickClose: true,
				cancel: false,
				width: 460,
				height:80,
				onclose:function(){
					$("#currentArea").val(this.data.currentArea);
					
				}
			}).show(document.getElementById('currentArea'));
		} else {
			artLab.msg("请先选择城市");
		}
	}
});	

function release(){
	var jobName = $("#jobName").val();
	var employ = $("#employ").val();
	var currentCity = $("#currentCity").val();
	var currentArea = $("#currentArea").val();
	var jobAttr = $("#jobAttr").val();
	var payment = $("#payment").val();
	
	if(jobName!='' && employ!='' && currentCity!='' && currentArea!='' && jobAttr!='' && payment!='' && jobName!='请输入职位名称，如：行政实习生' && employ!='请输入要招聘的人数，如：2，若干请填写：0' && currentCity!='请选择城市' && currentArea!='请选择区域' && jobAttr!='请选择职位类别' && payment!='请选择薪资范围'){
		if(!isNaN(employ)){
			document.getElementById("issuei").click();
		}else{
			$("#Span").text("招聘人数只能为数字！");
		}
	}else{
		$("#Span").text("带*的信息没有填写完整！");
	}
}
function backHome(){
	window.location.href="index.jsp";
}

function showAdd(){
	var interQuestionsOne = $("#interQuestionsOne").val();
	var interQuestionsTwo = $("#interQuestionsTwo").val();
	var interQuestionsThree = $("#interQuestionsThree").val();
	var interQuestionsFour = $("#interQuestionsFour").val();
	var interQuestionsFive = $("#interQuestionsFive").val();
	document.getElementById('interQuestionsOne').style.display="block";
	if(interQuestionsOne!='' && interQuestionsOne!='1、'){
		document.getElementById('interQuestionsTwo').style.display="block";
	}
	if(interQuestionsTwo != '' && interQuestionsTwo != '2、'){
		document.getElementById('interQuestionsThree').style.display="block";
	}
	if(interQuestionsThree !='' && interQuestionsThree !='3、'){
		document.getElementById('interQuestionsFour').style.display="block";
	}
	if(interQuestionsFour!='' && interQuestionsFour!='4、'){
		document.getElementById('interQuestionsFive').style.display="block";
	}
	if(interQuestionsFive!='' && interQuestionsFive!='5、'){
		$("#Span").text("最多只能提五个问题！");
	}
}
</script>
</html>
