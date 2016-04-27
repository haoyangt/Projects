<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp"%>
<script type="text/javascript">
function updateFounder(){
	var $form = $("#founderFrom");
	var founder = $("#founder").val();
	if(founder!=null && founder!=''){
		 $.ajax({
			type:'POST',
			url:'company/saveEdit',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#founderDiv").html(html);
				showEdit('#founderEditDiv', '#founderShowDiv');
			}
		});
	}else{
		$("#Spanes").text("内容不能为空！");
	}
}
</script>

<div class="s_qt">
<p><label>创始团队</label></p>
<div class="s_cs" id="founderShowDiv">
	<div class="bj_grxx">
		<a href="javascript:void(0);" onclick="showEdit('#founderShowDiv', '#founderEditDiv')"  class="a_edit" style="display: none;">&nbsp;&nbsp;</a>
	</div>
	<p style="padding-bottom: 10px">${empty company.founder ? "无" : company.founder }</p>
</div>
</div>
<!-- 编辑创始团队 -->
<div class="s_cs_edit" style="display: none;" id="founderEditDiv">
	<form action="company/saveEdit" method="post" id="founderFrom">
		<div class="login_top">
			<textarea rows="3" cols="3" name="companyInfo.founder" id="founder" style="width: 170px">${company.founder }</textarea>
		</div>
		<span id="Spanes" style="color: red;"></span>
		<div class="login_top">
			<input type="button" onclick="updateFounder();" value="保存" class="btn_style1" />
			<input type="button" value="取消" class="btn_cancel" onclick="showEdit('#founderEditDiv', '#founderShowDiv')" />
		</div>
	</form>
</div>