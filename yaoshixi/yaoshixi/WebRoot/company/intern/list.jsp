<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>

<base href="<%= basePath%>">

<!-- 实习生录用状态信息 -->
<c:set var="status_1" value="在职"></c:set>
<c:set var="status_2" value="已离职"></c:set>

实习生：
<br><br>
<c:if test="${empty page.results }">
	还没有招聘实习生
</c:if>
<c:forEach items="${page.results }" var="intern">
	姓名： ${intern.userName }   
	状态： ${pageScope[myfn:concat("status_", intern.status)] }
	
	<br>
	岗位：${intern.jobName }  
	
	<!-- 操作信息 -->
	<c:set var="operate_0">(待评价)&nbsp;&nbsp;<a href="company/intern/evaluateEdit/${intern.userId}">去评价</a></c:set>
	<c:set var="operate_1">(已评价)&nbsp;&nbsp;<a href="company/intern/showEvaluation/${intern.userId}">查看</a></c:set>
	${pageScope[myfn:concat("operate_", intern.commentStatus)] }
	
	<br>
	录用时间：<fmt:formatDate value="${intern.hireDate }" pattern="yyyy-MM-dd" type="date"/>
	
	<br><br>
</c:forEach>