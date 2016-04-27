<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ include file="/jstl.jsp" %>     
 <%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>"/>

<title>要实习后台</title>

<link href="res/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="res/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="res/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="res/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- ztree -->
<script src="res/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>
<script src="res/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="res/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="res/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="res/dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="res/dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="res/dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>
<script src="res/dwz/dwz.min.js" type="text/javascript"></script>
<script src="res/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	DWZ.init("res/dwz/dwz.frag.xml", {
		//loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
		loginUrl:"admin/login.jsp",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});

</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="javascript:void(0);">标志</a>
				<ul class="nav">
					<li><a href="javascript:void(0);">${adminUser.email }</a></li>
					<li><a href="admin/login/logout">退出</a></li>
				</ul>
			</div>
			<!-- navMenu -->
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionContent">
						<ul class="tree treeFolder collapse">
							<li><a href="javascript:void(0);">企业模块</a>
								<ul>
									<li><a href="admin/company/index" target="navTab" rel="company_index">企业总览</a></li>
									<li><a href="admin/company/import" target="navTab" rel="company_import">企业导入</a></li>
									<li><a href="admin/companyReview/index" target="navTab" rel="company_review_index">企业审核</a></li>
									<li><a href="admin/companyReview/authenticationIndex" target="navTab" rel="company_review_authenticationIndex">企业认证</a></li>
									<li><a href="admin/company/enterpriseRecord" target="navTab" rel="company_review_index">企业用户记录</a></li>
								</ul>
							</li>
							<li><a href="javascript:void(0);">用户模块</a>
								<ul>
									<li><a href="admin/company/uLogin" target="navTab" rel="company_uLogin">用户总览</a></li>
									<li><a href="admin/company/postRecord" target="navTab" rel="company_review_record">职位投递记录</a></li>
									<li><a href="admin/company/deliveryRecord" target="navTab" rel="user_toudijil">用户投递记录</a></li>
									<li><a href="admin/company/uRecordChart" target="navTab" rel="company_review_index">学生用户记录</a></li>
								</ul>
							</li>
							<li><a href="findFriendProposals" target="navTab" rel="company_findFriendProposals">线上活动</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="pageFormContent" layoutH="80" style="margin-right:230px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
		技术支持:
		<a href="http://www.szfore.com" title="http://www.szfore.com" target="_blank">深圳市远界管理咨询有限公司</a>
	</div>
</body>
</html>