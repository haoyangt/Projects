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
<link href="http://www.yaoshixi.com/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/skeleton.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tb_int{margin:0 auto;width:660px;}
.tb_int tr td{padding:4px;}
</style>
</head>
<body>
<c:if test="${msg!='' && msg != null }">${msg }</c:if>
   <c:if test="${msg=='' || msg == null }">
	<form class="tb_int" >
		<input type="hidden" id="userId" value="${userId }">
		<input type="hidden" id="jobId" value="${jobId }">
		<input type="hidden" id="email" value="${email }">
		<table>
			<tr>
				<td><span class="bt">*</span>收件人：</td>
				<td>${email }.com</td>
			</tr>
			<tr>
				<td><span class="bt"></span>拒绝原因及建议：</td>
				<td><textarea style="width:450px;height:100px" class="add_content  login_input" placeholder=""  id="add_content"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align:right;width:450px">你可以输入<span style="color:red">200</span>字</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<p style="width:450px;margin-top:20px"><input class="btn_style1" id="sendEmail" type="button" value="发送"><input class="btn_cancel" type="button" onclick="closeWindow();" value="取消"></p>
				</td>
			</tr>
		</table>
	</form>
	</c:if>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
		$("input#sendEmail").click(function(){
			forwardAjax();
		});
		
		function forwardAjax() {
			var userId = $("#userId").val();
			var jobId = $("#jobId").val();
			var email = $("#email").val();
			var content = $("#add_content").val();
			artLab.msg(content);
			$.ajax({
				type:'POST',
				url:'company/resume/turnDownUser',
				data:{"userId": userId, "jobId": jobId, "email": email,"content":content},
				dataType:'json',
				success:function(json) {
					alert(json.msg);
					closeWindow();
					$.ajax({
						type:'POST',
						url:'company/resume/list/'+jobId+'/0',
						dataType:'json',
						success:function(json) {
							
						}
					});
				}
			});
		}
	});
	function closeWindow() {
		var dialog = top.dialog;
		dialog.get("artBoxForResume").close();
	}
</script>
</html>