<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>要实习-专注于实习生招聘的互联网平台</title>
</head>
<body>
	<form action="list" method="post">
		<input type="text" name="numPerPage" value="15" />
		<input type="text" name="pageNum" value="2" />
		<input type="text" name="mapper" value="login"/>
		<input type="text" name="queryName" value="list"/>
		<input type="text" name="viewName" value="list"/>
		<input type="text" name="params[id]" value="123"/>
		<input type="text" name="params[name]" value="lei"/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>