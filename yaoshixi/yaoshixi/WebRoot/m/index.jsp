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

<!--组件依赖js end-->

</head>

<body >
<div id="page">
  <div class="cont">
    <header>
      <input name="" id="reveal-left" class="menu" type="button" >
      <h3>要实习</h3>
    </header>
    <section id="seach" class="gmu">
   		<form id="CjNameAction" action="" onsubmit="search()">
      		<input name="CjName" id="CjName" type="search" class="btnsearch" placeholder="请输入公司名称或职位名称">
    	</form>
    </section>
    <section id="hot-qy" class="hot-qy">
      <div class="hottitle"><span>热门企业</span><a href="m/companyIndex.jsp" title="更多企业" class="btn_gdzw" style=" float:right"></a></div>
      <div class="qy" id="topCompany">
        
      </div>
    </section>
    <section id="hot-zw" class="hot-zw">
      <div class="hottitle"><span>热门职位</span><a href="m/jobIndex.jsp" title="更多职位" class="btn_gdzw"></a></div>
      <div class="zw" id="hot_jobs">
      	
      </div>
    </section>
    <c:if test="${sessionScope.roleId != 1}">
	    <section id="hot-zw" class="hot-zw">
	      <div class="hottitle"><span>向我推荐</span><a href="m/jobIndex.jsp" title="更多职位" class="btn_gdzw"></a></div>
	      <div class="zw" id="TjjobsContent">
	      	
	      </div>
	    </section>
    </c:if>
    <section id="hot-zw" class="hot-zw">
      <div class="hottitle"><span>全部职位</span><a href="m/jobIndex.jsp" title="更多职位" class="btn_gdzw"></a></div>
      <div class="zw" id="alljobsContent">
      	
      </div>
    </section>
    <div class="resume">
    <!-- <section style="margin-bottom:10px;"> -->
    	<%-- <c:if test="${sessionScope.roleId == 1 || sessionScope.roleId == 2}">
    		<a class="a_login">已登录</a>
    	</c:if>
    	<c:if test="${sessionScope.roleId != 1 && sessionScope.roleId != 2}"> --%>
        	<a href="m/login.jsp">登录</a>
    	<%-- </c:if> --%>
    <!-- </section> -->
    </div>
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
  </div>
</div>
<script src="res/js/require.js"></script>
<script type="text/javascript">
$(function ($) {
    $('.panel').panel({
        contentWrap: $('.cont')
    });
    $('#reveal-left').on('click', function () {
        $('.panel').panel('toggle', 'reveal', 'left');
    });
}(Zepto));

 //创建组件
$("#gotop").gotop();
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
	top.dialog = art;
	$(document).ready(function(){
		topCompany();
		hostJob();
		tuiJobSan(); 
		allJobSan();
		if('${sessionScope.roleId}'==1){
			document.getElementById("tjJobs").style.display="none";
			if('${sessionScope.num}' != '' && '${sessionScope.num}' !=null && '${sessionScope.num}' != 0){
				var artBox = art({
    				id: 'artBoxForResume',
    				title: "简历提示",
    				url: "user/resumeRemind.jsp",
    				quickClose: false,
    				width: 600,
    				height:126
    			});
    			artBox.show();
			}
		}
	});
	function topCompany() {
		$.ajax({
			type:'POST',
			url:'topCompanyPhone',
			dataType:'html',
			success:function(html){
				$("#topCompany").html(html);
			}
		});
	}
	
	function hostJob(){
		$.ajax({
			type:'POST',
			url:'hotJobPhone',
			dataType:'html',
			success:function(html) {
				$("#hot_jobs").html(html);
			}
		});
	}
	
	function tuiJobSan() {
		$.ajax({
			type:'POST',
			url:'indRecommendSanPhone',
			dataType:'html',
			success:function(html) {
				$("#TjjobsContent").html(html);
			}
		});
	} 
	
	function allJobSan() {
		$.ajax({
			type:'POST',
			url:'indexModelSanPhone',
			dataType:'html',
			success:function(html) {
				$("#alljobsContent").html(html);
			}
		});
	}
});
	
	function search(){
		var CjName=$("#CjName").val();
		$("#CjNameAction").attr("action","<%=request.getContextPath()%>/m/jobIndex.jsp?CjName="+CjName);
	}
    
</script>
</body>
</html>