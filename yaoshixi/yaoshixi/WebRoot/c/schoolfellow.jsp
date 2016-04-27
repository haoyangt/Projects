<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp"%>

<div class="s_qt">
<p><label>同校校友</label></p>
<div class="s_cs" id="schoolShowDiv">
	<!-- <div class="bj_grxx">
		<a href="javascript:void(0);" onclick="showEdit('#schoolShowDiv', '#schoolEditDiv')"  class="a_edit">&nbsp;&nbsp;</a>
	</div> -->
	<c:forEach items="${school}" var="school">
		<p style="padding-bottom: 10px">
			${school.userName}•${school.university}
		</p>
	</c:forEach>
</div>
</div>
<!-- 编辑创始团队 -->
<div class="s_cs_edit" style="display: none;" id="schoolEditDiv">
	<form action="company/saveEdit" method="post" onsubmit="return saveEdit(this);" rel="schoolDiv">
		<input type="hidden" name="view" value="founder"/>
		<div class="login_top">
			<textarea rows="3" cols="3" name="founder" style="width: 170px">${company.founder }</textarea>
		</div>
		<div class="login_top">
			<input type="submit" value="保存" class="btn_style1" />
			<input type="button" value="取消" class="btn_cancel" onclick="showEdit('#schoolEditDiv', '#schoolShowDiv')" />
		</div>
	</form>
</div>