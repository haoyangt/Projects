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
<title>要实习-专注于社交招聘的互联网平台</title>
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
      <h3>热门职位</h3>
      <input name="" id="reveal-right" class="category" type="button" >
    </header>
    <section id="seach" class="gmu">
   		<form id="jobSeek" action="" onsubmit="search()">
      	   <p><input name="CjName" id="CjName" type="search" class="btnsearch" placeholder="搜索职位"></p>
    	</form>
    </section>
    <section id="hot-zw" class="hot-zw">
      <div class="hottitle"><span>热门职位</span><!-- <a href="#"  style=" float:right">more</a> --></div>
      <div class="zw" id="alljobsC">
      	
      </div>
      
      <div id="moreLogin" class="loading"><a onclick="morePost()">加载更多</a></div>
    </section>
    
    <footer>
     <p>&copy; 粤ICP备10202188号-4</p>
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
			<label for="ac-1">职位城市</label>
			<article class="ac-small">
				<ul id="workplaces">
				 <li><a onclick="workplace('');">不限</a></li>
				 <li><a onclick="workplace('广州');">广州</a></li>
				 <li><a onclick="workplace('深圳');">深圳</a></li>
				</ul>
			</article>
		</div>
		<div>
			<input id="ac-2" name="accordion-1" type="checkbox" />
			<label for="ac-2">月薪范围</label>
			<article class="ac-medium">
				<ul id="monthlyPay">
				    <li><a onclick="pay('');">不限</a></li>
				 	<li><a onclick="pay('面议');">面议</a></li>
				 	<li><a onclick="pay('0-1000元');">0-1000元</a></li>
				 	<li><a onclick="pay('1001-3000元');">1001-3000元</a></li>
				 	<li><a onclick="pay('3001-5000元');">3001-5000元</a></li>
				 	<li><a onclick="pay('5000以上');">5000以上</a></li>
				</ul>
		    </article>
		</div>
		<div>
			<input id="ac-3" name="accordion-1" type="checkbox" />
			<label for="ac-3">最低学历</label>
			<article class="ac-medium">
				<ul id="xueLi">
				 <li><a onclick="education('1');">不限</a></li>
				 <li><a onclick="education('2');">高中</a></li>
				 <li><a onclick="education('3');">专科</a></li>
				 <li><a onclick="education('4');">本科</a></li>
				 <li><a onclick="education('5');">硕士</a></li>
				 <li><a onclick="education('6');">博士</a></li>
				</ul>
			</article>
		</div>
		<div>
			<input id="ac-4" name="accordion-1" type="checkbox" />
			<label for="ac-4">工作性质</label>
			<article class="ac-large">
				<ul id="jobXinZhi">
				 <li><a onclick="jobCategorys('');">不限</a></li>
				 <li><a onclick="jobCategorys('1');">全职</a></li>
				 <li><a onclick="jobCategorys('2');">按天</a></li>
				 <li><a onclick="jobCategorys('3');">按小时</a></li>
				</ul>
			</article>
		</div>
		<div>
			<input id="ac-5" name="accordion-1" type="checkbox"/>
			<label for="ac-5">发布时间</label>
			<article class="ac-large">
				<ul id="howDays">
				 <li><a onclick="releaseTimes('');">不限</a></li>
				 <li><a onclick="releaseTimes('0');">今天</a></li>
				 <li><a onclick="releaseTimes('2');">3天内</a></li>
				 <li><a onclick="releaseTimes('6');">一周内</a></li>
				</ul>
	    	</article>
		</div>
    </div>
  </div>
</div>
<script type="text/javascript">
var CjName = '';//职位名称
var city = ''; //城市
var scope = ''; //薪资
var xueli = ''; //学历
var jobCategory='';//工作性质
var releaseTime = '';//发布时间
CjName = "<%=request.getParameter("CjName") %>";
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

$.ajax({
	type:'POST',
	url:'hotJobIndexPhone/10',
	data:{"CjName":CjName,"city":city,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope},
	dataType:'html',
	success:function(html) {
		$("#alljobsC").html(html);
		if($("#CjNames").val() != null && $("#CjNames").val() != '' && $("#CjNames").val() != 'null'){
			$("#CjName").val($("#CjNames").val());
		}
		var jobsCount = $("#jobsCount").val();
		var num = $("#num").val();
		if(Number(jobsCount) < Number(num) ){
			document.getElementById("moreLogin").style.display="none";
		}else{
			document.getElementById("moreLogin").style.display="block";
		}
	}
});
	function morePost(){
		var num = $("#num").val();
		var ss = Number(num)+Number(10);
		$.ajax({
			type:'POST',
			url:'hotJobIndexPhone/'+ss,
			data:{"CjName":CjName,"city":city,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope},
			dataType:'html',
			success:function(html) {
				$("#alljobsC").html(html);
				if($("#CjNames").val() != null && $("#CjNames").val() != '' && $("#CjNames").val() != 'null'){
					$("#CjName").val($("#CjNames").val());
				}
				var jobsCount = $("#jobsCount").val();
				var num = $("#num").val();
				if(Number(jobsCount) < Number(num) ){
					document.getElementById("moreLogin").style.display="none";
				}else{
					document.getElementById("moreLogin").style.display="block";
				}
			}
		});
	}
	function genKeyordsy(){
		ajaxSearchJob();
	}
	function workplace(city2){
		city = city2;
		ajaxSearchJob();
	}
	function pay(_scope){
		scope = _scope;
		ajaxSearchJob();
	}
	function education(xueli2){
		xueli = xueli2;
		ajaxSearchJob();
	}
	function jobCategorys(jobCategory2){
		jobCategory = jobCategory2;
		ajaxSearchJob();
	}
	function releaseTimes(releaseTime2){
		releaseTime = releaseTime2;
		ajaxSearchJob();
	}
	
	function ajaxSearchJob() {
		CjName = $("#CjName").val();
		$.ajax({
			type:'POST',
			url:'hotJobIndexPhone/10',
			data:{"CjName":CjName,"city":city,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope},
			dataType:'html',
			success:function(html) {
				$("#alljobsC").html(html);
				if($("#CjNames").val() != null && $("#CjNames").val() != '' && $("#CjNames").val() != 'null'){
					$("#CjName").val($("#CjNames").val());
				}
				var jobsCount = $("#jobsCount").val();
				var num = $("#num").val();
				if(Number(jobsCount) < Number(num) ){
					document.getElementById("moreLogin").style.display="none";
				}else{
					document.getElementById("moreLogin").style.display="block";
				}
			}
		});	
	}
    
</script>
</body>
</html>