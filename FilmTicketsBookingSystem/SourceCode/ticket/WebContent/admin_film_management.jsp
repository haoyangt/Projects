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
<body>
${actionMessages[0] }
<input type="button" value="添加"  onclick="document.getElementById('window_addfilm').style.display='block';document.getElementById('fade').style.display='block';"/>
	
 <div class="order-detail">
<DIV class=seatTab style="height: 100%">
<TABLE>
  <THEAD>
  <TR>
    <TH width="4%">海报</TH>
    <TH width="5%">影片名</TH>
    <TH width="2%">评分</TH>
    <TH width="7%">上映日期</TH>
    <TH width="4%">导演</TH>
    <TH width="3%">语言</TH>
    <TH width="3%">地区</TH>
    <TH width="3%">时长</TH>
    <TH width="3%">类型</TH>
    <TH width="3%">版本</TH>
    <TH width="8%">主演</TH>
    <TH width="6%">备注</TH>
    <TH width="9%">情节</TH>
    <TH width="30%">剧照</TH>
    <TH width="5%">预告片</TH>
    <TH width="5%">状态</TH>
    </TR></THEAD>

  <TBODY id=movie_seat>
  <!-- 添加still的表单  start-->
  <form name="form_addimg" method="post" ENCTYPE="multipart/form-data"  action="addFilmImg"/> 
	<input type="file" name="updateimg" style="display:none;" onchange="document.form_addimg.submit.click();" /> 
	<input type="submit" name="submit" style="display:none;" /> 
	<input type="hidden" name="updateimgfno"></input>
	</form> 
<!-- 添加still的表单 end-->
<!-- 修改poster和still的表单  start-->
  <form name="form_updateimg" method="post" ENCTYPE="multipart/form-data"  action="updateFilmImg" /> 
	<input type="file" name="updateimg" style="display:none;" onchange="document.form_updateimg.submit.click();" /> 
	<input type="submit" name="submit" style="display:none;" /> 
	<input type="hidden" name="updateimgfno"></input>
	<input type="hidden" name="updatetype"></input>
	<input type="hidden" name="originimg"></input>
	</form> 
