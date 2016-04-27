<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%= basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="http://www.yaoshixi.com/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/skeleton.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tb_int{margin:0 auto;width:660px;}
.tb_int tr td{padding:4px;}
.wh{width:100%;}
.available {
	color:#000000
}
.invailable {
	color:#cccccc
}
</style>
</head>
<body  class="body_cs" onload="index">
	<div id="body">
	<div class="co_jl">
		<div class="login_top">
            	<div class="jl_title">${users.userName }的简历</div>
            </div>
		<div class="js_n fl wh" >
			<strong>基本信息</strong>
		</div>
		<div class="xiangq fl wh">
			<div class="xq_xin">
				<p>
				<label>${users.userName }</label>|<label>${users.gender==0?'男':'女' }</label>|<label>${users.resume.birthDay
					}</label>
			</p>
			<p><label>所居城市：</label><label>${users.city}</label></p>
			<p>
				<label>希望的工作性质：</label>
			     <label>
	           		<c:if test="${users.timeAvailable==1 }">全职</c:if>
	           	</label>
	           	<label>
	           		<c:if test="${users.timeAvailable==2 }">按天</c:if>
	           	</label>
	           	<label>
	           		<c:if test="${users.timeAvailable==3 }">按小时</c:if>
	           	</label>
				
			</p>
			<p>
				<label>${users.telPhone }</label>|<label>${users.email }</label>
			</p>
		</div>
		<div class="qt_r">
		<c:if test="${users.headImg=='' || users.headImg ==null}"><img src="http://www.yaoshixi.com/res/images/cor.png" width="134" height="125"></c:if>
		<c:if test="${users.headImg!='' && users.headImg !=null}"><img src="user/getHeadPhoto?ImgPath=${users.headImg}" width="134" height="125"></c:if>
	</div>
	<div class="clear"></div>
</div>
	
	
	<div class="js_n fl wh">
		<strong>教育背景</strong>
	</div>
	<div class="xiangq fl wh">
		<div class="xq_xin">
			<div class="shix_li">
				<p>
					<label>${users.enterUniversityYear }~至今</label>
				</p>
				<p>
					<label>${users.university}</label>•<label>${users.college }</label>|<label>${users.major}</label>•<label>
					<c:if test="${users.education==2 }">高中 </c:if>
               	 	<c:if test="${users.education==3 }">大专 </c:if>
               	 	<c:if test="${users.education==4 }">本科 </c:if>
               	 	<c:if test="${users.education==5 }">硕士</c:if>
               	 	<c:if test="${users.education==6 }">博士</c:if>	
				</label>
				</p>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	
	
	<div class="js_n fl wh">
		<strong>自我描述</strong>
	</div>
	<div class="xiangq fl wh">
		<div class="xq_xin">
			<div class="shix_li">
			<p style="padding-right: 40px;">${users.selfDescription}</p>
		</div>
		</div>
		<div class="clear"></div>
	</div>
	
	
	<div class="js_n fl wh">
		<strong>特长</strong>
	</div>
	<div class="xiangq fl wh">
		<div class="xq_xin">
			<div class="shix_li">
			<p style="padding-right: 40px;">${users.speciality}</p>
		</div>
		</div>
		<div class="clear"></div>
	</div>
	
	
	<div class="js_n fl wh">
		<strong>实习经历</strong>
	</div>
	<div class="xiangq fl wh">
		<div class="xq_xin">
			<c:forEach items="${interns }" var="intern">
				<div class="shix_li">
					<p>${intern.hireDate }~${intern.leaveDate }</p>
					<table>
						<tr>
							<td rowspan="2" width="65px"><img src="res/images/gs/gs_2.png"
								width="60" height="60"></td>
							<td><label class="f16">${intern.jobName }</label></td>
						</tr>
						<tr>
							<td>${intern.companyName }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	<div class="clear"></div>
	</div>
	</div>
</div>
</body>
</html>
