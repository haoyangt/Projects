<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>更新职位-要实习-专注于实习生招聘的互联网平台</title>
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

<!-- <script type="text/javascript">

var startValue = 5;
var endValue = 10;

$(document).ready(function () {
	
	var payment = "${job.payment}";
	if(payment && payment!=""){
		var strArr = payment.split("-");
		if(strArr && strArr.length==2){
			startValue = parseInt(strArr[0]);
			endValue = parseInt(strArr[1]);
		}else if(strArr && strArr.length==1){
			startValue = parseInt(strArr[0]);
			endValue = 2*startValue > 20 ? 20 : 2*startValue;
		}
	}
	var sliderContainer = $('#paymentDiv');
	sliderContainer.jqslider({ rangeSelection: true, 
    			  theme: 'green', 
    			  selStart: startValue, 
    			  selEnd: endValue, 
    			  ticks: true, 
    			  labels:false,
    			  minValue: 1, 
    			  maxValue: 20, 
    			  dragTitle:'薪资',
    			  callback: onSlide });
});
function onSlide(selectionStart, selectionEnd) {
    //$('#text').html(selectionStart);
    startValue = selectionStart;
    endValue = selectionEnd;
    if(endValue<startValue){
    	endValue = startValue;
    }
    var str = startValue+"K-" + endValue + "K";
    $("#payment").val(str);
}
</script> -->
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

            <div class="wfb_zw">
            <div class="tt_bg">编辑修改职位</div>
            <div class="kt_bo">
	          <form action="company/job/modify" method="post" style="padding-left:20px;">
	           	<input type="hidden" name="id" value="${job.id }">
	           	
	           	<div class="ktname_b">职位名称</div>
	            <p class="login_top"><input name="jobName" id="jobName" type="text" placeholder="请输入职位名称，如：行政实习生" validate="required::请输入职位名称" class="login_input kt_input_w" value="${job.jobName }"></p>
	           	<div class="ktname_b">招聘人数</div>
	            <p class="login_top"><input name="employ" id="employ" type="text" placeholder="请输入要招聘的人数，如：2，若干请填写：0" validate="required::请输入招聘的人数" class="login_input kt_input_w" value="${job.employ }"></p>
	           	<!-- 
	           	<div class="ktname_b">职位类别</div>
	            <p class="login_top"><input name="" type="text" placeholder="请选择职位类别" class="login_input kt_input_w login_input_bg"></p>
	            
	            <div class="ktname_b">所属部门</div>
	            <p class="login_top"><input name="" type="text" placeholder="请输入所属部门" class="login_input kt_input_w"></p>
	            -->
	            
	            <div class="ktname_b">工作性质</div>
	            
	            <p class="login_top">
	              <label>
	                <input type="radio" name="workTime" value="1" id="RadioGroup1_0" <c:if test="${job.workTime eq 1 }">checked="checked"</c:if> >全职
		          </label>
		          <label>
		            <input type="radio" name="workTime" value="2" id="RadioGroup1_1" <c:if test="${job.workTime eq 2 }">checked="checked"</c:if> >按天
		          </label>
		          <label>
		             <input type="radio" name="workTime" value="3" id="RadioGroup1_2" <c:if test="${job.workTime eq 3 }">checked="checked"</c:if> >按小时
		          </label>
	            </p>
	            
	            <div class="ktname_b">工作城市</div>
	            <p class="login_top">
	            	<input name="city" id="currentCity" type="text" readonly="readonly"  placeholder="请选择城市" validate="required::请选择城市" class="login_input kt_input_w login_input_bg" value="${job.city }">
	            	<input id="currentCityId" type="hidden" >
	            </p>
	            <div class="ktname_b">区域</div>
	            <p class="login_top"><input name="area" id="currentArea" type="text" id="currentArea" readonly="readonly" placeholder="请选择区域" validate="required::请选择区域" class="login_input kt_input_w login_input_bg" value="${job.area }"></p>
	            <div class="ktname_b">职位类别</div>
		            <p class="login_top"><input name="category" id="jobAttr" type="text" readonly="readonly"  placeholder="请选择职位类别" validate="required::请选择职位类别" class="login_input kt_input_w login_input_bg" value="${job.category}"></p>
	            <div class="ktname_b">薪资范围</div>
	            <p class="login_top"><input name="payment" id="payment" type="text" readonly="readonly"  placeholder="请选择薪资范围"  validate="required::请选择薪资范围" class="login_input kt_input_w login_input_bg" value="${job.payment }"></p>
	            <div id="paymentDiv"></div>	
	             
	            <div class="ktname_b">最低学历</div>
	            <p class="login_top">
	            <label>
	                <input type="radio" name="educationalReq" value="1" id="RadioGroup3_0" <c:if test="${job.educationalReq eq 1 }">checked="checked"</c:if> >不限
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="2" id="RadioGroup3_1" <c:if test="${job.educationalReq eq 2 }">checked="checked"</c:if> >高中
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="3" id="RadioGroup3_2" <c:if test="${job.educationalReq eq 3 }">checked="checked"</c:if> >大专
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="4" id="RadioGroup3_3" <c:if test="${job.educationalReq eq 4 }">checked="checked"</c:if> >本科
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="5" id="RadioGroup3_4" <c:if test="${job.educationalReq eq 5 }">checked="checked"</c:if> >硕士
	            </label>
	            <label>
	                <input type="radio" name="educationalReq" value="6" id="RadioGroup3_5" <c:if test="${job.educationalReq eq 6 }">checked="checked"</c:if> >博士
	            </label>
	            </p>
	            
			
	           <%--  <div class="ktname_b">职位诱惑</div>
	            <p class="login_top"><input name="temptation" type="text" value="${job.temptation }" class="login_input kt_input_w" placeholder="请描述该职位对实习生的诱惑"></p> --%>
	              <div class="ktname_b">职位诱惑<span class="kt_font_x">(双击输入框可以选择)</span></div>
	            <p class="login_top"><textarea name="temptation" id="temptation" style="height: 60px;" placeholder="请描述该职位对实习生的诱惑" >${job.temptation }</textarea></p>
	             
	            <div class="ktname_b">职位描述<span class="kt_font_x">（分条描述该职位的工作职责，任务要求等。注：请勿输入公式邮箱，联系电话及其他外链，否则将自动删除）</span></div>
	            <p class="login_top"><textarea name="jobDesc" id="jobDesc" cols="30" rows="5">${job.jobDesc }</textarea>
	            <!-- <script type="text/javascript">
	            $(function(){
	            	UM.getEditor('jobDesc',{
		            	//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
		                toolbar:['source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
		                          'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
		                          '| justifyleft justifycenter justifyright justifyjustify |',
		                          '| horizontal preview fullscreen'],
		                //focus时自动清空初始化时的内容
		                autoClearinitialContent:false,
		                //关闭字数统计
		                wordCount:false,
		                //关闭elementPath
		                elementPathEnabled:false,
		                //默认的编辑区域高度
		                initialFrameHeight:300
		            });
				});
	            </script> -->
	            </p>
	            
	            <div class="ktname_b">任职要求<span class="kt_font_x">（分条描述该职位的能力要求）</span></div>
	            <p class="login_top"><textarea name="jobRequest" id="jobRequest" cols="30" rows="5">${job.jobRequest }</textarea>
	           <!-- <script type="text/javascript">
	            $(function(){
	            	UM.getEditor('jobRequest',{
		            	//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
		                toolbar:['source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
		                          'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
		                          '| justifyleft justifycenter justifyright justifyjustify |',
		                          '| horizontal preview fullscreen'],
		                //focus时自动清空初始化时的内容
		                autoClearinitialContent:false,
		                //关闭字数统计
		                wordCount:false,
		                //关闭elementPath
		                elementPathEnabled:false,
		                //默认的编辑区域高度
		                initialFrameHeight:300
		            });
				});
	            </script> -->
	            </p>
	            <div class="ktname_b">其他要求<span class="kt_font_x"></span></div>
	            <p class="login_top"><textarea name="otherReq" id="otherReq" placeholder="请输入该职位的其他要求" cols="10" rows="5">${job.otherReq }</textarea></p>
	            
	            <div class="ktname_b">提出问题<span class="kt_font_x">（不需要的问题可以空白）</span></div>
	            <p class="login_top">
	            <a class="a_add" onclick="showAdd();">&nbsp;&nbsp;</a>
	            	<input type="text" name="interQuestionsOne" id="interQuestionsOne" <c:if test="${job.interQuestionsOne ==null || job.interQuestionsOne =='' || job.interQuestionsOne =='1、' }">  style="display: none;" </c:if> class="login_input kt_input_w" value="${job.interQuestionsOne }">
	            	<input type="text" name="interQuestionsTwo" id="interQuestionsTwo" <c:if test="${job.interQuestionsTwo ==null || job.interQuestionsTwo =='' || job.interQuestionsTwo =='2、' }">  style="display: none;" </c:if> class="login_input kt_input_w"  value="${job.interQuestionsTwo }">
	            	<input type="text" name="interQuestionsThree" id="interQuestionsThree" <c:if test="${job.interQuestionsThree ==null || job.interQuestionsThree =='' || job.interQuestionsThree =='3、' }">  style="display: none;" </c:if> class="login_input kt_input_w" value="${job.interQuestionsThree }">
	            	<input type="text" name="interQuestionsFour" id="interQuestionsFour" <c:if test="${job.interQuestionsFour ==null || job.interQuestionsFour =='' || job.interQuestionsFour =='4、' }">  style="display: none;" </c:if> class="login_input kt_input_w" value="${job.interQuestionsFour }">
	            	<input type="text" name="interQuestionsFive" id="interQuestionsFive" <c:if test="${job.interQuestionsFive ==null || job.interQuestionsFive =='' || job.interQuestionsFive =='5、' }">  style="display: none;" </c:if> class="login_input kt_input_w" value="${job.interQuestionsFive }">
	            </p>
	            
	            <span id="Span" style="color: red;"></span>
	            
	            <div class="login_top" style="margin-top:10px;">
	            	<input type="submit" id="issuei" value="发布" style="display: none;">
		            <input type="button" value="发布" onclick="release()" class="btn_style1">
		            <input type="button" onclick="backHome()" value="取消" class="btn_cancel">
	            </div>
	            
	           </form>
    
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
			width: 460,
			height:80,
			onclose:function(){
				$("#payment").val(this.data.payment);
			}
		}).show(document.getElementById('payment'));
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
		console.log($("#currentCityId").val());
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

