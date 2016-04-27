<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<base href="<%= basePath%>">
<title>学生名片</title>
</head>

<body style="font-family:黑体;padding:0;margin:0;">
<div style="width:100%;margin:0 auto;">
<div style="width:100%; overflow:hidden;">
  <div style="float:left; border-right:1px dashed #999; padding-right:10px;width:15%"> <img src="http://www.yaoshixi.com/res/images/images/img_01.png" width="52" height="101" style="float:left"/> </div>
  <div style="float:left;border-bottom:1px dotted #999;width:81%">
     <table width="100%" border="0">
  <tr>
    <td valign="middle" align="right" height="94" ><p style="float:left; font-size:18px; line-height:91px; text-align:center; margin:0 0 0 20px;">
    	${userBasicInfo.userName }   
    	<c:if test="${userBasicInfo.gender==0 || userBasicInfo.gender=='' || userBasicInfo.gender==null }">
                           （男）
        </c:if> 
        <c:if test="${userBasicInfo.gender==1 }">（女）</c:if>
       <!--  <span style="text-transform:uppercase; font-size:14px;color:#666">zhang</span></p>
      	<p style="float:left;font-size:30px; text-align:center; ">三<br />
        <span style="text-transform:uppercase;font-size:14px; color:#666">san</span></p>--></td> 
  </tr>
</table>
    
    
  </div>
</div>

<div style="width:100%; overflow:hidden;">
  <div style="float:left; border-right:1px dashed #999; padding-right:10px;width:15%"> <img src="http://www.yaoshixi.com/res/images/images/img_03.png" width="52" height="98"  style="float:left"/> </div>
  <div style="float:left;border-bottom:1px dotted #999; width:81%;">
      <table width="100%" border="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
  <tr>
    <td valign="middle" align="right" height="91" width="40px"><img src="http://www.yaoshixi.com/res/images/images/d.png" width="25"/></td>
    <td valign="middle" style="font-size:18px">${userBasicInfo.telPhone }</td>
  </tr>
</table>
  </div>
</div>

<div style="width:100%; overflow:hidden;">
  <div style="float:left; border-right:1px dashed #999; padding-right:10px;width:15%"> <img src="http://www.yaoshixi.com/res/images/images/img_04.png" width="52" height="98"  style="float:left"/> </div>
  <div style="float:left;border-bottom:1px dotted #999;width:81%;">
      <table width="100%" border="0">
  <tr>
    <td valign="middle" align="right" height="91" width="40px"><img src="http://www.yaoshixi.com/res/images/images/m.png" width="25"/></td>
    <td valign="middle" style="font-size:18px">${userBasicInfo.email }</td>
  </tr>
</table>
    
  </div>
</div>

<div style="width:100%; overflow:hidden;">
  <div style="float:left; border-right:1px dashed #999; padding-right:10px;width:15%"> <img src="http://www.yaoshixi.com/res/images/images/img_05.png" width="52" height="98"  style="float:left"/> </div>
  <div style="float:left;border-bottom:1px dotted #999; width:81%;">
   <table width="100%" border="0">
  <tr>
    <td valign="middle" align="right" height="91" width="40px"><img src="http://www.yaoshixi.com/res/images/images/f.png" width="25"/></td>
    <td valign="middle" style="font-size:18px">${education.university } --
    <c:if test="${education.grade !=null }">
    	${education.grade }
    </c:if>
    <c:if test="${education.grade ==null }">
    	未提供
    </c:if>
    </td>
  </tr>
</table>

   
  </div>
</div>

<div style="width:100%; overflow:hidden;">
  <div style="float:left; border-right:1px dashed #999; padding-right:10px;width:15%"> <img src="http://www.yaoshixi.com/res/images/images/img_06.png" width="52" height="98"  style="float:left"/> </div>
  <div style="float:left;border-bottom:1px dotted #999; width:81%;">
     <table width="100%" border="0">
  <tr>
    <td valign="middle" align="right" height="91" width="40px"><img src="http://www.yaoshixi.com/res/images/images/zhuan.png" width="25"/></td>
    <td valign="middle" style="font-size:18px">${education.major}</td>
  </tr>
</table>

  </div>
</div>

<div style="width:100%; overflow:hidden;">
  <div style="float:left; border-right:1px dashed #999; padding-right:10px;width:15%"> <img src="http://www.yaoshixi.com/res/images/images/img_07.png" width="52" height="98"  style="float:left"/> </div>
  <div style="float:left;border-bottom:1px dotted #999; width:81%;">
      <table width="100%" border="0">
  <tr>
    <td valign="middle" align="right" height="91" width="40px"><img src="http://www.yaoshixi.com/res/images/images/date.png" width="25"/></td>
    <td valign="middle" style="font-size:18px">可实习时间：<br>
    	<c:if test="${days==null && months==null}">
    		0天/周，0个月
    	</c:if>
    	<c:if test="${days!=null && months!=null}">
    		${days+1}天/周，${months+1}个月
    	</c:if>
    	<c:if test="${days==null && months!=null}">
    		0天/周，${months+1}个月
    	</c:if>
    	<c:if test="${days!=null && months==null}">
    		${days+1}天/周，0个月
    	</c:if>
    </td>
  </tr>
</table>
  </div>
</div>
<div class="login_top" style="text-align:center;">
  	<a href="http://www.yaoshixi.com/user/resumeWx/${userBasicInfo.userId }"><input  type="button" value="修改简历" style="-webkit-appearance:none;padding: 0 10px;
	height:35px;color:#fff;font-size:16px;background-color:#336699;border-top:1px solid #336699;border-left:1px solid #336699;border-right:1px solid #336699;
	border-bottom:1px solid #336699;-webkit-transition: background-color 300ms ease-out 0s;-moz-transition: background-color 300ms ease-out 0s;
    -o-transition: background-color 300ms ease-out 0s;-ms-transition: background-color 300ms ease-out 0s;
	transition: background-color 300ms ease-out 0s;cursor: pointer;"/></a>
 </div> 
 
</div>
</body>
</html>
