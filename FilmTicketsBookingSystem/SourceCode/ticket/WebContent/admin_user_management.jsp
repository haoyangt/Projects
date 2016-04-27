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
<input type="button" value="添加"  onclick="document.getElementById('window_addadmin').style.display='block';document.getElementById('fade').style.display='block';"/>
<TABLE>
  <THEAD>
  <TR>
    <TH>用户名</TH>
    <TH>密码</TH>
    <TH>当前权限</TH>
    <TH>操作</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <c:forEach items="${requestScope.users }" var="user">
	<c:if test="${user.uno ne requestScope.uno }">
	<TR id="TR_${user.uno }">
		<TD>${user.username }</TD>
		<TD>${user.password }</TD>
		<TD>${user.permission.pname }</TD>
		<TD><a href="displayAdmin?uno=${user.uno }#TR_${user.uno }"> <input type="button" value="修改信息"></a><a href="deleteAdmin?uno=${user.uno }#TR_${user.uno }" onclick="return confirm('确定删除用户[ ${user.username} ]吗？')"> <input type="button" value="删除信息"></a></TD>
	</TR>
    </c:if>
    <c:if test="${user.uno eq requestScope.uno }">
	<TR id="TR_${user.uno }">
	<form action="updateAdmin?uno=${user.uno }" method="post" >
		<TD><input type="text" value="${user.username }"  size="12" name="username"/></TD>
		<TD><input type="text" value="${user.password }"  size="12" name="password"/></TD>
		<TD>
			<select name="status">
				<c:forEach items="${permissions }" var="permission">
					<c:if test="${user.permission.pname ne fn:split(permission,'_')[1] }"><option value="${fn:split(permission,'_')[0] }">${fn:split(permission,'_')[1] }</option></c:if>
					<c:if test="${user.permission.pname eq fn:split(permission,'_')[1] }"><option value="${fn:split(permission,'_')[0] }" selected="selected">${fn:split(permission,'_')[1] }</option></c:if>
					
				</c:forEach>  
			</select>
		</TD>
     	<TD><input type="submit"  value="完成修改"/> <a href="displayAdmin?#TR_${user.uno }"> <input type="button" value="取消修改"></a></TD>
     </form>
    </TR>
    </c:if>
   </c:forEach>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 管理员添加div --> 
<div id="window_addadmin" class="window">
<div class="window_title">
	<H2>管理员添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addadmin').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="addAdmin" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">用 户 名：</td>
			<td width="68%" align="left"><input type="text" maxlength="30" id= "username" name="username" > </td>
		</tr>
		<tr>
			<td width="32%" align="right">新 密 码：</td>
			<td width="68%" align="left"><input type="password" maxlength="30" id= "newpwd" name="newpwd" onblur="checkpwd()" onkeyup="checkpwd()"><span id="newpwdimg"></span> </td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><span id="magnitude"></span></td>
		</tr>
		<tr>
			<td align="right">密码验证：</td>
			<td align="left"><input type="password" maxlength="30" id="vpwd" name="vpwd" onblur="checkvpwd()" onkeyup="checkvpwd()"><span id="vpwdimg"></span></td>
		</tr>
		<tr>
			<td align="right">授予权限：</td>
			<td align="left"><select name="status"><c:forEach items="${permissions }" var="permission"><option value="${fn:split(permission,'_')[0] }">${fn:split(permission,'_')[1] }</option></c:forEach>  </select></td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><font color="red" size="1">${errorRegisterMsg }</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="注册" class="button">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addadmin').style.display='none';document.getElementById('fade').style.display='none';"> </td>
        </tr>
		
	</table>
	</form>
</div>
</div> 

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
<c:if test="${not empty sessionScope.errorRegisterMsg }">
	<script>document.getElementById('window_addadmin').style.display='block';document.getElementById('fade').style.display='block';</script>
</c:if>
</body>
<script type="text/javascript" src="js/showBigImage.js"></script>
</html>