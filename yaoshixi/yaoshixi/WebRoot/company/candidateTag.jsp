<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>

<c:if test="${empty page.results }">
	没有更多标签了，点击
	<a href="javascript:void(0);" onclick="loadCandidateTag()" class="hover_b">
		重新加载
	</a>
</c:if>

<c:if test="${not empty page.results }">
	<form action="company/candidateTag" method="post" id="candidateTagForm">
		<input type="hidden" name="pageNum" value="${page.pageNum + 1}">
		<input type="hidden" name="numPerPage" value="${page.numPerPage }">
		<c:forEach items="${page.results }" var="tagName">
			<span>${tagName }</span>	
		</c:forEach>
	</form>
</c:if>
	
<script>
	$(document).ready(function(){
		initUnselectedTag();
	});
</script>
