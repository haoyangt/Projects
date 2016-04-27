<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>company tags</title>
<script type="text/javascript">
	function showPanel() {
		var panel = $("#panel");
		if(panel.css("display") == "none") {
			$("#panel").show();
		} else {
			$("#panel").hide();
		}
	}
</script>
<style type="text/css">
.dl_flei{float:left;margin-bottom: 20px;width:100%; padding-top: 5px;}
	.dl_flei dd a{padding: 0 8px;white-space: nowrap;float:left; margin-bottom: 3px;}
	.dl_flei dd a:hover{color:#fff;background-color:#5C5C5C;}
</style>
</head>
<body>
	<dl class="dl_flei">
		<dt style="float: left; width:75px; font-weight: bold;">热门标签：</dt>
		<dd style="margin-left: 75px; display: block;">
			<a href="javascript:void(0)" onclick="searchCompanyByTag(this)" name="tag_company">全部</a>
			<a href="javascript:void(0)" onclick="searchCompanyByTag(this)" name="tag_company">美女多</a><a href="javascript:void(0)" onclick="searchCompanyByTag(this)" name="tag_company">五险一金</a>
			<a href="javascript:void(0)" onclick="searchCompanyByTag(this)" name="tag_company">福利很好</a><a href="javascript:void(0)" onclick="searchCompanyByTag(this)" name="tag_company">年底双薪</a>
		
		</dd>
	</dl>
</body>
</html>