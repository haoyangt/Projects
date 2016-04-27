<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>发布新职位-要实习-专注于实习生招聘的互联网平台</title>

<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<link href="res/jqslider/jqslider.css" rel="stylesheet" type="text/css" />
<link href="res/ueditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" charset="utf-8" src="res/ueditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="res/ueditor/editor_api.js"></script>
<script type="text/javascript" src="res/ueditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
.containerx{
    /* float: right; */
  	padding-top:60px;
    width: 810px;
	min-height:720px;
    padding-bottom:10px;
    position: relative;
	}
.wfb_zwx{
float:left;
/* background-color: #f5f5f5; */
border:1px dashed #E2E0E0;
position:relative;
padding:20px 0;
margin-top:20px; 
width:100%;}

.tt_bgx
{
	background-image: url(../res/images/ttt_bg.png);
	background-repeat: no-repeat;
	background-position: left top;
	color: #FFFFFF;
    font-size: 16px;
    font-weight: bold;
    height: 39px;
   /* left: 10px;   */
    line-height: 35px;
    padding-left: 10px;
    position: absolute;
    top: -19px;
    width: 146px;
    margin-left: 20px
	} 
#mainx {
	min-height:700px;
   /*  left: 42.4%;
    margin: 0 0 0 -519px;
    position: absolute; */
   /*  margin:0 auto; */
    width: 1024px;
}
</style>
</head>

<body>
<div id="body">
	
	
	
   <div id="mainx">
	
	

    <div class="containerx">
        
        <div class="kt_zwx">
           <div class="wfb_zwx" >
           <div>
           <span class="tt_bgx" id="postjob">发布新职位</span>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <span class="tt_bgx" id="postjobwith">带问题发布</span>
           </div>
            <div class="kt_bo" id="showcontent">
           
	          
    
   			 </div>
    	
           <div style="clear:both"></div></div>
        </div>
    
    </div>
     
    
 </div>
 <div style="clear:both"></div>
</div>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab',
		placeholder: 'res/js/placeholder',
		ajaxfileupload: 'res/js/ajaxfileupload'
	},
	shim: {
		'ajaxfileupload': {
			deps: ['jquery'],
			exports: 'ajaxfileupload'
		}
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe", "placeholder", "ajaxfileupload"], function($, artLab, art, placeholder, ajaxfileupload){
	top.dialog = art;
	 $(function(){
			validateUtil.init($(document));
			//$('input, textarea').placeholder();
		});
	$("#payment").click(function(){
		art({
			id: 'artBoxForCompensation',
			title: "选择薪资范围",
			data: {payment:""},
			url: 'company/job/compensation.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:80,
			onclose:function(){
				$("#payment").val(this.data.payment);
			}
		}).show(document.getElementById('payment'));
	});
	
	$("#temptation").dblclick(function(){
		art({
			id: 'artBoxForTemptation',
			title: "选择职位诱惑",
			data: {temptation:""},
			url: 'company/job/temptation.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:268,
			onclose:function(){
				var ss=$("#temptation").val();
				if(ss=='' || ss==null){
					ss=this.data.temptation;
				}else{
					ss=ss+"  "+this.data.temptation;
				}
				$("#temptation").val(ss);
			}
		}).show(document.getElementById('temptation'));
	});
	
	$("#jobRequest").dblclick(function(){
		art({
			id: 'artBoxForJobRequest',
			title: "选择任职要求",
			data: {jobRequest:""},
			url: 'company/job/jobRequest.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:268,
			onclose:function(){
				var ss=$("#jobRequest").val();
				if(ss=='' || ss==null){
					ss=this.data.jobRequest;
				}else{
					ss=ss+"  "+this.data.jobRequest;
				}
				$("#jobRequest").val(ss);
			}
		}).show(document.getElementById('jobRequest'));
	});
	//职位类别
	$("#jobAttr").click(function(){
		art({
			id: 'artBoxForJobAttr',
			title: "选择职位类别（最多选择3项）",
			data: {jobAttr:""},
			url: 'job/category.jsp',
			quickClose: true,
			cancel: true,
			cancelValue: '确定',
			width: 550,
			height:260,
			onclose:function(){
				$("#jobAttr").val(this.data.jobAttr);
			}
		}).show(document.getElementById('jobAttr'));
	});
	
	$("#currentCity").click(function(){
		art({
			id: 'artBoxForCurrentCity',
			title: "选择所在城市",
			data: {currentCityId:"",currentCity:""},
			url: 'company/currentCity.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:80,
			onclose:function(){
				$("#currentCity").val(this.data.currentCity);
				$("#currentCityId").val(this.data.currentCityId);
				openCompanyMajorWindow();
			}
		}).show(document.getElementById('currentCity'));
	});
	
	$("#postjob").click(function(){
		ajaxLoadHtml("wx/showpostjob", {}, "#showcontent");
	});
	
	$("#postjobwith").click(function(){
		ajaxLoadHtml("wx/showpostjobwith", {}, "#showcontent");
	});
	
	$("#currentArea").click(function(){
		openCompanyMajorWindow();
	});
	function openCompanyMajorWindow() {
		console.log($("#currentCityId").val());
		if($("#currentCityId").val() != "") {
			art({
				id: 'artBoxForCityRegion',
				title: "选择区域",
				data: {currentCityId: $("#currentCityId").val(), currentArea:""},
				url: 'company/cityRegion.jsp',
				quickClose: true,
				cancel: false,
				width: 460,
				height:80,
				onclose:function(){
					$("#currentArea").val(this.data.currentArea);
					
				}
			}).show(document.getElementById('currentArea'));
		} else {
			artLab.msg("请先选择城市");
		}
	}
	
	
});	

function backHome(){
	window.location.href="index.jsp";
}

function ajaxLoadHtml(url, data, target)
{
	$.ajax({
		type:'POST',
		url: url,
		data: data,
		dataType:'html',
	    success:function(html) {
	    	$(target).html(html);
	    }
	});
}
</script>
</html>
