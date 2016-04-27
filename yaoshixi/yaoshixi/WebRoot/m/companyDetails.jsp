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
<title>公司详情-要实习-专注于实习生招聘的互联网平台</title>
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
/* @media screen and (max-width:1024px) {
footer { margin-bottom:40px;}
} */
</style>
</head>

<body >
<div id="page">
  <div class="cont">
    <header>
      <input name="" id="reveal-left" class="goback" type="button" onclick="blackUpOne();">
      <h3>公司详情</h3>
    </header>
    <section id="zw-xq" class="zw-xq">
       <div class="xqblock">
          <div class="d-t">${company.companyName }</div>
          <!-- <p style="margin:0; height: 20px;"></p> -->
         
          	<div id="companyDesc" style="max-height:88px;overflow:hidden;"><strong>公司介绍：</strong> ${company.companyDesc }</div>
     <c:if test="${fn:length(company.companyDesc) >100}">
	     <div id="zkLook" style="text-align:right;margin-bottom:10px;font-size: 12px;"><a onclick="zkLook()" style="background-color: #ddd;text-align: center;">展开查看</a></div>
	     <div id="sqLook" style="text-align:right;margin-bottom:10px;font-size: 12px;display:none;"><a onclick="sqLook()" style="background-color: #ddd;text-align: center;">收起</a></div>
     </c:if>
          	<a href="tel:${company.phone}">电话：${company.phone }</a>
          	<a href="mailto:${company.email}">Email：${company.email }</a>
         
          <%-- <p>网站：<a target="_blank" href="${company.homePage }">${company.homePage }</a></p> --%>
          <p>地址：${company.addr }</p>
       </div>
       <%-- <div class="xqblock">
         <div class="com-xq">
         	  <div class="fl"><img src="${companyLogo }" class="comlogo"></div>
              <div class="comtitle"><p  class="xinq">${companyShortName }</p><p class="xinq">${scale }/${filedes }</p></div>
              <div class="jt"><img src="res/assets/images/jt.png" width="20"></div>
         </div>
       </div> --%>
      <%--  <div class="xqblock">
        <div class="xq-ms">公司口号</div>
        <div>${company.companySlogan }</div>
        <div class="xq-ms">公司介绍</div>
        <div>${company.companyDesc }</div>
       </div> --%>
       <div class="xqblock">
        <div class="xq-ms">所有发布的职位</div>
       		<c:forEach items="${company.jobPage}" var="job">
          		<div class="com-zp">
		          	<a <c:if test="${job.jobType != null &&  job.jobType != ''}">href="user/jobDetailWeix/${job.id }"</c:if><c:if test="${job.jobType == null ||  job.jobType == ''}">href="jobDetailPhone/${job.id }"</c:if>>
		               <div class="zwtitle"><div class="com-m"><strong style="color: #007DD1">${job.jobName }</strong></div><span class="zwdate"><fmt:formatDate value="${job.publishTime }" pattern="MM"></fmt:formatDate>月<fmt:formatDate value="${job.publishTime }" pattern="dd"></fmt:formatDate>日发布</span></div>
		                <p class="zw-xx">薪水：${job.payment }/人数： ${job.employ }</p>
		              <div class="jt"><img src="res/assets/images/jt.png" width="20"></div>
	              </a>
         		</div>
        	</c:forEach>      
         <!-- <div class="com-zp">
          <a href="#">
             <div class="zwtitle"><div class="com-m">人力资源部实习生</div><span class="zwdate">2014-07-25</span></div>
                <p class="zw-xx">薪水：面议 /人数： 若干</p>
              <div class="jt"><img src="res/assets/images/jt.png" width="20"></div>
              </a>
         </div> -->
       </div>
    </section>
    <footer>
     <p>&copy; 粤ICP备10202188号-4</p>
    </footer>
     <%-- <div class="resume">
     	<c:if test="${diliverStatus != 1 }">
     		<a id="btnDiliver"><input type="hidden" value="${id }"/>投个简历</a>
        </c:if>
    	<c:if test="${diliverStatus == 1 }">
   		 	<a id="btnDiliver">已投递</a>
   		</c:if>
     </div> --%>
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
<script type="text/javascript">
    function blackUpOne(){
    	javascript:history.go(-1);
    }
    
    function zkLook(){
		$("#companyDesc").attr("style","");
		$("#zkLook").hide();
		$("#sqLook").show();
	}
	function sqLook(){
		$("#companyDesc").attr("style","max-height:88px;overflow:hidden;");
		$("#zkLook").show();
		$("#sqLook").hide();
	}
</script>
</body>
</html>