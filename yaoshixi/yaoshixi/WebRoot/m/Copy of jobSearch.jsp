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
<style type="text/css">
	.current{background-color: #66B3E0;color:#FFF;}
	.current a{color:#FFF}
</style>
<!--组件依赖js end-->

</head>

<body >
<div id="page">
  <div class="cont" style="min-height:600px">
    <header>
      <input name="" id="reveal-left" class="menu" type="button" >
      <h3>职位搜索</h3>
      <!-- <input name="" id="reveal-right" class="category" type="button" > -->
    </header>
    <section id="seach" class="gmu">
   		<form id="jobSeek" action="" onsubmit="search()">
      	   <p><input name="CjName" id="CjName" type="search" class="btnsearch" placeholder="搜索职位"></p>
    	</form>
    </section>
    <div class="s-condition">
    	<table width="100%">
    		<tr style="background-color:#E6F1F7;">
    			<td width="85px"><b>职位城市：</b></td>
    			<td>
    				<a id="" class="current" id="unlimited1" onclick="workplace(this)">不限</a>
    				<a id="广州" onclick="workplace(this)">广州</a>
    				<a id="深圳" onclick="workplace(this)">深圳</a>
    			</td>
    		</tr>
    		<tr>
    			<td valign="top"><b>月薪范围：</b></td>
    			<td>
    				<a id="" class="current" onclick="pay(this);">不限</a>
				 	<a id="面议" onclick="pay(this);">面议</a>
				 	<a id="0-1000元" onclick="pay(this);">0-1000元</a>
				 	<a id="1001-3000元" onclick="pay(this);">1001-3000元</a>
				 	<a id="3001-5000元" onclick="pay(this);">3001-5000元</a>
				 	<a id="5000以上" onclick="pay(this);">5000以上</a>
    			</td>
    		</tr>
			<tr style="background-color:#E6F1F7;">
				<td><b>工作性质：</b></td>
				<td>
					<a id="" class="current" onclick="jobCategorys(this);">不限</a>
				    <a id="1" onclick="jobCategorys(this);">全职</a>
				 	<a id="2" onclick="jobCategorys(this);">按天</a>
				 	<a id="3" onclick="jobCategorys(this);">按小时</a>
				</td>
			</tr>
    		<tr>
    			<td><b>发布时间：</b></td>
    			<td>
    				<a class="current" id="" onclick="releaseTimes(this);">不限</a>
				 	<a id="0" onclick="releaseTimes(this);">今天</a>
				 	<a id="2" onclick="releaseTimes(this);">3天内</a>
				 	<a id="6" onclick="releaseTimes(this);">一周内</a>
    			</td>
    		</tr>
    	</table>
    </div>
   <section id="hot-zw" class="hot-zw">
      <div class="hottitle"><span>搜索结果</span></div>
       <div class="zw" id="alljobsC">
      	
      </div>
      
      <div id="moreLogin" class="loading" style="display: none;"><a onclick="morePost()">加载更多</a></div> 
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
				 <li><a id="fbsj1" name="" onclick="releaseTimes(this);">不限</a></li>
				 <li><a id="fbsj2" name="0" onclick="releaseTimes(this);">今天</a></li>
				 <li><a id="fbsj3" name="2" onclick="releaseTimes(this);">3天内</a></li>
				 <li><a id="fbsj4" name="6" onclick="releaseTimes(this);">一周内</a></li>
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
	 $('#citys li').click(function(){
			$(this).addClass("current").siblings().removeClass("current");
			$("#unlimited1").removeClass("current");
		});
}(Zepto));
 //创建组件
$("#gotop").gotop();

/* $.ajax({
	type:'POST',
	url:'indexModelPhone/10',
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
}); */
	function morePost(){
		var num = $("#num").val();
		var ss = Number(num)+Number(10);
		$.ajax({
			type:'POST',
			url:'indexModelPhone/'+ss,
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
		$(city2).addClass("current").siblings().removeClass("current");
		city = city2.id;
		ajaxSearchJob();
	}
	function pay(_scope){
		$(_scope).addClass("current").siblings().removeClass("current");
		scope = _scope.id;
		ajaxSearchJob();
	}
	function education(xueli2){
		$(xueli2).addClass("current").siblings().removeClass("current");
		xueli = xueli2.id;
		ajaxSearchJob();
	}
	function jobCategorys(jobCategory2){
		$(jobCategory2).addClass("current").siblings().removeClass("current");
		jobCategory = jobCategory2.id;
		ajaxSearchJob();
	}
	function releaseTimes(s){
		$(s).addClass("current").siblings().removeClass("current");
		releaseTime = s.id;
		ajaxSearchJob();
	}
	
	function ajaxSearchJob() {
		CjName = $("#CjName").val();
		$.ajax({
			type:'POST',
			url:'indexModelPhone/10',
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