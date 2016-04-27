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
<form method="post" action="admin/companyReview/reviewAuthentication/${companyInfo.id}" class="pageForm required-validate" onsubmit="return validateCallback(this, reviewPassDone);">
	<div class="pageFormContent" layoutH="56" align="center">
		<table width="100%" height="100%" >
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>营业执照：</label></td>
			<td class="formTableTd">
				<img alt="营业执照" width="750px" src="user/getHeadPhoto?ImgPath=${companyInfo.businessLicense}">
			</td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>组织机构代码证：</label></td>
			<td class="formTableTd">
				<img alt="组织机构代码证" width="750px" src="user/getHeadPhoto?ImgPath=${companyInfo.organizationCode}">
			</td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司名称：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.companyName}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司所在城市：</label></td>
			<td class="formTableTd"><p>
			${companyInfo.city}
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
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">通过验证</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
</form>
</div>
