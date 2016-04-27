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
   <div class="uni">
   
   <ul style="float:left;width:100%">
     	<li style="width:17%;"><input type="button" id="xs" value="销售" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="sc" value="市场" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="sj" value="设计" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="jrcw" value="金融/财务" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="ithlw" value="IT/互联网" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="mywl" value="贸易/物流" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="sczz" value="生产/制造" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="xzrs" value="行政/人事" class="gzsz"/></li>
   		<li style="width:22%;"><input type="button" id="jyflzx" value="教育/法律/咨询" class="gzsz"/></li>
   		<li style="width:17%;"><input type="button" id="qt" value="其他" class="gzsz"/></li>
   	</ul>
   	<ul style="float:left;width:100%">
		<li class="xs" style="width:23%;display: none;"><a href='javascript:void(0);'>区域销售助理</a></li>
   		<li class="xs" style="width:23%;display: none;"><a href='javascript:void(0);'>大客户销售助理</a></li>
   		<li class="xs" style="width:23%;display: none;"><a  href='javascript:void(0);'>电话销售</a></li>
   		<li class="xs" style="width:23%;display: none;"><a  href='javascript:void(0);'>渠道/分销专员</a></li>
   		<li class="xs" style="width:23%;display: none;"><a  href='javascript:void(0);'>网络/在线销售</a></li>	
   		<li class="xs" style="width:25%;display: none;"><a href='javascript:void(0);'>业务拓展专员/助理</a></li>
   		<li class="xs" style="width:22%;display: none;"><a href='javascript:void(0);'>销售顾问</a></li>
   		<li class="xs" style="width:22%;display: none;"><a  href='javascript:void(0);'>售前支持</a></li>
   		
   		<li class="sc" style="width:23%;display: none;"><a href='javascript:void(0);'>市场营销</a></li>
   		<li class="sc" style="width:23%;display: none;"><a href='javascript:void(0);'>市场策划</a></li>
   		<li class="sc" style="width:23%;display: none;"><a  href='javascript:void(0);'>市场专员</a></li>
   		<li class="sc" style="width:23%;display: none;"><a  href='javascript:void(0);'>市场推广</a></li>
   		<li class="sc" style="width:23%;display: none;"><a  href='javascript:void(0);'>活动策划</a></li>	
   		<li class="sc" style="width:25%;display: none;"><a href='javascript:void(0);'>商务拓展</a></li>
   		
   		<li class="sj" style="width:23%;display: none;"><a href='javascript:void(0);'>平面设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a href='javascript:void(0);'>美术设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a  href='javascript:void(0);'>flash设计/开发</a></li>
   		<li class="sj" style="width:23%;display: none;"><a  href='javascript:void(0);'>UI设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a  href='javascript:void(0);'>特效设计</a></li>	
   		<li class="sj" style="width:23%;display: none;"><a href='javascript:void(0);'>美术编辑</a></li>
   		<li class="sj" style="width:23%;display: none;"><a href='javascript:void(0);'>园林设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a  href='javascript:void(0);'>包装设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a  href='javascript:void(0);'>家居设计</a></li>	
   		<li class="sj" style="width:23%;display: none;"><a href='javascript:void(0);'>工业设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a href='javascript:void(0);'>游戏界面设计</a></li>
   		<li class="sj" style="width:23%;display: none;"><a  href='javascript:void(0);'>原画师</a></li>
   		
   		<li class="jrcw" style="width:23%;display: none;"><a href='javascript:void(0);'>会计/出纳</a></li>
   		<li class="jrcw" style="width:23%;display: none;"><a href='javascript:void(0);'>审计</a></li>
   		<li class="jrcw" style="width:23%;display: none;"><a  href='javascript:void(0);'>保险业务员</a></li>
   		<li class="jrcw" style="width:23%;display: none;"><a  href='javascript:void(0);'>信托服务</a></li>
   		<li class="jrcw" style="width:23%;display: none;"><a  href='javascript:void(0);'>证券投资</a></li>	
   		<li class="jrcw" style="width:23%;display: none;"><a href='javascript:void(0);'>银行业务</a></li>
   		
   		<li class="ithlw" style="width:23%;display: none;"><a href='javascript:void(0);'>软件开发</a></li>
   		<li class="ithlw" style="width:23%;display: none;"><a href='javascript:void(0);'>硬件开发</a></li>
   		<li class="ithlw" style="width:23%;display: none;"><a  href='javascript:void(0);'>测试人员</a></li>
   		<li class="ithlw" style="width:23%;display: none;"><a  href='javascript:void(0);'>网络管理员</a></li>
   		<li class="ithlw" style="width:22%;display: none;"><a  href='javascript:void(0);'>网络维护运营</a></li>	
   		<li class="ithlw" style="width:22%;display: none;"><a href='javascript:void(0);'>IT销售</a></li>
   		<li class="ithlw" style="width:22%;display: none;"><a href='javascript:void(0);'>网站编辑</a></li>
   		<li class="ithlw" style="width:25%;display: none;"><a  href='javascript:void(0);'>网站运营专员/助理</a></li>
   		
   		<li class="mywl" style="width:23%;display: none;"><a href='javascript:void(0);'>采购专员/助理</a></li>
   		<li class="mywl" style="width:23%;display: none;"><a href='javascript:void(0);'>外贸跟单员</a></li>
   		<li class="mywl" style="width:23%;display: none;"><a  href='javascript:void(0);'>贸易助理</a></li>
   		<li class="mywl" style="width:23%;display: none;"><a  href='javascript:void(0);'>报关员</a></li>
   		<li class="mywl" style="width:23%;display: none;"><a  href='javascript:void(0);'>单证员</a></li>	
   		<li class="mywl" style="width:23%;display: none;"><a href='javascript:void(0);'>仓库管理员</a></li>
   		<li class="mywl" style="width:23%;display: none;"><a href='javascript:void(0);'>供应链管理</a></li>
   		
   		<li class="sczz" style="width:23%;display: none;"><a href='javascript:void(0);'>产品管理</a></li>
   		<li class="sczz" style="width:23%;display: none;"><a href='javascript:void(0);'>生产运营</a></li>
   		<li class="sczz" style="width:23%;display: none;"><a  href='javascript:void(0);'>汽车制造</a></li>
   		<li class="sczz" style="width:23%;display: none;"><a  href='javascript:void(0);'>机械制造</a></li>
   		<li class="sczz" style="width:23%;display: none;"><a  href='javascript:void(0);'>生物制药</a></li>	
   		
   		
   		<li class="xzrs" style="width:23%;display: none;"><a href='javascript:void(0);'>前台</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a href='javascript:void(0);'>行政专员/助理</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a  href='javascript:void(0);'>人事专员</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a  href='javascript:void(0);'>HR实习生</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a  href='javascript:void(0);'>媒体公关</a></li>	
   		<li class="xzrs" style="width:23%;display: none;"><a href='javascript:void(0);'>客服人员</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a href='javascript:void(0);'>招聘助理</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a href='javascript:void(0);'>部门秘书</a></li>
   		<li class="xzrs" style="width:23%;display: none;"><a href='javascript:void(0);'>后勤人员</a></li>
   		
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>专业顾问</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>兼职教师</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a  href='javascript:void(0);'>培训策划</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a  href='javascript:void(0);'>课程顾问</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a  href='javascript:void(0);'>律师助理</a></li>	
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>法务专员/助理</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>合同管理</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>调研员</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>咨询项目管理</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>笔译</a></li>
   		<li class="jyflzx" style="width:23%;display: none;"><a href='javascript:void(0);'>口译</a></li>
   		
   		<li class="qt" style="width:23%;display: none;"><a href='javascript:void(0);'>管培生</a></li>
   		<li class="qt" style="width:23%;display: none;"><a href='javascript:void(0);'>公务员</a></li>
   		<li class="qt" style="width:23%;display: none;"><a  href='javascript:void(0);'>社区服务</a></li>
   		<li class="qt" style="width:23%;display: none;"><a  href='javascript:void(0);'>志愿者</a></li>
   		<li class="qt" style="width:23%;display: none;"><a  href='javascript:void(0);'>地勤人员</a></li>	
   		<li class="qt" style="width:23%;display: none;"><a href='javascript:void(0);'>其他</a></li>
    </ul>	
   
   </div>
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
		var jobAttrValue = dialog.get("artBoxForJobAttr").data.jobAttrValue;
		var aArray = $("a");
		
		for ( var i = 0; i < jobAttrValue.length; i++) {
			for ( var j = 0; j < aArray.length; j++) {
				if(jobAttrValue[i] ===  aArray[j].innerHTML) {
					$(aArray[j]).addClass('current');
				} 
			}
		}
		
		$('a').each(function () { 
    	    $(this).click(function(){
    	    	var del = false;
    	    	
    	    	for ( var i = 0; i < jobAttrValue.length; i++) {
					if(jobAttrValue[i] ===  $(this).html()) {
						jobAttrValue.splice(i,1);
						del = true;
						$(this).removeClass("current");
					} 
				}
    	    	if(jobAttrValue.length < 3) {
    	    		if(del !== true) {
    	    			jobAttrValue.push($(this).html());
    					$(this).addClass("current");
    	    		}
				} 
    	    	dialog.get("artBoxForJobAttr").data.jobAttrValue = jobAttrValue;
    	    	dialog.get("artBoxForJobAttr").data.jobAttr = "";
    	    	for ( var k = 0; k < jobAttrValue.length; k++) {
    	    		dialog.get("artBoxForJobAttr").data.jobAttr += jobAttrValue[k] + ((k == jobAttrValue.length - 1)?"":"｜");
				}
    	    	
    	    });  
    	});
		dialog.get("artBoxForJobAttr").data.jobAttrValue = jobAttrValue;
    	dialog.get("artBoxForJobAttr").data.jobAttr = jobAttrValue.toString();
		$("#xs").click(function(){
			condition("xs");
		});
		$("#sc").click(function(){
			condition("sc");
		});
		$("#sj").click(function(){
			condition("sj");
		});
		$("#jrcw").click(function(){
			condition("jrcw");
		});
		$("#ithlw").click(function(){
			condition("ithlw");
		});
		$("#mywl").click(function(){
			condition("mywl");
		});
		$("#sczz").click(function(){
			condition("sczz");
		});
		$("#xzrs").click(function(){
			condition("xzrs");
		});
		$("#jyflzx").click(function(){
			condition("jyflzx");
		});
		$("#qt").click(function(){
			condition("qt");
		});
		function condition(dd){
			$(".xs").hide();
			$(".sc").hide();
			$(".sj").hide();
			$(".jrcw").hide();
			$(".ithlw").hide();
			$(".mywl").hide();
			$(".sczz").hide();
			$(".xzrs").hide();
			$(".jyflzx").hide();
			$(".qt").hide();
			
			$("."+dd+"").show();
		}
	});
	
</script>
</html>