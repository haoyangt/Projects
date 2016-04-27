<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="要实习™是远界咨询旗下的实习生招聘网站,专注于提供实习生职位信息,为企业和实习生建立方便快捷的合作通道。" name="description">
<meta content="要实习,实习,要实习招聘,要实习网,实习生招聘,要实习实习生招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 远界咨询官网, 远界百科,跳槽, 高薪职位, 互联网圈子, 招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招" name="keywords">
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="res/js/w.js"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<!-- <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script> -->
<script src="res/js/require.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#forum").removeClass("licurrent");
	$("#companys").removeClass("licurrent");
	$("#Resume").removeClass("licurrent");
	$("#release").removeClass("licurrent");
	$("#manage").removeClass("licurrent");
	$("#indexSy").addClass("licurrent");
});
</script>
</head>
<body  class="body_cs">
<div id="body">
	<a id="top"></a> 
	<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
	<div id="main">
		<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>
    <div class="container">
    	<!-- <div class="adver" style="height: 197px;">
    		<a target="_blank" href="kindelActivity.jsp"><img height="197px;" width="100%" src="res/images/assets/xshdtpTou.jpg"/></a>
    	</div> -->
    	<div id="search_box">
    	<div class="re-dropdown-layout">
                    <div class="re-dropdown" title="全职">
                        <span id="seekType">职位</span>
                        <i class="caret"></i>
                    </div>
                    <ul >
                        <li id="seekZw" style="display: none;">
                            <a onclick="seekType('职位')">职位</a>
                        </li>
                        <li id="seekGs">
                            <a onclick="seekType('公司')">公司</a>
                        </li>
                    </ul>
                </div>
    	
    	<input id="search_input"  type="text" placeholder="请输入公司名称或职位名称" onkeydown="search();"  value="" tabindex="1" name="kd" >
    	<a id="ycbq" target="_blank" href="searchJobs.jsp" ></a>
    	<input id="search_button" class="search_button" onclick="genKeyord('');"  type="submit" value="找职位">
    	
    	</div>
    	<div class="rmhy"><label>热门职位：</label><span><a onclick="genKeyord('实习');">实习</a></span><span><a onclick="genKeyord('助理');">助理</a></span><span><a onclick="genKeyord('销售');">销售</a></span><span><a onclick="genKeyord('Java');">Java</a></span><span><a onclick="genKeyord('Android');">Android</a></span><span><a onclick="genKeyord('软件测试');">软件测试</a></span></div>
        
     <div id="ifocus">
	<div id="ifocus_pic">
		<div id="ifocus_piclist" style="left:0; top:0;">
			<ul>
				<li><a target="_blank" href="kindelActivity.jsp"><img src="res/images/upload/v2.jpg" alt="" /></a></li>
				<li><a target="_blank" href="seajs/indexImage.jsp"><img src="res/images/upload/y2.jpg" alt="" /></a></li>
				<li><a target="_blank" href="seajs/ggwSan.jsp"><img src="res/images/upload/g1.jpg" alt="" /></a></li>
			</ul>
		</div>
		<div id="ifocus_opdiv" style="display: none;"></div>
		<div id="ifocus_tx" style="display: none;">
			<ul>
				<li class="current"></li>
				<li class="normal"></li>
				<li class="normal"></li>
			</ul>
		</div>
	</div>
	<div id="ifocus_btn">
		<ul>
			<li class="current"><img src="res/images/upload/v3.jpg" alt="" /></li>
			<li class="normal"><img src="res/images/upload/y3.jpg" alt="" /></li>
			<li class="normal"><img src="res/images/upload/g2.jpg" alt="" /></li>
		</ul>
	</div>
