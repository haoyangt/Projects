<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/jstl.jsp" %>     
 <%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>"/>
 
<div class="pageContent">
<form action="admin/company/upload" id="importCompany" target="_blank" method="post" enctype="multipart/form-data" class="pageForm required-validate">
	<div class="pageFormContent" layoutH="56" align="left">
		<table>
		<tr><td class="formLabel" colspan="2">企业批量导入</td></tr>
		<tr>
			<td class="formLabel" style="text-align:right">模版下载：</td>
			<td class="formTableTd"><a href="admin/download/module/1">企业批量导入模版.xls</a></td>
		</tr>
		<tr class="containerBody">
			<td class="formLabel" style="text-align:right"><label>导入文件：</label></td>
			<td class="formTableTd">
				<input type="file" name="xls"/>
			</td>
		</tr>
		<tr><td></td><td><input type="submit" value="提交"/></td></tr>
		</table>
	</div>
</form>
</div>
