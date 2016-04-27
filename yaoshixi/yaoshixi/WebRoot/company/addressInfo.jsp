<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<script type="text/javascript">
function companyUpdate(){
	var $form = $("#addressIfoFrom");
	 $.ajax({
		type:'POST',
		url:'company/saveEdit',
		data:$form.serializeArray(),
		cache:false,
		dataType:'html',
		success:function(html){
			$("#addressInfoDiv").html(html);
			showEdit('#addressInfoEditDiv', '#addressInfoShowDiv');
		}
	}); 
	
}
</script>
<div class="s_qt" id="addressInfoShowDiv">
	<p><label>城市</label>${company.city }</p>
    <p><label>领域</label>${company.filedes } | ${company.major }</p>
    <p><label>性质</label>${company.nature }</p>
    <p><label>规模</label>${company.scale }</p>
    <div style="line-height:30px;">
    <label style="float:left;line-height: 20px;background-color: #7BC6F7;margin-right: 10px;padding: 2px 6px;">网站</label>
	    <c:if test="${company.homePage =='' || company.homePage == null || company.homePage =='无'}">
	    	未提供
	    </c:if>
	    <c:if test="${company.homePage !='' && company.homePage != null && company.homePage !='无'}">
	    	<c:if test="${fn:contains(company.homePage,'http://')}">
	    		<a target="_blank" class="interadrees" href="${company.homePage }">${company.homePage }</a>
	    	</c:if>
	    	<c:if test="${!fn:contains(company.homePage,'http://')}">
	    		<a target="_blank" class="interadrees" href="${company.homePage }">${company.homePage }</a>
	    	</c:if>
	    </c:if>
	    <div style="clear: both;"></div>
    </div>
	<p><label>地址</label>${company.addr }</p>
    <div class="bj_grxx"><a href="javascript:void(0);" onclick="showEdit('#addressInfoShowDiv', '#addressInfoEditDiv')" class="a_edit" style="display: none;">&nbsp;&nbsp;</a></div>
</div>
<!-- 地址信息编辑框  -->  
<div class="s_qt_edit" style="display: none;" id="addressInfoEditDiv">
	<form action="company/saveEdit" id="addressIfoFrom" method="post">
		<div class="login_top">城市：<input name="companyInfo.city"  id="gs" type="text"  class="login_input" value="${company.city }"/><span id="" style="color: red;"></span></div>
		<div class="login_top">领域：<input name="companyInfo.filedes"  id="gs" type="text"  class="login_input" value="${company.filedes }"/><span id="" style="color: red;"></span></div>
		<div class="login_top">性质：<input name="companyInfo.nature"  id="gs" type="text"  class="login_input" value="${company.nature }"/><span id="" style="color: red;"></span></div>
		<div class="login_top">规模：<input name="companyInfo.scale"  id="gs" type="text"  class="login_input" value="${company.scale }"/><span id="" style="color: red;"></span></div>
		<div class="login_top">网站：<input name="companyInfo.homePage"  id="gs" type="text"  class="login_input" value="${company.homePage }"/><span id="" style="color: red;"></span></div>
		<div class="login_top">地址：<input name="companyInfo.addr"  id="gs" type="text"  class="login_input" value="${company.addr }"/><span id="" style="color: red;"></span></div>
		<div class="login_top">
			<input  type="button" onclick="companyUpdate();" value="保存" class="btn_style1"/>
			<input  type="button"  value="取消" class="btn_cancel" onclick="showEdit('#addressInfoEditDiv', '#addressInfoShowDiv')"/>
		</div>
	</form>
</div>