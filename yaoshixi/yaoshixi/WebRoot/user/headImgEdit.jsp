<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp"%>
<%@ include file="/basePath.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%= basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传头像-要实习-专注于实习生招聘的互联网平台</title>
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<link href="res/imgAreaSelect/imgareaselect-default.css" rel="stylesheet" type="text/css" />
<script src="res/imgAreaSelect/jquery.imgareaselect.pack.js" charset="UTF-8"></script>

<script src="res/js/ajaxfileupload.js" charset="UTF-8"></script>

<script src="res/ajax/ajaxdialog.js" charset="UTF-8"></script>
<style type="text/css">
.btnup
{
background-color: #2c99cf;
	border: none;
	height: 25px;
	width: 50px;	
	cursor:pointer;
	line-height:25px;
	color:#FFF;
	}
.container{overflow:auto;height:500px;}
</style>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require([], function(){
		$(document).bind("saveLogoSuccess", function(){
			var logoName = $("#uploadedPhotoName").val();
			var dialog = top.dialog.get("artBoxForResume");
			dialog.close(logoName);
			dialog.remove();
		});
	});
</script>
<script type="text/javascript">
var imgWidth = 300;
var imgHeight = 300;
function ajaxUploadImg(){			
	$("#photoDiv").show();
	$("#preview").show();
	
	$.ajaxFileUpload({
		type:'POST',
		url:'company/uploadLogo',
		fileElementId: 'uploadImage',
		dataType:'json',
		success:function(json) {
     	   imgWidth = json.data.imgW;
     	   imgHeight = json.data.imgH;
     	   var src = "res/upload/logo/" + json.message;
     	  
     	   $("#photo").attr("src", src);
     	   $('#preview img').attr("src", src);
     	   
     	   var form = $("#photoForm");
     	   var uploadedFileName = json.message;
     	   $(form).find("input[name=photoName]").val(uploadedFileName);
     	   $("#upload_target").show();
		}
	});
}

function uploadAjaxForm(form){
	$.ajax({
		type:'post',
		url:$(form).attr("action"),
		dataType:'json',
		data:$(form).serialize(),
		success:function(json){
			if(json.statusCode == 1){
				$(document).trigger("saveLogoSuccess");
				return ;
			}
			alert("上传失败");
		},
		error:function(){
			alert("请检查网络后重试");
		}
	});
	return false;
}
</script>
</head>
<body>
<script type="text/javascript">

function preview(img, selection) {
    if (!selection.width || !selection.height)
        return;
    
    var scaleX = 125 / (selection.width || 1);
    var scaleY = 125 / (selection.height || 1);

    $('#preview img').css({
        width: Math.round(scaleX * imgWidth) + 'px',
        height: Math.round(scaleY * imgHeight)+ 'px',
        marginLeft: -Math.round(scaleX * selection.x1),
        marginTop: -Math.round(scaleY * selection.y1)
    });
    
    var form = $("#photoForm");
    $(form).find("input[name=x]").val(selection.x1);
    $(form).find("input[name=y]").val(selection.y1);
    $(form).find("input[name=width]").val(selection.width);
    $(form).find("input[name=height]").val(selection.height);
}

$(function () {
    $('#photo').imgAreaSelect({ x1: 120, y1: 90, x2: 280, y2: 210,
        fadeSpeed: 200, onSelectChange: preview });
});

</script>

	<div class="container demo">
	  <div style="float: left; width: 99%;">
	      <div class="instructions" style="margin-bottom:10px;"> 
	     	 <div id="fileDiv">
	     	 
	     	 <fieldset>
	     	  	<legend>请选择jpg图片：</legend>
		     		 <input type="file"  name="logo" id="uploadImage" value="" accept="image/*"  onchange="ajaxUploadImg()"/>
		    		<form id="photoForm" action="user/uploadImg" onsubmit="return uploadAjaxForm(this);" style="text-align:right">
				  		<input type="hidden" name="x" value=""/>
				  		<input type="hidden" name="y" value=""/>
				  		<input type="hidden" name="width" value=""/>
				  		<input type="hidden" name="height" value=""/>
				  		<input type="hidden" id="uploadedPhotoName" name="photoName" value=""/>
				  		<input type="submit"  id="upload_target" value="上传"  style="display: none;" class="btnup">
				  	</form>
	     	 </fieldset>
	      		
	    	 </div> 
	       </div>   
	 
	    <div id="photoDiv" class="frame"  style=" width: 300; height: 300;display:none;">
	      <div style="width:400px; height:400px; float:left;">
	      	<img id="photo" src="" style="width: 300; height: 300;border:1px solid #CCC;" />
	      </div>
	      <div id="preview" style="width: 125px; height: 125px; overflow: hidden; display: none;">
	        <img src="" style="border:1px solid #CCC;"/>
	      </div>
	    </div>
	     
	  </div>
	 
	  
	</div>
</body>
</html>
