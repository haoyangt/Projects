<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%= basePath%>">

投递的简历
<br><br>
<c:if test="${empty resumes }">
	<!-- 没有搜索到简历提示信息  -->
	没有搜索到简历提示信息
</c:if>
<c:forEach items="${resumes }" var="resume">
	${resume.userName }
	&nbsp;投递 &nbsp;
	${resume.jobName }
	<br>
	投递时间：<fmt:formatDate value="${resume.diliverTime }" pattern="yyyy-MM-dd" type="date"/>
	
	<!-- 简历操作  -->
	<a href="company/certificate/scan/${resume.userId }/${resume.jobId}">预览证明</a>
	<br><br>
 </c:forEach>

