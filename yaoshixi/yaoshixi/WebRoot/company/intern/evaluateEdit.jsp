<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>evaluate edit</title>
</head>
<body>
	尊敬的企业用户，
		请您对  ${intern.userName } 在贵公司的表现，进行客观评价，感谢。
	<form action="company/intern/evaluate" method="post">
		<input type="hidden" name="userId" value="${intern.userId }" />
		评价内容：<textarea name="content" rows="5" cols="60">对实习生的评价，打分。</textarea>
		<br>
		<input type="submit" value="保存评价">
	</form>
</body>
</html>