<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>职位邀请</title>
<style>
body{ font-size:14px; line-height:25px;}
h2{ text-align:center; border-bottom:1px dashed #CCC;padding-bottom:10px;z-index:2; position: relative;}
p{ text-indent:28px; }
</style>
</head>
<body>
<div style="background: url(/res/images/xx.png) repeat-x left top; background-size:120px;  height:9px;position: absolute;top:0;left:0; width:100%;"></div>
<div style="background: url(/res/images/yinz.png) no-repeat left top; z-index:1; background-size:120px;  height:80px;width:120px;position: absolute;top:2%;right:0; "></div>

<h2>来自${companyName }的邀请</h2>
<p>${userName } 您好！</p>
<p>${companyName }正在寻找<font style="color:#ee5742;">${jobName }</font>相关专业人才，通过简历漂流瓶跨过六度人脉找到你，快去和他联系吧，好工作在等着你！加油！</p><br/>
<p style="color:#ee5742;font-weight: bold;">企业留言：${content }</p>
<div style="text-indent:28px;">Tel：<a href="tel:${contactPhone }">${contactPhone }</a></div>
<div style="text-indent:28px;">E-mail：<a href="mailto:${email }">${email }</a></div>
<div style="text-indent:28px;">面试时间：预计${interviewTime}，具体时间可与HR电话、邮箱确认</div>
<div style="text-indent:28px;">面试地址：${place}</div>
<p style="text-align: center;color:#999;border-top:1px dashed #CCC;text-indent:0;"> 社交招聘 助人成长</p>


</body>
</html>
