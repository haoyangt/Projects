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
<script src="res/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function sendInterview() {
	var id = $("#jobId").val();
	var wenTi1 = '${wenTi1}';
	var daAn1 = $("#daAn1").val();
	var wenTi2 = '${wenTi2}';
	var daAn2 = $("#daAn2").val();
	var wenTi3 = '${wenTi3}';
	var daAn3 = $("#daAn3").val();
	var wenTi4 = '${wenTi4}';
	var daAn4 = $("#daAn4").val();
	var wenTi5 = '${wenTi5}';
	var daAn5 = $("#daAn5").val();
		var declaration=$("#content").val();
		var dialog = top.dialog;
		$.ajax({
			type:'POST',
			url:'user/diliverResumeWxWjl',
			data:{"jobId":id,"declaration":declaration,"wenTi1":wenTi1,"daAn1":daAn1,"wenTi2":wenTi2,"daAn2":daAn2,"wenTi3":wenTi3,"daAn3":daAn3,"wenTi4":wenTi4,"daAn4":daAn4,"wenTi5":wenTi5,"daAn5":daAn5,"terrace":2},
			dataType:'json',
			success:function(json) {
				alert(json.msg);
				dialog.get("artBoxForResume").close();
			}
		});
	}
	
	function closeWindow() {
		var id = $("#jobId").val();
		var declaration="hh";
		var dialog = top.dialog;
		$.ajax({
			type:'POST',
			url:'user/diliverResumeWxWjl',
			data:{"jobId":id,"declaration":declaration,"terrace":2},
			dataType:'json',
			success:function(json) {
				alert(json.msg);
				dialog.get("artBoxForResume").close();
			}
		});
	}
</script>
<style type="text/css">
.tb_int{margin:0 auto;width:660px;}
.tb_int tr td{padding:4px;}
</style>
</head>

<body>

 <form class="tb_int" id="interviewForm">
	<table>
		<tr><td colspan="2"><strong>您今天还可投递简历量为：${quantity }份</strong></td></tr>
		<c:if test="${wenTi1 ==null || wenTi1 =='' || wenTi1 =='1、'}">
		<tr>
			<td ><span class="bt">*</span>内<span class="bt"></span>容:</td>
			<td><textarea style="width:230px;height:160px" validate="required::请输入内容" name="interviewNotice.content" class="add_content  login_input" placeholder="说说您的优势以及对公司、职位的了解可以大大增加成功概率哦！求职是也是一个双向选择的过程，若果您对公司有特殊要求，也可以提前告知。"  id="content"></textarea></td>
		</tr>
		<tr><td colspan="2" align="center">
		<input type="hidden" id="jobId"  name="interviewNotice.jobId" value="${jobId }">
		<input class="btn_style1" type="button" onclick="sendInterview();"  value="确定"/>
		<input class="btn_cancel" type="button" onclick="closeWindow();" value="跳过"/></td></tr>
		</c:if> 
		<c:if test="${wenTi1 !=null && wenTi1 !='' && wenTi1!='1、'}"> 
		   <tr><td><span class="bt">*</span>请回答该公司提出的五个问题：</td></tr>
			   <tr><td>${wenTi1}</td></tr>
			   <tr><td><input type="text" id="daAn1" class="login_input kt_input_w" style="width:296px;" ></td></tr>
		   <c:if test="${wenTi2 !=null && wenTi2 !='' && wenTi2!='2、'}">
			   <tr><td>${wenTi2}</td></tr>
			   <tr><td><input type="text" id="daAn2" class="login_input kt_input_w" style="width:296px;"></td></tr>
	 	   </c:if>
	 	   <c:if test="${wenTi3 !=null && wenTi3 !='' && wenTi3!='3、'}">	   
			   <tr><td>${wenTi3}</td></tr>
			   <tr><td><input type="text" id="daAn3" class="login_input kt_input_w" style="width:296px;"></td></tr>
		   </c:if>
		   <c:if test="${wenTi4 !=null && wenTi4 !='' && wenTi4!='4、'}">
			   <tr><td>${wenTi4}</td></tr>
			   <tr><td><input type="text" id="daAn4" class="login_input kt_input_w" style="width:296px;"></td></tr>
		   </c:if>
		   <c:if test="${wenTi5 !=null && wenTi5 !='' && wenTi5!='5、'}">
			   <tr><td>${wenTi5}</td></tr>
			   <tr><td><input type="text" id="daAn5" class="login_input kt_input_w" style="width:296px;"></td></tr>
		   </c:if>
		<tr><td align="center"><input class="btn_style1" type="button" onclick="sendInterview();"  value="确定"/></td></tr>
		</c:if>
	</table>

</form>
</body>
</html>