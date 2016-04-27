<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>完善个人信息-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>

</head>
<body  class="body_cs">
<div id="body">
<div class="zhank"></div>
<div class="login">
 	<p>欢迎使用要实习网，请填写个人资料，开启全新实习之旅！</p>
    <hr/>
     <form action="user/addUserBasicInfo" method="post" onsubmit="return validateUtil.validateForm(this);">
    <div class="register_left">
		 <div id="facediv">  
       		 <p>
         	 <a >
         		<img id ="faces" src="res/images/toux.png" width="118" height="119">
        		 </a>
         	</p>	
          </div> 
        <p>尺寸：120*20px<br/>大小：小于5M</p>
      <!-- <p style="width:100%;overflow: hidden;"><input type="file" name="fileToUpload" id="fileToUpload" onchange="uploadHead();" style="width:65px"/></p> -->
      <p style="width:100%;overflow: hidden;"><input type="button" value="上传" name="fileToUploads" id="fileToUploads"  style="width:65px"/></p>
   </div>
    <div class="register_right">
        <div class="login_top">用户名：<input name="userBasicInfo.userName" id="userNames" validate="required::用户名" type="text" placeholder="用户名" class="login_input" ><span class="bt">*</span> 
          &nbsp; &nbsp;
            <label>
              <input type="radio" name="userBasicInfo.gender" checked="checked" value="0" id="RadioGroup1_0">
              男</label>
         
            <label>
              <input type="radio" name="userBasicInfo.gender"  value="1" id="RadioGroup1_1">
              女</label>
         
        </div>
        <div class="login_top">出生年份：
        	<input name="userBasicInfo.birthDay" id="birthDay" validate="required::输入出生年份" type="text" placeholder="出生年份" onclick="WdatePicker();" class="login_input login_input_bg"><span class="bt">*</span><font style="color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;例：1991-01-01</font>
       	</div>
        <div class="login_top">常用邮箱：
        	<input name="userBasicInfo.email" value="${email }"  validate="email::请输入常用邮箱" readonly="readonly" type="text" placeholder="联系邮箱" class="login_input register_input_w"><span class="bt">*</span>
       	</div>
        <div class="login_top">联系电话：
        	<input name="userBasicInfo.telPhone" id="telPhone"  validate="required::请输入联系电话" type="text" placeholder="联系电话"  class="login_input register_input_w"><span class="bt">*</span>
       	</div>
        <div class="login_top">所在城市：
        	<input name="userBasicInfo.city" id="currCity" value="${city }" type="text" placeholder="所在城市" style="width: 350px" class="login_input kt_input_w login_input_bg"><span class="bt">*</span>
        </div>
        <div class="login_top">希望职位所在城市：
           	<input name="userBasicInfo.jobCity" id="jobCity" value="${jobCity }" type="text" style="width: 350px" validate="required::请选择希望职位所在城市" placeholder="希望职位所在城市" class="login_input kt_input_w login_input_bg"><span class="bt">*</span>
        </div>
        <div class="login_top">希望职位类别：
            <input  id="category" value="${category }" type="text" style="width: 350px" validate="required::请选择希望职位类别" placeholder="希望职位类别" class="login_input kt_input_w login_input_bg"><span class="bt">*</span>
            <input name="userBasicInfo.category" type="hidden" id="jobAttrValue">
        </div>
       	<div class="login_top">您是通过什么途径知道要实习网站？&nbsp; &nbsp;&nbsp;
       		<input name="userBasicInfo.approach" id="currApproach"  type="text" placeholder="您是通过什么途径知道要实习网站？" class="login_input register_input_w">
       	</div>
        <div class="login_top"><span class="bt">*</span>
            <label>
              <input type="radio" name="resume.timeAvailable" id="workday" value="1" checked="checked" <c:if test="${timeAvailable==1 }">checked="checked" </c:if>>全职
            </label>
            <label>
              <input type="radio" name="resume.timeAvailable" id="weekend" value="2" <c:if test="${timeAvailable==2 }">checked="checked" </c:if>>按天
            </label>
            <label>
              <input type="radio" name="resume.timeAvailable" id="holiday" value="3" <c:if test="${timeAvailable==3 }">checked="checked" </c:if>>按小时
            </label>
            <label> (希望的工作性质)</label>
        </div>
            <span id="Span" style="color: red;"></span>
    </div>
    <div style="clear:both"></div>
     <div class="login_top" style="text-align:center;">
     	<input  type="submit" value="保存" id="submitSave" style="display: none;">
     	<input  type="button" onclick="saveBasicInfo()" value="保存" class="btn_style1">
     </div>
       </form>
       
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
	
		$("#currCity").click(function(){
			art({
				id: 'artBoxForCurrentCity',
				title: "选择所在城市",
				data: {currentCity:""},
				url: 'company/currentCity.jsp',
				quickClose: true,
				cancel: false,
				width: 360,
				height: 60,
				onclose:function(){
					$("#currCity").val(this.data.currentCity);
				}
			}).show(document.getElementById('currCity'));
		});
		
		$("#jobCity").click(function(){
			art({
				id: 'artBoxForjobCity',
				title: "选择希望职位所在城市",
				data: {currentCity:""},
				url: 'company/jobCity.jsp',
				quickClose: true,
				cancel: false,
				width: 350,
				height: 60,
				onclose:function(){
					$("#jobCity").val(this.data.jobCity);
				}
			}).show(document.getElementById('jobCity'));
		});
		
		$("#category").click(function(){
			//var jobAttrValue = document.getElementById('jobAttrValue').value.slice(",");
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
				cancel: false,
				width: 550,
				height:260,
				onclose:function(){
					$("#category").val(this.data.jobAttr);
					$("#jobAttrValue").val(this.data.jobAttrValue);
					
					jobAttrValue = this.data.jobAttrValue.toString();
				}
			}).show(document.getElementById('category'));
		});
		
		$("#currApproach").click(function(){
			art({
				id: 'artBoxForCurrApproach',
				title: "选择信息来源",
				data: {currApproach:""},
				url: 'company/currApproach.jsp',
				quickClose: true,
				cancel: false,
				width: 360,
				height: 80,
				onclose:function(){
					$("#currApproach").val(this.data.currApproach);
				}
			}).show(document.getElementById('currApproach'));
		});
		
	});
	
$("#fileToUploads").on("click", function(){
	var title = "上传头像";
    var url = "user/headImgEdit.jsp";
	top.dialog({
		id: 'artBoxForResume',
		title: title,
		url: url,
		quickClose: false,
		width: '700px',
		height: '520px',
		onclose: function(){
			if(this.returnValue)
			{
				$("#faces").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
			//	$("#companyLogoImg").attr("src", "res/upload/logo/" + this.returnValue);
			}
		}
	}).showModal();
});
function saveBasicInfo() {
	var userName = $("#userNames").val();
	var city = $("#currentCity").val();
	var birthDay = $("#birthDay").val();
	var email = $("#email").val();
	var telPhone = $("#telPhone").val();
	if(userName!='' && birthDay!='' && email!='' && telPhone!='' && city!='' && userName!='用户名' && birthDay!='出生年月' && email!='联系邮箱' && telPhone!='联系电话' && city!='所在城市'){
		$("#submitSave").click();
	}else{
		$("#Span").text("带*的信息没有填写完整！");
	}
	
}
</script>
</html>
