<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>轮播图管理</title>
<LINK rel="stylesheet" href="css/f2c00656.css">
<LINK rel="stylesheet" href="css/mycss.css">
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/myjs.js"></script>
</head>
<body>
${actionMessages[0] }
 <div class="order-detail" style="height: 100%;width: 60%;">
<DIV class=seatTab style="height: 100%">
<input type="button" value="添加"  onclick="document.getElementById('window_addslideimg').style.display='block';document.getElementById('fade').style.display='block';"/>
<TABLE>
  <THEAD>
  <TR>
    <TH></TH>
    <TH>影片名</TH>
    <TH>标题</TH>
    <TH>评分</TH>
    <TH>链接地址</TH>
    <TH>相关操作</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <!-- 修改img的表单  start-->
  <form name="form_updateimg" method="post" ENCTYPE="multipart/form-data"  action="updateSlideimg" /> 
	<input type="file" name="updateimg" style="display:none;" onchange="document.form_updateimg.submit.click();" /> 
	<input type="submit" name="submit" style="display:none;" /> 
	<input type="hidden" name="updateimgsno"></input>
	</form> 
<!-- 修改img表单 end-->
  <c:forEach items="${requestScope.slideimg }" var="info">
	<c:if test="${info.sno ne requestScope.sno }">
	<TR id="TR_${info.sno }">
		<TD> <img src="image/slide_picture/${info.img }" width="130" height="60"  onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgsno.value='${info.sno }'"onMouseOver="toolTip('<img src=image/slide_picture/${info.img }>')" onMouseOut="toolTip()"></TD>
		<TD>${info.sname }</TD>
		<TD>${info.title }</TD>
		<TD><strong>${info.score1 }</strong>.${info.score2 }</TD>
		<TD>${info.href }</TD>
		<TD><a href="displaySlideinfo?sno=${info.sno }#TR_${info.sno }"> <input type="button" value="修改信息"></a><a href="deleteSlideinfo?sno=${info.sno }#TR_${info.sno }" onclick="return confirm('确定删除该轮播图信息[ ${info.sname} ]吗？')"> <input type="button" value="删除信息"></a></TD>
	</TR>
    </c:if>
    <c:if test="${info.sno eq requestScope.sno }">
	<TR id="TR_${info.sno }">
	<form action="updateSlideinfo?sno=${info.sno }" method="post" >
		<TD> <img src="image/slide_picture/${info.img }" width="130" height="60" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgsno.value='${info.sno }'"onMouseOver="toolTip('<img src=image/slide_picture/${info.img }>')" onMouseOut="toolTip()"></TD>
		<TD><input type="text" value="${info.sname }"  size="12" name="sname"/></TD>
		<TD><input type="text" value="${info.title }"  size="26" name="title"/></TD>
		<TD>
			<select name="score1">
					<c:forEach	begin="0" end="9" var="i" step="1">
						<c:if test="${i eq info.score1 }"><option value="${i }" selected="selected">${i }</option></c:if>
						<c:if test="${i ne info.score1 }"><option value="${i }">${i }</option></c:if>
					</c:forEach>
				</select> .
				<select name="score2">
					<c:forEach	begin="0" end="9" var="i" step="1">
						<c:if test="${i eq info.score2 }"><option value="${i }" selected="selected">${i }</option></c:if>
						<c:if test="${i ne info.score2 }"><option value="${i }">${i }</option></c:if>
					</c:forEach>
				</select> 
		</TD>
		<TD><input type="text" value="${info.href }"  size="12" name="href"/></TD>
     	<TD><input type="submit"  value="完成修改"/> <a href="displaySlideinfo?#TR_${info.sno }"> <input type="button" value="取消修改"></a></TD>
     </form>
    </TR>
    </c:if>
   </c:forEach>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 管理员添加div --> 
<div id="window_addslideimg" class="window">
<div class="window_title">
	<H2>轮播图信息添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addslideimg').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="addSlideinfo" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">影片名:</td>
			<td width="68%" align="left"><input type="text" size="30" id= "sname" name="sname" > </td>
		</tr>
		<tr>
			<td width="32%" align="right">标　题:</td>
			<td width="68%" align="left"><input type="text" size="30" id= title name="title"></td>
		</tr>
		<tr >
			<td align="right">海报图片:</td>
			<td  colspan="2" align="center" ></td>
		</tr>
		<tr>
			<td align="right">评　分:</td>
			<td align="left">
				<select name="score1">
					<c:forEach	begin="0" end="9" var="i" step="1">
					<c:if test="${i eq 7}"><option value="${i }" selected="selected">${i }</option></c:if>
					<c:if test="${i ne 7}"><option value="${i }">${i }</option></c:if>
					</c:forEach>
				</select> .
				<select name="score2">
					<c:forEach	begin="0" end="9" var="i" step="1">
					<option value="${i }">${i }</option>
					</c:forEach>
				</select> 
			</td>
		</tr>
		<tr>
			<td align="right">链接地址:</td>
			<td align="left"><input type="text" name="href" size="30"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="添加" class="button">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addslideimg').style.display='none';document.getElementById('fade').style.display='none';"> </td>
        </tr>
		
	</table>
	</form>
</div>
</div> 

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
<c:if test="${not empty sessionScope.errorRegisterMsg }">
	<script>document.getElementById('window_addslideimg').style.display='block';document.getElementById('fade').style.display='block';</script>
</c:if>
</body>
<script type="text/javascript" src="js/showBigImage.js"></script>
</html>