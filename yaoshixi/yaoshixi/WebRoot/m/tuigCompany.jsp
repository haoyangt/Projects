<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<!--自己编写css -->
<link href="res/assets/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="res/assets/css/panel_demo.css" />

<!--组件依赖css begin-->
<link rel="stylesheet" type="text/css" href="res/assets/css/pull.css" />
<link rel="stylesheet" type="text/css" href="res/assets/css/widget/gotop/gotop.css" />
<link rel="stylesheet" type="text/css" href="res/assets/css/widget/panel/panel.css"/>
<link rel="stylesheet" type="text/css" href="res/assets/css/widget/panel/panel.default.css" />
<!--皮肤文件，若不使用该皮肤，可以不加载-->
<!--组件依赖css end-->
<!--组件依赖js begin-->
<script type="text/javascript" src="res/assets/js/dist/zepto.js"></script>
<script type="text/javascript" src="res/assets/js/core/gmu.js"></script>
<script type="text/javascript" src="res/assets/js/core/event.js"></script>
<script type="text/javascript" src="res/assets/js/core/widget.js"></script>
<script type="text/javascript" src="res/assets/js/extend/fix.js"></script>
<script type="text/javascript" src="res/assets/js/extend/touch.js"></script>
<script type="text/javascript" src="res/assets/js/extend/throttle.js"></script>
<script type="text/javascript" src="res/assets/js/extend/event.scrollStop.js"></script>
<script type="text/javascript" src="res/assets/js/extend/event.ortchange.js"></script>
<script type="text/javascript" src="res/assets/js/extend/matchMedia.js"></script>
<script type="text/javascript" src="res/assets/js/widget/panel/panel.js"></script>
<script type="text/javascript" src="res/assets/js/widget/gotop/gotop.js"></script>
<script type="text/javascript" src="res/assets/js/modernizr.custom.29473.js"></script>

<!--组件依赖js end-->

</head>

<body >
<div id="page">
  <div class="cont" style="min-height:600px">
    <header>
      <input name="" id="reveal-left" class="menu" type="button" >
      <h3>企业推广</h3>
      <input name="" id="reveal-right" class="category" type="button" >
    </header>
    <section id="seach" class="gmu">
   		<form id="jobSeek" action="" onsubmit="search()">
      	   <p><input name="companyName" id="companyName" type="search" class="btnsearch" placeholder="搜索公司"></p>
    	</form>
    </section>
    <section id="hot-zw" class="hot-zw">
      <div class="hottitle"><span>企业推广</span><!-- <a href="#"  style=" float:right">more</a> --></div>
      <div class="zw" id="alljobsC">
      	
      </div>
      
      <div id="moreLogin" class="loading"><a onclick="morePost()">加载更多</a></div>
    </section>
    
    <footer>
     <p>©2013-2014要实习网 粤ICP备10202188号-4</p>
    </footer>
     <div id="gotop"></div>
  </div>
  <div class="panel">
    <a href="m/index.jsp"><h3>要实习</h3></a>
    <ul class="panel-dir">
      <li><a href="m/index.jsp">首页</a></li>
      <li><a href="m/companyIndex.jsp">公司</a></li>
      <li><a href="m/jobIndex.jsp">职位</a></li>
    </ul>
    <div class="panel-category ac-container">
      <div>
			<input id="ac-1" name="accordion-1" type="checkbox" />
			<label for="ac-1">公司城市</label>
			<article class="ac-small">
				<ul id="workplaces">
				 <li><a onclick="companyCity('');">不限</a></li>
				 <li><a onclick="companyCity('广州');">广州</a></li>
				 <li><a onclick="companyCity('深圳');">深圳</a></li>
				</ul>
			</article>
		</div>
		<div>
			<input id="ac-6" name="accordion-1" type="checkbox" />
			<label for="ac-6">公司认证</label>
			<article class="ac-small">
				<ul id="workplaces">
				 <li><a onclick="authentication('');">不限</a></li>
				 <li><a onclick="authentication('2');">已认证</a></li>
				 <li><a onclick="authentication('1');">未认证</a></li>
				</ul>
			</article>
		</div>
		<div>
			<input id="ac-2" name="accordion-1" type="checkbox" />
			<label for="ac-2">公司规模</label>
			<article class="ac-mediuma">
				<ul id="monthlyPay">
				    <li><a onclick="companyScale('')">不限</a></li>
				 	<li><a onclick="companyScale('少于15人')">少于15人</a></li>
				 	<li><a onclick="companyScale('15-50人')">15-50人</a></li>
				 	<li><a onclick="companyScale('50-150人')">50-150人</a></li>
				 	<li><a onclick="companyScale('150-500人')">150-500人</a></li>
				 	<li><a onclick="companyScale('500-2000人')">500-2000人</a></li>
				 	<li><a onclick="companyScale('2000人以上')">2000人以上</a></li>
				</ul>
		    </article>
		</div>
		<div>
			<input id="ac-3" name="accordion-1" type="checkbox" />
			<label for="ac-3">公司性质</label>
			<article class="ac-mediumb">
				<ul id="xueLi">
				 <li><a onclick="companyNature('')">不限</a></li>
				 <li><a onclick="companyNature('有限责任公司')">有限责任公司</a></li>
				 <li><a onclick="companyNature('股份有限公司')">股份有限公司</a></li>
				 <li><a onclick="companyNature('国有独资公司')">国有独资公司</a></li>
				 <li><a onclick="companyNature('个人独资企业')">个人独资企业</a></li>
				 <li><a onclick="companyNature('合伙企业')">合伙企业</a></li>
				 <li><a onclick="companyNature('个体工商户')">个体工商户</a></li>
				 <li><a onclick="companyNature('私营企业')">私营企业</a></li>
				 <li><a onclick="companyNature('外商投资企业')">外商投资企业</a></li>
				</ul>
			</article>
		</div>
		<div>
			<input id="ac-5" name="accordion-1" type="checkbox" />
			<label for="ac-5">行业类别</label>
			<article class="ac-large2">
				<ul id="howDays">
					<li><a  onclick="majorLb('')">不限</a></li>
				 <li><a  onclick="majorLb('IT行业')">IT行业</a></li>
				 <li><a onclick="majorLb('金融行业')">金融行业</a></li>
				 <li><a onclick="majorLb('专业服务')">专业服务</a></li>
				 <li><a onclick="majorLb('教育培训行业')">教育培训行业</a></li>
				 <li><a onclick="majorLb('消费品行业')">消费品行业</a></li>
				 <li><a onclick="majorLb('医疗/卫生')">医疗/卫生</a></li>
				 <li><a onclick="majorLb('制造工业')">制造工业</a></li>
				 <li><a onclick="majorLb('文化传媒行业')">文化传媒行业</a></li>
				 <li><a onclick="majorLb('建筑/房地产')">建筑/房地产</a></li>
				 <li><a onclick="majorLb('贸易物流行业')">贸易物流行业</a></li>
				 <li><a onclick="majorLb('服务业')">服务业</a></li>
				 <li><a onclick="majorLb('其他')">其他</a></li>
				</ul>
	    	</article>
		</div>
    </div>
  </div>