</div>
        
       
        <div class="adver" id="topCompany">
        
    	</div>
        <div class="hot_zw">
        	<div class="xin_title">
           	<div class="title_za">
           	 	<input type="button" id="hotJobs" onclick="hostJobSan();"  class="btqbzw current_i" value="热门职位" />
           	 </div>
           	 <c:if test="${sessionScope.roleId != 1}">
	           	 <div class="title_za">
	           	 	<input type="button" id="tuij" onclick="tuiJobSan();"  class="btqbzw" value="向我推荐" /> 
	           	 </div>
           	 </c:if>
           	  <div class="title_za">
           	 	<input type="button" id="all" onclick="allJobSan();"  class="btqbzw" value="全部职位" />
           	 </div>
           </div>
           <div class="tuij" id="hotdivjobs">
           		<!-- <div class="tag_qb"><img width="35" height="121" src="res/images/qbzw.gif"></div> -->
           		<div id="hotjobsContent">
           		
           		</div>
           		<div id="hotMoreJobs" class="mgdzw"><a onclick="hotPost();" title="更多职位" class="btn_gdzw"></a></div>
           </div> 
           <div class="tuij" id="tjJobs" style="display: none;">
           		<!--  <div class="tag_qb"><img width="35" height="121" src="res/images/xwtj.gif"></div> -->
           		<div id="TjjobsContent">
           		
           		</div>
           		<div class="mgdzw" id="tjMoreJobs"><a onclick="recommend();" title="更多职位" class="btn_gdzw"></a></div>
           </div>
           <div class="tuij" id="allJobs" style="display: none;">
           		<!-- <div class="tag_qb"><img width="35" height="121" src="res/images/qbzw.gif"></div> -->
           		<div id="alljobsContent">
           		
           		</div>
           		<div id="allMoreJobs" class="mgdzw"><a onclick="allPost();" title="更多职位" class="btn_gdzw"></a></div>
           </div> 
           
           <div class="f_links">
             <label>友情链接：</label><a target="_blank" href="http://www.36kr.com/" >36氪网</a>|
             <a target="_blank" href="http://www.szhrss.gov.cn/">深圳市人力资源和社会保障局</a>|
             <a target="_blank" href="http://www.hrssgz.gov.cn/">广州市人力资源和社会保障局</a>|
             <a target="_blank" href="http://www.hao123.com/">Hao123</a>|
             <a target="_blank" href="http://hao.360.cn/">360导航</a>|
             <a target="_blank" href="http://se.360.cn/">360安全浏览器</a>
             
           </div>
           <div style="clear:both"></div>
         </div>
         <div style="clear:both"></div>
    </div>
   
    <div class="bottomlogin" id="weiLogin">
     <div class="bt-cont">
         <div class="bt-tr"></div>
          <img alt="" src="res/images/yuu.png" style="position: absolute;top:7px;left:-132px;">
          <div class="bt-number"><span id="userNum"></span>活跃用户</div>
          <div class="bt-number2"><span id="jobNum"></span>有效职位</div>
          <div class="bt-register">
          <a target="_blank" href="user/regist.jsp" class="a-reg"><img alt="" src="res/images/nggv.png" style="margin:20px 0 0 15px"></a>
          </div>
          <div class="bt-login">
  				<a target="_blank" href="login.jsp" class="a-login"><img alt="" src="res/images/logins.png" style="margin:22px 0 0 15px"></a>
<%-- =======
	          <c:if test="${sessionScope.userName == '' || sessionScope.userName == null}">
          			<a target="_blank" href="login.jsp" class="a-login"><img alt="" src="res/images/logins.png" style="margin:20px 0 0 15px"></a>
	          </c:if>
	           <c:if test="${sessionScope.userName != '' && sessionScope.userName != null}">
          			<a>${sessionScope.userName}</a>
	          </c:if>
>>>>>>> .r1589 --%>
          </div>
     </div>
    </div>
      <%@include file="/footer.jsp" %>
     <%-- <!-- 二维码扫一扫 -->
	    <%@include file="/scanner.jsp" %> --%>
	</div>
	<div style="clear:both"></div>
</div>
</body>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
	top.dialog = art;
	if('${sessionScope.roleId}' != null && '${sessionScope.roleId}' != ''){
		document.getElementById("weiLogin").style.display="none";
	}
	topCompany();
	hostJob();
	/* tuiJobSan(); 
	allJobSan(); */
	$.ajax({
		type:'POST',
		url:'statisticsData',
		dataType:'json',
		success:function(json) {
			$("#userNum").text(json.userNum);
			$("#jobNum").text(json.jobNum);
		}
	});
	if('${sessionScope.roleId}'== 1){
		document.getElementById("tjJobs").style.display="none";
		if('${sessionScope.num}' != '' && '${sessionScope.num}' !=null && '${sessionScope.num}' != 0){
			//createArtBox("简历提示", "user/resumeRemind.jsp");
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
		/* $("#all").mouseover(function(){
	   		$(this).addClass("current_i");        
	    }).mouseout(function(){
	    	$(this).removeClass("current_i");
	   });
		$("#tuij").mouseover(function(){
	   		$(this).addClass("current_i");        
	    }).mouseout(function(){
	    	$(this).removeClass("current_i");
	   });
		$("#hotJobs").mouseover(function(){
	   		$(this).addClass("current_i");        
	    }).mouseout(function(){
	    	$(this).removeClass("current_i");
	   }); */
		
	/* function createArtBox(title, url, data) {
		var artBox = art({
			id: 'artBoxForResume',
			title: title,
			data: data,
			url: url,
			quickClose: false,
			cancel:false,
			width: 600
		});
		return artBox.show();
	} */
	function topCompany() {
		$.ajax({
			type:'POST',
			url:'topCompany',
			dataType:'html',
			success:function(html) {
				$("#topCompany").html(html);
			}
		});
	}
	
	function hostJob(){
		$.ajax({
			type:'POST',
			url:'hotJobsSan',
			dataType:'html',
			success:function(html) {
				$("#hotjobsContent").html(html);
			}
		});
	}
});


