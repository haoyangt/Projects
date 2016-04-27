<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>开通招聘-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/ajax/ajax.js"></script>
<script type="text/javascript">
	$(function(){
		validateUtil.init($(document));
	});
</script>
</head>
<body  class="body_cs">
<div id="body">
	<div id="main">
	    <div class="container">
	        <div class="kt_zw">
	       		<div class="login_top">
	            	<div class="kt_title">开通招聘服务</div>
	            </div>
	            <p class="login_top" style="font-size:18px;">简单填写基本信息，开通招聘服务后即可免费发布职位</p>
	  <form action="company/add" method="post" id="companyForm">
	           <div class="fl" style="width:100%">
	           <div class="register_left" style="width:200px;"><span style="color: red;">*</span>
           		    <div id="facediv">  
                     	<p>
                       	 	<a>
                       	    <img id ="businessL" src="res/images/cor.png" width="118" height="119">
                      		</a>
                       	</p>	
                    </div> 
                   	<p style="width:100%;overflow: hidden;">
                   		<input type="button" value="上传营业执照"  id="businessLicense"  style="width:100px"/>
                   		<input type="hidden" name="companyInfo.businessLicense" id="buLicense"  style="width:100px"/>
                   	</p>
                 </div>
                 <!-- </div>
                  <div class="fl" style="width:100%"> -->
                 <div class="register_left" style="width:200px;"><span style="color: red;">*</span>
           		    <div id="facediv2">  
                     	<p>
                       	 	<a>
                       	    <img id ="organizationC" src="res/images/cor.png" width="118" height="119">
                      		</a>
                       	</p>	
                    </div> 
                   	<p style="width:100%;overflow: hidden;">
                   		<input type="button" value="组织机构代码证" id="organizationCode"  style="width:104px"/>
                   		<input type="hidden" name="companyInfo.organizationCode" id="orgCode"  style="width:104px"/>
                   	</p>
                 </div></div>
                 <div style="clear:both"></div>
	           	<div class="ktname_b">公司全称<span class="kt_font_x">（输入与公司营业执照一致的公司全称）</span></div>
	            <p class="login_top"><input name="companyInfo.companyName" id="companyName" value="${company.companyName}" type="text" placeholder="请输入与公司营业执照一致的公司名称" readonly="readonly" validate="required::请输入公司名称" class="login_input kt_input_w"></p>
	            
	            <div class="ktname_b">公司简称</div>
	            <p class="login_top"><input name="companyInfo.companyShortName" id="companyShortName" value="${company.companyShortName}" type="text" placeholder="请输入公众熟悉的简称" validate="required::请输入公司名称" class="login_input kt_input_w"></p>
	            <%-- <div class="ktname_b">公司</div>
	            <p class="login_top"><input name="companyInfo.companyShortName" id="companyShortName" value="${company.companyShortName}" type="text" placeholder="请输入公众熟悉的简称" validate="required::请输入公司名称" class="login_input kt_input_w"></p> --%>
	            <div class="ktname_b">公司网站</div>
	            <p class="login_top"><input name="companyInfo.homePage" id="homePage" value="${company.homePage}" type="text" placeholder="请输入公司主页网站" validate="required::请输入公司主页网站" class="login_input kt_input_w"></p>
	            <div class="ktname_b">接收简历Email<span class="kt_font_x">(为注册email，不可修改)</span></div>
	            <p class="login_top"><input name="companyInfo.email" id="email" value="${email}" type="text" readonly="readonly" class="login_input kt_input_w"></p>
	            <div class="ktname_b">行业领域</div>
                	<input name="companyInfo.filedes" id="industrySector" type="text" readonly="readonly"  placeholder="公司行业领域" validate="required::请输入公司行业领域" class="login_input kt_input_w login_input_bg" value="${company.filedes}">
                	<input id="industrySectorId" type="hidden" >
	           
	            <div class="ktname_b">公司专业<span class="kt_font_x">（请填写公司的专业）</span></div>
	            	<input name="companyInfo.major" id="companyMajor" type="text" readonly="readonly"  placeholder="公司专业" validate="required::请输入公司专业" class="login_input kt_input_w login_input_bg" value="${company.major}">
	            
	            <div class="ktname_b">公司性质<span class="kt_font_x">（请填写公司性质）</span></div>
	            	<input name="companyInfo.nature" id="natureBusiness" type="text" readonly="readonly"  placeholder="公司性质" validate="required::请输入公司性质" class="login_input kt_input_w login_input_bg" value="${company.nature}">
	           
	           	<div class="ktname_b">公司规模<span class="kt_font_x">（请填写公司规模大小）</span></div>
	           		<input name="companyInfo.scale" id="companyScale" type="text" readonly="readonly"  placeholder="公司规模" validate="required::请输入公司规模" class="login_input kt_input_w login_input_bg" value="${company.scale}">
	           
	            <div class="ktname_b">所在城市<span class="kt_font_x">（请选择城市）</span></div>
	            	<input name="companyInfo.city" id="currentCity" type="text" readonly="readonly"  placeholder="请选择城市" validate="required::请输入公司所在城市" class="login_input kt_input_w login_input_bg" value="${company.city}">
	             
	             <div class="ktname_b">公司地址<span class="kt_font_x">（请填写公司的详细地址）</span></div>
	            	<input name="companyInfo.addr" id="addr" type="text"  placeholder="请填写公司的详细地址" validate="required::请输入公司的详细地址" class="login_input kt_input_w" value="${company.addr}">
	           
	            <div class="ktname_b">公司简介<span class="kt_font_x">（请填写公司简介）</span></div>
	            <p class="login_top"><textarea name="companyInfo.companyDesc" cols="50" rows="4" placeholder="请输入公司简介" >${company.companyDesc}</textarea></p>
	            <span id="SpanText" style="color: red;"></span>
	            <div class="login_top" >
	            	<input  type="submit" id="present" value="提交" style="display: none;" class="btn_style1">
	            	<input  type="button" onclick="presentButten();" value="提交" class="btn_style1">
	            </div>
	   </form>
	           <div style="clear:both"></div>
	        </div>
	    
	    </div>
     <%@include file="/scanner.jsp" %>
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
	}
});

