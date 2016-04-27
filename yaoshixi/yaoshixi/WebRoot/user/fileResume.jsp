 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/res/jquery/jquery-1.10.2.js"></script>
<link href="<%=request.getContextPath() %>/res/imgAreaSelect/imgareaselect-default.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath() %>/res/imgAreaSelect/jquery.imgareaselect.pack.js" charset="UTF-8"></script>
<script src="<%=request.getContextPath() %>/res/js/ajaxfileupload.js" charset="UTF-8"></script>
<script src="<%=request.getContextPath() %>/res/ajax/ajaxdialog.js" charset="UTF-8"></script>
<style type="text/css">
.btnup{
	background-color: #2c99cf;
	border: none;
	height: 25px;
	width: 50px;	
	cursor:pointer;
	line-height:25px;
	color:#FFF;
}
</style>	
<script type="text/javascript">
function delFileResume() {
	$.ajax({
		type:'POST',
		url:'user/delfileResume',
		data:'',
		dataType:'html',
	    success:function(html) {
	    	$("#fileResumeDiv").html(html);
	    	showEdit("#fjEditDiv", "#fjShowDiv");
	    }
	});	
}

function dd(){
	$.ajaxFileUpload({
		type:'POST',
		url:'user/fileResume',
		fileElementId: 'upldAccessory',
		dataType:'json',
		success:function(json) {
     	   var src = "user/getFileDown?filePath=" + json.accessory;
     	   $("#accessory").attr("href", src);
     	  	$("#accessory").text(json.adjunct);
     	 	showEdit("#fjEditDiv", "#fjShowDiv");
		}
	});
}

function shangchuan(){
	var files = $("#upldAccessory").val();
	if(files!=null){
		if("${adjunct}"=='' || "${adjunct}" ==null){
			$("#shangchuang").show();
		}else{
			$("#tihuan").show();
		}
	}
}
</script>
<%@ include file="/jstl.jsp" %>
<div class="xiangq" id="fjShowDiv">
	<p>
        <c:if test="${adjunct=='' || adjunct ==null}"><a onclick="showEdit('#fjShowDiv', '#fjEditDiv')" id="accessory">还未上传简历附件</a></c:if>
   	     <c:if test="${adjunct!='' && adjunct !=null}"><a href="getFileDown?filePath=${accessory}">${adjunct}</a></c:if>
  	</p>
  	<div class="bj_grxs"><a href="javascript:void(0);" class="a_edit" onclick="showEdit('#fjShowDiv', '#fjEditDiv')">&nbsp;&nbsp;</a></div>
    <div class="clear"></div>
</div>
 <div class="basicEdit_a" id="fjEditDiv" style="display: none">
	 <c:if test="${adjunct !='' && adjunct !=null}">
	 	<p style="height:35px">${adjunct}&nbsp; &nbsp;<input type="button" id="" value="删除" onclick="delFileResume()"  class="btnup"></p>
	 </c:if>	
		<form id="resumeForm" enctype="multipart/form-data" action="user/fileResume" method="post">
		 	<input type="file"  name="accessory" id="upldAccessory" onchange="shangchuan();"/>
		 	<input type="hidden" name="userId" value="${userId }">
				<input type="submit" id="shangchuang" value="上传" style="display: none;" class="btnup">
				<input type="submit" id="tihuan" value="替换" style="display: none;"  class="btnup">
				<!-- <input type="button" id="" onclick="shangchuan();" value="上传"   class="btnup"> -->
			<%-- </c:if>
			<c:if test="${adjunct!='' && adjunct !=null}">
				<input type="submit" id="tihuan" value="替换" style="display: none;"  class="btnup">
				<input type="button" id="" onclick="tihuan();" value="替换"  class="btnup">
			</c:if> --%>
			
		</form>
 </div>