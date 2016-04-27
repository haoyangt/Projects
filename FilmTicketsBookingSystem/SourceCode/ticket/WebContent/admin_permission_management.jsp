<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影管理</title>
<LINK rel="stylesheet" href="css/f2c00656.css">
<LINK rel="stylesheet" href="css/mycss.css">
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/myjs.js"></script>
</head>
<body>

	
 <div class="order-detail" style="height: 100%;width: 40%;">
<DIV class=seatTab style="height: 100%">
<input type="button" value="添加"  onclick="document.getElementById('window_addpermission').style.display='block';document.getElementById('fade').style.display='block';"/>
<TABLE>
  <THEAD>
  <TR>
    <TH>权限名</TH>
    <TH>可管理项目</TH>
    <TH>操作</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <c:forEach items="${requestScope.permissions }" var="permission">
	<c:if test="${permission.pno ne requestScope.pno }">
	<TR>
		<TD>${permission.pname }</TD>
		<TD >
			<c:forEach items="${permission.percontent }" var="percontent"  varStatus="i">
				${percontent.pname };<c:if test="${(i.index+1)%4 == 0 }"><br></c:if>
			</c:forEach>
		 </TD>
		<TD><a href="displayAllPermission?pno=${permission.pno }#TR_${permission.pno }"> <input type="button" value="修改信息"></a><a href="detelePermission?pno=${permission.pno }#TR_${permission.pno }" onclick="return confirm('确定删除[ ${permission.pname} ]权限吗？')"> <input type="button" value="删除信息"></a></TD>
	</TR>
    </c:if>
    <c:if test="${permission.pno eq requestScope.pno }">
	<TR>
	<form action="updateAllPermission?pno=${permission.pno }" method="post" >
		<TD><input type="hidden" name="pm_pno" value="${permission.pno }"/>
				<input type="text" value="${permission.pname }"  size="12" name="pmsname"/>
		</TD>
		<TD style="text-align: left;">
		
			<input type="checkbox" name="pname" value="电影管理">电影管理</input><br>
			<input type="checkbox" name="pname" value="影院管理">影院管理</input><br>
			<input type="checkbox" name="pname" value="影厅管理">影厅管理</input><br>
			<input type="checkbox" name="pname" value="影片上映管理">影片上映管理</input><br>
			<input type="checkbox" name="pname" value="轮播图管理">轮播图管理</input><br>
			<input type="checkbox" name="pname" value="用户管理">用户管理</input><br>
			<input type="checkbox" name="pname" value="权限管理">权限管理</input><br>
			<input type="checkbox" name="pname" value="excel导入导出">excel导入导出</input><br>
		 </TD>
     	<TD><input type="submit"  value="完成修改"/> <a href="displayAllPermission?#TR_${permission.pno }"> <input type="button" value="取消修改"></a></TD>
     </form>
    </TR>
    </c:if>
   </c:forEach>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 权限添加div --> 
<div id="window_addpermission" class="window">
<div class="window_title">
	<H2>权限添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addpermission').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="addPermission" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">权限名：</td>
			<td width="68%" align="left"><input type="text" maxlength="30" id= "pmsname" name="pmsname" > </td>
		</tr>
		<tr>
			<td width="32%" align="right">可用权限:</td>
			<td width="68%" align="left">
			<input type="checkbox" name="pname" value="电影管理">电影管理</input><br>
			<input type="checkbox" name="pname" value="影院管理">影院管理</input><br>
			<input type="checkbox" name="pname" value="影厅管理">影厅管理</input><br>
			<input type="checkbox" name="pname" value="影片上映管理">影片上映管理</input><br>
			<input type="checkbox" name="pname" value="轮播图管理">轮播图管理</input><br>
			<input type="checkbox" name="pname" value="用户管理">用户管理</input><br>
			<input type="checkbox" name="pname" value="权限管理">权限管理</input><br>
			<input type="checkbox" name="pname" value="excel导入导出">excel导入导出</input><br>
			</td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><font color="red" size="1">${errorRegisterMsg }</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="注册" class="button">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addpermission').style.display='none';document.getElementById('fade').style.display='none';"> </td>
        </tr>
		
	</table>
	</form>
</div>
</div> 

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
<c:if test="${not empty sessionScope.errorRegisterMsg }">
	<script>document.getElementById('window_addpermission').style.display='block';document.getElementById('fade').style.display='block';</script>
</c:if>
</body>
<script type="text/javascript" src="js/showBigImage.js"></script>
</html>