</div>
<script type="text/javascript">
var companyName = '';//公司名称
var city = '';//城市
var scale = '';//规模
var nature = '';//公司性质
var field = '';//从事领域
var authenti = '';//公司认证
$(function ($) {
    $('.panel').panel({
        contentWrap: $('.cont')
    });
    $('#reveal-left').on('click', function () {
    	$('.panel-dir').css('display','block'); 
        $('.panel-category').css('display','none'); 
        $('.panel').panel('toggle', 'reveal', 'left');
    });
    $('#reveal-right').on('click', function () {
    	$('.panel-category').css('display','block'); 
        $('.panel-dir').css('display','none'); 
        $('.panel').panel('toggle', 'reveal', 'right');
    });
    $('#workplaces li').click(function(){
		$(this).addClass("cselect").siblings().removeClass("cselect");
	});
	 $('#monthlyPay li').click(function(){
			$(this).addClass("cselect").siblings().removeClass("cselect");
		});
	 $('#xueLi li').click(function(){
			$(this).addClass("cselect").siblings().removeClass("cselect");
		});
	 $('#jobXinZhi li').click(function(){
			$(this).addClass("cselect").siblings().removeClass("cselect");
		});
	 $('#howDays li').click(function(){
			$(this).addClass("cselect").siblings().removeClass("cselect");
		});
}(Zepto));
 //创建组件
$("#gotop").gotop();
companyName = "<%=request.getParameter("companyName") %>";
 $.ajax({
	type:'POST',
	url:'c/tuigmodelPhone/10',
	data:{"companyName":companyName,"city":city,"scale":scale,"nature":nature,"field":field,"authentication":authenti},
	dataType:'html',
	success:function(html) {
		$("#alljobsC").html(html);
		if($("#companyNames").val() != null && $("#companyNames").val() != '' && $("#companyNames").val() != 'null'){
			$("#companyName").val($("#companyNames").val());
		}
		var companyCount = $("#companyCount").val();
		var num = $("#num").val();
		if(Number(companyCount) < Number(num) ){
			document.getElementById("moreLogin").style.display="none";
		}
	}
}); 
	function morePost(){
		var num = $("#num").val();
		var ss = Number(num)+Number(10);
		$.ajax({
			type:'POST',
			url:'c/tuigmodelPhone/'+ss,
			data:{"companyName":companyName,"city":city,"scale":scale,"nature":nature,"field":field,"authentication":authenti},
			dataType:'html',
			success:function(html) {
				$("#alljobsC").html(html);
				if($("#companyNames").val() != null && $("#companyNames").val() != '' && $("#companyNames").val() != 'null'){
					$("#companyName").val($("#companyNames").val());
				}
				var companyCount = $("#companyCount").val();
				var num = $("#num").val();
				if(Number(companyCount) < Number(num) ){
					document.getElementById("moreLogin").style.display="none";
				}
			}
		});
	}
	function companyCity(date){
		city = date;
		autoSubmit();
	}
	function companyScale(dates){
		scale = dates;
		autoSubmit();
	}
	function companyNature(dds){
		nature = dds;
		autoSubmit();
	}
	function majorLb(lb){
		field = lb;
		autoSubmit();
	}
	function authentication(rz){
		authenti = rz;
		autoSubmit();
	}
	
	function autoSubmit() {
		companyName = $("#companyName").val();
		$.ajax({
			type:'POST',
			url:'c/tuigmodelPhone/10',
			data:{"companyName":companyName,"city":city,"scale":scale,"nature":nature,"field":field,"authentication":authenti},
			dataType:'html',
			success:function(html) {
				$("#alljobsC").html(html);
				if($("#companyNames").val() != null && $("#companyNames").val() != '' && $("#companyNames").val() != 'null'){
					$("#companyName").val($("#companyNames").val());
				}
				var companyCount = $("#companyCount").val();
				var num = $("#num").val();
				if(Number(companyCount) < Number(num) ){
					document.getElementById("moreLogin").style.display="none";
				}
			}
		});	
	}
    
</script>
</body>
</html>