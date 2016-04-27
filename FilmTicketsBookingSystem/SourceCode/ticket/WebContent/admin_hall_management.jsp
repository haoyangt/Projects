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

<input type="button" value="添加"  onclick="document.getElementById('window_addhall').style.display='block';document.getElementById('fade').style.display='block';"/>
	
 <div class="order-detail" style="height: 100%;width: 98%;">
<DIV class=seatTab style="height: 100%">
<TABLE>
  <THEAD>
  <TR>
  	<TH width="10%"></TH>
    <TH width="10%">影院名</TH>
    <TH width="10%">影厅名</TH>
    <TH width="30%">备注</TH>
    <TH width="10%">座位上限</TH>
    <TH width="30%">操作</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <c:set var="count" value="100"></c:set>
  <c:set var="countIndex" value="0"></c:set>
  <c:forEach items="${requestScope.allHall }" var="hall" varStatus="step">
	<c:if test="${hall.hno ne requestScope.hno }">
	<TR id="TR_${hall.hno }" class="hallTR">
		<c:if test="${countGroupByCno[countIndex-1] < count or countIndex==0}"> <TD rowspan="${countGroupByCno[countIndex] }"><img src="image/cinema/${hall.logo }" width="150px" height="90px" onMouseOver="toolTip('<img src=image/cinema/${hall.logo }>')" onMouseOut="toolTip()"> </TD>
		<TD rowspan="${countGroupByCno[countIndex] }"><strong> ${hall.cname }</strong></TD><c:set var="count" value="1" /><c:set var="countIndex" value="${countIndex+1 }" /></c:if>
		<TD>${hall.hname }</TD>
		<TD>${hall.remark }</TD>
		<TD><c:if test="${hall.maxseat eq 0}"><font color="#FF0000"><strong> 未添加座位！</strong></font> </c:if><c:if test="${hall.maxseat ne 0}"> ${hall.maxseat }</c:if></TD>
		<TD><a href="displayAllHall?hno=${hall.hno }#TR_${hall.hno }"> <input type="button" value="修改信息"></a><a href="displaySeatselection?hno=${hall.hno }"> <input type="button" value="修改座位"></a><a href="deleteHall?hno=${hall.hno }" onclick="return confirm('确定删除影厅 [ ${hall.hname} ] 吗?');"><input type="button" value="删除影厅" ></a> </TD>
    </TR>
    <c:set var="count" value="${count+1 }" />
    </c:if>
    <c:if test="${hall.hno eq requestScope.hno }">
	<TR id="TR_${hall.hno }" class="hallTR">
	<form action="updateHall?hno=${hall.hno }" method="post" >
		<c:if test="${countGroupByCno[countIndex-1] < count or countIndex==0 }"> <TD rowspan="${countGroupByCno[countIndex] }"><img src="image/cinema/${hall.logo }" width="150px" height="90px" onMouseOver="toolTip('<img src=image/cinema/${hall.logo }>')" onMouseOut="toolTip()"> </TD>
		<TD rowspan="${countGroupByCno[countIndex] }"><strong> ${hall.cname }</strong></TD><c:set var="count" value="1" /><c:set var="countIndex" value="${countIndex+1 }" /> </c:if>
		<TD><input type="text" value="${hall.hname }" name="hname" /> </TD>
		<TD><textarea rows="8" cols="30" name="remark">${hall.remark }</textarea> </TD>
		<TD><c:if test="${hall.maxseat eq 0}"><font color="#FF0000"><strong> 未添加座位！</strong></font> </c:if><c:if test="${hall.maxseat ne 0}"> ${hall.maxseat }</c:if></TD>
		<TD><input type="submit" value="完成修改" ><a href="displaySeatselection?hno=${hall.hno }" ><input type="button" value="修改座位"></a><a href="deleteHall?hno=${hall.hno }" onclick="return confirm('确定删除影厅 [ ${hall.cname} ] 吗?');"><input type="button" value="删除影厅"></a></TD>
    </form>
    </TR>
    <c:set var="count" value="${count+1 }" />
    </c:if>
    
   </c:forEach>
   <script type="text/javascript">
 $("tr.hallTR").hover(function()
		 {
			 $(this).addClass("hover2");
		 },
		 function()
		{
			 $("tr.hallTR").removeClass("hover2");
		 }
 );
 </script>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 影厅添加div --> 
<div id="window_addhall" class="window">
<div class="window_title">
	<H2>影厅添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addhall').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="addHall" method="post">
	<table width="34%">
	<H2><font color="#FF0000"><strong>请在影厅创建后添加座位......</strong></font></H2>
		<tr>
			<td width="32%" align="right">影厅名：</td>
			<td width="68%" align="left"><input type="text" name="hname"> </td>
		</tr>
		<tr>
			<td width="32%" align="right">所属影院:</td>
			<td width="68%" align="left">
				<select name="cno">
					<c:forEach items="${requestScope.listCnoCname }" var="cnocname">
						<c:set var="cnocnamearray" value="${fn:split(cnocname,';') }" />
						<option value="${cnocnamearray[0] }">${cnocnamearray[1] }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="32%" align="right">备　注：</td>
			<td width="68%" align="left"><textarea rows="6" cols="24" name="remark"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="添加" class="button" onclick="return confirm('确认添加影厅吗？');document.getElementById('window_addhall').style.display='none';document.getElementById('fade').style.display='none';">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addhall').style.display='none';document.getElementById('fade').style.display='none';"> </td>
        </tr>
	</table>
	</form>
