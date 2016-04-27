<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<ul >
	<c:forEach items="${companys }" var="company">
        <li><a href="c/indexPhone/${company.id }"><img src="${company.companyLogo }"></a></li>
	</c:forEach>
</ul>