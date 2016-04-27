<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>  
<%@ include file="/basePath.jsp" %>
<base href="<%=basePath%>"/>
<script type="text/javascript">

function reviewPassDone(json){
	DWZ.ajaxDone(json);
	if(json.statusCode == 200){
		navTab.reload(false,{navTabId:"company_review_record"});
		$.pdialog.closeCurrent();	
	}
}

function sendInvitations(){
	var name = $("#name").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	$.ajax({
		type:'POST',
		url:'admin/company/exportExcels',
		data:{'name':name,'startTime':startTime,'endTime':endTime},
		dataType:'json',
	    success:function(json) {
	    	alert(json.msg);
	    	$.pdialog.closeCurrent();
	    }
	}); 
}
</script> 
<div class="pageContent">
<form method="post" action="admin/company/exportExcels" class="pageForm required-validate" >
	<div class="pageFormContent" layoutH="56" align="center">
		<table width="100%" height="100%" >
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>起始时间：</label></td>
			<td class="formTableTd"><p>
				<input type="text" name="startTime" id="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>结束时间：</label></td>
			<td class="formTableTd"><p>
				<input type="text" name="endTime" id="endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
			</p></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align: right"><label>导出名称为：</label></td>
			<td class="formTableTd"><p>
				<input type="text" name="name" id="name" >
			</p></td>
		</tr>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit" >确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
</form>
</div>
