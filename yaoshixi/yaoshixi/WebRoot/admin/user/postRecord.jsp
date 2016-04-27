<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>



<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="admin/company/postRecord" method="post">
	<div class="searchBar">
	<input type="hidden" name="pageNum" value="${page.pageNum}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<table class="searchContent">
			<tr>
				<td>
					起始时间：<input type="text" name="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${startTime }"/>
				</td>
				<td>
					结束时间：<input type="text" name="endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${endTime }"/>
				</td>
				<td>
					公司名称：<input type="text" name="companyName"  value="${companyName }"/>
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
			<li><a class="edit" href="admin/company/postRecordExcel" height="450" target="dialog" rel="company_reviewPage"><span>导出Excel</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="10%">发布时间</th>
				<th width="5%">地区</th>
				<th width="10%">公司名称</th>
				<th width="20%">公司简介</th>
				<th width="8%">联系电话</th>
				<th width="10%">HR邮箱</th>
				<th width="10%">发布的职位</th>
				<th width="5%">接受简历量</th>
				<th width="5%">职位浏览量</th>
				<th width="5%">激活码</th>
				<th width="5%">激活码状态</th>
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
					<td>${data.publishTime}</td>
					<td>${data.city}</td>
					<td>${data.companyName}</td>
					<td>${data.companyDesc}</td> 
					<td>${data.phone}</td>
					<td>${data.email}</td>
					<td>${data.jobName}</td>
					<td>${data.count}</td>
					<td>${data.pageView}</td>
					<td>${data.cdkey}</td>
					<td>
						<c:if test="${data.cdkeyStatus == 1}">未使用</c:if>
						<c:if test="${data.cdkeyStatus == 2}">已使用</c:if>
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
