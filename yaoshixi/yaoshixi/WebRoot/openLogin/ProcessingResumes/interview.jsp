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
<title></title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script src="res/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

	$(function(){
		validateUtil.init($(document));
	});

	function sendInterview() {
		var $form = $("#interviewForm");
		if(!validateUtil.validateForm($form)){
			return;
		}
		$.ajax({
			type:'POST',
			url:'company/resume/sendInterviewNotice',
			data:$form.serializeArray(),
			dataType:'json',
			success:function(json) {
				confirm(json.msg);
				closeWindow();
			}
		});
	}
	
	function closeWindow() {
		var dialog = top.dialog;
		dialog.get("artBoxForResume").close();
	}
</script>
<style type="text/css">
.tb_int{margin:0 auto;width:660px;}
.tb_int tr td{padding:4px;}
</style>
</head>

<body>
 <form class="tb_int" id="interviewForm">
 	<input type="hidden" id="userId" name="interviewNotice.userId" value="${userId }">
 	<input type="hidden" id="jobId"  name="interviewNotice.jobId" value="${jobId }">
 	<input type="hidden" id="email"  name="interviewNotice.email" value="${email }">
	<table >
		<tr>
			<td><span class="bt">*</span>收件人：</td>
			<td>${email }.com</td>
		</tr>
		<tr>
			<td><span class="bt">*</span>面试时间：</td>
			<td>
				<input name="interviewNotice.interviewTime" validate="required::请输入日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" type="text"  placeholder="请选择日期"
				 style="width: 200px" class="login_input" />
				<font style="color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp; </font> 
				<br>
				<input name="interviewNotice.hour" style="width: 200px" validate="required::请输入时间" onclick="WdatePicker({dateFmt:'HH:mm'});" type="text"  placeholder="请选择时间" class="login_input login_input_w" />
				<font style="color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;</font> 
			</td>
		</tr>
		<tr>
			<td><span class="bt">*</span>面试地址：</td>
			<td><input  type="text"  name="interviewNotice.place" value="${company.addr }" validate="required::请输入公司地址"  placeholder="默认公司地址" style="width: 200px" class="login_input" /></td>
		</tr>
		<tr>
			<td><span class="bt">*</span>联系人：</td>
			<td><input  name="interviewNotice.contactPerson" validate="required::请输入联系人" type="text" style="width: 200px" class="login_input" /></td>
		</tr>
		<tr>
			<td><span class="bt">*</span>联系电话：</td>
			<td><input   name="interviewNotice.contactPhone" validate="required::请输入联系电话" type="text" style="width: 200px" class="login_input" /></td>
		</tr>
		<tr>
			<td><span class="bt">*</span>内容：</td>
			<td><textarea style="width:200px;height:100px" validate="required::请输入内容" name="interviewNotice.content" class="add_content  login_input" placeholder=""  id="content"></textarea></td>
		</tr>
		<tr><td></td><td><input class="btn_style1" type="button" onclick="sendInterview();"  value="发送"/><input class="btn_cancel" type="button" onclick="closeWindow();" value="取消"/></td></tr>
	</table>

</form>
</body>
</html>