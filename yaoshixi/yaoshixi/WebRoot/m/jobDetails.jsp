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
<title>职位详情-要实习-专注于社交招聘的互联网平台</title>
<!--自己编写css -->
<link href="res/assets/css/style.css" rel="stylesheet" type="text/css">
<!--<link rel="stylesheet" type="text/css" href="res/assets/css/panel_demo.css" />-->

<!--组件依赖css begin-->
 <link rel="stylesheet" type="text/css" href="res/assets/css/widget/gotop/gotop.css" />
<!--<link rel="stylesheet" type="text/css" href="res/assets/css/widget/panel/panel.css"/>
<link rel="stylesheet" type="text/css" href="res/assets/css/widget/panel/panel.default.css" />-->
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
<!--<script type="text/javascript" src="res/assets/js/widget/panel/panel.js"></script>-->
<script type="text/javascript" src="res/assets/js/widget/gotop/gotop.js"></script>

<!--组件依赖js end-->
<style>
@media screen and (max-width:1024px) {
footer { margin-bottom:40px;}
}
</style>
</head>

<body >
<div id="page">
  <div class="cont">
    <header>
      <input name="" id="reveal-left" class="goback" type="button" onclick="blackUpOne();">
      <h3>职位详情</h3>
    </header>
    <section id="zw-xq" class="zw-xq">
       <div class="xqblock">
          <div class="d-t">${jobName }</div>
          <p>
          	<span class="colorg">${payment }</span>
          	<span>/</span>
          	<span>${city} </span>
          	<!-- <span>/</span>
          	<span>经验5-10年</span> -->
          	<span>/</span>
	          	<span>
          			<c:if test="${educationalReq == 1 }">不限</c:if>
		           <c:if test="${educationalReq == 2 }">高中及以上</c:if>
		           <c:if test="${educationalReq == 3 }">大专及以上</c:if>
		           <c:if test="${educationalReq == 4 }">本科及以上</c:if>
		           <c:if test="${educationalReq == 5 }">硕士及以上</c:if>
		           <c:if test="${educationalReq == 6 }">博士及以上</c:if>
				</span>
          	<span>/</span>
          	<span>
          		<c:if test="${workTime=='' && jobs.workTime==null }">未提供</c:if>
          		<c:if test="${workTime==1 }">全职</c:if>
          		<c:if test="${workTime==2 }">按天</c:if>
          		<c:if test="${workTime==3 }">按小时</c:if>
          	</span>
          </p>
       	  <p>职位诱惑：
       	  		<c:if test="${empty temptation}">
               		  未提供
               	</c:if>
               	<c:if test="${not empty temptation}">
                	${temptation }
               	</c:if>
			</p>
          <div class="fb-time">发布时间：<fmt:formatDate value="${publishTime }" pattern="MM"></fmt:formatDate>月<fmt:formatDate value="${publishTime }" pattern="dd"></fmt:formatDate>日发布</div>
       </div>
       <div class="xqblock">
        <a href="c/indexPhone/${companyId }" >
         <div class="com-xq">
         	  <div class="fl"><img src="${companyLogo }" class="comlogo"></div>
              <div class="comtitle"><p  class="xinqb">${companyName }</p><%-- <p class="xinq">${scale }/${filedes }</p> --%></div>
              <div class="jt"><img src="res/assets/images/jt.png" width="20"></div>
         </div>
         </a>
       </div>
       <div class="xqblock">
        <div class="xq-ms">职位描述</div>
        <div>${jobDesc }</div>
        <div class="xq-ms">任职要求</div>
        <div>${jobRequest }</div>
       </div>
    </section>
    <footer>
     <p>&copy; 粤ICP备10202188号-4</p>
    </footer>
     <div class="resume">
     	<c:if test="${diliverStatus != 1 }">
     		<a id="btnDiliver"><input type="hidden" value="${id }"/>投个简历</a>
        </c:if>
    	<c:if test="${diliverStatus == 1 }">
   		 	<a id="btnDiliver">已投递</a>
   		</c:if>
     </div>
     <div id="gotop"></div>
  </div>
 <!-- <div class="panel">
    <h3>要实习</h3>
    <ul class="panel-dir">
      <li><a href="#">首页</a></li>
      <li><a href="#">公司</a></li>
      <li><a href="#">我的简历</a></li>
      <li><a href="#">论坛</a></li>
    </ul>
  </div>-->
</div>
<script src="res/js/require.js"></script>
<script type="text/javascript">
   /* $(function ($) {
        $('.panel').panel({
            contentWrap: $('.cont')
        });
        $('#reveal-left').on('click', function () {
            $('.panel').panel('toggle', 'reveal', 'left');
        });
    }(Zepto));*/
	
	 //创建组件
    $('#gotop').gotop();
    require.config({
    	paths: {
    		jquery: 'res/jquery/jquery-1.10.2',
    		artLab: 'res/artDialog/artLab'
    	}
    });
    require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
    	top.dialog = art;
    	/* if('${sessionScope.userId}'=='' || '${sessionScope.userId}'==null){
    		var artBox = art({
    			id: 'artBoxForResume',
    			title: "用户登录",
    			url: "m/login.jsp",
    			quickClose: false,
    			width: 268,
    		});
    		artBox.show();
    	} */
    	$("a#btnDiliver").each(function(){
    		var a_diliver = $(this);
    		a_diliver.click(function(){
    			var jobId = a_diliver.children("input[type='hidden']").val();
    			var ratio = '${sessionScope.university}';
    			var userName = '${sessionScope.userName}';
    			var email = '${sessionScope.userEmail}';
    			var quantity = '${sessionScope.quantityHH}';
    			if('${sessionScope.userId}'!='' && '${sessionScope.roleId}' != '1' && ratio!='' && userName!='' && email!='' && quantity>0){
    				if(jobId != null && jobId != '' ){
    					createArtBox("说出你的优势，让企业hr更了解你", "user/declarationPhone/"+jobId);
	    				$(this).text("已投递");
    				}else{
    					artLab.msg("该职位已投递！");
    				}
    				/* $(this).addClass("tjlcurr").siblings().removeClass("btn_tjls"); */
    			}else if('${sessionScope.userId}'==''){
    				artLab.msg("请先登录");
    				window.location.href="m/login.jsp";
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
    				width: 300
    			});
    			return artBox.show();
    		}
    	});
    });
    function blackUpOne(){
    	javascript:history.go(-1);
    }
</script>
</body>
</html>