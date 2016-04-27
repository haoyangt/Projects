<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.current{background-color: #66B3E0;color:#FFF;}
	.current a{color:#FFF}
</style>
</head>

<body>
   <%@ include file="../cfiles/major.jsp" %>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		var dialog = top.dialog;
		var majorArray = dialog.get("artBoxForCMajor").data.majorArray;
		var divId = dialog.get("artBoxForCMajor").data.fieldId
		$("div#"+divId).css('display','block');
		var aArray = $("div#"+divId).find("a");
		//console.log(aArray);
		for ( var i = 0; i < majorArray.length; i++) {
			for ( var j = 0; j < aArray.length; j++) {
				if(majorArray[i] ===  aArray[j].innerHTML) {
					$(aArray[j]).addClass('current');
				} /* else {	
					console.log("do nothing");
				} */
			}
		}
		
		$('a').each(function () { 
    	    $(this).click(function(){  
    	    	var del = false;
    	    	for ( var i = 0; i < majorArray.length; i++) {
					if(majorArray[i] ===  $(this).html()) {
						majorArray.splice(i,1);
						del = true;
						$(this).removeClass("current");
						//console.log("del");
					} /* else {	
						console.log("do nothing");
					} */
				}
    	    	if(del !== true) {
    	    		majorArray.push($(this).html());
					$(this).addClass("current");
					//console.log("add");
	    		}
    	    	dialog.get("artBoxForCMajor").data.majorArray = majorArray.toString();
    	    });  
    	});
		
		dialog.get("artBoxForCMajor").data.majorArray = majorArray.toString();
	});
	
	
</script>
</html>