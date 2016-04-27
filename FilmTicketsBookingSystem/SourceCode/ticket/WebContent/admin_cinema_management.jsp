<%@page import="java.util.List"%>
<%@page import="com.hy.vo.PageBean"%>
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
</head>
${actionMessages[0] }
<input type="button" value="添加"  onclick="document.getElementById('window_addcinema').style.display='block';document.getElementById('fade').style.display='block';"/>
	
 <div class="order-detail" >
<DIV class=seatTab style="height: 100%">
<TABLE>
  <THEAD>
  <TR>
    <TH width="4%">LOGO</TH>
    <TH width="5%">影院名</TH>
    <TH width="2%">评分</TH>
    <TH width="8%">营业时间</TH>
    <TH width="7%">地址</TH>
    <TH width="5%">所属地区</TH>
    <TH width="7%">电话</TH>
    <TH width="10%">线路</TH>
    <TH width="15%">介绍</TH>
    <TH width="30%">介绍图</TH>
    <TH width="8%">备注</TH>
    <TH width="4%">纬度</TH>
    <TH width="4%">经度</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <!-- 添加image的表单  start-->
  <form name="form_addimg" method="post" ENCTYPE="multipart/form-data"  action="addCinemaImg"/> 
	<input type="file" name="updateimg" style="display:none;" onchange="document.form_addimg.submit.click();" /> 
	<input type="submit" name="submit" style="display:none;" /> 
	<input type="hidden" name="updateimgcno"></input>
	</form> 
<!-- 添加image的表单 end-->
<!-- 修改logo和image的表单  start-->
  <form name="form_updateimg" method="post" ENCTYPE="multipart/form-data"  action="updateCinemaImg" /> 
	<input type="file" name="updateimg" style="display:none;" onchange="document.form_updateimg.submit.click();" /> 
	<input type="submit" name="submit" style="display:none;" /> 
	<input type="hidden" name="updateimgcno"></input>
	<input type="hidden" name="updatetype"></input>
	<input type="hidden" name="originimg"></input>
	</form> 
