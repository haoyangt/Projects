<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<script src="http://www.yaoshixi.com/res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
function validateUrl(){
	var url = encodeURI("${validateUrl }");
	$("#validateUrl").attr("href",url);
	document.getElementById("validateUrl").click();
}
</script>
<body  class="body_cs" onload="index">
	<div class="sendmail">
        <div class="smail">
        	<h1><img src="http://www.yaoshixi.com/res/images/logo.png" width="121" height="140"></h1>
        	<p>亲爱的  ${email }，您好！</p>
       		<p>要实习已经收到了你的激活公司邮箱请求，请点击以下链接进行激活。<br/>
				<a href="${validateUrl }" id="validateUrl" onclick="validateUrl()" class="h_b_under">${validateUrl }</a> 
			</p>
           <br/>
            <p style="text-align:right">要实习</p>
            <p style="text-align:right">${registDate }</p>
            <div class="hr"></div>
            <p>要实习：<a href="http://www.yaoshixi.com" class="h_b_under">http://www.yaoshixi.com</a></p>
        </div>

	</div>
</body>
</html>
