<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>新浪微博登录-要实习-专注于实习生招聘的互联网平台</title>
<script type="text/javascript">
window.location="https://api.weibo.com/oauth2/authorize?client_id=1862990248&response_type=code&redirect_uri=http://www.yaoshixi.com/user/sinaLogin";
</script>
<body  class="body_cs">
</body>
</html>

