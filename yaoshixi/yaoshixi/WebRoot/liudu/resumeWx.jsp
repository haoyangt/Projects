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
<title>编辑简历</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<link rel="stylesheet" type="text/css" href="/res/liudu/resume/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/resume/css/index.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/resume/css/animations.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/resume/css/load.css" />
<link rel="stylesheet" type="text/css" href="/res/liudu/resume/css/component.css" />

<style type="text/css">
.bdcg{background-image: url("/res/liudu/invite/img/xiaoyuangouicon.png");background-position: left center;background-repeat: no-repeat;display: block; height: 32px;padding-left: 40px;width: 100%;line-height:32px; color:#0079e0;}
</style>
</head>
<body>
<!--<div id="loading">
  <div class="spinner">
    <div class="double-bounce1"></div>
    <div class="double-bounce2"></div>
  </div>
</div>-->
<!--<div id="content">-->
<form id="userFrom" action="" method="post">
<input type="hidden" name="userBasicInfo.userId" value="${userBasicInfo.userId }">
<input type="hidden" name="educationExperience.id" value="${education.id }">
<input type="hidden" name="userBasicInfo.refreshto" id="refreshto" value="1">

  <div class="page page-1-1 page-current">
    <div class="wrap">
      <img class="tp" src="/res/liudu/resume/img/top.png" />
       <div class="toux">
       		
              	<img id="photo" height="140px;" 
	              	<c:if test="${fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn')}"> 
	              		src="${userBasicInfo.headImg}"
	              	</c:if>	
	              	<c:if test="${!fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn') && userBasicInfo.headImg !=''}">
	              		src="/user/getHeadPhoto?ImgPath=${userBasicInfo.headImg}"
	              	</c:if>
	              	<c:if test="${userBasicInfo.headImg =='' || userBasicInfo.headImg ==null }">
	              		src="/res/liudu/resume/img/t.jpg"
	              	</c:if>
              	> 
             <input type="hidden" name="userBasicInfo.headImg" id="headImgg"> 	
           <p style="width:100%;">
<!--            		<input type="file" value="" name="logo" id="uploadImage" accept="image/*"  onchange="ajaxUploadImg()" style="width:65px; border:none; background-color:#265898;padding:3px;-webkit-appearance: none;"/> -->
          <!--  <input type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc;display:none">   -->
		   <input type="button" value="修改头像" onclick="uploadImage.click()" style="border:none;padding:5px 8px;font-size:14px; background-color:#265898;color:#FFF;">  
		   <input type="file" style="display:none" name="logo" id="uploadImage" accept="image/*"  onchange="ajaxUploadImg()">
           </p>
      		
       	</div>
       <div class="nick cbg">
       		<input name="userBasicInfo.userName" id="userNames" value="${userBasicInfo.userName }" type="text" placeholder="默认显示的是微信昵称">
       		<p style="color:#CC6600;font-size: 12px;padding-top:5px;">使用真实姓名可以获得更多HR关注</p>
       	</div>
       <div class="sex">
       <input name="userBasicInfo.gender" id="gender" value="${userBasicInfo.gender }" type="hidden" >
       		<c:if test="${fn:contains(userBasicInfo.gender,1)}">
	        	<a onclick="nansex()" class="nv onnv">女</a>
	      	</c:if>
		 	<c:if test="${!fn:contains(userBasicInfo.gender,1)}">
	        	<a onclick="nansex()" class="nv">女</a>
	      	</c:if>
        	<img style="position:absolute;left:50%;top:8px;margin-left:-1px;" src="/res/liudu/resume/img/line.png" width="2" height="30">
	        
	      	<c:if test="${fn:contains(userBasicInfo.gender,0)}">	
        		<a onclick="nvsex()" class="nan onnan">男</a>
	        </c:if>
	        <c:if test="${!fn:contains(userBasicInfo.gender,0)}">
	        	<a onclick="nvsex()" class="nan">男</a>
	        </c:if>
       </div>
       <div class="city cbg"> 
       	<input name="userBasicInfo.city" id="city" type="text" placeholder="默认显示微信资料的城市" value="${userBasicInfo.city}">
      	<p style="color:#CC6600;font-size: 12px;padding-top:5px;">使用当前所在地有利于找到合适工作</p>
       </div>
       <div class="muq">
       
       <span style="color:#000">目前状态：</span><select id="postJob" name="job.postJob" class="slcte" onchange="jobss()">
				<option>请选择</option>
				<option>已离职，可快速到岗</option>
				<option>正在职，等待机会</option>
				<option>暂时不想找工作</option>
				<option>我是应届毕业生</option>
			</select>
	
       </div>
       	<div class="city cbg"> 
	 <span style="color:#000">当前岗位：</span>	<input id="gw" type="text"  value="">
	</div>
       <!--<div class="agreement"><span></span>要实习用户协议</div>-->
       
       <div class="ac-custom ac-checkbox ac-checkmark" autocomplete="off">
			<ul style="width:90%">
	       		<li id="xiyi" style="color: red;padding:4px 0;font-size: 12px;text-align: center;"></li>
				<li>
					<label for="cb6">
						<input id="cb6" name="cb6"  type="checkbox" <c:if test="${education.university != '' && education.university != null}">checked="checked"</c:if> onclick="ysxXy()">我已阅读并同意
						<a href="/weixin/xieyi.jsp">《用户协议》</a>
					</label>
					<c:if test="${education.university != '' && education.university != null}"> 
						<svg id="sxxy" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
							<path d="M16.667,62.167c3.109,5.55,7.217,10.591,10.926,15.75 c2.614,3.636,5.149,7.519,8.161,10.853c-0.046-0.051,1.959,2.414,2.692,2.343c0.895-0.088,6.958-8.511,6.014-7.3 c5.997-7.695,11.68-15.463,16.931-23.696c6.393-10.025,12.235-20.373,18.104-30.707C82.004,24.988,84.802,20.601,87,16" style="stroke-dasharray: 126.36976623535156px, 126.36976623535156px; stroke-dashoffset: 0px; -webkit-transition: stroke-dashoffset 0.2s ease-in-out 0s; transition: stroke-dashoffset 0.2s ease-in-out 0s;"></path>
						</svg>
					</c:if>
				</li>
			</ul>
       </div>
      <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" /> 
     </div>
  </div>
  <div class="page page-2-1 hide">
    <div class="wrap">
     <img class="tp" src="/res/liudu/resume/img/top.png" />
         <div class="cbg"> 
   			<table class="zyjj">
   			<tr>
   			<th>职位类别</th><th>职位</th><th>职位方向</th><th>工作年限</th>
   			</tr>
   			<tr>
   			<td><select id="sdss" name="" class="slcte-jj" onchange="getRegion()">
				<option value="">请选择</option>
				<option value="IT/互联网">IT/互联网</option>
				<option value="设计">设计</option>
				<option value="生产/制造">生产/制造</option>
				<option value="行政/人事">行政/人事</option>
				<option value="教育/法律/咨询">教育/法律/咨询</option>
				<option value="市场">市场</option>
				<option value="贸易/物流">贸易/物流</option>
				<option value="财务">财务</option>
				<option value="销售">销售</option>
			</select></td>
			<td><select id="sscc" name="" class="slcte-jj">
				<%-- <c:if test="${jobName == null || jobName == ''}">
=======
			<td><select id="postJob" name="job.postJob" class="slcte-jj" onchange="jobss()">
				<option>请选择</option>
				<option>助理</option>
				<option>专员</option>
				<option>经理</option>
				<option>总监</option>
				<option>总监及以上</option>
			</select></td>
			<td><select id="sscc" name="job.jobName" class="slcte-jj" onchange="jobss()">
				<c:if test="${jobName == null || jobName == ''}">
>>>>>>> .r1968
					<option>请选择</option>
				</c:if>
				<c:if test="${jobName != null && jobName != ''}">
					<option>${jobName}</option>
				</c:if> --%>
			</select></td>
			<td><select id="zhiwfx" name="" class="slcte-jj" onchange="jobss()">
				<option >请选择</option>
				<option value="总监">总监</option>
				<option value="经理">经理</option>
				<option value="员工">员工</option>
			</select></td>
			<td><select id="gongznx" name="" class="slcte-jj" onchange="jobss()">
				<option>请选择</option>
				<option value="应届毕业生">应届毕业生</option>
				<option value="一年">一年</option>
				<option value="两年">两年</option>
				<option value="三年">三年</option>
				<option value="四年">四年</option>
				<option value="五年">五年</option>
				<option value="六年">六年</option>
				<option value="七年">七年</option>
				<option value="八年">八年</option>
				<option value="九年">九年</option>
				<option value="十年">十年</option>
				<option value="十年以上">十年以上</option>
			</select></td>
   			</tr>
   			</table>
   			<p style="margin-top:10px"><a class="input-add" onclick="addgzjy()">添加</a>
   			</p>
   			<p style="margin-top:10px"><span style="color:#C0504D;font-size: 1em;">职业生涯中会有对于自己重要的经验，<br/>不需要太多，最多5条哦。</span>
   			</p>
         </div>
         <div style="margin-top:10px;padding-left:5px;line-height:30px;font-size: 14px">
        <p style="font-weight: bold;"> 人生中最重要的经验：</p>
         <ul id="gzjxShow">
         
         </ul>
         </div>
       <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" /> 
     </div>
  </div>
 
<div class="page page-3-1 hide">
    <div class="wrap">
     <img class="tp" src="/res/liudu/resume/img/top.png" />
     <div style="height:20%"></div>
    <div class="ones cbg"><img src="/res/liudu/resume/img/iconfont-dianhua.png" width="35" > 
   	  	<input name="userBasicInfo.telPhone" id="telPhone" value="${userBasicInfo.telPhone }" type="tel" placeholder="电话号码">
   	</div>
    <div class="ones"><img src="/res/liudu/resume/img/iconfont-youxiang.png" width="35" > 
   	  	<input name="userBasicInfo.email" id="email" value="${userBasicInfo.email }" type="text" placeholder="邮箱">
   	</div>
    <div class="ones cbg"><img src="/res/liudu/resume/img/iconfont-xuexiaoguanli.png" width="35" > 
 	 		<select id="postJob" name="job.postJob" class="slcte" onchange="jobss()">
				<option>请选择最高学历</option>
				<option>大专</option>
				<option>本科</option>
				<option>硕士</option>
				<option>博士</option>
				<option>其他</option>
			</select>
 	 </div>
   <%--  <div class="ones cbg"><img src="/res/liudu/resume/img/iconfont-biaoqian.png" width="35" > 
   	  <input name="educationExperience.major" id="major" value="${education.major}" type="text" placeholder="专业">
   	</div> --%>
      <div class="ac-custom ac-checkbox ac-checkmark" autocomplete="off">
				<input id="expose" name="userBasicInfo.expose" type="hidden" value="${userBasicInfo.expose}" ><br>
				<ul style="padding-left:5%">
					<li>
						<input type="checkbox" id="exposec" <c:if test="${fn:contains(userBasicInfo.expose, 2)}">checked="checked"</c:if> onclick="sfgk()" >
						<label for="exposec" style="font-size:12px;">允许对您感兴趣的注册企业用户查看联系方式</label>
						<c:if test="${fn:contains(userBasicInfo.expose,2)}"> 
						<svg id="mrdh" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
							<path d="M16.667,62.167c3.109,5.55,7.217,10.591,10.926,15.75 c2.614,3.636,5.149,7.519,8.161,10.853c-0.046-0.051,1.959,2.414,2.692,2.343c0.895-0.088,6.958-8.511,6.014-7.3 c5.997-7.695,11.68-15.463,16.931-23.696c6.393-10.025,12.235-20.373,18.104-30.707C82.004,24.988,84.802,20.601,87,16" style="stroke-dasharray: 126.36976623535156px, 126.36976623535156px; stroke-dashoffset: 0px; -webkit-transition: stroke-dashoffset 0.2s ease-in-out 0s; transition: stroke-dashoffset 0.2s ease-in-out 0s;"></path>
						</svg>
					 </c:if>
					</li>
				</ul>
       		</div>
    
      <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" />
  </div>
  </div>
  
<div class="page page-4-1 hide">
    <div class="wrap"> <img class="tp" src="/res/liudu/resume/img/top.png" />
    <div style="padding:5px 0;text-align:center;background-color:#f37157;color: #FFF;
width: 60%;margin:10px auto 0;">描述特征</div>
     <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请选择中意的标签来表现自己。</div>
     	<div id="weixuanbq" class="tag">
       		<span id="时间观念强" onclick="weixbiaoqz('时间观念强')">时间观念强</span>
       		<span id="倾听型" onclick="weixbiaoqz('倾听型')">倾听型</span>
       		<span id="注重细节" onclick="weixbiaoqz('注重细节')">注重细节</span>
	  		<span id="耐心" onclick="weixbiaoqz('耐心')">耐心</span>
        	<span id="善于总结" onclick="weixbiaoqz('善于总结')">善于总结</span>
        	<span id="开发思维" onclick="weixbiaoqz('开发思维')">开发思维</span>
        	<span id="性格温和" onclick="weixbiaoqz('性格温和')">性格温和</span>
        	<span id="善于自省" onclick="weixbiaoqz('善于自省')">善于自省</span>
         </div>
        <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">属于自己的标签。</div>
        <div class="selecttag">
  		 <div id="yixuanbq"  class="spans">
  		 	<c:forEach items="${tagUsers}" var="tagUsers" varStatus="idxStatus">
  		 		<span id="${tagUsers.tagName}" onclick="yixbiaoqz('${tagUsers.tagName}',this)">${tagUsers.tagName}</span>
  		 	</c:forEach> 
  		 </div>
          <label style="position:absolute; bottom:2px; right:2px; color:#666; font-size:12px;">只可以选择8个</label>
          <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除</label>
        </div>
        <p style="text-align: center; padding:5px 0; font-size: 12px;"><label id="tishi" style="color: red"></label></p>
        <div class="wt">     	
        	<input id="zdybiaoq" name="" type="text" class="inputw" placeholder="再贴几个标签突出个人优势吧">
        	<input name="" type="button" onclick="tiebiaoq()" value="我贴" class="inputb">
        </div>
    <!--  <div class="tswz">《 左滑填写证书</div> -->
     <!--  <img class="yuan pt-page-scaleUp" src="/res/liudu/resume/img/dot1.png" /> -->
      <!-- <div style="position: absolute;bottom: 0px;left: 34%;">&copy;远界科技技术支持</div> -->
      <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" />
	</div>
</div>
<div class="page page-5-1 hide">
    <div class="wrap"> <img class="tp" src="/res/liudu/resume/img/top.png" />
       <div style="padding:5px 0;text-align:center;background-color:#f37157;color: #FFF;
width: 60%;margin:10px auto 0;">我的技能</div>
    <input type="hidden" name="userBasicInfo.certificate" id="certificate" value="${userBasicInfo.certificate}">
     <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请选择中意的标签来表现自己。</div>
     	<div id="weixuanzsbq" class="tag">
       		<span id="计算机二级" onclick="weixzsbqz('计算机二级')">计算机二级</span>
       		<span id="英语六级" onclick="weixzsbqz('英语六级')">英语六级</span>
       		<span id="口译证书" onclick="weixzsbqz('口译证书')">口译证书</span>
	  		<span id="奖学金" onclick="weixzsbqz('奖学金')">奖学金</span>
        	<span id="银行从业资格证" onclick="weixzsbqz('银行从业资格证')">银行从业资格证</span>
        	<span id="专利证书" onclick="weixzsbqz('专利证书')">专利证书</span>
        </div>
        <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">属于自己的标签。</div>
        <div class="selecttag">
  		 <div id="yixuanzsbq"  class="spans">
  		 	<%-- <c:forEach items="${tagUsers}" var="tagUsers" varStatus="idxStatus">
  		 		<span id="${tagUsers.tagName}" onclick="yixbiaoqz('${tagUsers.tagName}',this)">${tagUsers.tagName}</span>
  		 	</c:forEach>  --%>
  		 </div>
          <label style="position:absolute; bottom:2px; right:2px; color:#666; font-size:12px;">只可以选择8个</label>
          <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除</label>
      
        </div>
        <p style="text-align: center; padding:5px 0; font-size: 12px;"><label id="zstishi" style="color: red"></label></p>
        <div class="wt">     	
        	<input id="zdyzsbiaoq" name="" type="t/ext" class="inputw" placeholder="再贴几个标签突出个人优势吧">
        	<input name="" type="button" onclick="tiezsbiaoq()" value="我贴" class="inputb">
        </div>
     <!--  <img class="yuan pt-page-scaleUp" src="/res/liudu/resume/img/dot2.png" /> -->
      <!-- <div style="position: absolute;bottom: 0px;left: 34%;">&copy;远界科技技术支持</div> -->
      <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" />
	</div>
</div>
<div class="page page-6-1 hide">
    <div class="wrap"> <img class="tp" src="/res/liudu/resume/img/top.png" />
       <div class="cbg2"> 
   			<div class="btitle">作品展示<p style="font-size: 14px;">让HR惊艳一把吧！仅限图片，xxM以内</p></div>
             <p style="width:100%;">
		   <input type="button" value="增加" onclick="addImage.click()" style="border:none;padding:5px 12px;font-size:14px; background-color:#265898;color:#FFF; border-radius:5px;line-height:20px;">  
		   <input type="file" style="display:none" name="logo" id="addImage" accept="image/*"  onchange="ajaxUploadImg()">
           </p>
         </div>
         <div class="cbg"> 
           <div style="overflow:hidden;">
           	<div onclick="ffdf('/res/liudu/resume/img/1012.png');" style="width:44%;height:100px;margin:3%; background-color:#FFF;border-radius:5px; overflow: hidden;float:left">
           	    <img src="/res/liudu/resume/img/1012.png"  height="100%" />
           	   
           	</div>
           	<div  onclick="ffdf('/res/liudu/resume/img/2.png');" style="width:44%;height:100px;margin:3%; background-color:#FFF;border-radius:5px; overflow: hidden;float:left">
           	  <img src="/res/liudu/resume/img/2.png" height="100%"/>
           		
           	</div>
           	<div  onclick="ffdf('/res/liudu/resume/img/1.png');" style="width:44%;height:100px;margin:3%; background-color:#FFF;border-radius:5px; overflow: hidden;float:left">
           	  <img src="/res/liudu/resume/img/1.png" height="100%"/>
           		
           	</div>
           	<div  onclick="ffdf('/res/liudu/resume/img/166.jpg');" style="width:44%;height:100px;margin:3%; background-color:#FFF;border-radius:5px; overflow: hidden;float:left">
           	  <img src="/res/liudu/resume/img/166.jpg" height="100%"/>
           		
           	</div>
           </div>
           
           
         </div>
         <p style="text-align: center;">若无作品  请跳过</p>
      <div class="zhez" id="xcd" style="display: none;" onclick="ffff();">
       <div class="zhezcon">
       <table style="width:100%;height:100%"><tr><td valign="middle" align="center"> <img id="imgId" src="/res/liudu/resume/img/2.png" width="100%"/></td></tr></table>
      </div>
      </div>

      <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" />
	</div>
</div>
<div class="page page-7-1 hide">
    <div class="wrap"> <img class="tp" src="/res/liudu/resume/img/top.png" />
       <div class="cbg"> 
   			<div class="btitle">期望工作类型</div>
            <select id="postJob" name="job.postJob" class="slcte" onchange="jobss()">
				<option>请选择</option>
				<option>全职</option>
				<option>兼职</option>
				<option>实习</option>
			</select>
         </div>
        <div class="city cbg2"> 
   			<div class="btitle">期待岗位</div>
          <input id="gw" type="text"  value="">
         </div>
	    <div class="city cbg"> 
		 <div class="btitle">期待城市</div>
		 <input id="gw" type="text"  value="">
		</div>
        <div class="cbg2"> 
   			<div class="btitle">期望薪资</div>
           <select id="postJob" name="job.postJob" class="slcte" onchange="jobss()" style="margin-bottom:10px;">
				<option>月薪</option>
				<option>2K以下</option>
				<option>2K-5K</option>
				<option>5K-10K</option>
				<option>10K-15K</option>
				<option>15K-25K</option>
				<option>25K-50K</option>
				<option>50K以上</option>
			</select>
         </div>
       
      <img class="icon pt-page-moveIconUp" src="/res/liudu/resume/img/icon_up.png" />
	</div>
</div>

<div id="zuih" class="page page-8-1 hide">
    <div class="wrap"> <img class="tp" src="/res/liudu/resume/img/top.png" />
    
    	<div id="xingf" style="display: block;">
	        <img class="di" src="/res/liudu/resume/img/di.png" />
	        <div class="bai qq pt-page-moveFromBottom2">
		        <div style="line-height:25px;padding:10px; color:#666; text-align:center">
		        	<textarea name="userBasicInfo.giveHRword" rows="4px;" cols="22px;" style="padding:5px;border:1px solid #E6E6E6" placeholder="用一句话描述自己，告诉HR为什么选你而不是别人">${userBasicInfo.giveHRword}</textarea>
		        </div>
	        </div>
	        <img class="shang" src="/res/liudu/resume/img/shang.png" />
        </div>
        
         <div id="fabuhou" style="display: none;">
        	<div class="weixin_l" style="padding: 20px 10px 76px 20px;margin-top:86px;background-color: #EEECE9;width: 100%;">
		    	<a class="bdcg">
		    	恭喜你，已经成功创建简历<br>
		    	点击【查看并分享】可查看简历漂流瓶
		    	<!-- 发送给好友或朋友圈，工作机会只留给主动的人 -->
		    	</a>
		   </div>
		   <p style="text-align: center;line-height: 30px;">若要修改，请返回菜单栏点击“简历漂流瓶”</p>
	      	<div style="text-align:center; position:absolute;top:52%; width:100%; left:0;"> 
	      		<a id="yulang" href=""><input type="button" value="查看并分享" class="inputfb"></a>
	      	</div><br>
	      	<div style="text-align:center; position:absolute;top:68%; width:100%; left:0;"> 
	      		<input name="" id="" type="button" value="如何让简历漂流瓶获得更多关注" onclick="coled()" class="inputfb" style="width: 80%;background-color: #F79646;">
	      	</div>
        </div>
        
      <!--<div class="fb">已经编辑好您的微简历了，感觉发布吧!</div>-->
      <div id="saveId" style="text-align:center; position:absolute;top:70%; width:100%; left:;"> 
      	<input type="submit" id="saveBettn" style="display: none;">
      	<input name="" id="fabu" type="button" value="保存" onclick="svaeResu(2)" class="inputfb">
      </div>
       <!--  <div style="text-align:center; position:absolute;top:70%; width:50%; left:50%;"> 
        <input name="" type="button"  onclick="svaeResu(1)" value="预览" class="inputfb"></div> -->
      	<div style="position: absolute;bottom: 0px;width:100%;left:50%;margin-left:-50%;color:#CC6600;font-size: 12px;text-align: center;">&copy;远界科技技术支持</div>
      	
    </div>
   </div>
</form>

<div id="share" onClick="closeDialog()">
    	<div class="shareImg"></div>
 </div>	
 <div id="sharesc" onClick="closeDialogsc()">
    	<div class="shouchang"></div>
 </div>
 </body>
<!--<script type="text/javascript">
		var imgUrl = 'http://www.linklearn.cn/lightapp/solutions/kegh/img/t10-logo.png';
		 var lineLink = 'http://www.linklearn.cn/lightapp/solutions/kegh/?v='+Math.round(Math.random()*999)+3000;
		 var descContent = "2014年，不平凡的一年，远界十年，硕果累累、开拓创新。远界将继续前行，与您共同成长。";
		 var shareTitle = '远界这一年......';
		 var appid = 'wx51b0af35c14e2cba'; 
		gSound = 'img/1.mp3'; 
		</script> -->
<script src="/res/liudu/resume/js/zepto.min.js"></script> 
<script src="/res/liudu/resume/js/touch.js"></script> 
<script src="/res/liudu/resume/js/index.js"></script> 
<script src="/res/liudu/resume/js/svgcheckbx.js"></script>
<script src="/res/liudu/resume/js/page.js"></script>
<script src="/res/liudu/resume/js/province.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="/res/jquery/jquery-1.10.2.js"></script>
<script src="/res/imgAreaSelect/jquery.imgareaselect.pack.js" charset="UTF-8"></script>
<script src="/res/js/ajaxfileupload.js" charset="UTF-8"></script>
<script src="/res/ajax/ajaxdialog.js" charset="UTF-8"></script>
<script src="/res/js/require.js"></script>
<script type="text/javascript">
var pg = 0;
var userId= '${userBasicInfo.userId }';
var certificate = '${userBasicInfo.certificate}';
if(certificate != "" && certificate != null){
	var fss = certificate.split(",");
	var str = "";
	for(var j=0;j<fss.length;j++){
		str = str+"<span id=\""+fss[j]+"\" onclick=\"yixuanzsbq('"+fss[j]+"','tieshang')\">"+fss[j]+"</span>";
	}
	document.getElementById("yixuanzsbq").innerHTML=str;
}
var skill = '${userBasicInfo.skill}';
if(skill != "" && skill != null){
	var fsd = skill.split(",");
	var std = "";
	for(var j=0;j<fsd.length;j++){
		std = std +"<span id=\""+fsd[j]+"\" onclick=\"yixuanjnbq('"+fsd[j]+"','tieshang')\">"+fsd[j]+"</span>";
	}
	document.getElementById("yixuanjnbq").innerHTML=std;
}
var experience = '${userBasicInfo.experience}';
if(experience != "" && experience != null){
	var fsv = experience.split(",");
	var stv = "";
	for(var j=0;j<fsv.length;j++){
		stv = stv+"<span id=\""+fsv[j]+"\" onclick=\"yixuanzsbq('"+fsv[j]+"','tieshang')\">"+fsv[j]+"</span>";
	}
	document.getElementById("yixuanjlbq").innerHTML=stv;
}
var hobby = '${userBasicInfo.hobby}';
if(hobby != "" && hobby != null){
	var fsg = hobby.split(",");
	var stg = "";
	for(var j=0;j<fsg.length;j++){
		stg = stg+"<span id=\""+fsg[j]+"\" onclick=\"yixuanzsbq('"+fsg[j]+"','tieshang')\">"+fsg[j]+"</span>";
	}
	document.getElementById("yixuanahbq").innerHTML=stg;
}

	
function svaeResu(num){
	var $form = $("#userFrom");
	$.ajax({
		type:'POST',
		url:'/user/saveResumeWx/${userBasicInfo.userId }',
		data:$form.serializeArray(),
		dataType:'html',
		success:function(jsons) {
			var json = JSON.parse(jsons);
			if(json.start==0){
				$("#xingf").attr("style","display:none;");
				$("#saveId").hide();
				$("#fabuhou").attr("style","display:block;");
				$("#zuih").attr("class","page page-1-1 page-current");
				$("#yulang").attr("href","/user/findUserWeixinById/"+json.userId);
			}
		}
	});	 
}
function coled(){
	wx.closeWindow();
}

function onBridgeReady(){
	 WeixinJSBridge.call('hideOptionMenu');
}

if (typeof WeixinJSBridge == "undefined"){
   if( document.addEventListener ){
       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
   }else if (document.attachEvent){
       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
   }
}else{
   onBridgeReady();
} 


require([], function(){
	$(document).bind("saveLogoSuccess", function(){
		var logoName = $("#uploadedPhotoName").val();
		var dialog = top.dialog.get("artBoxForResume");
		dialog.close(logoName);
		dialog.remove();
	});
});
function ajaxUploadImg(){			
	$.ajaxFileUpload({
		type:'POST',
		url:'/company/uploadLogo',
		fileElementId: 'uploadImage',
		dataType:'json',
		success:function(json) {
     	   imgWidth = json.data.imgW;
     	   imgHeight = json.data.imgH;
     	   var src = "/res/upload/logo/" + json.message;
     	  var uploadedFileName = json.message;
     	  $("#headImgg").val(uploadedFileName);
     	   $("#photo").attr("src", src);
     	  $.ajax({
     			type:'post',
     			url:'/user/uploadImg',
     			dataType:'json',
     			data:{'x':'1','y':'1','width':'340','height':'340','photoName':uploadedFileName},
     			success:function(json){
     				if(json.statusCode == 1){
     					$(document).trigger("saveLogoSuccess");
     					return ;
     				}
     				alert("上传失败");
     			}
     		});
		}
	});
}
function ffdf(n){
	$("#xcd").attr("style","");
	$("#imgId").attr("src",n);
}
function ffff(){
	$("#xcd").attr("style","display:none");
	$("#imgId").attr("src","");
}
</script>
<!-- <script src="/res/jianl/js/domeFriend.js"></script> -->
</html>
