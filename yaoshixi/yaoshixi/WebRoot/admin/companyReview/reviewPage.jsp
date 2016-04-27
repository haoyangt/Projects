<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>  
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>

<script type="text/javascript">
<!--

function reviewPassDone(json){
	DWZ.ajaxDone(json);
	if(json.statusCode == 200){
		navTab.reload(false,{navTabId:"company_review_index"});
		$.pdialog.closeCurrent();	
	}
}
//-->
</script> 
<div class="pageContent">
<form method="post" action="admin/companyReview/review/${companyInfo.id}" class="pageForm required-validate" onsubmit="return validateCallback(this, reviewPassDone);">
	<div class="pageFormContent" layoutH="56" align="center">
		<table width="100%" height="100%" >
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司名称：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.companyName}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司简称：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.companyShortName}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司所在城市：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.city}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司的logo图片：</label></td>
			<td class="formTableTd">
				<img alt="公司logo" width="100px" src="${companyInfo.companyLogo}">
			</td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司的email：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.email}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司的性质：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.nature}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司从事的领域：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.filedes}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司规模：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.scale}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司主页网址：</label></td>
			<td class="formTableTd"><p>
				<a href="${companyInfo.homePage }" target="_blank">公司主页网址</a>
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司介绍：</label></td>
			<td class="formTableTd"><p>
				${companyInfo.companyDesc}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司的发展阶段：</label></td>
			<td class="formTableTd"><p>
				${companyInfo.growthStage}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>备注：</label></td>
			<td class="formTableTd"><p>
				${companyInfo.mark}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>创始团队：</label></td>
			<td class="formTableTd"><p>
				${companyInfo.founder}
			</p></td>
		</tr>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">通过审核</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
</form>
</div>
