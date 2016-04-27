<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
 <!-- 分页down -->
 <div class="pages">
  	<pg:pager items="${page.totalRecord }" export="currentPageNumber=pageNumber" maxPageItems="${page.numPerPage}">
		<pg:first>
			<a onclick="page(${pageNumber},${page.numPerPage });"  id="firstPageUrl" style="cursor: pointer" >首页</a>
		</pg:first>
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
		<pg:last>
			<a  onclick="page(${pageNumber},${page.numPerPage });"  id="endPageUrl"  style="cursor: pointer" >尾页</a>
		</pg:last>
	</pg:pager>
	
	<div class="page_nu">
		&nbsp;共 <label style="color:#007dd1">${page.totalRecord } </label>条
		&nbsp;每页${page.numPerPage }条
	</div>
	<!-- 分页up -->
</div>