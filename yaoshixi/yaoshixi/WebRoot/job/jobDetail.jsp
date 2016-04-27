<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html lang="en" xmlns:wb=“http://open.weibo.com/wb”>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta property="og:type" content="image" />
<meta property="og:url" content="http://www.yaoshixi.com/res/images/logo.png" />
<meta property="og:title" content="要实习职位分享" />
<meta property="og:description" content="登录要实习官网" />
<meta property="weibo:image:full_image" content="http://www.yaoshixi.com/res/images/logo.png" />
<meta name="weibo:image:create_at" content="图片的创建时间" /> -->
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
</head>

<body  class="body_cs">
<div id="body">
	
	<!-- 顶部 LOGO、登录部分  -->
	<%@include file="/header.jsp" %>
	
   <div id="main">
   
   	<!-- 左边导航 -->
	<%@include file="/banner.jsp" %>
   
    <div class="container">
    	<div class="look_zw">
    	<div class="wfb_zw">
          <div class="right_zw">
          		<div class="tt_bg">职位信息</div>
                <div class="zw_titles">
                    <div class="zw_title">
                        <%-- <p >${companyName }</p> --%>
                        <p class="font_s" style="height:52px;">${jobName }</p>
                    </div>
                  </div>
                  <div class="zw_xxs">
                	<div class="zw_xx">
                		<p><strong style="font-size: 14px;">工作城市：</strong>${city}  </p>
                		<p><strong style="font-size: 14px;">薪水：</strong>${payment }   </p>
			           	<p><strong style="font-size: 14px;">最低学历：</strong>
			           <c:if test="${educationalReq == 1 }">不限</c:if>
			           <c:if test="${educationalReq == 2 }">高中</c:if>
			           <c:if test="${educationalReq == 3 }">大专</c:if>
			           <c:if test="${educationalReq == 4 }">本科</c:if>
			           <c:if test="${educationalReq == 5 }">硕士</c:if>
			           <c:if test="${educationalReq == 6 }">博士</c:if>
			           </p>
			           <p>
			           <strong style="font-size: 14px;">招聘人数：</strong>
	           				<c:if test="${employ == 0 }">若干</c:if>
	           				<c:if test="${employ != 0 && employ !=null && employ !='' }">${employ }人</c:if></p>
           				 <p> <strong style="font-size: 14px;">工作性质：</strong>
			           		<c:if test="${workTime=='' && jobs.workTime==null }">未提供</c:if>
			           		<c:if test="${workTime==1 }">全职</c:if>
			           		<c:if test="${workTime==2 }">按天</c:if>
			           		<c:if test="${workTime==3 }">按小时</c:if>
			           </p>
			           <p><strong style="font-size: 14px;">发布时间：</strong><fmt:formatDate value="${publishTime }" pattern="MM"></fmt:formatDate>月<fmt:formatDate value="${publishTime }" pattern="dd"></fmt:formatDate>日</p>
                	</div>
               	</div>
               	 <div class="zw_bb">
                     <div class="font_v">职位诱惑</div>
                     <div>
                    <c:if test="${empty temptation}">
                		  未提供
                	</c:if>
                	<c:if test="${not empty temptation}">
                	${temptation }
                	</c:if>
                    </div>
                </div>
                <div class="zw_bb">
                     <div class="font_v">职位描述</div>
                     <div>${jobDesc }</div>
                </div>
                <div class="zw_bb">
                     <div class="font_v">任职要求</div>
                  <div>${jobRequest }</div>
                </div>
                <c:if test="${otherReq !=null && otherReq != ''}">
	                <div class="zw_bb">
	                     <div class="font_v">其他要求</div>
	                  <div>${otherReq }</div>
	                </div>
                </c:if>
                
                <c:if test="${interQuestionsOne !='' && interQuestionsOne !='1、' && interQuestionsOne !=null}">
                	<div class="zw_bb">
	                     <div class="font_v">企业提问</div>
	                  <div>
	                    ${interQuestionsOne }<br>
	                  <c:if test="${interQuestionsTwo !=null && interQuestionsTwo !='' && interQuestionsTwo !='2、'}">
	            		${interQuestionsTwo }<br>
	            	</c:if>
	            	<c:if test="${interQuestionsThree !=null && interQuestionsThree !='' && interQuestionsThree !='3、'}">
	            		${interQuestionsThree }<br>
	            	</c:if>
	            	<c:if test="${interQuestionsFour !=null && interQuestionsFour !='' && interQuestionsFour !='4、'}">
	            		${interQuestionsFour }<br>
	            	</c:if>
	            	<c:if test="${interQuestionsFive !=null && interQuestionsFive !='' && interQuestionsFive !='5、'}">
	            		${interQuestionsFive }
	            	</c:if>	
	                </div>
	                </div>
	            </c:if>    
                <div class="zw_tjl">
                	<c:if test="${diliverStatus == 1 }">
                		<a href="javascript:void(0)" class="btn_tjl" ><input type="hidden" value="${id }"/>已投递</a>
                	</c:if>
                	<c:if test="${diliverStatus != 1 }">
               		 	<a href="javascript:void(0)" id="btnDiliver" class="btn_tjl"><input type="hidden" value="${id }"/>投个简历</a>
               		</c:if>
                </div>
                
                <div class="zw_tjl">
               		<wb:share-button appkey="30cxTO" addition="number" type="button" pic="http%3A%2F%2Fwww.yaoshixi.com%2Fres%2Fimages%2Flogo.png"  default_text="要实习网站分享职位:【${city }】——${companyName }——${jobName }，  请登录：http://www.yaoshixi.com投递简历 或发送【公司名称】个人简历至cv@yaoshixi.com " ralateUid="3971198910"></wb:share-button>
                </div>
                
            </div>
            <div class="right_zw_2">
            	<div class="gs_logo">
                	<div class="gs_logo_img"><a target="_blank" href="${homePage }"><img src="${companyLogo }" width="82" height="82"></a></div>
                    <div class="gs_logo_name"><a target="_blank" href="${homePage }">${companyName }</a></div>
                </div> 
            	<div class="zw_qt">
               	 	<p><label>领域</label> ${filedes }</p>
                	<p><label>规模</label> ${scale }</p>
                    <p><label>网站</label><a href="${homePage }" target="_blank">${homePage }</a> </p>
                    <div class="zw_title_x">${growthStage }</div>
                    <div class="zw_title_x">
                    	<strong>公司标签</strong>
                    </div>
	                    <p  style="clear:both">
	                    	<c:forTokens items="${tags }" delims="," var="tag">
				           	<span><c:out value="${tag }"></c:out></span>
				         </c:forTokens>
	                    </p>
                    	<div style="clear:both">
                    </div>
                    <div class="zw_title_x"><strong>工作地点</strong></div>
                    <p>${city} ${area}</p>
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    
    </div>
    <%@include file="/footer.jsp" %>
   <%--  <!-- 二维码扫一扫 -->
    <%@include file="/scanner.jsp" %>
     --%>
 </div>
 <div style="clear:both"></div>
