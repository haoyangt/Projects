<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn" class="no-js">
<head>
<meta http-equiv="Content-Type">
<meta content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>我是${userBasicInfo.userName }，正在找工作</title>	
<link rel="shortcut icon" href="/res/images/favicon.ico">	
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">        
<link rel="stylesheet" type="text/css" href="/res/liudu/zsjianl/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/zsjianl/css/index.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/zsjianl/css/animations.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/zsjianl/css/load.css" /> 
</head>
<body>
    <div id="loading">
     	<div class="spinner">
  			<div class="double-bounce1"></div>
  			<div class="double-bounce2"></div>
		</div>
	</div>
		<div id="content" style="display:none">
			<div class="page page-1-1 page-current">
				<div class="wrap">
                    <div class="t1-txt qq pt-page-moveFromTop">我是<label style="color:#ff556d">${userBasicInfo.userName }</label>，听说你在找我？</div>
                    	<c:if test="${fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn')}">
                   			 <img class="img_4 pt-page-moveFromTop" height="140px;" src="${userBasicInfo.headImg}"> 
                   			  <%--<img class="img_4 pt-page-moveFromTop" height="140px;"  src="/res/liudu/zsjianl/img/t.jpg">--%>
                   		</c:if>
                   		<c:if test="${!fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn') && userBasicInfo.headImg !=''}">
                   			<img class="img_4 pt-page-moveFromTop" height="140px;" src="/user/getHeadPhoto?ImgPath=${userBasicInfo.headImg}"> 
                   			<%--  <img class="img_4 pt-page-moveFromTop" height="140px;"  src="/res/liudu/zsjianl/img/t.jpg">--%>
                   		</c:if>
                   		<c:if test="${userBasicInfo.headImg == '' || userBasicInfo.headImg == null}">
                   			<img class="img_4 pt-page-moveFromTop" height="140px;" src="/res/liudu/zsjianl/img/t.jpg" />
                   		</c:if> 
                    <div class="sexy qq pt-page-moveFromTop">
	                 <c:if test="${userBasicInfo.gender==0 || userBasicInfo.gender=='' || userBasicInfo.gender==null }">
				        	男<img src="/res/liudu/zsjianl/img/iconfont-nan.png" />
				        </c:if> 
				        <c:if test="${userBasicInfo.gender==1 }">
	                       	 女 <img src="/res/liudu/zsjianl/img/iconfont-nv.png" />
				        </c:if> 
			        </div>
                    
                    <div class="gzcity qq pt-page-moveFromTop">${userBasicInfo.city }所在城市</div>
                    <div class="status qq pt-page-moveFromTop">${userBasicInfo.city }正在职，等待机会</div>
                    <div class="post qq pt-page-moveFromTop">${userBasicInfo.city }正式员工</div>
                  <%--   <c:if test="${userBasicInfo.giveHRword != '' && userBasicInfo.giveHRword != null }"> --%>
                    	<div class="gzcity qq pt-page-moveFromTop" style="top:80%;">"${userBasicInfo.giveHRword }一句话介绍"</div>
                  <%--   </c:if> --%>
					<img class="icon pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
				</div>
			</div>
			<div class="page page-2-1 hide">
				<div class="wrap">
					<!-- <img class="img_1 hide pt-page-moveCircle" src="/res/liudu/zsjianl/img/t2-t.png" />
					<div class="t2-txt1 hide qq pt-page-moveCircle">教育背景</div> -->
					<div class="img_2 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/xue.png" width="35px"/><br/><span>学校</span></div>
					<div class="img_3 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/zhuan.png" width="30px"/><br/><span>专业</span></div>
					<div class="img_4 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/da.png" width="30px"/><br/><span>学历</span></div>
					<div class="img_5 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/biaoqian.png" width="27px"/><br/><span>年级</span></div>
					<div class="img_6 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/dianhua.png" width="30px"/><br/><span>电话</span></div>
					<div class="img_7 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/youxiang.png" width="30px"/><br/><span>邮箱</span></div>
                  <!--   <img class="img_2 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/xue.png" /> -->
                    <!-- <img class="img_3 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/zhuan.png" />
                    <img class="img_4 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/da.png" />
                    <img class="img_5 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/biaoqian.png" />
                    <img class="img_6 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/dianhua.png" />
                    <img class="img_7 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/youxiang.png" /> -->
                    <div class="t2-txtt hide qq pt-page-moveFromRight">
                     <table width="100%" height="100%"><tr><td>${education.university }</td></tr></table>
                    </div>
                    <div class="t2-txtx hide qq pt-page-moveFromRight">
                     <table width="100%" height="100%"><tr><td>${education.major}</td></tr></table>
                    </div>
                    <div class="t2-txt2 hide qq pt-page-moveFromRight">
                     <table width="100%" height="100%"><tr>
                     	<td>
                     	<c:if test="${fn:contains(education.education, '3')}">专科</c:if>
                     	<c:if test="${fn:contains(education.education, '4')}">本科</c:if>
                     	<c:if test="${fn:contains(education.education, '5')}">研究生</c:if>
                     	<c:if test="${fn:contains(education.education, '6')}">博士</c:if>
                     	</td>
                     </tr></table>
                    </div>
                     <div class="t2-txt3 hide qq pt-page-moveFromRight">
                     <table width="100%" height="100%"><tr>
                     	<td>
							<c:if test="${fn:contains(education.grade, '大一')}">一年级</c:if>
							<c:if test="${fn:contains(education.grade, '大二')}">二年级</c:if>
							<c:if test="${fn:contains(education.grade, '大三')}">三年级</c:if>
							<c:if test="${fn:contains(education.grade, '大四')}">四年级</c:if>
						</td>
                     </tr></table>
                    </div>
                    <div class="t2-txt4 hide qq pt-page-moveFromRight">
                     	<table width="100%" height="100%"><tr><td>
                     	<c:if test="${sessionScope.userId != '' && sessionScope.userId != null}">
	                     	<c:if test="${userBasicInfo.expose ==2 }">
	                     		<a href="tel:${userBasicInfo.telPhone }">${userBasicInfo.telPhone }</a>
	                     	</c:if>	
	                     	<c:if test="${userBasicInfo.expose ==1 }">
	                     		未公开
	                     	</c:if>	
                     	</c:if>
                     	<c:if test="${sessionScope.userId == '' || sessionScope.userId == null}">
                     	登录后可查看
                     	</c:if>
                  		</td></tr></table>
                    </div>
                     <div class="t2-txt5 hide qq pt-page-moveFromRight">
                     	<table width="100%" height="100%"><tr><td>
                     	<c:if test="${sessionScope.userId != '' && sessionScope.userId != null}">
	                     	<c:if test="${userBasicInfo.expose ==2 }">
	                     		${userBasicInfo.email }
	                     	</c:if>
	                     	<c:if test="${userBasicInfo.expose ==1 }">
                     			未公开
                     		</c:if> 
                     	</c:if>
                     	<c:if test="${sessionScope.userId == '' || sessionScope.userId == null}">
                     		登录后可查看
                     	</c:if>
                     	</td></tr></table>
                    </div>
                    <img class="icon pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
 				</div>
			</div>
			<div class="page page-3-1 hide">
                   <div class="wrap">
					<!-- <img class="img_1 hide pt-page-moveCircle" src="/res/liudu/zsjianl/img/t2-t.png" />
					<div class="t3-txt1 hide qq pt-page-moveCircle">求职意向</div> -->
					<div class="img_2 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/date.png" width="25px"/><br/><span>可实习时间</span></div>
					<div class="img_3 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/yue.png" width="25px"/><br/><span>可实习月份</span></div>
					<div class="img_4 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/ad.png" width="25px"/><br/><span>可实习场所</span></div>
					<div class="img_5 hide qq pt-page-moveFromLeft"><img src="/res/liudu/zsjianl/img/chuang.png" width="25px"/><br/><span>住宿意愿</span></div>
                   <!--  <img class="img_2 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/date.png" />
                    <img class="img_3 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/yue.png" />
                    <img class="img_4 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/ad.png" />
                    <img class="img_5 hide pt-page-moveFromLeft" src="/res/liudu/zsjianl/img/chuang.png" /> -->
                    <div class="t3-txt2 hide qq pt-page-moveFromRight">
                     <table width="100%" height="100%"><tr><td> 
                    		 每周星期
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周一')}">1、</c:if>
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周二')}">2、</c:if>
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周三')}">3、</c:if>
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周四')}">4、</c:if>
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周五')}">5、</c:if>
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周六')}">6、</c:if>
                    		 <c:if test="${fn:contains(userBasicInfo.workReady,'周日')}">7</c:if>
                    		 实习   
    				</td></tr></table>
                    </div>
                    <%--  <div class="t3-txt3 hide qq pt-page-moveFromRight">
                      ${userBasicInfo.city}
                    </div> --%>
                     <div class="t3-txt3 hide qq pt-page-moveFromRight">
                     <table width="100%" height="100%"><tr><td>
                     	每年
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'一月')}">1、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'二月')}">2、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'三月')}">3、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'四月')}">4、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'五月')}">5、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'六月')}">6、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'七月')}">7、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'八月')}">8、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'九月')}">9、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'十月')}">10、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'十壹月')}">11、</c:if>
                     	<c:if test="${fn:contains(userBasicInfo.monthReady,'十贰月')}">12</c:if>
                     	月可实习
                     <%-- 异地<c:if test="${fn:contains(userBasicInfo.jobCity,'同城')}">同城:</c:if>
                     <c:if test="${fn:contains(userBasicInfo.jobCity,'在校')}">在校;</c:if>
                     <c:if test="${fn:contains(userBasicInfo.jobCity,'单位')}">单位;</c:if>
                     <c:if test="${fn:contains(userBasicInfo.jobCity,'异地')}">异地:</c:if>
                     <c:if test="${fn:contains(userBasicInfo.jobCity,'公司提供住宿')}">公司提供住宿;</c:if>
                     <c:if test="${fn:contains(userBasicInfo.jobCity,'自己提供')}">自己提供;</c:if> --%>
                     </td></tr></table>
                    </div>
                    <div class="t3-txt4 hide qq pt-page-moveFromRight">
                  		  <table width="100%" height="100%"><tr>
                  		  	<td>
                  		  	<c:if test="${fn:contains(userBasicInfo.jobCity, '需居家办公')}">需居家办公</c:if>
                  		  	<c:if test="${fn:contains(userBasicInfo.jobCity, '在公司办公')}">在公司办公</c:if>
                  		  	<c:if test="${!fn:contains(userBasicInfo.jobCity, '在公司办公') && !fn:contains(userBasicInfo.jobCity, '需居家办公')}">
                  		  		未填写
                  		  	</c:if>
                  		  	</td>
                  		  </tr></table>
                    </div>
                    <div class="t3-txt5 hide qq pt-page-moveFromRight">
                  		 <table width="100%" height="100%"><tr>
                  		 	<td>
                  		 	<c:if test="${fn:contains(userBasicInfo.jobCity, '自行解决住宿')}">可自行解决住宿</c:if>
                  		  	<c:if test="${fn:contains(userBasicInfo.jobCity, '公司解决住宿')}">希望公司解决住宿</c:if>
                  		  	<c:if test="${!fn:contains(userBasicInfo.jobCity, '公司解决住宿') && !fn:contains(userBasicInfo.jobCity, '自行解决住宿')}">
                  		  		未填写
                  		  	</c:if>
                  		 	</td>
                  		 </tr></table>
                    </div>
                    <img class="icon pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
 				</div>
			</div>
			 <div class="page page-4-1 hide">
			 <div class="wrap stag">
				   <div class="bbtt">做事风格</div> 
				     <div style="background-color:rgba(228,95,62,0.1);width:90%;height:75%; position:absolute;top:15%; left:5%;"></div>
                     <div  style="background-color:rgba(172,213,152,0.8); width:40px;height:60px; position:absolute;top:10%; left:0;"></div>
                     <div  style="background-color:rgba(236,105,65,0.8); width:40px;height:60px; position:absolute;bottom:5%; right:0;"></div>
                     <div  style="background-color:rgba(236,104,164,0.8); width:20px;height:30px; position:absolute;bottom:2%; right:8%;"></div>
				
				   <c:forEach items="${tagUsers}" var="tagUsers" varStatus="s">
				   		<div class="t4-tag${s.index} hide qq pt-page-scaleUp"><table><tr><td>${tagUsers.tagName}</td></tr></table></div>
				   </c:forEach>
				   	
				   <!-- <div class="t4-tag2 hide qq pt-page-moveFromRight">沟通能力强</div>
				   <div class="t4-tag3 hide qq pt-page-moveFromRight">有实习经验</div>
				   <div class="t4-tag4 hide qq pt-page-moveFromRight">熟悉办公软件</div>
				   <div class="t4-tag5 hide qq pt-page-moveFromRight">英语专八</div>
				   <div class="t4-tag6 hide qq pt-page-moveFromRight">沟通能力良好</div>
				   <div class="t4-tag7 hide qq pt-page-moveFromRight">身高1米8</div>
				   <div class="t4-tag8 hide qq pt-page-moveFromRight">身高1米8</div> -->
				<!--  <img class="xing1 hide" src="/res/liudu/zsjianl/img/xing1.png" />
				 <img class="xing2 hide" src="/res/liudu/zsjianl/img/xing2.png" />
				 <img class="xing3 hide" src="/res/liudu/zsjianl/img/xing3.png" />
				 <img class="xing4 hide" src="/res/liudu/zsjianl/img/xing4.png" />  -->
				 <img class="icon  pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
				</div>
 				
				
			</div>
			<div class="page page-5-1 hide">
			<div class="wrap stag">
				   <div class="bbtt">技能</div> 
				    <div style="background-color:rgba(249,233,23,0.1);width:90%;height:75%; position:absolute;top:15%; left:5%;"></div>
                     <div  style="background-color:rgba(172,213,152,0.8); width:40px;height:60px; position:absolute;top:10%; left:0;"></div>
                     <div  style="background-color:rgba(236,105,65,0.8); width:40px;height:60px; position:absolute;bottom:5%; right:0;"></div>
                     <div  style="background-color:rgba(236,104,164,0.8); width:20px;height:30px; position:absolute;bottom:2%; right:8%;"></div>
				
				   <div id="skill"></div>
				   <%-- <c:forEach items="${tagUsers}" var="tagUsers" varStatus="s">
				   		<div class="t4-tag${s.index} hide qq pt-page-moveFromRight">${tagUsers.tagName}</div>
				   </c:forEach> --%>
				   <!-- <div class="t4-tag2 hide qq pt-page-moveFromRight">沟通能力强</div>
				   <div class="t4-tag3 hide qq pt-page-moveFromRight">有实习经验</div>
				   <div class="t4-tag4 hide qq pt-page-moveFromRight">熟悉办公软件</div>
				   <div class="t4-tag5 hide qq pt-page-moveFromRight">英语专八</div>
				   <div class="t4-tag6 hide qq pt-page-moveFromRight">沟通能力良好</div>
				   <div class="t4-tag7 hide qq pt-page-moveFromRight">身高1米8</div>
				   <div class="t4-tag8 hide qq pt-page-moveFromRight">身高1米8</div> -->
				<!-- 	<img class="xing1 hide" src="/res/liudu/zsjianl/img/xing1.png" />
				 <img class="xing2 hide" src="/res/liudu/zsjianl/img/xing2.png" />
				 <img class="xing3 hide" src="/res/liudu/zsjianl/img/xing3.png" />
				 <img class="xing4 hide" src="/res/liudu/zsjianl/img/xing4.png" />  -->
				 <img class="icon pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
				</div>
				
			</div>
			<div class="page page-6-1 hide">
				<div class="wrap stag">
				   <div class="bbtt">证书与荣誉</div> 
				    <div style="background-color:rgba(71,69,168,0.1);width:90%;height:75%; position:absolute;top:15%; left:5%;"></div>
                     <div  style="background-color:rgba(172,213,152,0.8); width:40px;height:60px; position:absolute;top:10%; left:0;"></div>
                     <div  style="background-color:rgba(236,105,65,0.8); width:40px;height:60px; position:absolute;bottom:5%; right:0;"></div>
                     <div  style="background-color:rgba(236,104,164,0.8); width:20px;height:30px; position:absolute;bottom:2%; right:8%;"></div>
				
				   <div id="certificate"></div>
				   <%-- <c:forEach items="${tagUsers}" var="tagUsers" varStatus="s">
				   		<div class="t4-tag${s.index} hide qq pt-page-moveFromRight">${tagUsers.tagName}</div>
				   </c:forEach> --%>
				   <!-- <div class="t4-tag2 hide qq pt-page-moveFromRight">沟通能力强</div>
				   <div class="t4-tag3 hide qq pt-page-moveFromRight">有实习经验</div>
				   <div class="t4-tag4 hide qq pt-page-moveFromRight">熟悉办公软件</div>
				   <div class="t4-tag5 hide qq pt-page-moveFromRight">英语专八</div>
				   <div class="t4-tag6 hide qq pt-page-moveFromRight">沟通能力良好</div>
				   <div class="t4-tag7 hide qq pt-page-moveFromRight">身高1米8</div>
				   <div class="t4-tag8 hide qq pt-page-moveFromRight">身高1米8</div> -->
			<!-- 		<img class="xing1 hide" src="/res/liudu/zsjianl/img/xing1.png" />
				 <img class="xing2 hide" src="/res/liudu/zsjianl/img/xing2.png" />
				 <img class="xing3 hide" src="/res/liudu/zsjianl/img/xing3.png" />
				 <img class="xing4 hide" src="/res/liudu/zsjianl/img/xing4.png" />  -->
				 <img class="icon pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
				</div>
			</div>
			<div class="page page-7-1 hide">
				<div class="wrap stag">
				   <div class="bbtt">其他</div> 
				   <!-- <div id="hobby"></div> -->
				     <div style="background-color:rgba(37,155,216,0.1);width:90%;height:75%; position:absolute;top:15%; left:5%;"></div>
                    <div  style="background-color:rgba(172,213,152,0.8); width:40px;height:60px; position:absolute;top:10%; left:0;"></div>
                     <div  style="background-color:rgba(236,105,65,0.8); width:40px;height:60px; position:absolute;bottom:5%; right:0;"></div>
                      <div  style="background-color:rgba(236,104,164,0.8); width:20px;height:30px; position:absolute;bottom:2%; right:8%;"></div>
				<%--  <div  style="position: absolute; color:#000; top:15%; left:50%;width:80%; margin-left:-40%;line-height:25px;">
				 <ul>
				 	 <li>1、经历: ${userBasicInfo.experience }</li>
					 <li>2、爱好:${userBasicInfo.hobby }</li>
				 </ul>
				 </div> --%>
				    <c:forEach items="${tagUsers}" var="tagUsers" varStatus="s">
				   		<div class="t4-tag${s.index} hide qq pt-page-scaleUp"><table><tr><td>${tagUsers.tagName}</td></tr></table></div>
				   </c:forEach> 
				   <!-- <div class="t4-tag2 hide qq pt-page-moveFromRight">沟通能力强</div>
				   <div class="t4-tag3 hide qq pt-page-moveFromRight">有实习经验</div>
				   <div class="t4-tag4 hide qq pt-page-moveFromRight">熟悉办公软件</div>
				   <div class="t4-tag5 hide qq pt-page-moveFromRight">英语专八</div>
				   <div class="t4-tag6 hide qq pt-page-moveFromRight">沟通能力良好</div>
				   <div class="t4-tag7 hide qq pt-page-moveFromRight">身高1米8</div>
				   <div class="t4-tag8 hide qq pt-page-moveFromRight">身高1米8</div> -->
			<!-- 		<img class="xing1 hide" src="/res/liudu/zsjianl/img/xing1.png" />
				 <img class="xing2 hide" src="/res/liudu/zsjianl/img/xing2.png" />
				 <img class="xing3 hide" src="/res/liudu/zsjianl/img/xing3.png" />
				 <img class="xing4 hide" src="/res/liudu/zsjianl/img/xing4.png" />  -->
				 <img class="icon pt-page-moveIconUp" src="/res/liudu/zsjianl/img/icon_up.png" />
				</div>
			</div>

			<div class="page page-8-1 hide">
				<div class="wrap">
					<div class="ftop"><span class="fenxiang">${userBasicInfo.sharetimes}次</span><span class="chakan">${userBasicInfo.viewCount}次</span><span class="kong">还在找工作哟</span></div>
	
					
					<%--  电话：
					 <c:if test="${userBasicInfo.expose ==2 }">
                     		<a href="tel:${userBasicInfo.telPhone }">${userBasicInfo.telPhone }</a>直接邀请我吧！<br>
                     	</c:if>	
                     	<c:if test="${userBasicInfo.expose ==1 }">
                     		未公开<br>
                     	</c:if>	
                   	 邮箱：
                   	 <c:if test="${userBasicInfo.expose ==2 }">
                     		<a href="mailto:${userBasicInfo.email }">${userBasicInfo.email }</a>直接邀请我吧！<br> <br>
                     	</c:if>	
                     	<c:if test="${userBasicInfo.expose ==1 }">
                     		未公开<br>
                     	</c:if>	
                     	<br/><br/> --%>
					
					<div style="text-align:center; position:absolute;top:12%; width:80%; left:50%; margin-left:-40%;"> 
					<div id="dianhyoux" style="display: none;">
						 电话：<a href="tel:${userBasicInfo.telPhone }" style="color: #FF811A;">${userBasicInfo.telPhone }</a>直接邀请我吧！<br>
						邮箱：<a href="mailto:${userBasicInfo.email }" style="color: #FF811A;">${userBasicInfo.email }</a>直接邀请我吧！<br><br>
					</div>
					<div style="line-height:25px;margin:5px 0;color:#666">我是你的实习生吗？</div>
                   		<input name="" id="yaoq" type="button" onclick="invite('${userBasicInfo.userId}','${userBasicInfo.email}')" value="联系我" class="inputfb">
                   <div style="line-height:25px;margin:5px 0;color:#666">如果不是，转出去，<br>让我去看看更大的世界好吗？</div>
                   		<input name="" id="yaoq" type="button"  onclick="shareDialog()" value="帮我漂出去" class="inputfb">
                  
                   <div style="line-height:25px;margin:5px 0;">想让亲友熟人帮你找工作？长按二维码，30秒制作你的简历漂流瓶</div>
	              	 <div >
	              	 	<img id="ss" style="width:40%" src="/res/images/wxEwm.jpg" />
	              	 </div>
                   </div>                  
                   <div style="text-align:center; position:absolute;top:85%; width:30%; left:50%;margin-left:-15%"> 
                   		<button class="inputfb"  onclick="shareDialogsc()">收藏简历</button>
                   </div> 
				  <!--  <div style="text-align:center; position:absolute;top:85%; width:30%; left:30%;left:65%;"> 
				   		<button class="inputfb"  onclick="shareDialog()">分享</button>
  				   </div> -->
   					<div style="position: absolute;bottom: 0px;width:100%;left:50%;margin-left:-50%;color:#CC6600;font-size: 12px;text-align: center;">&copy;远界科技技术支持</div>
				</div>
			</div> 
    </div>
	<!-- <div id="audiocontainer"></div>
	<div id="textsuper">
	<div id="textsub"><img id="fontimg" />
    </div></div> -->
    <div id="share" onClick="closeDialog()">
    	<div class="shareImg"></div>
    </div>		
    <div id="sharesc" onClick="closeDialogsc()">
    	<div class="shouchang"></div>
 </div>
