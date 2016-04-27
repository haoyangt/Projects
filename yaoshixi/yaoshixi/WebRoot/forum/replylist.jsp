<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<ul>
 	<c:forEach items="${page.results }" var="reply">
		 <li>
			<p>${reply.replyContent }</p>
			<div><span class="c7">${reply.userName }</span> · <span class="c9">${myfn:friendlyTime(reply.replyTime)}</span><a onclick="replySb(${reply.id},'${reply.userName }');" class="fr h_y" >回复</a></div>
		 </li>
	 </c:forEach>
</ul>
<%@include file="/pager.jsp"%>