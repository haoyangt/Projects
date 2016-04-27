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
</head>

<body  class="body_cs" onload="index">
	<div style="width:800px;margin:0 auto;line-height:28px;font-size:16px;">
        <div style="padding:0 0 0 80px; width:600px;font-family:"宋体";">
        	<h1><img src="http://www.yaoshixi.com/res/images/logo.png" width="121" height="140"></h1>
        	<p style="margin:0;">${emails }.com 同学，你好！</p>
        	<p style="margin:0;">邀请你面试：我们是要实习™招聘网。</p>
        	<p style="margin:0;">在要实习™网站上${companyNames }给你发出面试邀请。</p>
       		<p style="margin:0;">面试时间：${interviewTime }&nbsp;&nbsp;${hour }<br/></p>
       		<p style="margin:0;">面试地址：${interviewNotice.place }</p>
       		<p style="margin:0;">联系人：${interviewNotice.contactPerson }&nbsp;&nbsp;&nbsp;&nbsp;联系电话：${interviewNotice.contactPhone }<br/></p>
       		<p style="margin:0;">内容：${interviewNotice.content }<br/></p>
       		<p style="margin:0;">点击此链接：<a href="http://www.yaoshixi.com" class="h_b_under">http://www.yaoshixi.com/</a>登录账号，即可查看详情 </p>
			<p style="margin:0;">如无法点击，请将链接拷贝到浏览器地址栏中直接访问”</p>
           <br/>
            <p style="margin:0;">衷心祝愿您可以在要实习网找到满意的工作！</p>
            <p style="text-align:right; margin:0;">要实习</p>
            <p style="text-align:right;margin:0; ">${registDate }</p>
            <div style="text-decoration:underline;color:#0000FF;"></div>
            <p>要实习：<a href="http://www.yaoshixi.com" class="h_b_under">http://www.yaoshixi.com</a></p>
            <img src="http://www.yaoshixi.com/res/images/welRegister.png" width="560" >
        </div>

	</div>
</body>
</html>
