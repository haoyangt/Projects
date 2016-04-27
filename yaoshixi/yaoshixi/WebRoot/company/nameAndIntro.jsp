<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<script type="text/javascript">
function nameAndIntroUpdate(){
	var companySlogan = $("#companySlogan").val();
	if(companySlogan.length<17){
		var $form = $("#nameAndIntroFrom");
		 $.ajax({
			type:'POST',
			url:'company/saveEdit',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#nameAndIntroDiv").html(html);
				showEdit('#nameAndIntroEditDiv', '#nameAndIntroShowDiv');
			}
		}); 
	}else{
		$("#spand").text("公司口号不得超过16字！");
	}
}
</script>
<div class="s_jib" id="nameAndIntroShowDiv">

	 <p class="f18" style="line-height:35px;">${company.companyName }</p>
     <p>
     	<c:if test="${company.authentication==2}">
     		<img src="res/images/attestation.png" width="150">
     	</c:if>
     	<c:if test="${company.authentication==1}">
     		<img src="res/images/attestation2.png" width="150">
     	</c:if>
     </p>
   <%--   <p>${company.companyDesc }</p> --%>
	 
     <div class="biaoq_list">
     	<c:forEach var="tag" items="${company.tagCompanyList}">
        	<span>${tag.tagName}</span>
        </c:forEach>
     </div>
     <c:if test="${company.companySlogan != null && company.companySlogan != '' }">
     	<div style="height:50px;overflow:hidden;"><strong>公司口号：</strong>${company.companySlogan }</div>
     </c:if>
     <div id="companyDesc" style="height:240px;overflow:hidden;"><strong>公司介绍：</strong>${company.companyDesc }</div>
     <c:if test="${fn:length(company.companyDesc) >250}">
	     <div id="zkLook" style="text-align:right;margin-bottom:10px;font-size: 12px;"><a onclick="zkLook()" style="background-color: #7BC6F7">展开查看</a></div>
	     <div id="sqLook" style="text-align:right;margin-bottom:10px;font-size: 12px;display:none;"><a onclick="sqLook()" style="background-color: #7BC6F7">收起</a></div>
     </c:if>
    <!--  这个页面中企业账号登陆才能看见编辑按钮 -->
      <div class="bj_grxx"><a href="javascript:void(0);" class="a_edit" style="display: none;" onclick="showEdit('#nameAndIntroShowDiv','#nameAndIntroEditDiv')" >&nbsp;&nbsp;</a></div>
    <!--  这个页面中企业账号登陆才能看见编辑按钮 -->
</div>
    
<!-- 编辑企业名称，介绍  -->
<div class="s_jib_edit" id="nameAndIntroEditDiv" style="display: none;">
	<form  method="post" action="company/saveEdit" id="nameAndIntroFrom">
 	
 	<input type="hidden" name="view" value="nameAndIntro"/>
 	
 	<div class="login_top"><input name="companyInfo.companyName" value="${company.companyName }" id="gs" type="text"  placeholder="公司简称" class="login_input login_input_w" /><span id="" style="color: red;"></span></div>
	<p>公司口号：</p>
	<div class="login_top"><input id="companySlogan"  name="companyInfo.companySlogan" style="width:320px;height: 38px;" value="${company.companySlogan }"><br><span id="spand" style="color: red;"></span></div>	
	<p>描述：</p>
	<div class="login_top"><textarea name="companyInfo.companyDesc" rows="3" cols="3" style="width:300px;">${company.companyDesc }</textarea><span id="" style="color: red;"></span></div>
		
 	<div class="login_top">
 		<input  type="button" onclick="nameAndIntroUpdate()" value="保存" class="btn_style1"/>
 		<input  type="button"  value="取消" class="btn_cancel" onclick="showEdit('#nameAndIntroEditDiv','#nameAndIntroShowDiv')" />
 	</div>
 	 
 	<h3>已选择标签</h3>
   	<div class="biaoq_list" id="selectedTagDiv">
    	<c:forEach var="tag" items="${company.tagCompanyList}">
        	<span>${tag.tagName}</span>
        </c:forEach>
    </div>
 	 
	<div class="login_top">
  		<a href="javascript:void(0);" onclick="loadCandidateTag()" class="hover_b">换一换</a>
      	<input name="tagName"  id="tagName" type="text"  placeholder="添加自定义标签" class="login_input2" /><input  type="button" onclick="addTag('#tagName')"  value="贴上" class="btn_ts">
  	</div>
  	<div class="biaoq_list" id="unselectedTagDiv">
   		<span>技能培训</span><span>免费班车</span><span>岗位晋升</span><span>帅哥多</span>
   		<span>弹性工作</span><span>五险一金</span><span>规范管理</span><span>节日礼物</span>
  	</div>
 </form>
</div>
<script>
	$(document).ready(function(){
		initUnselectedTag();
	});
	function initUnselectedTag()
	{
		$("#unselectedTagDiv").find("span").click(function(){
			$This = $(this);
			var tagName = $This.html();
			saveTag(tagName, function(){
				$This.remove();
			});
		});
		$("#selectedTagDiv").find("span").click(function(){
			$This = $(this);
			var tagName = $This.html();
			removeTag(tagName, function(){
				$This.remove();
			});
		});
	}
	function addTag(input)
	{
		var input = $(input);
		
		var tagName = $(input).val();
		if(tagName == null || tagName == "")
		{
			return;
		}
		saveTag(tagName, function(){
			$(input).val("");
		});
	}
	
	function saveTag(tagName, callBack)
	{
		var url = "company/addTag";
		var data = {tagName: tagName};
		$.ajax({
			url: url,
			type: "post",
			data: data,
			dataType: "json",
			success: function(json){
				if(json.statusCode == 200){
					$("#selectedTagDiv").append("<span>" + tagName + "</span>");
					callBack();
				}
			},
			error: function(){
				alert("网络错误，请稍后重试");
			}
		});
	}
	
	function removeTag(tagName, callBack)
	{
		var url = "company/removeTag";
		var data = {tagName: tagName};
		$.ajax({
			url: url,
			type: "post",
			data: data,
			dataType: "json",
			success: function(json){
				if(json.statusCode == 200){
					$("#unselectedTagDiv").append("<span>" + tagName + "</span>");
					callBack();
				}
			},
			error: function(){
				alert("网络错误，请稍后重试");
			}
		});
	}
	function loadCandidateTag()
	{
		var url = "company/candidateTag";
		var data = $("#candidateTagForm").length > 0 ? $("#candidateTagForm").serialize() : {pageNum: 1, numPerPage: 8};
		
		$.ajax({
			url: url,
			data: data,
			type: "post",
			dataType: "html",
			success: function(html){
				$("#unselectedTagDiv").html(html);
			}
		});
	}
	
	function zkLook(){
		$("#companyDesc").attr("style","");
		$("#zkLook").hide();
		$("#sqLook").show();
	}
	function sqLook(){
		$("#companyDesc").attr("style","height:240px;overflow:hidden;");
		$("#zkLook").show();
		$("#sqLook").hide();
	}
</script>