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
<script type="text/javascript">
function setAllCheckBox(boxName){
	var f = document.operationtype;
	for(var i =0 ; i<f.elements.length; i++){
		if(f.elements[i].name == boxName){
			f.elements[i].checked = true;
		}
	}
}
function setFanCheckBox(boxName){
	var f = document.operationtype;
	for(var i =0 ; i<f.elements.length; i++){
		if(f.elements[i].name == boxName){
			if(f.elements[i].checked == true){
				f.elements[i].checked = false;
			}else{
				f.elements[i].checked = true;
			}
		}
	}
}
function checkCheckBoxSelection(boxName){
	var f = document.operationtype;
	var judgment="false";
	for(var i =0 ; i<f.elements.length; i++){
		if(f.elements[i].name == boxName){
			if(f.elements[i].checked == true){
				judgment="true";
			}
		}
	}
	return judgment;
}
</script>
<body>

${actionMessages[0] }
 <div class="order-detail" style="height: 100%;width: 20%;">
<DIV class=seatTab style="height: 100%">
<form action="" id="operationtype" name="operationtype" onsubmit="if(checkCheckBoxSelection('tablenames')=='false'){alert('请选择需要操作的表！');return false;}  if(document.getElementById('filename').value=='请输入目标文件地址'){alert('请输入目标地址！');return false;} if(document.getElementById('filename').value.indexOf('.xls')<=0){alert('请输入.xls文件！');return false;}">
<TABLE>
  <THEAD>
  <TR>
    <TH></TH>
    <TH>表名</TH>
    </TR></THEAD>
  <TBODY id=movie_seat>
  <c:forEach items="${requestScope.listTablename }" var="tablename">
	<TR>
		<TD width="20%"><input type="checkbox" value="${tablename }" name="tablenames"> </TD>
		<TD width="80%">${tablename }</TD>
	</TR>
	</c:forEach>
	<TR ><TD colspan="2"><a href="javascript:setAllCheckBox('tablenames');"> 全选</a> <a href="javascript:setFanCheckBox('tablenames');"> 反选</a></TD></TR>
	<TR ><TD colspan="2"><input type="text" id="filename"name="filename" value="请输入目标文件地址" onfocus="this.value=''" onblur="if(this.value=='')this.value='请输入目标文件地址'"> </TD></TR>
	<TR><TD><input type="submit" value="将数据导入excel" onclick="document.getElementById('operationtype').action='write'" /> </TD><TD><input type="submit" value="从excel导入数据" onclick="document.getElementById('operationtype').action='read'" /> </TD> </TR>
 </TBODY></TABLE>
</form>
 </DIV>

 </div>
</body>
</html>