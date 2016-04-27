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
	<form class="tb_int" action="" method="post">
		<table>
			<tr>
				<td><span class="login_top">转发给：</span></td>
			    <td><input class="login_input login_input_w" type="text" id="targetEmail"  placeholder=""></td>
		    </tr>
		    <tr>
				<td><span class="login_top">附言：</span></td>
				<td><textarea style="width:450px;height:100px" class="add_content  login_input" placeholder=""  id="add_content"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align:right;width:450px">你可以输入<span style="color:red">100</span>字</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<p style="width:450px;margin-top:20px"><input class="btn_style1" id="sendEmail" type="button" value="发送"><input class="btn_cancel" type="button" onclick="closeWindow();" value="取消"></p>
				</td>
			</tr>
		</table>
	</form>
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
			var userId = top.dialog.get("artBoxForResume").data.userId;
			var jobId = top.dialog.get("artBoxForResume").data.jobId;
			var targetEmail = $("input#targetEmail").val();
			var content = $("#add_content").val();
			$.ajax({
				type:'POST',
				url:'company/resume/forward',
				data:{"userId": userId,"jobId":jobId, "targetEmail": targetEmail, "content": content},
				dataType:'json',
				success:function(json) {
					if(json.status = 200) {
						artLab.dialog({
						    title: '提示',
						    content: '邮件发送成功，是否继续转发简历？',
						    ok: function () {
						        var that = this;
						        that.close().remove();
						        return false;
						    },
						    cancel: function () {
						    	top.dialog.get("artBoxForResume").close();
						        return false;
						    }
						}).show();
					} 
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