</body> 
      <!--  <script type="text/javascript">
		
		gSound = 'img/1.mp3'; 
		</script>-->
<script src="/res/liudu/zsjianl/js/zepto.min.js"></script>
<script src="/res/liudu/zsjianl/js/touch.js"></script>
<script src="/res/liudu/zsjianl/js/index.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
document.onreadystatechange = loading; 

var certificate = '${userBasicInfo.certificate}';
if(certificate != "" && certificate != null){
	var fss = certificate.split(",");
	var str = "";
	for(var j=0;j<fss.length;j++){
		str = str+"<div class=\"t4-tag"+(Number(j))+" hide qq pt-page-moveFromRight\"><table><tr><td>"+fss[j]+"</td></tr></table></div>";
	}
	document.getElementById("certificate").innerHTML=str; 
}
var skill = '${userBasicInfo.skill}';
if(skill != "" && skill != null){
	var fsd = skill.split(",");
	var sttr = "";
	for(var i=0;i<fsd.length;i++){
		sttr = sttr+"<div class=\"t4-tag"+(Number(i))+" hide qq pt-page-moveFromRight\"><table><tr><td>"+fsd[i]+"</td></tr></table></div>";
	}
	document.getElementById("skill").innerHTML=sttr;
}
var experience = '${userBasicInfo.experience}';
if(experience != "" && experience != null){
	var fs = experience.split(",");
	var ext = "";
	for(var n=0;n<fs.length;n++){
		ext = ext+"<div class=\"t4-tag"+(Number(n))+" hide qq pt-page-moveFromRight\"><table><tr><td>"+fs[n]+"</td></tr></table></div>";
	}
	document.getElementById("experience").innerHTML=ext; 
}
var hobby = '${userBasicInfo.hobby}';
if(hobby != "" && hobby != null){
	var fsf = hobby.split(",");
	var dds = "";
	for(var s=0;s<fsf.length;s++){
		dds = dds+"<div class=\"t4-tag"+(Number(s))+" hide qq pt-page-moveFromRight\"><table><tr><td>"+fsf[s]+"</td></tr></table></div>";
	} 
	document.getElementById("hobby").innerHTML=dds; 
}
function loading(){
	if(document.readyState == "complete"){ 
		$("#loading").hide();
		$("#content").show();
		//playbksound();
	}
}

