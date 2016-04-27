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

<body>
	<div style="width:800px;margin:0 auto;line-height:28px;font-size:16px;">
        <div style="padding:0 0 0 80px; width:600px;font-family:"宋体";">
        	<h1><img src="http://www.yaoshixi.com/res/images/logo.png" width="120"></h1>
			<p style="margin:0;">${email }.com，您好！</p>
        	<p style="margin:0;">您已成功注册<b>要实习™</b>，马上完善贵公司的资料，发布新职位吸引众多求职者吧！</p>
       		<p style="margin:0;">公司资料编辑：
       			<a href="${validateUrl }" style="text-decoration:underline;color:#0000FF;">${validateUrl }</a>
			</p>
           <br/>
           <p style="color:#366092;margin:0;">微信也可以找工作了，想想也有点小激动呢。</p>
            <p style="color:#366092;margin:0;">我们的微信：iyaoshixi</p>
            <p style="font-size:12px;color:#999999;border-top:1px solid #999999;margin-top:10px;margin:0;">
                                             系统自动发出，<b class="">请勿直接回复。</b><br>
				如有疑问或建议，可发送邮件至<a href="mailto:cs@yaoshixi.com" style="text-decoration:underline;color:#0000FF;">cs@yaoshixi.com</a>
            </p>
            
            <img src="http://www.yaoshixi.com/res/images/welRegister.png" width="560" >
        </div>

	</div>
</body>
</html>
