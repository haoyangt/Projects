<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>company name</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function showPanel() {
		var panel = $("#panel");
		if(panel.css("display") == "none") {
			$("#panel").show();
		} else {
			$("#panel").hide();
		}
		
	}
	
</script>
</head>
<body >
<!-- 顶部 LOGO、登录部分  -->
   <%@include file="/header.jsp" %>
	
   <div id="main">
   
   	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>	
	<div class="container">
	    	<div  class="adver"></div>
	        
	        <div class="gs_zw">
	       		 <div class="one_zp">
	                	<div class="gsimg"><img src="res/images/gs/gs_2.png" width="125" height="125"></div>
	             		<div class="gsxq">
	                 		<p class="f18">深圳市远界管理咨询有限公司</p>
	                        <p>远界的使命是助人成长，通过创新帮助人们更好地使用知识。创立十年间，远界见证了中国企业的发展，变革与崛起，市场也见证了远界的成长。</p>
	                        <hr class="hr_bng"/>
	                        <div class="biaoq_list">
	                            <span>年终分红</span>
	                            <span>五险一金</span>
	                            <span>年度旅游</span>
	                            <span>领导好</span>
	                            <span>弹性工作</span>
	                            <span>绩效奖金</span>
	                            <span>美女多</span>
	                        </div>
	                        <div class="bj_grxx"><a href="#" class="a_edit">&nbsp;&nbsp;</a></div>
	                        <br/>
	                        <br/>
	                        <div class="login_top">
	                            <div class="zp_title">招聘职位</div>
	                        </div>
	                        <div class="zp_list">
	                        	<p class="ts_s"><a href="#" class="hover_y f16">Flash实习生</a>[深圳]</p>
	                            <div class="bq_li"><span>实习生2K-3K</span><span>可无经验</span><span>学历不限</span></div>
	                       		<p><label class="f12 c5">1天前发布</label></p>
	                        </div>
	                         
	                         <div class="zp_list">
	                        	<p class="ts_s"><a href="#" class="hover_y f16">网页设计</a>[深圳]</p>
	                            <div class="bq_li"><span>实习生2K-3K</span><span>可无经验</span><span>学历不限</span></div>
	                       		<p><label class="f12 c5">1天前发布</label></p>
	                        </div> 
	                    	 <div class="zp_list">
	                        	<p class="ts_s"><a href="#" class="hover_y f16">网页设计</a>[深圳]</p>
	                            <div class="bq_li"><span>实习生2K-3K</span><span>可无经验</span><span>学历不限</span></div>
	                       		<p><label class="f12 c5">1天前发布</label></p>
	                        </div> 
	                    
	                    
	                    
	                    </div>
	             </div>
	           	  <div class="one_gs">
	                	<div class="s_qt">
	                        <p><label>地点</label>深圳</p>
	                        <p><label>领域</label>咨询服务</p>
	                        <p><label>规模</label>150人以上</p>
	                        <p><label>网站</label>www.szfore.com</p>
	                        
	                   </div>     
	                     
	                         <div class="login_top">
	                            <div class="zp_title">发展阶段</div>
	                        </div>
	                        <p style="padding-bottom:10px">目前阶段：稳步上升</p>
	                         <div class="login_top">
	                            <div class="zp_title">创始团队</div>
	                        </div>
	                    
	                       
	               	 
	              </div>
	           		
	             
	             
	     
	    
	    
	    	
	           <div style="clear:both"></div>
	         </div>
	    
	    </div>
	    <div class="erwm"><img src="res/images/erwm.png" width="85" height="80"></div>
	 </div>

	
</body>
</html>