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
        	<p style="margin:0;">您所投递的（${jobName}）已经过去五天了，机会有点渺茫！</p>
			<p style="margin:0;">不要灰心，再接再厉，更多职位可以上<strong>要实习™</strong>查询。</p>
			<p style="margin:0;">我们的网站：<a target="_blank" href="http://www.yaoshixi.com/" style="text-decoration:underline;color:#0000FF;">www.yaoshixi.com</a></p>
			<p style="margin:0;">衷心祝愿您可以在<strong>要实习™</strong>找到满意的工作！</p>
           <br/>
           <p style="color:#366092;margin:0;">微信也可以找工作了，想想也有点小激动呢。</p>
            <p style="color:#366092;margin:0;">我们的微信：iyaoshixi</p>
            <p style="font-size:12px;color:#999999;border-top:1px solid #999999;margin-top:10px;margin:0;">
                                             系统自动发出，<strong>请勿直接回复</strong>。<br>
				如有疑问或建议，可发送邮件至<a href="mailto:cs@yaoshixi.com" style="text-decoration:underline;color:#0000FF;">cs@yaoshixi.com</a>
            </p>
            
            <img src="http://www.yaoshixi.com/res/images/welRegister.png" width="560" >
        </div>

	</div>
</body>
</html>