require(["jquery", "artLab", "res/artDialog/dialog-iframe", "placeholder"], function($, artLab, art, placeholder){
	top.dialog = art;
	var SectorId =  "";
	$("#industrySector").click(function(){
		$("#companyMajor").val("");
		art({
			id: 'artBoxForIndustrySector',
			title: "选择行业领域",
			data: {industrySectorId:"", industrySector:""},
			url: 'company/industrySector.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:120,
			onclose:function(){
				$("#industrySector").val(this.data.industrySector);
				$("#industrySectorId").val(this.data.industrySectorId);
				
				openCompanyMajorWindow(this.data.industrySectorId);
			}
		}).show(document.getElementById('industrySector'));
	});
	
	$("#companyMajor").click(function(){
		openCompanyMajorWindow("");
	});
	
	function openCompanyMajorWindow(date) {
		if(date==""){
			SectorId = $("#industrySectorId").val();
		}else{
			SectorId = date;
		}
		//alert(SectorId);
		if(SectorId != "") {
			art({
				id: 'artBoxForCompanyMajor',
				title: "选择公司专业",
				data: {companyMajorId:SectorId, companyMajor:""},
				url: 'company/companyMajor.jsp',
				quickClose: true,
				cancel: true,
				width: 460,
				height:120,
				onclose:function(){
					$("#companyMajor").val(this.data.companyMajor);
					this.data.companyMajorId = SectorId;
				}
			}).show(document.getElementById('companyMajor'));
		} else {
			artLab.msg("请先选择公司的行业领域");
		}
	}
	
	$("#natureBusiness").click(function(){
		art({
			id: 'artBoxForNatureBusiness',
			title: "选择公司性质",
			data: {natureBusiness:""},
			url: 'company/natureBusiness.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height:80,
			onclose:function(){
				$("#natureBusiness").val(this.data.natureBusiness);
			}
		}).show(document.getElementById('natureBusiness'));
	});
	
	$("#companyScale").click(function(){
		art({
			id: 'artBoxForCompanyScale',
			title: "选择公司规模",
			data: {companyScale:""},
			url: 'company/companyScale.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height: 80,
			onclose:function(){
				$("#companyScale").val(this.data.companyScale);
			}
		}).show(document.getElementById('companyScale'));
	});
	
	$("#currentCity").click(function(){
		art({
			id: 'artBoxForCurrentCity',
			title: "选择所在城市",
			data: {currentCity:""},
			url: 'company/currentCity.jsp',
			quickClose: true,
			cancel: false,
			width: 460,
			height: 50,
			onclose:function(){
				$("#currentCity").val(this.data.currentCity);
			}
		}).show(document.getElementById('currentCity'));
	});
	
});
function presentButten(){
	var companyName = $("#companyName").val();
	var companyShortName = $("#companyShortName").val();
	var industrySector = $("#industrySector").val();
	var companyMajor = $("#companyMajor").val();
	var natureBusiness = $("#natureBusiness").val();
	var companyScale = $("#companyScale").val();
	var businessLicense = $("#buLicense").val();
	var organizationCode = $("#orgCode").val();
	var addr = $("#addr").val();
	if(companyName!='' && companyShortName!='' && industrySector!='' && companyMajor!=''&& natureBusiness!='' && companyScale!='' && addr!='' && businessLicense!='' && businessLicense!=null && organizationCode!=''&& organizationCode!=null ){
		$("#present").click();
	}else{
		$("#SpanText").text("请填写完整带*的信息！");
	}
}
$('#businessLicense').on("click", function(){
	var title = "上传营业执照";
    var url = "company/businessLicense.jsp";
	top.dialog({
		id: 'artBoxForResume',
		title: title,
		url: url,
		quickClose: false,
		width: '900px',
		height: '520px',
		onclose: function(){
			if(this.returnValue){
				$("#businessL").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
			}
			$("#buLicense").val(this.returnValue);
		}
	}).showModal();
});
$('#organizationCode').on("click", function(){
	var title = "组织机构代码证";
    var url = "company/organizationCode.jsp";
	top.dialog({
		id: 'artBoxForResume',
		title: title,
		url: url,
		quickClose: false,
		width: '900px',
		height: '520px',
		onclose: function(){
			if(this.returnValue){
				$("#organizationC").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
			}
			$('#orgCode').val(this.returnValue);
		}
	}).showModal();
});
</script>
</html>