</div>
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
	if('${sessionScope.userId}'=='' || '${sessionScope.userId}'==null){
		var artBox = art({
			id: 'artBoxForResume',
			title: "用户注册",
			url: "user/remindRegist.jsp",
			quickClose: false,
			width: 420,
		});
		artBox.show();
	}
	$("a#btnDiliver").each(function(){
		var a_diliver = $(this);
		a_diliver.click(function(){
			var jobId = a_diliver.children("input[type='hidden']").val();
			var ratio = '${sessionScope.university}';
			var userName = '${sessionScope.userName}';
			var email = '${sessionScope.userEmail}';
			var quantity = '${sessionScope.quantityHH}';
			if('${sessionScope.userId}'!='' && '${sessionScope.roleId}' != '1' && ratio!='' && userName!='' && email!='' && quantity>0){
				createArtBox("让企业hr了解你更加适合我们企业或这个岗位的个人优势", "user/declaration/"+jobId);
				/* $(this).addClass("tjlcurr").siblings().removeClass("btn_tjls"); */
				$(this).text("已投递");
			}else if('${sessionScope.userId}'==''){
				artLab.msg("请先登录");
				window.location.href="login.jsp";
			}else if('${sessionScope.roleId}' == '1'){
				artLab.msg("企业用户暂不能投递简历");
			}else if(ratio=='' || ratio==null || userName=='' || userName==null || email=='' || email==null){
				artLab.msg("你的简历不够完善，暂不能投递简历，请先完善简历");
				window.location.href="user/resume";
			}else if(quantity<=0){
				artLab.msg("您今天可投递的简历量已满");
			}
		});
		function createArtBox(title, url, data) {
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
		}
	});
});

	
</script>
</html>
