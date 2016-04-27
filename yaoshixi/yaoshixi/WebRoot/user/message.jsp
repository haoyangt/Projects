<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="message">
	<ul>
		<c:forEach items="${msgList }" var="msg">
			<li>
				<table><tr><td width="50px" align="center"><img src="res/images/cor.png" width="40" height="40"></td>
				<td width="200px"><a href="company/resume/listNews/${msg.id }/${msg.uId}/${msg.email}" target="_blank"><strong>${msg.userName }</strong>投递了您发布的<strong>${msg.jobName }</strong>职位</a></td>
				<td width="50px"> <fmt:formatDate value="${msg.diliverTime }" pattern="MM-dd"/></td></tr></table>
			</li>
		</c:forEach>
		
		<c:forEach items="${interviewNotices }" var="notice">
			<li>
				<table><tr><td width="50px" align="center"><img src="res/images/cor.png" width="40" height="40"></td>
				<td width="200px"><a href="user/interviewNotice/${notice.id }" target="_blank">您收到<strong>${notice.companyName }-${notice.jobName }</strong>职位的面试通知</a></td>
				</tr></table>
			</li>
		</c:forEach>
		<%-- <c:forEach items="${intern }" var="intern">
			<li>
				<table><tr><td width="50px" align="center"><img src="res/images/cor.png" width="40" height="40"></td>
				<td width="200px"><a href="user/interviewNotice/${intern.id }" target="_blank">您收到<strong>${intern.companyName }-${intern.jobName }</strong>职位的入职通知</a></td>
				</tr></table>
			</li>
		</c:forEach> --%>
		<c:if test="${empty msgList && empty interviewNotices}">
			<li>暂无消息哦O(∩_∩)O~</li>
		</c:if>
	</ul>
</div>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	})
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		$("#btnSaveBasicInfo").click(function(){
			saveBasicInfo();
		});
		
		function saveBasicInfo() {
			var $form = $("#userBasicForm");
			 $.ajax({
				type:'POST',
				url:'user/saveUserBasicInfo',
				data:$form.serializeArray(),
				cache:false,
				dataType:'json',
				success:function(json){
					artLab.msg(json.msg);
				}
			}); 
		}
		
		$("#btnSaveEducation").click(function(){
			saveEducation();
		});
		
	 	function saveEducation() {
			var $form = $("#educationForm");
			 $.ajax({
					type:'POST',
					url:'user/saveResume',
					data:$form.serializeArray(),
					cache:false,
					dataType:'json',
					success:function(json){
						//alert(json.msg);
						artLab.msg(json.msg);
					}
				}); 
		}
		
	 	$("#btnSaveSelfDescForm").click(function(){
	 		saveSelfDescForm();
		});
		function saveSelfDescForm() {
			var $form = $("#selfDescForm");
			 $.ajax({
					type:'POST',
					url:'user/saveResume',
					data:$form.serializeArray(),
					cache:false,
					dataType:'json',
					success:function(json){
						//alert(json.msg);
						artLab.msg(json.msg);
					}
				}); 
		}
	});
</script>
</html>