<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<script type="text/javascript">
function updeatGrowthStage(){
	var $form = $("#growthStageFrom");
	var growthStage = $("#growthStage").val();
	if(growthStage!=null && growthStage!=''){
		 $.ajax({
			type:'POST',
			url:'company/saveEdit',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#growthStageDiv").html(html);
				showEdit('#growthStageEditDiv', '#growthStageShowDiv');
			}
		}); 
	}else{
		$("#Span").text("内容不能为空！");
	}
}
</script>
<div class="s_qt">
<p><label>发展阶段</label></p>

<div class="s_fz" id="growthStageShowDiv">
	<div class="bj_grxx">
		<a href="javascript:void(0);" onclick="showEdit('#growthStageShowDiv', '#growthStageEditDiv')" class="a_edit" style="display: none;">&nbsp;&nbsp;</a>
	</div>
	<p style="padding-bottom: 10px">目前阶段：${company.growthStage == null || company.growthStage ==''?"未添加":company.growthStage }</p>
</div>
</div>
<!-- 发展阶段编辑框 -->
<div class="s_fs_edit" style="display: none;" id="growthStageEditDiv">
	<form action="company/saveEdit" method="post" id="growthStageFrom">
		<div class="login_top">
		 <!--  <ul>
		  	<li><label><input type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0" /> 初创型</label></li>
		  	<li><label><input type="radio" name="RadioGroup1" value="2" id="RadioGroup1_1" /> 成长型</label></li>
		  	<li><label><input type="radio" name="RadioGroup1" value="3" id="RadioGroup1_2" /> 成熟型</label></li>
		  	<li><label><input type="radio" name="RadioGroup1" value="4" id="RadioGroup1_3" /> 已上市</label></li>
		  </ul> -->
		 <textarea name="companyInfo.growthStage" id="growthStage" rows="3" cols="3" style="width: 170px;">${company.growthStage }</textarea>
		</div>
		<span id="Span" style="color: red;"></span>
		<div class="login_top">
			<input type="button" onclick="updeatGrowthStage();" value="保存" class="btn_style1" />
			<input type="button" value="取消" class="btn_cancel" onclick="showEdit('#growthStageEditDiv', '#growthStageShowDiv')" />
		</div>
	</form>
</div>