<!-- 修改logo和image的表单 end-->
  <c:forEach items="${requestScope.allCinema.data }" var="cinema">
	<c:if test="${cinema.cno ne requestScope.cno }">
	<TR id="TR_${cinema.cno }">
		<TD><img src="image/cinema/${cinema.logo }" width="80px" height="60px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgcno.value='${cinema.cno }';document.form_updateimg.updatetype.value='logo';document.form_updateimg.originimg.value='${cinema.logo }'"onMouseOver="toolTip('<img src=image/cinema/${cinema.logo }>')" onMouseOut="toolTip()"> <br /><a href="displayAllCinemaByAdmin?cno=${cinema.cno }#TR_${cinema.cno }" ><input type="button" value="修改" /></a><a href="deleteCinema?cno=${cinema.cno }" onclick="return confirm('确定删除电影院[ ${cinema.cname } ]吗？');"><input type="button" value="删除"/></a></TD>
		<TD>${cinema.cname }</TD>
		<TD>${cinema.grade }</TD>
		<TD>${cinema.openinghours }</TD>
		<TD>${cinema.location }</TD>
		<TD>
			<c:if test="${cinema.simpleloc eq 'heping'}">和平区&nbsp;&nbsp;</c:if>
			<c:if test="${cinema.simpleloc eq 'nankai'}">南开区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'hexi'}">河西区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'binhai'}">滨海区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'beichen'}">北辰区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'hongqiao'}">红桥区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'hedong'}">河东区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'jinghai'}">静海区&nbsp;&nbsp;  </c:if>
			<c:if test="${cinema.simpleloc eq 'baodi'}">宝坻区&nbsp;&nbsp;  </c:if>
		</TD>
		<TD>${cinema.tel }</TD>
		<TD>${cinema.route }</TD>
		<TD title="${cinema.introduction }">${fn:substring(cinema.introduction,0,100) }......</TD>
		<TD><c:forEach items="${fn:split(cinema.image,';') }" var="image"><img src="image/cinema/${image }" width="100px" height="65px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgcno.value='${cinema.cno }';document.form_updateimg.updatetype.value='image';document.form_updateimg.originimg.value='${image }'"onMouseOver="toolTip('<img src=image/cinema/${image }>')" onMouseOut="toolTip()"></c:forEach> <input type="button" value="添加图片" onclick="document.form_addimg.updateimg.click();document.form_addimg.updateimgcno.value='${cinema.cno }';"/></TD>
		<TD title="${cinema.remark }">${fn:substring(cinema.remark,0,100) }......</TD>
		<TD>${cinema.latitude }</TD>
		<TD>${cinema.longitude }</TD>
    </TR>
    </c:if>
    <c:if test="${cinema.cno eq requestScope.cno }">
	<TR id="TR_${cinema.cno }">
	<form action="updateCinema"  name="updateCinema"method="post" >
	<input type="hidden" value="${cinema.cno }" name="cno">
		<TD><img src="image/cinema/${cinema.logo }" width="80px" height="60px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgcno.value='${cinema.cno }';document.form_updateimg.updatetype.value='logo';document.form_updateimg.originimg.value='${cinema.logo }'"onMouseOver="toolTip('<img src=image/cinema/${cinema.logo }>')" onMouseOut="toolTip()"> <br /><input type="submit" value="完成" /> <a href="displayAllCinemaByAdmin"><input type="button" value="取消" /></a></TD>
		<TD><textarea rows="2" cols="16" name="cname">${cinema.cname }</textarea> </TD>
		<TD><input type="text" value="${cinema.grade }"  size="1" name="grade"/></TD>
		<TD>
			<select name="openTime" >
				<c:if test="${fn:substring(cinema.openinghours,0,5) eq '09:00'}"><option value="09:00" selected="selected">09:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,0,5) ne '09:00'}"><option value="09:00" >09:00</option></c:if>
				<c:if test="${fn:substring(cinema.openinghours,0,5) eq '10:00'}"><option value="10:00" selected="selected">10:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,0,5) ne '10:00'}"><option value="10:00" >10:00</option></c:if>
				<c:if test="${fn:substring(cinema.openinghours,0,5) eq '11:00'}"><option value="11:00" selected="selected">11:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,0,5) ne '11:00'}"><option value="11:00" >11:00</option></c:if>
				<c:if test="${fn:substring(cinema.openinghours,0,5) eq '12:00'}"><option value="12:00" selected="selected">12:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,0,5) ne '12:00'}"><option value="12:00" >12:00</option></c:if>
			</select>-
			<select name="closeTime">
				<c:if test="${fn:substring(cinema.openinghours,6,11) eq '21:00'}"><option value="21:00" selected="selected">21:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,6,11) ne '21:00'}"><option value="21:00" >21:00</option></c:if>
				<c:if test="${fn:substring(cinema.openinghours,6,11) eq '22:00'}"><option value="22:00" selected="selected">22:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,6,11) ne '22:00'}"><option value="22:00" >22:00</option></c:if>
				<c:if test="${fn:substring(cinema.openinghours,6,11) eq '23:00'}"><option value="23:00" selected="selected">23:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,6,11) ne '23:00'}"><option value="23:00" >23:00</option></c:if>
				<c:if test="${fn:substring(cinema.openinghours,6,11) eq '24:00'}"><option value="24:00" selected="selected">24:00</option></c:if><c:if test="${fn:substring(cinema.openinghours,6,11) ne '24:00'}"><option value="24:00" >24:00</option></c:if>
			</select>
		</TD>
		<TD><textarea rows="5" cols="16" name="location">${cinema.location }</textarea> </TD>
		<TD>
			<c:if test="${cinema.simpleloc eq 'heping'}"><input type="radio" name="simpleloc" value="heping" checked="checked" />和平区  </c:if><c:if test="${cinema.simpleloc ne 'heping'}"><input type="radio" name="simpleloc" value="heping" />和平区  </c:if>
			<c:if test="${cinema.simpleloc eq 'nankai'}"><input type="radio" name="simpleloc" value="nankai" checked="checked" />南开区  </c:if><c:if test="${cinema.simpleloc ne 'nankai'}"><input type="radio" name="simpleloc" value="nankai" />南开区  </c:if>
			<c:if test="${cinema.simpleloc eq 'hexi'}"><input type="radio" name="simpleloc" value="hexi" checked="checked" />河西区  </c:if><c:if test="${cinema.simpleloc ne 'hexi'}"><input type="radio" name="simpleloc" value="hexi" />河西区  </c:if>
			<c:if test="${cinema.simpleloc eq 'binhai'}"><input type="radio" name="simpleloc" value="binhai" checked="checked" />滨海区  </c:if><c:if test="${cinema.simpleloc ne 'binhai'}"><input type="radio" name="simpleloc" value="binhai" />滨海区  </c:if>
			<c:if test="${cinema.simpleloc eq 'beichen'}"><input type="radio" name="simpleloc" value="beichen" checked="checked" />北辰区  </c:if><c:if test="${cinema.simpleloc ne 'beichen'}"><input type="radio" name="simpleloc" value="beichen" />北辰区  </c:if>
			<c:if test="${cinema.simpleloc eq 'hongqiao'}"><input type="radio" name="simpleloc" value="hongqiao" checked="checked" />红桥区  </c:if><c:if test="${cinema.simpleloc ne 'hongqiao'}"><input type="radio" name="simpleloc" value="hongqiao" />红桥区  </c:if>
			<c:if test="${cinema.simpleloc eq 'hedong'}"><input type="radio" name="simpleloc" value="hedong" checked="checked" />河东区  </c:if><c:if test="${cinema.simpleloc ne 'hedong'}"><input type="radio" name="simpleloc" value="hedong" />河东区  </c:if>
			<c:if test="${cinema.simpleloc eq 'jinghai'}"><input type="radio" name="simpleloc" value="jinghai" checked="checked" />静海区  </c:if><c:if test="${cinema.simpleloc ne 'jinghai'}"><input type="radio" name="simpleloc" value="jinghai" />静海区  </c:if>
			<c:if test="${cinema.simpleloc eq 'baodi'}"><input type="radio" name="simpleloc" value="baodi" checked="checked" />宝坻区  </c:if><c:if test="${cinema.simpleloc ne 'baodi'}"><input type="radio" name="simpleloc" value="baodi" />宝坻区  </c:if>
		</TD>
		<TD><input type="text" value="${cinema.tel }"  size="10" name="tel"/></TD>
		<TD><textarea rows="6" cols="20" name="route">${cinema.route }</textarea> </TD>
		<TD><textarea rows="8" cols="30" name="introduction">${cinema.introduction }</textarea> </TD>
		<TD><c:forEach items="${fn:split(cinema.image,';') }" var="image"><img src="image/cinema/${image }" width="100px" height="65px"onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgcno.value='${cinema.cno }';document.form_updateimg.updatetype.value='image';document.form_updateimg.originimg.value='${image }'" onMouseOver="toolTip('<img src=image/cinema/${image }>')" onMouseOut="toolTip()"></c:forEach> <input type="button" value="添加图片" onclick="document.form_addimg.updateimg.click();document.form_addimg.updateimgcno.value='${cinema.cno }';"/></TD>
		<TD><textarea rows="8" cols="16" name="remark">${cinema.remark }</textarea> </TD>
		<TD><input type="text" value="${cinema.latitude }"  size="5" name="latitude"/></TD>
		<TD><input type="text" value="${cinema.longitude }"  size="5" name="longitude"/></TD>
     </form>
    </TR>
    </c:if>
   </c:forEach>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 影院添加div --> 