<!-- 修改poster和still的表单 end-->

  <c:forEach items="${requestScope.allFilm }" var="film">
	<c:if test="${film.fno ne requestScope.fno }">
	<TR id="TR_${film.fno }">
		<TD><img src="image/film/${film.poster }" width="60px" height="80px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgfno.value='${film.fno }';document.form_updateimg.updatetype.value='poster';document.form_updateimg.originimg.value='${film.poster }'" onMouseOver="toolTip('<img src=image/film/${film.poster }>');" onMouseOut="toolTip();"> <br />
		<a href="displayAllFilm?fno=${film.fno }#TR_${film.fno }" ><input type="button" value="修改" /></a><a href="deleteFilm?fno=${film.fno }" onclick="return confirm('确定删除电影[ ${film.fname } ]吗？');"><input type="button" value="删除"/></a></TD>
		<TD>${film.fname }</TD>
		<TD>${film.grade }</TD>
		<TD><c:set var="rdate" value="${film.rdate }"></c:set>${fn:substring(rdate,0,10) }</TD>
		<TD>${film.director }</TD>
		<TD>${film.language }</TD>
		<TD>${film.location }</TD>
		<TD>${film.runtime }分钟</TD>
		<TD>${film.type }</TD>
		<TD>${film.version }</TD>
		<TD title="${film.protagonist }"><c:set var="protagonist" value="${film.protagonist }"></c:set>${fn:substring(protagonist,0,20) }......</TD>
		<TD>${film.remark }</TD>
		<TD title="${film.plot }"><c:set var="plot" value="${film.plot }"></c:set>${fn:substring(plot,0,100) }...... </TD>
		<TD><c:set var="stills" value="${film.still }"></c:set><c:forEach items="${fn:split(stills,';') }" var="still"><img src="image/film/${still }" width="100px" height="65px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgfno.value='${film.fno }';document.form_updateimg.updatetype.value='still';document.form_updateimg.originimg.value='${still }'" onMouseOver="toolTip('<img src=image/film/${still }>');" onMouseOut="toolTip()"></c:forEach> <input type="button" value="添加剧照" onclick="document.form_addimg.updateimg.click();document.form_addimg.updateimgfno.value='${film.fno }';"/> </TD>
		<TD title="${film.prevue }"><c:set var="prevue" value="${film.prevue }"></c:set>${fn:substring(prevue,0,20) }......</TD>
		<TD><c:if test="${film.state eq 1}">已上映或即将上映</c:if><c:if test="${film.state eq 0}"><Strong><font color="#FF0000"> 已下架</font></Strong></c:if> </TD>
    </TR>
    </c:if>
    <c:if test="${film.fno eq requestScope.fno }">
	<TR id="TR_${film.fno }">
	
	<form action="updateFilm" method="post" >
	<input type="hidden" value="${film.fno }" name="fno">
		<TD><img src="image/film/${film.poster }" width="60px" height="80px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgfno.value='${film.fno }';document.form_updateimg.updatetype.value='poster';document.form_updateimg.originimg.value='${film.poster }'" onMouseOver="toolTip('<img src=image/film/${film.poster }>')" onMouseOut="toolTip()"> <br /><input type="submit" value="完成" /> <a href="displayAllFilm"><input type="button" value="取消" /></a></TD>
		<TD><textarea rows="2" cols="16" name="fname">${film.fname }</textarea> </TD>
		<TD><input type="text" value="${film.grade }"  size="1" name="grade"/></TD>
		<TD><input type='text' value="${fn:substring(film.rdate,0,10) }" size="10" name='rdate' onfocus="WdatePicker()"/></TD>
		<TD><input type="text" value="${film.director }"  size="3" name="director"/></TD>
		<TD><input type="text" value="${film.language }"  size="2" name="language"/></TD>
		<TD><input type="text" value="${film.location }"  size="2" name="location"/></TD>
		<TD><input type="text" value="${film.runtime }"  size="2" name="runtime"/>分钟</TD>
		<TD>
			<c:set var="type" value="${film.type }" />
			<c:if test="${fn:indexOf(type,'动作') >-1 }"> <input type="checkbox" value="动作" name="type" checked="checked"/>动作</c:if><c:if test="${fn:indexOf(type,'动作') eq -1 }"> <input type="checkbox" value="动作" name="type"/>动作</c:if>
			<c:if test="${fn:indexOf(type,'科幻') >-1 }"> <input type="checkbox" value="科幻" name="type" checked="checked"/>科幻</c:if><c:if test="${fn:indexOf(type,'科幻') eq -1 }"> <input type="checkbox" value="科幻" name="type"/>科幻</c:if>
			<c:if test="${fn:indexOf(type,'惊悚') >-1 }"> <input type="checkbox" value="惊悚" name="type" checked="checked"/>惊悚</c:if><c:if test="${fn:indexOf(type,'惊悚') eq -1 }"> <input type="checkbox" value="惊悚" name="type"/>惊悚</c:if>
			<c:if test="${fn:indexOf(type,'冒险') >-1 }"> <input type="checkbox" value="冒险" name="type" checked="checked"/>冒险</c:if><c:if test="${fn:indexOf(type,'冒险') eq -1 }"> <input type="checkbox" value="冒险" name="type"/>冒险</c:if>
			<c:if test="${fn:indexOf(type,'剧情') >-1 }"> <input type="checkbox" value="剧情" name="type" checked="checked"/>剧情</c:if><c:if test="${fn:indexOf(type,'剧情') eq -1 }"> <input type="checkbox" value="剧情" name="type"/>剧情</c:if>
			<c:if test="${fn:indexOf(type,'犯罪') >-1 }"> <input type="checkbox" value="犯罪" name="type" checked="checked"/>犯罪</c:if><c:if test="${fn:indexOf(type,'犯罪') eq -1 }"> <input type="checkbox" value="犯罪" name="type"/>犯罪</c:if>
			<c:if test="${fn:indexOf(type,'喜剧') >-1 }"> <input type="checkbox" value="喜剧" name="type" checked="checked"/>喜剧</c:if><c:if test="${fn:indexOf(type,'喜剧') eq -1 }"> <input type="checkbox" value="喜剧" name="type"/>喜剧</c:if>
			<c:if test="${fn:indexOf(type,'战争') >-1 }"> <input type="checkbox" value="战争" name="type" checked="checked"/>战争</c:if><c:if test="${fn:indexOf(type,'战争') eq -1 }"> <input type="checkbox" value="战争" name="type"/>战争</c:if>
			<c:if test="${fn:indexOf(type,'奇幻') >-1 }"> <input type="checkbox" value="奇幻" name="type" checked="checked"/>奇幻</c:if><c:if test="${fn:indexOf(type,'奇幻') eq -1 }"> <input type="checkbox" value="奇幻" name="type"/>奇幻</c:if>
			<c:if test="${fn:indexOf(type,'爱情') >-1 }"> <input type="checkbox" value="爱情" name="type" checked="checked"/>爱情</c:if><c:if test="${fn:indexOf(type,'爱情') eq -1 }"> <input type="checkbox" value="爱情" name="type"/>爱情</c:if>
			<c:if test="${fn:indexOf(type,'动画') >-1 }"> <input type="checkbox" value="动画" name="type" checked="checked"/>动画</c:if><c:if test="${fn:indexOf(type,'动画') eq -1 }"> <input type="checkbox" value="动画" name="type"/>动画</c:if>
			<c:if test="${fn:indexOf(type,'悬疑') >-1 }"> <input type="checkbox" value="悬疑" name="type" checked="checked"/>悬疑</c:if><c:if test="${fn:indexOf(type,'悬疑') eq -1 }"> <input type="checkbox" value="悬疑" name="type"/>悬疑</c:if>
			<c:if test="${fn:indexOf(type,'家庭') >-1 }"> <input type="checkbox" value="家庭" name="type" checked="checked"/>家庭</c:if><c:if test="${fn:indexOf(type,'家庭') eq -1 }"> <input type="checkbox" value="家庭" name="type"/>家庭</c:if>
			<c:if test="${fn:indexOf(type,'恐怖') >-1 }"> <input type="checkbox" value="恐怖" name="type" checked="checked"/>恐怖</c:if><c:if test="${fn:indexOf(type,'恐怖') eq -1 }"> <input type="checkbox" value="恐怖" name="type"/>恐怖</c:if>
			<c:if test="${fn:indexOf(type,'记录') >-1 }"> <input type="checkbox" value="记录" name="type" checked="checked"/>记录</c:if><c:if test="${fn:indexOf(type,'记录') eq -1 }"> <input type="checkbox" value="记录" name="type"/>记录</c:if>
			<c:if test="${fn:indexOf(type,'音乐') >-1 }"> <input type="checkbox" value="音乐" name="type" checked="checked"/>音乐</c:if><c:if test="${fn:indexOf(type,'音乐') eq -1 }"> <input type="checkbox" value="音乐" name="type"/>音乐</c:if></TD>
		<TD>
			<c:set var="version" value="${film.version }" />
			<c:if test="${fn:indexOf(version,'IMAX3D') >-1 }"> <input type="checkbox" value="IMAX3D" name="version" checked="checked"/>IMAX3D</c:if><c:if test="${fn:indexOf(version,'IMAX3D') eq -1 }"> <input type="checkbox" value="IMAX3D" name="version"/>IMAX3D</c:if>
			<c:if test="${fn:indexOf(version,'3D') >-1 and fn:indexOf(version,'IMAX3D')+4 ne fn:indexOf(version,'3D')}"> <input type="checkbox" value="3D" name="version" checked="checked"/>3D</c:if><c:if test="${fn:indexOf(version,'3D') eq -1 or fn:indexOf(version,'IMAX3D')+4 eq fn:indexOf(version,'3D')}"> <input type="checkbox" value="3D" name="version"/>3D</c:if>
			<c:if test="${fn:indexOf(version,'2D') >-1 }"> <input type="checkbox" value="2D" name="version" checked="checked"/>2D</c:if><c:if test="${fn:indexOf(version,'2D') eq -1 }"> <input type="checkbox" value="2D" name="version"/>2D</c:if></TD>
		<TD><textarea rows="10" cols="20" name="protagonist">${film.protagonist }</textarea> </TD>
		<TD><textarea rows="5" cols="20" name="remark">${film.remark }</textarea></TD>
		<TD><textarea rows="10" cols="20" name="plot">${film.plot }</textarea></TD>
		<TD> <c:set var="stills" value="${film.still }"></c:set> <c:forEach items="${fn:split(stills,';') }" var="still"><img src="image/film/${still }" width="100px" height="65px" onclick="document.form_updateimg.updateimg.click();document.form_updateimg.updateimgfno.value='${film.fno }';document.form_updateimg.updatetype.value='still';document.form_updateimg.originimg.value='${still }'" onMouseOver="toolTip('<img src=image/film/${still }>')" onMouseOut="toolTip()"></c:forEach> <input type="button" value="添加剧照" onclick="document.form_addimg.updateimg.click();document.form_addimg.updateimgfno.value='${film.fno }';" /> </TD>
		<TD><textarea rows="10" cols="20" name="prevue">${film.prevue }</textarea></TD>
		<TD>
			<c:if test="${film.state eq 1 }"> <input type="radio" value="1" name="state" checked="checked"/>已上映或即将上映<br /> <input type="radio" value="0" name="state"/>已下架</c:if><c:if test="${film.state eq 0 }"><input type="radio" value="1" name="state" />已上映或即将上映<br /> <input type="radio" value="0" name="state" checked="checked"/>已下架</c:if></TD>
     </form>
    </TR>
    </c:if>
   </c:forEach>
 </TBODY></TABLE></DIV>

 </div>
 <!-- 电影添加div --> 
