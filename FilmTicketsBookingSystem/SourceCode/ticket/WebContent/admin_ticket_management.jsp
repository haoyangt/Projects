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
<script type="text/javascript" src="js/183.js"></script>
</head>

<input type="button" value="添加"  onclick="document.getElementById('window_addticket').style.display='block';document.getElementById('fade').style.display='block';"/>
	
 <div class="order-detail" style="height: 100%;width: 98%;">
<DIV class=seatTab style="height: 100%">
<TABLE>
  <THEAD>
  <TR>
  	<TH width="10%"></TH>
    <TH width="15%">电影名</TH>
    <TH width="15%">影院名</TH>
    <TH width="10%">影厅名</TH>
    <TH width="10%">放映时间</TH>
    <TH width="10%">售票价格</TH>
    <TH width="10%">剩余座位</TH>
    <TH width="20%">相关操作</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <c:set var="count" value="100"></c:set>
  <c:set var="countIndex" value="0"></c:set>
  <c:forEach items="${requestScope.allTicket }" var="ticket" varStatus="step">
	<c:if test="${ticket.tno ne requestScope.tno }">
	<TR id="TR_${ticket.tno }" class="ticketTR">
		<c:if test="${countGroupByFno[countIndex-1] < count or countIndex==0}"> <TD rowspan="${countGroupByFno[countIndex] }"><img src="image/film/${ticket.poster }" width="100px" height="150px" onMouseOver="toolTip('<img src=image/film/${ticket.poster }>')" onMouseOut="toolTip()"> </TD>
		<TD rowspan="${countGroupByFno[countIndex] }"><strong> ${ticket.fname }</strong></TD><c:set var="count" value="1" /><c:set var="countIndex" value="${countIndex+1 }" /></c:if>
		<TD><span onMouseOver="toolTip('<img src=image/cinema/${ticket.logo }>')" onMouseOut="toolTip()">${ticket.cname }</span></TD>
		<TD>${ticket.hname }</TD>
		<TD>${ticket.time }</TD>
		<TD>${ticket.price }</TD>
		<TD>${ticket.restseat }</TD>
		<TD><a href="displayAllTicket?tno=${ticket.tno }#TR_${ticket.tno }"> <input type="button" value="修改信息"></a><a href="deleteTicket?tno=${ticket.tno }#TR_${ticket.tno }" onclick="return confirm('确定删除该信息吗?');"><input type="button" value="删除信息" ></a> </TD>
    </TR>
    <c:set var="count" value="${count+1 }" />
    </c:if>
    <c:if test="${ticket.tno eq requestScope.tno }">
	<TR id="TR_${ticket.tno }" class="ticketTR">
	<form action="updateTicket?tno=${ticket.tno }" method="post" >
		<c:if test="${countGroupByFno[countIndex-1] < count or countIndex==0 }"> <TD rowspan="${countGroupByFno[countIndex] }"><img src="image/film/${ticket.poster }" width="100px" height="150px" onMouseOver="toolTip('<img src=image/film/${ticket.poster }>')" onMouseOut="toolTip()"> </TD>
		<TD rowspan="${countGroupByFno[countIndex] }"><strong> ${ticket.fname }</strong></TD><c:set var="count" value="1" /><c:set var="countIndex" value="${countIndex+1 }" /> </c:if>
		<TD><span onMouseOver="toolTip('<img src=image/cinema/${ticket.logo }>')" onMouseOut="toolTip()">${ticket.cname }</span></TD>
		<TD>${ticket.hname } </TD>
		<TD><input type="text" value="${ticket.time }" name="time" size="5"/> </TD>
		<TD><input type="text" value="${ticket.price }" name="price" size="5"/> </TD>
		<TD><input type="text" value="${ticket.restseat }" name="restseat" size="4"/> </TD>
		<TD><input type="submit" value="完成修改" ><a href="displayAllTicket?#TR_${ticket.tno }" ><input type="button" value="取消修改"></a></TD>
    </form>
    </TR>
    <c:set var="count" value="${count+1 }" />
    </c:if>
    
   </c:forEach>
   <script type="text/javascript">
 $("tr.ticketTR").hover(function()
		 {
			 $(this).addClass("hover2");
		 },
		 function()
		{
			 $("tr.ticketTR").removeClass("hover2");
		 }
 );
 </script>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 上映信息添加div --> 
<div id="window_addticket" class="window">
<div class="window_title">
	<H2>上映信息添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addticket').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<script type="text/javascript">
window.onload = function(){
	setHallMsg();
};
	function setHallMsg(){
		var cno=document.getElementById("cno");
		var hno=document.getElementById("hno");
		var hallmsg=document.getElementById("hallmsg").value;
		var array=hallmsg.split(";");
		hno.options.length=0;
		for(var i=0;i<array.length;i++){
			if(array[i].split(",")[0]==cno.value){
				hno.options.add(new Option(array[i].split(",")[2],array[i].split(",")[1]));
			}
				
		}
	}
	
</script>
<div class="window_content">
<form action="addTicket" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">电影名:</td>
			<td width="68%" align="left">
				<select name="fno">
					<c:forEach items="${requestScope.listFnoFname }" var="fnofname">
						<c:set var="fnofnamearray" value="${fn:split(fnofname,';') }" />
						<option value="${fnofnamearray[0] }">${fnofnamearray[1] }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="32%" align="right">影院名:</td>
			<td width="68%" align="left">
				<select name="cno" onchange="setHallMsg()" id="cno">
					<c:forEach items="${requestScope.listCnoCname }" var="cnocname">
						<c:set var="cnocnamearray" value="${fn:split(cnocname,';') }" />
						<option value="${cnocnamearray[0] }">${cnocnamearray[1] }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="32%" align="right">影厅名:</td>
			<td width="68%" align="left">
				<select id="hno" name="hno">
				</select>
			</td>
		</tr>
		<tr>
			<td width="32%" align="right">放映时间:</td>
			<td width="68%" align="left">　<input type="text" name="time" size="6" /> </td>
		</tr>
		<tr>
			<td width="32%" align="right">价　格:</td>
			<td width="68%" align="left">￥<input type="text" name="price" size="6" /> </td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="添加" class="button" onclick="return confirm('确认添加上映信息吗？');document.getElementById('window_addticket').style.display='none';document.getElementById('fade').style.display='none';">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addticket').style.display='none';document.getElementById('fade').style.display='none';"> </td>
        </tr>
	</table>
	<input type="hidden" value="${requestScope.cnoHnoHnameStr }" id="hallmsg">
	</form>
</div>
</div> 
 <!-- 上映信息添加div end--> 

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
</body>
<script type="text/javascript" src="js/showBigImage.js"></script>
</html>