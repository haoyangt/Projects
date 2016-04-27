<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>

<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="admin/company/index" method="post">
	<div class="searchBar">
	<input type="hidden" name="pageNum" value="${page.pageNum}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<table class="searchContent">
			<tr>
				<td>
					关键字：<input type="text" name="params[keywords]" value="${page.params.keywords}"/>
					激活码状态：<%-- <input type="text" name="params[cdkeyStatus]" value="${page.params.cdkeyStatus}"/> --%>
					<select name="params[cdkeyStatus]">
						<c:if test="${page.params.cdkeyStatus==null || page.params.cdkeyStatus==''}">
							<option value=""> </option>
							<option value="1">未使用</option>
							<option value="2">已使用</option>
						</c:if>
						<c:if test="${page.params.cdkeyStatus==1}">
							<option value="1">未使用</option>
							<option value="2">已使用</option>
							<option value=""> </option>
						</c:if>
						<c:if test="${page.params.cdkeyStatus==2}">
							<option value="2">已使用</option>
							<option value="1">未使用</option>
							<option value=""> </option>
						</c:if>
					</select>
					企业来源：
					<select name="params[companyStatus]">
						<c:if test="${page.params.companyStatus==null || page.params.companyStatus==''}">
							<option value=""> </option>
							<option value="2">注册</option>
							<option value="1">激活</option>
						</c:if>
						<c:if test="${page.params.companyStatus==2}">
							<option value="2">注册</option>
							<option value="1">激活</option>
							<option value=""> </option>
						</c:if>
						<c:if test="${page.params.companyStatus==1}">
							<option value="1">激活</option>
							<option value="2">注册</option>
							<option value=""> </option>
						</c:if>
					</select>
					企业认证
					<select name="params[companyAuthentication]">
						<c:if test="${page.params.companyAuthentication==null || page.params.companyAuthentication==''}">
							<option value=""> </option>
							<option value="2">已认证</option>
							<option value="1">未认证</option>
						</c:if>
						<c:if test="${page.params.companyAuthentication==2}">
							<option value="2">已认证</option>
							<option value="1">未认证</option>
							<option value=""> </option>
						</c:if>
						<c:if test="${page.params.companyAuthentication==1}">
							<option value="1">未认证</option>
							<option value="2">已认证</option>
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
			<li><a class="edit" href="admin/companyReview/sendInvitations/{sid_companyId}" height="450" target="dialog" rel="company_reviewPage"><span>邀请注册</span></a></li>
			<!-- <li><a class="add" href="admin/companyReview/sendInvitations/{sid_companyId}" height="450" target="dialog" rel="company_reviewPage"><span>邀请注册</span></a></li>
			<li><a class="delete" href="admin/companyReview/sendInvitations/{sid_companyId}" height="450" target="dialog" rel="company_reviewPage"><span>邀请注册</span></a></li>	 -->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="240">公司名称</th>
				<th width="120">公司简称</th>
				<th width="90">公司所在城市</th>
				<th width="200">HR邮箱</th>
				<th width="100">公司的性质</th>
				<th width="100">公司从事的领域</th>
				<th width="80">公司规模</th>
				<th width="80">审核状态</th>
				<th width="80">认证状态</th>
				<!-- <th width="80">在线job数</th>
				<th width="80">下线job数</th>
				<th width="80">job总数</th> -->
				<th width="100">公司激活码</th>
				<th width="80">激活码状态</th>
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
					<td>${data.email}</td>
					<td>${data.nature}</td>
					<td>${data.field}</td>
					<td>${data.scale}</td>
					<td>
						<c:choose>
							<c:when test="${data.certifyStatus}">已审核</c:when>
							<c:otherwise>待审核</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:if test="${data.authentication=='1'}">待认证</c:if>
						<c:if test="${data.authentication=='2'}">已认证</c:if>
						<%-- <c:choose>
							<c:when test="${data.authentication==2}">已认证</c:when>
							<c:otherwise>待认证</c:otherwise>
						</c:choose> --%>
					</td>
					<%-- <td>${data.legal}</td>
					<td>${data.illegal}</td>
					<td>${data.all}</td> --%>
					<td>${data.cdkey}</td>
					<td>
						<c:if test="${data.cdkeyStatus==1}">未使用</c:if>
						<c:if test="${data.cdkeyStatus==2}">已使用</c:if>
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
