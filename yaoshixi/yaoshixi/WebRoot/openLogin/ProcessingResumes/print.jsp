<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
function preview(oper){  
	if (oper < 10){  
		bdhtml=window.document.body.innerHTML;//获取当前页的html代码  
		sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域  
		eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域  
		prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html  
		prnhtmlprnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html  
		window.document.body.innerHTML=prnhtml;  
		window.print();  
		window.document.body.innerHTML=bdhtml;  
	} else {  
		window.print();  
	}  
}  
</script>
<style type="text/css">
.available {
	color:#000000
}
.invailable {
	color:#cccccc
}
@media print {
.noprint { display: none;color:green }
} 
</style>
<!--startprint1-->
<div class="ktname_b">
	<strong>基本信息</strong>
</div>
<div class="xiangq">
	<div class="xq_xin">
		<p>
			<label>${resume.userName }</label>|<label>${resume.gender==0?'男':'女' }</label>|
			<label> <fmt:formatDate value="${resume.birthDay}" pattern="yyyy/MM " type="date"/> </label>
		</p>
		<p>
			<label>求职意向：${resume.category}~${resume.jobCity }~
									<c:if test="${timeAvailable==1 }">全职</c:if>
                            		<c:if test="${timeAvailable==2 }">按天</c:if>
                            		<c:if test="${timeAvailable==3 }">按小时</c:if>
            </label>
		</p>
		<p>
			<label>${resume.telPhone }</label>|<label>${resume.email }</label>
		</p>
	</div>
	<%-- <div class="qt_r">
		<c:if test="${resume.headImg=='' || resume.headImg==null}"><img src="res/images/cor.png" width="134" height="125"></c:if>
		<c:if test="${resume.headImg!='' && resume.headImg!=null}"><img src="user/getHeadPhoto?ImgPath=${resume.headImg}" width="134" height="125"></c:if>
	</div> --%>
	<div class="clear"></div>
</div>


<div class="ktname_b">
	<strong>教育经历</strong>
</div>
<div class="xiangq">
	<div class="xq_xin">
		<div class="shix_li">
			<p>
				<label>${resume.enterUniversityYear }~至今</label>
			</p>
			<p>
				<label>${resume.university}</label>•<label>${resume.college }</label>|<label>${resume.major}</label>•<label>
					<c:if test="${resume.education==2 }">高中 </c:if>
               	 	<c:if test="${resume.education==3 }">大专 </c:if>
               	 	<c:if test="${resume.education==4 }">本科 </c:if>
               	 	<c:if test="${resume.education==5 }">硕士</c:if>
               	 	<c:if test="${resume.education==6 }">博士</c:if>
				</label>
			</p>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div class="ktname_b">
	<strong>专业能力</strong>
</div>
<div class="xiangq">
	<div class="xq_xin">
		<div class="zpzs_li">
			<p style="padding-right: 40px;">${resume.majorAbility}</p>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div class="ktname_b">
	<strong>技术特长</strong>
</div>
<div class="xiangq">
	<div class="xq_xin">
		<div class="zpzs_li">
			<p style="padding-right: 40px;">${resume.speciality}</p>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div class="ktname_b">
	<strong>自我描述</strong>
</div>
<div class="xiangq">
	<div class="xq_xin">
		<p style="padding-right: 40px;">${resume.selfDescription}</p>
	</div>
	<div class="clear"></div>
</div>
<!-- <div class="ktname_b">
	<strong>实习经历</strong>
</div>
<div class="xiangq">
	<div class="xq_xin">
		<div class="shix_li">
			<p>2011.09~至今</p>
			<table>
				<tr>
					<td rowspan="2" width="65px"><img src="res/images/gs/gs_2.png"
						width="60" height="60"></td>
					<td><label class="f16">实习助理</label></td>
				</tr>
				<tr>
					<td>深圳市远界管理咨询有限公司</td>
				</tr>
			</table>
		</div>
		<div class="shix_li">
			<p>2011.09~至今</p>
			<table>
				<tr>
					<td rowspan="2" width="65px"><img src="res/images/gs/gs_2.png"
						width="60" height="60"></td>
					<td><label class="f16">实习助理</label></td>
				</tr>
				<tr>
					<td>深圳市远界管理咨询有限公司</td>
				</tr>
			</table>
		</div>
	</div> -->
	<div class="clear"></div>
<!--endprint1--> 
	<!-- <div><INPUT onclick=javascript:preview(1) type=button value=打印 name=button_print class=noprint /></div> -->
</div>