function invite(uId,email){
	if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/openLogin/user/login.jsp";
	}else{
		if('${sessionScope.roleId}'==1){
			if('${userBasicInfo.expose}'==2){
				$("#dianhyoux").attr("style","display:block;");
				$("#yaoq").attr("onclick","fayaoq('"+uId+"','"+email+"')");
				$("#yaoq").val("发邀请");
			}else{
				window.location.href="/company/resume/inteWeixYaoQing/"+uId+"/"+email;
			}
		}else{
			alert("暂只支持企业用户发送邀请！");
		}
	}
}

function fayaoq(uId,email){
	if('${sessionScope.userId}'==''){
		alert("请先登录");
		window.location.href="/m/login.jsp";
	}else{
		if('${sessionScope.roleId}'==1){
			window.location.href="/company/resume/inteWeixYaoQing/"+uId+"/"+email;
		}else{
			alert("暂只支持企业用户发送邀请！");
		}
	}
}

function shareDialog(){
	 $("#share").show();			
}
function closeDialog(){
	$("#share").hide();
}
function shareDialogsc(){
	 $("#sharesc").show();			
}
function closeDialogsc(){
	$("#sharesc").hide();
}




var userName = '${userBasicInfo.userName }';
var userId = '${userBasicInfo.userId }';
var url = location.href;
$.ajax({
	type:'POST',
	url:'/weixin/approve',
	data:{"url":url},
	dataType:'html',
	success:function(jsons) {
		var json = JSON.parse(jsons);
		wx.config({
		    debug: false,
		    appId: 'wx916479acee4084e2',
		    timestamp: json.timestamp,
		    nonceStr: json.nonceStr,
		    signature: json.signature,
		    jsApiList: ['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage',
		      'onMenuShareQQ','onMenuShareWeibo','hideMenuItems','showMenuItems',
		      'hideAllNonBaseMenuItem','showAllNonBaseMenuItem','translateVoice',
		      'startRecord','stopRecord','onRecordEnd','playVoice','pauseVoice',
		      'stopVoice','uploadVoice','downloadVoice','chooseImage','previewImage',
		      'uploadImage','downloadImage','getNetworkType','openLocation','getLocation',
		      'hideOptionMenu','showOptionMenu','closeWindow','scanQRCode','chooseWXPay',
		      'openProductSpecificView','addCard','chooseCard','openCard'
		    ]
		});
	}
});

</script>
<script src="/res/liudu/zsjianl/js/domeFriend.js"></script>

</html>