</div>
</div> 
 <!-- 影厅添加div end--> 

<!-- 弹出选座窗口 -->
<style> 
        .window_seatselection { 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%;
            width: 100%; 
            height: 230%; 
            background-color:#000000;
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=80); 
        } 
        .submitButton{
        	width:100px;    
         	height:40px;   
         	left:200px;
        	background:url(image/button.png) no-repeat center;    
         	cursor:pointer; 
        }
    </style>
    <script>
    function showSeatWindow(){
    	document.getElementById('seatselection').style.display='block';
    }
    </script>
<div id="seatselection" class="window_seatselection">
<c:set var="seatsequence" value="${requestScope.seatsequence }"></c:set>
<c:set var="row" value="1"></c:set>
<c:set var="column" value="1"></c:set>
<H2><font color="#FFFFFF" size="2"><strong> >>绿色表示可选座位，灰色表示无座位....请根据需求调整座位</strong></font><a href="displayAllHall" onclick="document.getElementById('seatselection').style.display='none';"> <SPAN class=seatPop-close></SPAN></a></H2>
<br />
<font color="#FFFFFF" size="2" ><strong>我想将座位改为<select id="customrow"><c:forEach begin="1" end="13" step="1" var="i"><option value="${i }">${i }</option> </c:forEach> </select> 排<select id="customcol"> <c:forEach begin="1" end="30" step="1" var="i"><option value="${i }">${i }</option> </c:forEach></select>座&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="修改" id="changeseat"/> </strong></font>
<br /><br />
<form action="updateSeatsequence?hno=${requestScope.hno }" method="post">
<table align="center" id="seatTable">
<c:forEach begin="0" end="${fn:length(seatsequence) }" step="1" var="i">
	<c:if test="${fn:substring(seatsequence,i,i+1) eq ';' }"> <tr> <c:set var="row" value="${row+1 }"></c:set><c:set var="column" value="1"></c:set></c:if>
		<td>
			  <c:if test="${fn:substring(seatsequence,i,i+1) eq '1' }"><input type="checkbox" style="display:none" id="${row }_${column }" name="seats" value="${row }_${column }" checked="checked"><img src="image/green.png" title="${row }行${column }列" row=${row } column=${column } id="img_${row }_${column }">&nbsp;<c:set var="column" value="${column+1 }"></c:set></c:if>
			  <c:if test="${fn:substring(seatsequence,i,i+1) eq '0' }"><input type="checkbox" style="display:none" id="${row }_${column }" name="seats" value="${row }_${column }"><img src="image/grey.png" title="${row }行${column }列" row=${row } column=${column } id="img_${row }_${column }">&nbsp;<c:set var="column" value="${column+1 }"></c:set></c:if>
		</td>
	<c:if test="${fn:substring(seatsequence,i,i+1) eq ';' }"> </tr> </c:if>
</c:forEach>
</table>
<br>
<div align="center" >
<input type="submit" value="确认" class="submitButton" onclick="if(!confirm('是否确认修改？'))return false;" > 
</div>
</form>
</div> 
 <script type="text/javascript">
 $("#seatTable img").click(function()
		 {
		if($(this).attr('src')=='image/green.png'){
			$(this).attr('src','image/grey.png');
			$('#'+$(this).attr('row')+'_'+$(this).attr('column')).removeAttr("checked");
		}
		else if($(this).attr('src')=='image/grey.png'){
			$(this).attr('src','image/green.png');
			$('#'+$(this).attr('row')+'_'+$(this).attr('column')).attr('checked','true');
		}
	 });
 	$("#changeseat").click(function()
 		{
	 	//取消所有选中座位
	 	for(var i=1;i<=13;i++){
	 		for(var j=1;j<=30;j++){
	 			if($('#img_'+i+'_'+j).attr('src')=='image/green.png'){
					$('#img_'+i+'_'+j).attr('src','image/grey.png');
					$('#'+i+'_'+j).removeAttr("checked");
				}
	 		}
	 	}
	 	//重新选择座位
	 	var start=16-Math.ceil($("#customcol").attr("value")/2);
	 	var end=15+Math.floor($("#customcol").attr("value")/2);
	 	for(var i=1;i<=$("#customrow").attr("value");i++){
	 		for(var j=start;j<=end;j++){
				$('#img_'+i+'_'+j).attr('src','image/green.png');
				$('#'+i+'_'+j).attr('checked','true');
	 		}
	 	}
 	});
 </script>
<c:if test="${not empty requestScope.seatsequence  }">
 <script>
 	showSeatWindow();
 </script>
 </c:if>
<!-- 弹出选座窗口 end-->

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
</body>
<script type="text/javascript" src="js/showBigImage.js"></script>
</html>