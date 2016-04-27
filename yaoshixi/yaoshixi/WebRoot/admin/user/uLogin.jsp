<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="admin/company/uLogin" method="post" >
	<div class="searchBar">
	<input type="hidden" name="pageNum" value="${page.pageNum}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<table class="searchContent">
			<tr>
				<td>
					关键字：<input type="text" name="params[userName]" value="${page.params.userName}"/>
					<input name="params[roleId]" value="2" style="display: none;">
						<%-- <c:if test="${page.params.roleId==null || page.params.roleId==''}">
							<option value=""> </option>
							<option value="1">企业</option>
							<option value="2">学生</option>
						</c:if>
						<c:if test="${page.params.roleId==1}">
							<option value="1">企业</option>
							<option value="2">学生</option>
							<option value=""> </option>
						</c:if>
						<c:if test="${page.params.roleId==2}">
							<option value="2">学生</option>
							<option value="1">企业</option>
							<option value=""> </option>
						</c:if>
					</select> --%>
					
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
				<th width="220">用户名称</th>
				<th width="150">性别 </th>
				<th width="220">出生年月</th>
				<th width="150">电话</th>
				<th width="200">所在城市</th>
				<th width="450">学校</th>
				<th width="350">专业</th>
				<th width="150">学历</th>
				<th width="150">入学年份</th>
				<th width="300">邮箱</th>
				<th width="650">通过什么途径知道要实习</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty page.results}">
			<tr>
					<td colspan="7" style="text-align:center"><span style="color:red">暂无数据</span></td>
				</tr>	
			</c:if>
			<c:forEach var="data" items="${page.results}">
				<tr>
					<td>${data.userName}</td>
					<td>
						<c:if test="${data.gender==0}">男</c:if>
						<c:if test="${data.gender==1}">女</c:if>
					</td>
					<td>${data.birthDay}</td>
					<td>${data.telPhone}</td>
					<td>${data.city}</td>
					<td>${data.university}</td>
					<%-- <td>${data.college}</td> --%>
					<td>${data.major}</td>
					<td>
						<c:if test="${data.education==2}">高中 </c:if>
                   	 	<c:if test="${data.education==3}">专科</c:if>
                   	 	<c:if test="${data.education==4}">本科 </c:if>
                   	 	<c:if test="${data.education==5}">硕士</c:if>
                   	 	<c:if test="${data.education==6}">博士</c:if>
					</td>
					<td>${data.enterUniversityYear}</td>
					<td>${data.email}</td>
					<td>${data.approach}</td>
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