function showAdd(){
	var interQuestionsOne = $("#interQuestionsOne").val();
	var interQuestionsTwo = $("#interQuestionsTwo").val();
	var interQuestionsThree = $("#interQuestionsThree").val();
	var interQuestionsFour = $("#interQuestionsFour").val();
	var interQuestionsFive = $("#interQuestionsFive").val();
	if(interQuestionsOne!='' || interQuestionsOne!='1、'){
		document.getElementById('interQuestionsOne').style.display="block";
		if(interQuestionsOne==''){
			$("#interQuestionsOne").val("1、");
		}
	}
	if(interQuestionsOne!='' && interQuestionsOne!='1、'){
		document.getElementById('interQuestionsTwo').style.display="block";
		if(interQuestionsTwo==''){
			$("#interQuestionsTwo").val("2、");
		}
	}
	if(interQuestionsTwo != '' && interQuestionsTwo != '2、'){
		document.getElementById('interQuestionsThree').style.display="block";
		if(interQuestionsThree==''){
			$("#interQuestionsThree").val("3、");
		}
	}
	if(interQuestionsThree !='' && interQuestionsThree !='3、'){
		document.getElementById('interQuestionsFour').style.display="block";
		if(interQuestionsFour==''){
			$("#interQuestionsFour").val("4、");
		}
	}
	if(interQuestionsFour!='' && interQuestionsFour!='4、'){
		document.getElementById('interQuestionsFive').style.display="block";
		if(interQuestionsFive==''){
			$("#interQuestionsFive").val("5、");
		}
	}
	if(interQuestionsFive!='' && interQuestionsFive!='5、'){
		$("#Span").text("最多只能提五个问题！");
	}
}

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
</script>
</html>