<div id="window_addcinema" class="window">
<div class="window_title">
	<H2>影院添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addcinema').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="addCinema" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">影院名：</td>
			<td width="68%" align="left"><input type="text" name="cname" /> </td>
		</tr>
		<tr>
			<td align="right">LOGO：</td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="right">评　分：</td>
			<td align="left"><input type="text" name="grade" /></td>
		</tr>
		<tr>
			<td align="right">营业时间:</td>
			<td align="left">
				<select name="openTime">
					<option value="09:00">09:00</option>
					<option value="10:00">10:00</option>
					<option value="11:00">11:00</option>
					<option value="12:00">12:00</option>
				</select>-
				<select name="closeTime">
					<option value="21:00">21:00</option>
					<option value="22:00">22:00</option>
					<option value="23:00">23:00</option>
					<option value="24:00">24:00</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right">地　址：</td>
			<td align="left"><input type="text" name="location" /></td>
		</tr>
		<tr>
			<td align="right">所在地区:</td>
			<td align="left">
				<input type="radio" value="heping" name="simpleloc"/>和平区
				<input type="radio" value="nankai" name="simpleloc"/>南开区
				<input type="radio" value="hexi" name="simpleloc"/>河西区<br />
				<input type="radio" value="binhai" name="simpleloc"/>滨海区
				<input type="radio" value="beichen" name="simpleloc"/>北辰区
				<input type="radio" value="hongqiao" name="simpleloc"/>红桥区<br />
				<input type="radio" value="hedong" name="simpleloc"/>河东区
				<input type="radio" value="jinghai" name="simpleloc"/>静海区
				<input type="radio" value="baodi" name="simpleloc"/>宝坻区
			</td>
		</tr>
		<tr>
			<td align="right">电　话：</td>
			<td align="left"><input type="text" name="tel" /></td>
		</tr>
		<tr>
			<td align="right">线　路：</td>
			<td align="left"><input type="text" name="route" /></td>
		</tr>
		<tr>
			<td align="right">介　绍：</td>
			<td align="left">
				<textarea rows="10" cols="30" name="introduction"></textarea>
			</td>
		</tr>
		<tr>
			<td align="right">介绍图片:</td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="right">备　注：</td>
			<td align="left"><textarea rows="10" cols="30" name="remark"></textarea> </td>
		</tr>
		<tr>
			<td align="right">纬　度：</td>
			<td align="left"><input type="text" name="latitude" /> </td>
		</tr>
		<tr>
			<td align="right">经　度：</td>
			<td align="left"><input type="text" name="longitude" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="添加" class="button" onclick="return confirm('确认添加影院吗？');document.getElementById('window_addcinema').style.display='none';document.getElementById('fade').style.display='none';">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addcinema').style.display='none';document.getElementById('fade').style.display='none';"> </td>
        </tr>
	</table>
	</form>
</div>
</div> 

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
</body>
<script type="text/javascript" src="js/showBigImage.js"></script>
</html>