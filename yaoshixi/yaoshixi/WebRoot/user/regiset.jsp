<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${num == 1 }">
		<p>您申请的邮箱已注册</p>
		<p><a target="_blank" href="user/upadtePass.jsp">忘记密码</a> </p>
	</c:if>
	<c:if test="${num == 2 }">
		<p>您申请的公司已经被导入，请通过邮箱cs@yaoshixi.com联系我们询问激活码</p>
	</c:if>
</body>
</html>