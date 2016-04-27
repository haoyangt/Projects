<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="admin/company/deliveryRecord" method="post" >
	<div class="searchBar">
	<input type="hidden" name="pageNum" value="${page.pageNum}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<table class="searchContent">
			<tr>
				<td>
					关键字：<input type="text" name="params[userName]" value="${page.params.userName}"/>
					投简历的平台：<select name="params[terrace]">
						<c:if test="${page.params.terrace==null || page.params.terrace==''}">
							<option value=""> </option>
							<option value="1">网页</option>
							<option value="2">微信</option>
						</c:if>
						<c:if test="${page.params.terrace==1}">
							<option value="1">网页</option>
							<option value="2">微信</option>
							<option value=""> </option>
						</c:if>
						<c:if test="${page.params.terrace==2}">
							<option value="2">微信</option>
							<option value="1">网页</option>
							<option value=""> </option>
						</c:if>
					</select>
					
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
				<th width="320">用户名称</th>
				<th width="350">职位名称</th>
				<th width="320">公司名称</th>
				<th width="350">投递时间</th>
				<th width="350">状态</th>
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
					<td>${data.jobName }</td>
					<td>${data.companyName}</td>
					<td>${data.diliverTime}</td>
					<td>
						<c:if test="${data.status==0}">未查看</c:if>
			    		<c:if test="${data.status==1}">已查看</c:if>
			    		<c:if test="${data.status==2}">已下载</c:if>
			    		<c:if test="${data.status==4}">已拒绝</c:if>
			    		<c:if test="${data.status==8}">已通知面试</c:if>
			    		<c:if test="${data.status==6}">已转给同事</c:if>
			    		<c:if test="${data.status==7}">已录用</c:if>
			    		<c:if test="${data.status==5}">未处理</c:if>
			    		<c:if test="${data.status==9}">备选</c:if>
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
