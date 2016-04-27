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
<style type="text/css">
.tb_int{margin:0 auto;width:660px;}
.tb_int tr td{padding:4px;}
</style>
</head>

<body>
 <form class="tb_int" id="internForm">
		<input type="hidden" id="companyIds" name="intern.companyId" value="${companyId }">
		<input type="hidden" id="userIdes" name="intern.userId" value="${userId }">
		<input type="hidden" id="jobIds" name="intern.jobId" value="${jobId }">
		<input type="hidden" id="emailes" name="intern.email" value="${email }">
	<table >
		<tr>
			<td><span class="bt">*</span>收件人：</td>
			<td>${email }.com</td>
		</tr>
		<tr>
			<td><span class="bt">*</span>入职时间：</td>
			<td>
				<input name="intern.hireDate" id="sj" type="text" style="width: 200px" validate="required::请输入日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" placeholder="请选择日期" class="login_input " /> 
				<br><input name="intern.hour" id="sj" type="text" style="width:200px" validate="required::请输入时间" onclick="WdatePicker({dateFmt:'HH:mm'});" placeholder="请选择日期" class="login_input login_input_w" /> 
			</td>
		</tr>
		<tr>
			<td><span class="bt">*</span>入职地址：</td>
			<td><input name="intern.officeAddress" id="dz"  style="width: 200px"type="text" value="${company.addr }" validate="required::请输入地址"  placeholder="默认公司地址" class="login_input" /></td>
		</tr>
		<tr>
			<td><span class="bt">*</span>联系人：</td>
			<td><input name="intern.linkman" id="lzr" type="text" style="width: 200px" validate="required::请输入联系人" class="login_input" /></td>
		</tr>
		<tr>
			<td><span class="bt">*</span>联系电话：</td>
			<td><input name="intern.phone" id="dh" type="text" validate="required::请输入联系电话" class="login_input" style="width: 200px"/></td>
		</tr>
		<tr>
			<td>入职职位：</td>
			<td><input name="intern.jobName" id="jobNamess" type="text" readonly="readonly" class="login_input" value="${jobName }" style="width: 200px"/></td>
		</tr>
		<tr><td></td><td><input class="btn_style1" type="button" onclick="EntryRecord();" value="发送"/><input class="btn_cancel" type="button" onclick="closeWindow();" value="取消"/></td></tr>
	</table>

</form>
</body>
<script type="text/javascript">
	$(function(){
		validateUtil.init($(document));
	});
	function closeWindow() {
		var dialog = top.dialog;
		dialog.get("artBoxForResume").close();
	}
	function EntryRecord(){
		var $form = $("#internForm");
		console.log($form.serializeArray());
		if(!validateUtil.validateForm($form)){
			return;
		}
		$.ajax({
			type:'POST',
			url:'company/resume/internRecord',
			data:$form.serializeArray(),
			dataType:'json',
			success:function(json) {
				confirm(json.msg);
				closeWindow();
			}
		});
	}
</script>
</html>