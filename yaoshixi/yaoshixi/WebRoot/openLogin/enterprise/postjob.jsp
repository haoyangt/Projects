<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发布新职位-要实习-专注于实习生招聘的互联网平台</title>
<base href="<%= basePath%>">
<link href="res/css/weixin.css" rel="stylesheet" type="text/css" />
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

<style type="text/css">

.wfb_zwx{
float:left;
/* background-color: #f5f5f5; */
border-top:1px solid #CCC;
position:relative;
padding:20px 0;
margin-top:20px; 
width:100%;}

.tt_bgx
{
	background-image: url(../res/images/ttt_bg.png);
	background-repeat: no-repeat;
	background-position: left top;
	color: #FFFFFF;
    font-size: 16px;
    font-weight: bold;
    height: 39px;
   /* left: 10px;   */
    line-height: 35px;
    padding-left:8px;
    position: absolute;
    top: -19px;
    width: 146px;
    margin-left: 10px;
	} 
	.tt_bgx2
{
	background-image: url(../res/images/ttt_bg.png);
	background-repeat: no-repeat;
	background-position: left top;
	color: #FFFFFF;
    font-size: 16px;
    font-weight: bold;
    height: 39px;
   /* left: 10px;   */
    line-height: 35px;
    padding-left: 8px;
    position: absolute;
    top: -19px;left: 148px;
    width: 146px;
    margin-left: 10px;
	} 
#mainx {
	min-height:700px;
   /*  left: 42.4%;
    margin: 0 0 0 -519px;
    position: absolute; */
   /*  margin:0 auto; */
    width: 1024px;
}
</style>
</head>

<body>
<div class="weixin_body">
	<div class="main_j">
        
        <div class="kt_zwx">
           <div class="wfb_zwx" >
           <div>
          <span class="tt_bgx" id="postjob">发布新职位</span>
           <span class="tt_bgx2" id="postjobwith">带问题发布</span>
           </div>
            <div class="kt_bo">
           
	          <form action="company/job/addOnWx" method="post" >
	           	
	           	<div class="ktname_b">职位名称</div>
	            <p class="login_top"><input name="jobName" type="text" placeholder="请输入职位名称，如：行政实习生" validate="required::请输入职位名称" class="login_input kt_input_w register_input_w"></p>
	           	<div class="ktname_b">招聘人数</div>
	            <p class="login_top"><input name="employ" type="text" placeholder="请输入要招聘的人数，如：2，若干请填写：0" validate="required::请输入招聘的人数" class="login_input kt_input_w"></p>
	            
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
	            <div class="ktname_b">薪资范围<!-- <span class="kt_font_x">（最高薪资不能大于最低薪资的2倍）</span> --></div>
	            	<p class="login_top" style="height:50px"><input name="payment" id="payment" type="text" readonly="readonly"  placeholder="请选择薪资范围" validate="required::请选择薪资范围" class="login_input kt_input_w login_input_bg" value="${payment}"></p>
	            <div class="ktname_b">最低学历</div>
	            	<p class="login_top">
	            <label style="margin-right:10px;">
	                <input type="radio" name="educationalReq" checked="checked" value="1" id="RadioGroup3_0">不限
	            </label>
	            <label style="margin-right:10px;">
	                <input type="radio" name="educationalReq" value="2" id="RadioGroup3_1">高中
	            </label>
	            <label style="margin-right:10px;">
	                <input type="radio" name="educationalReq" value="3" id="RadioGroup3_2">大专
	            </label><br/>
	            <label style="margin-right:10px;">
	                <input type="radio" name="educationalReq" value="4" id="RadioGroup3_3">本科
	            </label>
	            <label style="margin-right:10px;">
	                <input type="radio" name="educationalReq" value="5" id="RadioGroup3_4">硕士
	            </label>
	            <label style="margin-right:10px;">
	                <input type="radio" name="educationalReq" value="6" id="RadioGroup3_5">博士
	            </label>
	            </p>
				
	            <div class="ktname_b">职位诱惑<!-- <span class="kt_font_x">(双击输入框可以选择)</span> --></div>
	            <p class="login_top"><input name="temptation" id="temptation" type="text" class="login_input kt_input_w" placeholder="请描述该职位对实习生的诱惑" ></p>
	             
	            <div class="ktname_b">职位描述<span class="kt_font_x">(分条描述该职位的工作职责，任务要求等。)<br>注：请勿输入公司邮箱，联系电话及其他外链，否则将自动删除</span></div>
	            <p class="login_top"><textarea name="jobDesc" id="jobDesc" placeholder="请输入该职位的描述"  cols="10" rows="5" style="width:100%"></textarea>
	            </p>
	            
	            <div class="ktname_b">任职要求<!-- <span class="kt_font_x">（双击输入框可以选择选项，点击输入框可输入内容）</span> --></div>
	            <p class="login_top"><textarea name="jobRequest" id="jobRequest" placeholder="请输入该职位的能力要求" cols="10" rows="5" style="width:100%"></textarea>
	            
	            <div class="ktname_b">其他要求<span class="kt_font_x"></span></div>
	            <p class="login_top"><textarea name="otherReq" id="otherReq" placeholder="请输入该职位的其他要求" cols="10" rows="5" style="width:100%"></textarea>
	            
	            <div class="login_top" style="margin-top:10px;" align="center">
	            <input name="" type="submit" value="发布" class="btn_style1" onclick="return confirm('确定要发布该职位吗？')">
	           
	            </div>
	            
	           </form>
    
   			 </div>
    	
           <div style="clear:both"></div></div>
        </div>

     
   
 <div style="clear:both"></div>
 </div>
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
			width: 380,
			height:80,
			onclose:function(){
				$("#payment").val(this.data.payment);
			}
		}).show(document.getElementById('payment'));
	});
	
	$("#temptation").click(function(){
		art({
			id: 'artBoxForTemptation',
			title: "选择职位诱惑",
			data: {temptation:""},
			url: 'company/job/temptation.jsp',
			quickClose: true,
			cancel: false,
			width: 380,
			height:268,
			onclose:function(){
				var ss=$("#temptation").val();
				if(ss=='' || ss==null){
					ss=this.data.temptation;
				}else{
					ss=ss+"  "+this.data.temptation;
				}
				$("#temptation").val(ss);
			}
		}).show(document.getElementById('temptation'));
	});
	
	$("#jobRequest").click(function(){
		art({
			id: 'artBoxForJobRequest',
			title: "选择任职要求",
			data: {jobRequest:""},
			url: 'company/job/jobRequest.jsp',
			quickClose: true,
			cancel: false,
			width: 380,
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
			width: 380,
			height:360,
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
			width: 380,
			height:80,
			onclose:function(){
				$("#currentCity").val(this.data.currentCity);
				$("#currentCityId").val(this.data.currentCityId);
				openCompanyMajorWindow();
			}
		}).show(document.getElementById('currentCity'));
	});
	
	$("#postjob").click(function(){
		window.location.href="wx/showpostjob";
	});
	
	$("#postjobwith").click(function(){
		window.location.href="wx/showpostjobwith";
	});
	$("#currentArea").click(function(){
		openCompanyMajorWindow();
	});
	function openCompanyMajorWindow() {
		console.log($("#currentCityId").val());
		if($("#currentCityId").val() != "") {
			art({
				id: 'artBoxForCityRegion',
				title: "选择区域",
				data: {currentCityId: $("#currentCityId").val(), currentArea:""},
				url: 'company/cityRegion.jsp',
				quickClose: true,
				cancel: false,
				width: 380,
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



</script>

</html>
