<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="findFriendProposals" method="post" >
	<div class="searchBar">
	<input type="hidden" name="pageNum" value="${page.pageNum}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<table class="searchContent">
			<tr>
				<td>
					关键字：<input type="text" name="params[userName]" value="${page.params.userNames}"/>
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
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="180">用户名称</th>
				<th width="120">性别 </th>
				<th width="180">电话</th>
				<th width="180">邮箱</th>
				<th width="420">面试职位</th>
				<th width="450">设计目的</th>
				<th width="420">面试形式</th>
				<th width="450">面试描述</th>
				<th width="450">参考思路</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty page.results}">
			<tr>
					<td colspan="9" style="text-align:center"><span style="color:red">暂无数据</span></td>
				</tr>	
			</c:if>
			<c:forEach var="data" items="${page.results}">
				<tr>
					<td>${data.userName}</td>
					<td>
						<c:if test="${data.sex==0}">男</c:if>
						<c:if test="${data.sex==1}">女</c:if>
					</td>
					<td>${data.telPhone}</td>
					<td>${data.email}</td>
					<th>${data.jobInterview}</th>
					<th>${data.designGoal}</th>
					<th>${data.interviewForm}</th>
					<th>${data.descriptionInterview}</th>
					<th>${data.referenceIdeas}</th>
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
