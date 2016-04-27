<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/jstl.jsp" %>     
 <%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>"/>
<title>上传结果</title>
</head>
<body>
	<c:if test="${empty errorList}">
	<p>添加企业成功</p>
	</c:if>
	<c:if test="${not empty errorList}">
	<table>
		<tr><td>编号</td><td>原因</td></tr>
		<c:forEach items="${errorList}" var="data">
			<tr><td>${data.no }</td><td>${data.msg }</td></tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>