<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>  
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>
<script type="text/javascript">

function reviewPassDone(json){
	DWZ.ajaxDone(json);
	if(json.statusCode == 200){
		navTab.reload(false,{navTabId:"company_review_index"});
		$.pdialog.closeCurrent();	
	}
}

function sendInvitations(){
	var email = $("#email").val();
	var cdkey = "${companyInfo.cdkey}";
	var cdkeyStatus = "${companyInfo.cdkeyStatus}";
	var companyName = "${companyInfo.companyName}";
	$.ajax({
		type:'POST',
		url:'admin/companyReview/sendInvitationEmail',
		data:{'email':email,'cdkey':cdkey,'cdkeyStatus':cdkeyStatus,'companyName':companyName},
		dataType:'json',
	    success:function(json) {
	    	alert(json.msg);
	    	$.pdialog.closeCurrent();
	    }
	}); 
}
</script> 
<div class="pageContent">
<form method="post" id="sdsd" action="admin/companyReview/sendInvitationEmail" class="pageForm required-validate" onsubmit="return validateCallback(this, reviewPassDone);">
	<div class="pageFormContent" layoutH="56" align="center">
		<table width="100%" height="100%" >
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>公司名称：</label></td>
			<td class="formTableTd"><p>
				${companyInfo.companyName}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>激活码：</label></td>
			<td class="formTableTd"><p>
				${companyInfo.cdkey}
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>激活码状态：</label></td>
			<td class="formTableTd"><p>
			    <c:if test="${companyInfo.cdkeyStatus==1}">未使用</c:if>
				<c:if test="${companyInfo.cdkeyStatus==2}">已使用</c:if>
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>HR邮箱：</label></td>
			<td class="formTableTd"><p>
				<input type="text" name="email" id="email" >
			</p></td>
		</tr>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="sendInvitations()">发送邀请</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
</form>
</div>
