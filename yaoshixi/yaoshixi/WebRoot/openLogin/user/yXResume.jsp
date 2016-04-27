<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${userBasicInfo.userName }的简历</title>
</head>

<body style="padding:0;margin:0;">
<div style="width:800px; margin:0 auto;">
<div style="background-color:#265A9D; height:100px;">
<h1 style="margin:0;padding:0; color:#FFF; line-height:100px;padding-left:50px">${userBasicInfo.userName }</h1>
</div>
<div style="position:relative;background:#fdfdfb url(http://www.yaoshixi.com/res/weixin/preview/img/bg.jpg) repeat-y 100px 0">

       <img style=" position:absolute;left:80px;top:30px; width:40px" src="http://www.yaoshixi.com/res/weixin/preview/img/t3-jy.png" />
                       <div style="font-size:14px; color:#898989; padding-left:150px; padding-top:30px; text-align:left;">
                            <h2 style="color:#de525b; font-size:20px; line-height:40px; margin:0">教育经历</h2>
                            <div style="line-height:25px;">
                            <span style="color:#000; margin-right:10px;">${education.university }</span>
                            <span style="color:#000; margin-right:10px;">
                            	<c:if test="${fn:contains(education.education, '3')}">专科</c:if>
		                     	<c:if test="${fn:contains(education.education, '4')}">本科</c:if>
		                     	<c:if test="${fn:contains(education.education, '5')}">研究生</c:if>
		                     	<c:if test="${fn:contains(education.education, '6')}">博士</c:if>
							</span>
                            <span style="color:#000; margin-right:10px;">${education.major}</span><br/>
                                	专业能力：${userBasicInfo.skill }<br/>
                            </div>
						</div>
</div>
<div style="position:relative;background:url(http://www.yaoshixi.com/res/weixin/preview/img/bg.jpg) repeat-y 100px 0">
       <img style=" position:absolute;left:80px;top:30px; width:40px" src="http://www.yaoshixi.com/res/weixin/preview/img/t3-ss.png" />
                       <div style="font-size:14px; color:#898989; padding-left:150px; padding-top:30px; text-align:left;">
                            <h2 style="color:#de525b; font-size:20px; line-height:40px; margin:0">实践经历</h2>
                            <div style="line-height:25px;">
                            	${userBasicInfo.experience }
                            <!-- <span style="color:#000; margin-right:10px;"> 2009-09-01 ~ 2013-06-01</span>
                            <span style="color:#000; margin-right:10px;">一白丁科技集团</span>
                            <span style="color:#000; margin-right:10px;">市场部实习生</span> --><br/>
                        
                                <!-- <ul style="padding-left:20px; margin:0 ">
                                 <li>负责社团组织建设，社团机构的管理，协调各部门工作；</li>
                                 <li>协助筹备“不可思议”大型市场推广广州站部分系列活动；</li>
                                 <li>负责社团组织建设，社团机构的管理，协调各部门工作；</li>
                                 <li>协助筹备“不可思议”大型市场推广广州站部分系列活动；</li>
                                </ul> -->
                            </div>
				</div>
</div>
<div style="position:relative;background:url(http://www.yaoshixi.com/res/weixin/preview/img/bg.jpg) repeat-y 100px 0">

       <img style=" position:absolute;left:80px;top:30px; width:40px" src="http://www.yaoshixi.com/res/weixin/preview/img/t4-ss.png" />
                       <div style="font-size:14px; color:#898989; padding-left:150px; padding-top:30px; text-align:left;">
                            <h2 style="color:#de525b; font-size:20px; line-height:40px; margin:0">技能证书</h2>
                            <div style="line-height:25px;">
                            	${userBasicInfo.certificate}
                               <!-- <ul style="padding-left:20px; margin:0 ">
                                 <li>CET-6，优秀的听说写能力</li>
                                 <li>计算机二级，熟悉计算机各项操作</li>
                                 <li>高级营销员，国家职业资格四级</li>
                               </ul> -->
                            </div>
				</div>
</div>

<div style="position:relative;background:url(http://www.yaoshixi.com/res/weixin/preview/img/bg.jpg) repeat-y 100px 0">

       <img style=" position:absolute;left:80px;top:30px; width:40px" src="http://www.yaoshixi.com/res/weixin/preview/img/t4-jx.png" />
                       <div style="font-size:14px; color:#898989; padding-left:150px; padding-top:30px; text-align:left;">
                            <h2 style="color:#de525b; font-size:20px; line-height:40px; margin:0">特征</h2>
                            <div style="line-height:25px;">
                            <c:forEach items="${tagUsers}" var="tagUsers" varStatus="s">
                            	<c:if test="${s.last }">
                            		${tagUsers.tagName}
                            	</c:if>
                            	<c:if test="${!s.last }">
				   				${tagUsers.tagName},
				   				</c:if>
				   			</c:forEach>
                               <!-- <ul style="padding-left:20px; margin:0 ">
                                 <li>2009.10获国家奖学金</li>
                                 <li>2010.11获“三好学生称号”</li>
                                 <li>2011.4挑战杯创业计划大赛省级铜奖</li>
                               </ul> -->
                            </div>

</div>
<div style="position:relative;background:url(http://www.yaoshixi.com/res/weixin/preview/img/bg.jpg) repeat-y 100px 0">

       <img style=" position:absolute;left:80px;top:30px; width:40px" src="http://www.yaoshixi.com/res/weixin/preview/img/t4-pj.png" />
                       <div style="font-size:14px; color:#898989; padding-left:150px; padding-top:30px; text-align:left;">
                            <h2 style="color:#de525b; font-size:20px; line-height:40px; margin:0">性格爱好</h2>
                            <div style="line-height:25px;">
                              ${userBasicInfo.hobby }
                              </div>

</div>



</div>
<div style="background-color:#E7E7E7; height:80px;padding-top:10px;">
<ul>
<li style="list-style-type:none; display:inline-block; margin-right:10px;">
  <div style=" display:inline-block; background-color:#12A89D; border-radius:40px;padding:5px; margin:10px; vertical-align:middle">
  <img src="http://www.yaoshixi.com/res/weixin/preview/img/iconfont-riqixuanzetubiao.png" width="20"/></div>
	<fmt:formatDate value="${userBasicInfo.birthDay }" pattern="yyyy-MM-dd"/>
</li> 
<li style="list-style-type:none; display:inline-block;margin-right:10px;">
  <div style=" display:inline-block; background-color:#EE745F; border-radius:40px;padding:5px; margin:10px; vertical-align:middle">
  <img src="http://www.yaoshixi.com/res/weixin/preview/img/iconfont-dizhi.png" width="20"/></div>${userBasicInfo.city }</li>
<li style="list-style-type:none; display:inline-block;margin-right:10px;">
  <div style=" display:inline-block; background-color:#8D5690; border-radius:40px;padding:5px; margin:10px; vertical-align:middle">
  <img src="http://www.yaoshixi.com/res/weixin/preview/img/iconfont-dianhua.png" width="20"/></div>${userBasicInfo.telPhone }</li> 
<li style="list-style-type:none; display:inline-block;">
  <div style=" display:inline-block; background-color:#649AE1; border-radius:40px;padding:5px; margin:10px; vertical-align:middle">
  <img src="http://www.yaoshixi.com/res/weixin/preview/img/iconfont-email.png" width="20"/></div>${userBasicInfo.email}</li> 
</ul>

</div>

</div>

</div>
</body>
</html>
