<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>

	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>
    <div class="container">
    	<!-- <div class="adver" style="height: 197px;">
    		<a target="_blank" href="kindelActivity.jsp"><img height="197px;" width="100%" src="res/images/assets/xshdtpTou.jpg"/></a>
    	</div> -->
        <div class="adver" id="topCompany">
    	</div>
    	<div class="search_n"><input id="search_input"  type="text" placeholder="请输入公司名称或职位名称" onkeydown="search();"  value="" tabindex="1" name="kd" >
    	<a id="ycbq" target="_blank" href="searchJobs.jsp" ></a>
    	<input id="search_button" class="search_button" onclick="genKeyord('');"  type="submit" value="找实习"></div>
    	<div class="rmhy"><label>热门职位：</label><span><a onclick="genKeyord('实习');">实习</a></span><span><a onclick="genKeyord('助理');">助理</a></span><span><a onclick="genKeyord('销售');">销售</a></span><span><a onclick="genKeyord('Java');">Java</a></span><span><a onclick="genKeyord('Android');">Android</a></span><span><a onclick="genKeyord('软件测试');">软件测试</a></span></div>
        <div class="hot_zw">
        	<div class="xin_title">
           	<div class="title_za">
           	 	<input type="button" id="hotJobs" onclick="hotPost();"  class="btqbzw current_i" value="热门职位" />
           	 </div>
           	 <c:if test="${sessionScope.roleId != 1}">
	           	 <div class="title_za">
	           	 	<input type="button" id="tuij" onclick="recommend();"  class="btqbzw" value="向我推荐" /> 
	           	 </div>
           	 </c:if>
           	  <div class="title_za">
           	 	<input type="button" id="all" onclick="allPost();"  class="btqbzw" value="全部职位" />
           	 </div>
           </div>
           <div id="hot_jobs">
           
           </div>
           <div class="tuij" id="tjJobs">
           		<div class="tag_qb"><img width="35" height="121" src="res/images/xwtj.gif"></div>
           		<div id="TjjobsContent"></div>
           		<div class="mgdzw" id="tjMoreJobs"><a onclick="recommend();" title="更多职位" class="btn_gdzw"></a></div>
           </div>  
           <div class="tuij" id="allJobs">
           		<div class="tag_qb"><img width="35" height="121" src="res/images/qbzw.gif"></div>
           		<div id="alljobsContent"></div>
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
    
    
      <%@include file="/footer.jsp" %>
     <%-- <!-- 二维码扫一扫 -->
	    <%@include file="/scanner.jsp" %> --%>
	    
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
	top.dialog = art;
	$(function(){
		topCompany();
		tuiJobSan(); 
		allJobSan();
		hostJob();
		if('${sessionScope.roleId}'==1){
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
		$("#all").mouseover(function(){
	   		$(this).addClass("curre");        
	    }).mouseout(function(){
	    	$(this).removeClass("curre");
	   });
		$("#tuij").mouseover(function(){
	   		$(this).addClass("curre");        
	    }).mouseout(function(){
	    	$(this).removeClass("curre");
	   });
		$("#hotJobs").mouseover(function(){
	   		$(this).addClass("curre");        
	    }).mouseout(function(){
	    	$(this).removeClass("curre");
	   });
		
	});
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
	
function tuiJobSan() {
		$.ajax({
			type:'POST',
			url:'indRecommendSan',
			dataType:'html',
			success:function(html) {
				$("#TjjobsContent").html(html);
			}
		});
	} 
	function allJobSan() {
		$.ajax({
			type:'POST',
			url:'indexModel',
			dataType:'html',
			success:function(html) {
				$("#alljobsContent").html(html);
				
			}
		});
	}
	
	function hostJob(){
		$.ajax({
			type:'POST',
			url:'hotJobs',
			dataType:'html',
			success:function(html) {
				$("#hot_jobs").html(html);
				
			}
		});
	}
});
	function allPost(){
		$("#all").attr("class","btqbzw current_i");
		$("#tuij").attr("class","btqbzw");
		$("#hotJobs").attr("class","btqbzw");
		document.getElementById("hot_jobs").style.display="none";
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
				document.getElementById("hot_jobs").style.display="none";
				document.getElementById("tjMoreJobs").style.display="none";
				document.getElementById("allJobs").style.display="none";
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
		document.getElementById("hot_jobs").style.display="block";
		document.getElementById("allJobs").style.display="block";
		document.getElementById("allMoreJobs").style.display="block";
		if('${sessionScope.roleId}'!=1){
			document.getElementById("tjJobs").style.display="block";
		}
		document.getElementById("tjMoreJobs").style.display="block";
		$.ajax({
			type:'POST',
			url:'indRecommendSan',
			dataType:'html',
			success:function(html) {
				$("#TjjobsContent").html(html);
			}
		});
		$.ajax({
			type:'POST',
			url:'indexModel',
			dataType:'html',
			success:function(html) {
				$("#alljobsContent").html(html);
				
			}
		}); 
	}
	
	function search(){
		genKeyordsy($("#search_input").val());
		return false;
	}
</script>	    