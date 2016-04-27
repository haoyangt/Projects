<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="res/ajax/ajax.js"></script>
<title>公司主页-要实习-专注于实习生招聘的互联网平台</title>
</head>
<body>
	<!-- 顶部 LOGO、登录部分  -->
   <%@include file="/header.jsp" %>
	
   <div id="main">
   
   	<!-- 左边导航 -->
	<%@include file="/banner_zw.jsp" %>	
	
	<div class="container">
	        
	        <div class="gs_zw">
	         <div class="gs_jianj">
	         <div class="tt_bg">公司简介</div>
	       		 <div class="one_zp">
	                	<div class="gsimg">
	                		<img src="${empty company.companyLogo ? 'res/images/gs/gs_2.png' : company.companyLogo}" id="companyLogoImg" width="125" height="125">
	                	<br/><br/>
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
	                <%-- <c:if test="${company.growthStage!=null && company.growthStage!=''}"> --%>
		                <div id="growthStageDiv">
		                	<%@include file="/company/growthStage.jsp" %>
		                </div>
	               <%--  </c:if> --%>
	                <!-- 创始团队 -->	
	                <%-- <c:if test="${company.founder!=null && company.founder!=''}">  --%>
		                <div id="founderDiv">
		                	<%@include file="/company/founder.jsp" %>
		                </div>   
	               	 <%-- </c:if> --%>
	               	 <div id="businLiceDiv">
		                	<%@include file="/company/businLice.jsp" %>
		                </div> 
	              </div>
	               </div>
	             <div class="gs_zpx">
	                  <div class="tt_bg">招聘职位</div>
	              <!-- 职位列表 -->
							<div id="jobListDiv">
								<script type="text/javascript">
									$(document).ready(function(){
										$.ajax({
											url: "company/jobList",
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
	   <%--  <!-- 右下角扫一扫  -->
	    <%@include file="/scanner.jsp" %> --%>
	    <!-- <div class="erwm"><img src="res/images/erwm.png" width="85" height="80"></div> -->
	</div> 
 <script src="res/js/require.js"></script>
 <script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.7.2.min'
	}
});
require(['res/artDialog/dialog-iframe'], function(dialog){
	top.dialog = dialog;
	$(document).ready(function(){
		$("#bangzhu").removeClass("licurrent");
		$("#forum").removeClass("licurrent");
		$("#companys").removeClass("licurrent");
		$("#indexSy").removeClass("licurrent");
		$("#Resume").removeClass("licurrent");
		$("#release").removeClass("licurrent");
		$("#manage").addClass("licurrent");
		var isCompany = '${isCompany }';
		if(isCompany != '')
		{
			$(".btn_style1, .a_edit").show();
		}
	});
		
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
					$("#face").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
				}
				$("#businessLicense2").val(this.returnValue);
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
					$("#face2").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
				}
				$('#organizationCode2').val(this.returnValue);
			}
		}).showModal();
	});	
	$('#logoEditBtn').on("click", function(){
		var title = "上传 Logo";
		var url = "company/logoEdit.jsp";
		top.dialog({
			id: 'artBoxForResume',
			title: title,
			url: url,
			quickClose: false,
			width: '700px',
			height: '520px',
			onclose: function(){
				if(this.returnValue){
					$("#companyLogoImg").attr("src", "res/upload/logo/" + this.returnValue);
				}
			}
		}).showModal();
	});
});

function showEdit(hideDiv, showDiv){
	$(hideDiv).hide();
	$(showDiv).show();
}
function saveEdit(form){
	var url = $(form).attr("action");
	var data = $(form).serialize();
	var refreshDiv = $(form).attr("rel");
	$.ajax({
		type: "post",
		url: url,
		data:data,
		dataType: "html",
		success: function(html){
			$("#" + refreshDiv).html(html);
		}
	});
	return false;
}
	//发布的职位分页js
function page(pageNum,ps) {
	var offset =  ((pageNum-1)*(ps));
	$.ajax({
		type:'POST',
		url:'company/jobList',
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