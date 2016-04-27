<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="admin/companyReview/index" method="post">
	<div class="searchBar">
	<input type="hidden" name="pageNum" value="${page.pageNum}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<table class="searchContent">
			<tr>
				<td>
					关键字：<input type="text" name="params[keywords]" value="${page.params.keywords}"/>
				</td>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="edit" href="admin/companyReview/reviewPage/{sid_companyId}" height="450" target="dialog" rel="company_reviewPage"><span>审核企业</span></a></li>
		</ul>
	</div>
	<table class="table" width="80%" layoutH="112">
		<thead>
			<tr>
				<th width="220">公司名称</th>
				<th width="220">公司简称</th>
				<th width="120">公司所在城市</th>
				<th width="130">公司的性质</th>
				<th width="150">公司从事的领域</th>
				<th width="150">公司规模</th>
				<th width="150">审核状态</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty page.results}">
			<tr>
					<td colspan="7" style="text-align:center"><span style="color:red">暂无数据</span></td>
				</tr>	
			</c:if>
			<c:forEach var="data" items="${page.results}">
				<tr target="sid_companyId" rel="${data.id}">
					<td>${data.companyName}</td>
					<td>${data.companyShortName}</td>
					<td>${data.city}</td>
					<td>${data.nature}</td>
					<td>${data.filedes}</td>
					<td>${data.scale}</td>
					<td>
						<c:choose>
							<c:when test="${data.certifyStatus}">已审核</c:when>
							<c:otherwise>待审核</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="15" <c:if test="${page.numPerPage eq 15}">selected="selected"</c:if> >15</option>
				<option value="50" <c:if test="${page.numPerPage eq 50}">selected="selected"</c:if> >50</option>
				<option value="100" <c:if test="${page.numPerPage eq 100}">selected="selected"</c:if> >100</option>
				<option value="200" <c:if test="${page.numPerPage eq 200}">selected="selected"</c:if> >200</option>
			</select>
			<span>条，共${page.totalRecord}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${page.totalRecord}" numPerPage="${page.numPerPage}" pageNumShown="5" currentPage="${page.pageNum}"></div>
	</div>
</div>