function hostJobSan(){
	$("#all").attr("class","btqbzw");
	$("#tuij").attr("class","btqbzw");
	$("#hotJobs").attr("class","btqbzw current_i");
	document.getElementById("allJobs").style.display="none";
	document.getElementById("tjJobs").style.display="none";
	document.getElementById("hotMoreJobs").style.display="block";
	document.getElementById("hotdivjobs").style.display="block";
	$.ajax({
		type:'POST',
		url:'hotJobsSan',
		dataType:'html',
		success:function(html) {
			$("#hotjobsContent").html(html);
		}
	});
}

function allJobSan() {
	$("#all").attr("class","btqbzw current_i");
	$("#tuij").attr("class","btqbzw");
	$("#hotJobs").attr("class","btqbzw");
	document.getElementById("hotdivjobs").style.display="none";
	document.getElementById("tjJobs").style.display="none";
	document.getElementById("allMoreJobs").style.display="block";
	document.getElementById("allJobs").style.display="block";
	$.ajax({
		type:'POST',
		url:'indexModel',
		dataType:'html',
		success:function(html) {
			$("#alljobsContent").html(html);
			
		}
	});
}

function tuiJobSan() {
	$("#all").attr("class","btqbzw");
	$("#tuij").attr("class","btqbzw current_i");
	$("#hotJobs").attr("class","btqbzw");
	require(["jquery", "artLab"], function($, artLab){
	  if('${sessionScope.userId}'==''){
			artLab.msg("请先登录后才能使用职位推荐！");
			window.location.href="login.jsp";
		}else{
			document.getElementById("hotdivjobs").style.display="none";
			document.getElementById("allJobs").style.display="none";
			document.getElementById("tjMoreJobs").style.display="block";
			document.getElementById("tjJobs").style.display="block";
			$.ajax({
				type:'POST',
				url:'indRecommendSan',
				dataType:'html',
				success:function(html) {
					$("#TjjobsContent").html(html);
				}
			});
		}
	});
} 
	function allPost(){
		$("#all").attr("class","btqbzw current_i");
		$("#tuij").attr("class","btqbzw");
		$("#hotJobs").attr("class","btqbzw");
		document.getElementById("hotdivjobs").style.display="none";
		document.getElementById("allMoreJobs").style.display="none";
		document.getElementById("tjJobs").style.display="none";
		document.getElementById("allJobs").style.display="block";
		$.ajax({
			type:'POST',
			url:'indexModelall',
			dataType:'html',
			success:function(html) {
				$("#alljobsContent").html(html);
			}
		});
	}
	function recommend(){
		$("#all").attr("class","btqbzw");
		$("#tuij").attr("class","btqbzw current_i");
		$("#hotJobs").attr("class","btqbzw");
		require(["jquery", "artLab"], function($, artLab){
		  if('${sessionScope.userId}'==''){
				artLab.msg("请先登录后才能使用职位推荐！");
				window.location.href="login.jsp";
			}else{
				document.getElementById("hotdivjobs").style.display="none";
				document.getElementById("allJobs").style.display="none";
				document.getElementById("tjMoreJobs").style.display="none";
				document.getElementById("tjJobs").style.display="block";
				$.ajax({
					type:'POST',
					url:'user/positionRecommend',
					dataType:'html',
					success:function(html) {
						$("#TjjobsContent").html(html);
					}
				});	
			}
		});
	}
	function hotPost(){
		$("#all").attr("class","btqbzw");
		$("#tuij").attr("class","btqbzw");
		$("#hotJobs").attr("class","btqbzw current_i");
		document.getElementById("hotdivjobs").style.display="block";
		document.getElementById("hotMoreJobs").style.display="none";
		document.getElementById("allJobs").style.display="none";
		document.getElementById("allMoreJobs").style.display="none";
		//if('${sessionScope.roleId}'!=1){
		document.getElementById("tjJobs").style.display="none";
		//}
		document.getElementById("tjMoreJobs").style.display="none";
		$.ajax({
			type:'POST',
			url:'hotJobs',
			dataType:'html',
			success:function(html) {
				$("#hotjobsContent").html(html);
			}
		});
	}
	
	function search(){
		genKeyordsy($("#search_input").val());
		return false;
	}
	
	function seekType(data){
		$("#seekType").text(data);
		if(data == '公司'){
			document.getElementById("seekZw").style.display="block";
			document.getElementById("seekGs").style.display="none";
			$("#search_button").attr("onclick","genCompany('')");
			$("#search_button").attr("value","找公司");
		}else if(data == '职位'){
			document.getElementById("seekZw").style.display="none";
			document.getElementById("seekGs").style.display="block";
			$("#search_button").attr("onclick","genKeyord('')");
			$("#search_button").attr("value","找职位");
		}
	}
</script>
</html>
