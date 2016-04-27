<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%= basePath%>">

<h2>实习证明</h2>

兹有     ${certificateInfo.university } ${certificateInfo.college }   学校/学院     ${certificateInfo.major } 专业    ${certificateInfo.internName } 同学于
_______年_______月_______日至_______年_______月_______日
在     ${certificateInfo.companyName } 实习。
该同学的实习职位是    ${certificateInfo.jobName }。
										证明人:__________(单位盖章)
										
<br><br>
<a href="company/certificate/print">打印</a>
<a href="company/certificate/download">下载</a>
										