<div id="window_addfilm" class="window">
<div class="window_title">
	<H2>电影添加</H2>
	<a href = "javascript:void(0)" onclick = "document.getElementById('window_addfilm').style.display='none';document.getElementById('fade').style.display='none';"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="addFilm" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">影片名：</td>
			<td width="68%" align="left"><input type="text" name="fname"> </td>
		</tr>
		<tr>
			<td align="right">海　报：</td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="right">评　分：</td>
			<td align="left"><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td align="right">上映时间：</td>
			<td align="left"><input type="text" name="rdate" onfocus="WdatePicker()"></td>
		</tr>
		<tr>
			<td align="right">导　演：</td>
			<td align="left"><input type="text" name="director"></td>
		</tr>
		<tr>
			<td align="right">语　言：</td>
			<td align="left"><input type="text" name="language"></td>
		</tr>
		<tr>
			<td align="right">地　区：</td>
			<td align="left"><input type="text" name="location"></td>
		</tr>
		<tr>
			<td align="right">时　长：</td>
			<td align="left"><input type="text" name="runtime"></td>
		</tr>
		<tr>
			<td align="right">类　型：</td>
			<td align="left">
				<input type="checkbox" value="动作" name="type"/>动作&nbsp;
				<input type="checkbox" value="科幻" name="type"/>科幻&nbsp;
				<input type="checkbox" value="惊悚" name="type"/>惊悚&nbsp;
				<input type="checkbox" value="冒险" name="type"/>冒险&nbsp;
				<input type="checkbox" value="剧情" name="type"/>剧情&nbsp;
				<input type="checkbox" value="犯罪" name="type"/>犯罪&nbsp;
				<input type="checkbox" value="喜剧" name="type"/>喜剧&nbsp;
				<input type="checkbox" value="战争" name="type"/>战争&nbsp;
				<input type="checkbox" value="奇幻" name="type"/>奇幻&nbsp;
				<input type="checkbox" value="爱情" name="type"/>爱情&nbsp;
				<input type="checkbox" value="动画" name="type"/>动画&nbsp;
				<input type="checkbox" value="悬疑" name="type"/>悬疑&nbsp;
				<input type="checkbox" value="家庭" name="type"/>家庭&nbsp;
				<input type="checkbox" value="恐怖" name="type"/>恐怖&nbsp;
				<input type="checkbox" value="记录" name="type"/>记录&nbsp;
				<input type="checkbox" value="音乐" name="type"/>音乐&nbsp;
			</td>
		</tr>
		<tr>
			<td align="right">版　本：</td>
			<td align="left">
				<input type="checkbox" value="IMAX3D" name="version"/>&nbsp;IMAX3D&nbsp;&nbsp;
				<input type="checkbox" value="3D" name="version"/>&nbsp;3D&nbsp;&nbsp;
				<input type="checkbox" value="2D" name="version"/>&nbsp;2D
			</td>
		</tr>
		<tr>
			<td align="right">主　演：</td>
			<td align="left"><input type="text" name="protagonist"></td>
		</tr>
		<tr>
			<td align="right">备　注：</td>
			<td align="left"><input type="text" name="remark"></td>
		</tr>
		<tr>
			<td align="right">情　节：</td>
			<td align="left"><textarea rows="5" cols="20" name="plot"></textarea> </td>
		</tr>
		<tr>
			<td align="right">剧　照：</td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="right">宣传片：</td>
			<td align="left"><input type="text" name="prevue"></td>
		</tr>
		
		
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="添加" class="button" onclick="return confirm('确认添加电影吗？');document.getElementById('window_addfilm').style.display='none';document.getElementById('fade').style.display='none';">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="document.getElementById('window_addfilm').style.display='none';document.getElementById('fade').style.display='none';"> </td>
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