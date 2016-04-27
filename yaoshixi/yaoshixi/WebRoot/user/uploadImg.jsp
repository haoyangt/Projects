<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<base href="<%= basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/js/ajaxfileupload.js"></script>
<!-- 提醒插件 -->
<script type="text/javascript" src="res/js/jquery.noty.packaged.min.js"></script>

<script type="text/javascript">
	function uploadImg() {
		var imgPath = $("#fileToUpload").val();
    	var m = imgPath.substring(imgPath.lastIndexOf("."),imgPath.length);
    	if(m != ".jpg" && m !=".png") {
    		//alert("请选择jpg头像或者png头像");
    		noty({text: '请选择jpg头像或者png头像' , type: 'error', timeout:2000});
    		return false;
    	}
		$.ajaxFileUpload({
			type:'POST',
			url:'user/uploadImg',
			fileElementId: 'fileToUpload',
			dataType:'json',
			success:function(data) {
				if(data['result'] == 1) {
					$("#facediv").css({"display":"block"});
					$("#face").attr("src",data['path']);
				}
			}
		});
	}
</script>

</head>
<body>
<input type="file" name="fileToUpload" id="fileToUpload" onchange="uploadImg();"/>
	<div id="facediv" style="display:none;z-index:100;">  
     	<img id="face" />  
 	</div> 
</body>
</html>

