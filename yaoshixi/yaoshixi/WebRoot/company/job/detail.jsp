<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>view job</title>
</head>
<body>
	<a href="company/job/modifyEdit/${job.id}">编辑</a>
	<br><br>
	职位名称：${job.jobName }
	<br>
	职位描述：${job.jobDesc }
	<br>
	能力要求：${job.jobRequest }
	<br>
	学历要求：${job.educationalReq }
	<br>
	其他要求：${job.otherReq }
	<br>
	工作时间：${job.workTime }
	<br>
	工作城市：${job.city }
	<br>
	薪酬福利：${job.payment }
	<br>
	发布时间：<fmt:formatDate value="${job.publishTime }" pattern="yyyy-MM-dd" type="date"/>
	<br><br>
	<a href="company/job/modifyEdit/${job.id}">编辑</a>
</body>
</html>