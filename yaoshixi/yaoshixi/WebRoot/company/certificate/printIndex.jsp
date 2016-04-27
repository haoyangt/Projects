<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>

<base href="<%= basePath%>">

<form action="company/certificate/searchResume" method="post">
输入姓名：<input type="text" name="name" />
<input type="submit" value="搜索" />
</form>



<c:if test="${empty page.results }">
	暂时没有招聘历史。
</c:if>
<c:forEach items="${page.results }" var="job">
	职位名称：<a href="company/jobDetail/${job.id }">${job.jobName }</a>
	<br>
	投递人：${job.receivedResumeNum } <a href="company/certificate/postedList/${job.id }">查看</a>
	<br>
	
	<br><br>
</c:forEach>
