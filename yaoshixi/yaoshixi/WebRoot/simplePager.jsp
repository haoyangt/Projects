<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
 <!-- 分页down -->
 <div class="pages">
  	<pg:pager items="${page.totalRecord }" export="currentPageNumber=pageNumber" maxPageItems="${page.numPerPage}">
		<pg:prev>
			<a onclick="page(${pageNumber},${page.numPerPage });" id="prevPageUrl" style="cursor: pointer">上页</a>
		</pg:prev>
		<pg:pages>
			<c:choose>
				<c:when test="${page.pageNum eq pageNumber }">
					<font color="#007dd1">${page.pageNum }</font>
				</c:when>
				<c:otherwise>
					<a  onclick="page(${pageNumber},${page.numPerPage });" id="targetPages">${pageNumber}</a>
				</c:otherwise>
			</c:choose>
		</pg:pages>
		<pg:next>
			<a  onClick="page(${pageNumber},${page.numPerPage });" id="nextPageUrl" style="cursor: pointer">下页</a>
		</pg:next>
	</pg:pager>
	
	<div class="page_nu">
		共 <label style="color:#007dd1">${page.totalRecord } </label>条
	</div>
	<!-- 分页up -->
</div>