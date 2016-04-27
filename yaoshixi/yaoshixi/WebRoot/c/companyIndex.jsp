<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>${company.companyName }-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="res/ajax/ajax.js"></script>
</head>
<body>
	<!-- 顶部 LOGO、登录部分  -->
   <%@include file="/header.jsp" %>
	
   <div id="main">
   
   	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>	
	
	<div class="container">

	        <div class="gs_zw">
	           <div class="gs_jianj">
	             <div class="tt_bg">公司简介</div>
	       		 <div class="one_zp">
	                	 <div class="gsimg"><img src="${empty company.companyLogo ? 'res/images/gs/gs_2.png' : company.companyLogo}" id="companyLogoImg" width="125" height="125"><br/><br/>
	                	   <input  type="button"  value="修改" id="logoEditBtn" class="btn_style1">
	                	</div> 
	                	
	             		<div class="gsxq">
	             			<!-- 编辑企业名称，介绍 -->
	             			<div  id="nameAndIntroDiv">
	             				<%@include file="/company/nameAndIntro.jsp" %>
	             			</div>
	                    </div>
	                    
	             </div>
	             <div class="one_gs">
	           	 	<!-- 地点、领域、规模、网址 -->
	           	 	<div id="addressInfoDiv">
	           	 		<%@include file="/company/addressInfo.jsp" %>
	           	 	</div>
	                
	                 <!-- 发展阶段 -->
	                <c:if test="${company.growthStage!=null && company.growthStage!=''}">
		                <div id="growthStageDiv">
		                	<%@include file="/company/growthStage.jsp" %>
		                </div>
	                </c:if>
	                <!-- 创始团队 -->	
	                <c:if test="${company.founder!=null && company.founder!=''}"> 
		                <div id="founderDiv">
		                	<%@include file="/company/founder.jsp" %>
		                </div>   
	               	 </c:if>
	               	 
	               	 <!-- 同校校友 -->	
	                <c:if test="${sessionScope.userId !='' && sessionScope.userId !=null && sessionScope.roleId !=1}"> 
		                <div id="schoolfellowDiv">
		                	<%@include file="/c/schoolfellow.jsp" %>
		                </div>   
	               	 </c:if>
	              </div>
	              </div>
	              <div class="gs_zpx">
	                  <div class="tt_bg">招聘职位</div>
	              <!-- 职位列表 -->
							<div id="jobListDiv" >
								<script type="text/javascript">
									$(document).ready(function(){
										var companyId = '${company.id}';
										var url = "c/jobList/" + companyId;
										$.ajax({
											url: url,
											type: "post",
											dataType: "html",
											success: function(html){
												$("#jobListDiv").html(html);
											}
										});
									});
								</script>
							</div>
	              
	              </div>
	           <div style="clear:both"></div>
	         </div>
	    
	    </div>
	    
	    <%@include file="/footer.jsp" %>
	    <!-- 右下角扫一扫  -->
	   <!--  <div class="erwm"><img src="res/images/erwm.png" width="85" height="80"></div> -->
	 </div>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/source/artDialog.js'
	}
});
require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
	top.dialog = art;
	
$(document).ready(function(){
	var isCompany = '${isCompany }';
	if(isCompany != ''){
		$(".btn_style1, .a_edit").show();
	}
	if('${sessionScope.userId}'=='' || '${sessionScope.userId}'==null){
		 var artBox = art({
			id: 'artBoxForResume',
			title: "用户注册",
			url: "user/remindRegist.jsp",
			quickClose: false,
			width: 420,
			lock: true
		});
		// artBox.lock();
		artBox.show(); 
		/* var dialog = art.dialog({id: 'N3690',title: false});

		// jQuery ajax   
		$.ajax({
		    url: 'user/remindRegist.jsp',
		    success: function (data) {
		        dialog.content(data);
		    },
		    cache: false,
		    lock: true
		}); */
		
		/* art.dialog({
		    lock: true,
		    background: '#600', // 背景色
		    opacity: 0.87,	// 透明度
		    content: '中断用户在对话框以外的交互，展示重要操作与消息',
		    icon: 'error',
		    ok: function () {
		        art.dialog({content: '再来一个锁屏', lock: true});
		        return false;
		    },
		    cancel: true
		}); */
		//art.dialog.get('id-demo').title('用户注册');
	}
});
});	
	//发布的职位分页js
	function page(pageNum,ps) {
		var offset =  ((pageNum-1)*(ps));
		var companyId = '${company.id}';
		var url = "c/jobList/" + companyId;
		$.ajax({
			type:'POST',
			url:url,
			data:{'pageNum':pageNum,'pager.offset':offset},
			dataType:'html',
		    success:function(html) {
		    	$("#jobListDiv").html(html);
		    }
		});
	}
</script>
</body>
</html>