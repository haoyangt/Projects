<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp"%>
<%@ include file="/jstl.jsp"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>远界咨询</title>
<base href="<%=basePath%>">

<style>
body {
	background-color: #FFF;
	font-size: 16px;
	line-height: 25px;
	margin: 0;
	padding: 0;
	background-color: #F9F9F9;
}

.main {
	margin: 0 auto;
	width: 800px;
	position: relative;
	b
}

.main_j {
	padding: 8px;
}

.bt {
	font-size: 20px;
	font-weight: bold;
	color: #7BC4F4;
	line-height: 40px;
}

.neir {
	border: 1px solid #CCC;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	margin-bottom: 10px;
	padding: 8px;
	background-color: #FFF;
	color: #434343
}

.neir p {
	margin: 0;
}

.neir p label {
	color: #8D8D8D;
}

.neir a {
	color: #7BC4F4;
	text-decoration: none;
}

.tjl {
	position: fixed;
	bottom: 0;
	background-color: #7BC4F4;
	color: #FFF;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
	width: 100%;
}

@media screen and (max-width:600px) {
	.main {
		width: 100%;
	}
	.tjl {
		width: 100%;
	}
}
a.btn_tjl{
	text-decoration: none;
}
.cs4 {
	text-align: center;
	padding: 10px 0;
	font-size: 28px;
	line-height: 40px;
}
</style>
</head>

<body>

	<div class="main">
		<div class="main_j">
			<div class="bt">${jobName }</div>
			<div class="neir">
				<p>
					<label>所属公司：</label>${companyName }
				</p>
				<p>
					<label>工作地点：</label>${city }
				</p>
				<p>
					<label>月薪范围：</label>${payment }
				</p>

				<p>
					<label>最低学历：</label>
					<c:if test="${educationalReq == 1 }">不限</c:if>
					<c:if test="${educationalReq == 2 }">高中</c:if>
					<c:if test="${educationalReq == 3 }">大专</c:if>
					<c:if test="${educationalReq == 4 }">本科</c:if>
					<c:if test="${educationalReq == 5 }">硕士</c:if>
					<c:if test="${educationalReq == 6 }">博士</c:if>
				</p>
				<p>
					<label>发布时间：</label>
					<fmt:formatDate value="${publishTime }" pattern="MM"></fmt:formatDate>
					月
					<fmt:formatDate value="${publishTime }" pattern="dd"></fmt:formatDate>
					日
				</p>
				<p>
					<label>职位诱惑：</label>${temptation }
				</p>
				<p>
					<label>职位描述：</label>
				</p>
				<p>${jobDesc }</p>
				<p>
					<label>任职要求</label>
				</p>
				<p>${jobRequest }</p>
			</div>
			<div class="neir" style="margin-bottom: 50px;">
				<p>
					<label>公司名称：</label>${companyName }
				</p>
				<p>
					<label>公司主页：</label><a href="${homePage }" target="_blank">${homePage
						}</a>
				</p>

				<div class="zw_title_x">${growthStage }</div>
				<div class="zw_title_x">
					<strong>公司标签:</strong>
					<p style="clear: both">
						<c:forTokens items="${tags }" delims="," var="tag">
							<span><c:out value="${tag }"></c:out>
							</span>
						</c:forTokens>
					</p>
				</div>

				<div style="clear: both"></div>
				<div class="zw_title_x">
					<strong>工作地点:</strong>
					<p>${city } ${area}</p>
				</div>


			</div>
		</div>
	</div>

	<%-- <div class="tjl">
		<c:if test="${diliverStatus == 1 }">
			<a href="javascript:void(0)" class="btn_tjl" onclick="return false" ><input
				type="hidden" value="${id }" />已投递</a>
		</c:if>
		<c:if test="${diliverStatus != 1 }">
			<a href="javascript:void(0)" id="btnDiliver" class="btn_tjl"><input type="hidden" value="${id }" />投个简历</a>
		</c:if>
	</div> --%>

	
		<c:if test="${diliverStatus == 1 }">
			<a href="javascript:void(0)" class="btn_tjl" onclick="return false" >
			<div class="tjl" style="background-color: gray">
			<input type="hidden" value="${id }"/>已投递
			</div>
			</a>
		</c:if>
		<c:if test="${diliverStatus != 1 }">
			<a href="javascript:void(0)" id="btnDiliver" class="btn_tjl">
			<div class="tjl">
			<input type="hidden" value="${id }" />投个简历
			</div>
			</a>
		</c:if>
	



</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
	top.dialog = art;
	$("a#btnDiliver div").each(function(){
		var ratio = '${sessionScope.university}';
		var userName = '${sessionScope.userName}';
		var email = '${sessionScope.userEmail}';
		var quantity = '${sessionScope.quantityHH}';
		
		var a_diliver = $(this);
		a_diliver.bind('click',(function(){
			if(confirm("确定要投递吗？")){
			var id = a_diliver.children("input[type='hidden']").val();
			if('${sessionScope.userId}'!='' && ratio!='' && userName!='' && email!='' && quantity>0){
				 createArtBox("让企业hr了解你更加适合我们企业或这个岗位的个人优势", "user/declarationx/"+id); 
				 $(this).html('<input type="hidden" value="${id }" />已投递');	
				 $(this).css("background-color","#545454");	 				
			}else if('${sessionScope.userId}'==''){
				artLab.msg("请先登录");
				window.location.href="openLogin/wxsend/wxLogin.jsp";
				return;
			}else if('${sessionScope.roleId}' == '1'){
				artLab.msg("企业用户暂不能投递简历");
			}else if(ratio=='' || ratio==null || userName=='' || userName==null || email=='' || email==null){
				artLab.msg("你的简历不够完善，暂不能投递职位，请先完善简历");
				/* window.location.href="user/resume"; */
			}else if(quantity<=0){
				artLab.msg("您今天可投递的简历量已满");
				
			}
			
	/* 	diliverResume(id); */
			 /* createArtBox("让企业hr了解你更加适合我们企业或这个岗位的个人优势", "user/declarationx/"+id);  */
			 a_diliver.unbind("click");
			}
		}));
		
		function createArtBox(title, url, data) {
			var artBox = art({
				id: 'artBoxForResume',
				title: title,
				data: data,
				url: url,
				quickClose: false,
				width: 400
			});
			return artBox.show();
		}
		
		function diliverResume(id) {
			$.ajax({
				type:'POST',
				url:'user/diliverResumeByWxSend',
				data:{"jobId":id},
				dataType:'json',
				success:function(json) {
					artLab.msg(json.msg);
				}
			});
		}
	});
});

</script>
</html>
