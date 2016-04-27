<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>要实习-专注于实习生招聘的互联网平台</title>
</head>
<body>
	<div>总行数：${page.totalRecord }</div>
	<c:forEach items="${page.results }" var="obj">
		${obj.userId }<br>
	</c:forEach>
</body>
</html>