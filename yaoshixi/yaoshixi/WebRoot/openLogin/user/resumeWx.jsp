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
<link rel="stylesheet" type="text/css" href="/res/weixin/resume/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/resume/css/index.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/resume/css/animations.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/resume/css/load.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/resume/css/component.css" />
<style type="text/css">
.bdcg{background-image: url("/res/weixin/invite/img/xiaoyuangouicon.png");background-position: left center;background-repeat: no-repeat;display: block; height: 32px;padding-left: 40px;width: 100%;line-height:32px; color:#0079e0;}
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
      <img class="tp" src="/res/weixin/resume/img/top.png" />
       <div class="toux">
       		
              	<img id="photo" height="140px;" 
	              	<c:if test="${fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn')}"> 
	              		src="${userBasicInfo.headImg}"
	              	</c:if>	
	              	<c:if test="${!fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn') && userBasicInfo.headImg !=''}">
	              		src="/user/getHeadPhoto?ImgPath=${userBasicInfo.headImg}"
	              	</c:if>
	              	<c:if test="${userBasicInfo.headImg =='' || userBasicInfo.headImg ==null }">
	              		src="/res/weixin/resume/img/t.jpg"
	              	</c:if>
              	> 
             <input type="hidden" name="userBasicInfo.headImg" id="headImgg"> 	
           <p style="width:100%;">
           
<!--            		<input type="file" value="" name="logo" id="uploadImage" accept="image/*"  onchange="ajaxUploadImg()" style="width:65px; border:none; background-color:#265898;padding:3px;-webkit-appearance: none;"/> -->
          <!--  <input type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc;display:none">   -->
		   <input type="button" value="修改头像" onclick="uploadImage.click()" style="border:none;padding:5px 8px;font-size:14px; background-color:#265898;color:#FFF;">  
		   <input type="file" style="display:none" name="logo" id="uploadImage" accept="image/*"  onchange="ajaxUploadImg()">
           </p>
      		<p style="color:#CC6600;font-size: 12px;padding-top:5px;">照片有可能会歪哦，横着拍试试</p>
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
        	<img style="position:absolute;left:50%;margin-left:-1px;" src="/res/weixin/resume/img/line.png" width="2" height="30">
	        
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
       <!--<div class="agreement"><span></span>要实习用户协议</div>-->
       
       <div class="ac-custom ac-checkbox ac-checkmark" autocomplete="off">
			<ul style="width:90%">
	       		<li id="xiyi" style="color: red;padding:4px 0;font-size: 12px;"></li>
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
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
     </div>
  </div>
  <div class="page page-2-1 hide">
    <div class="wrap">
     <img class="tp" src="/res/weixin/resume/img/top.png" />
       <div class="sxcity" >
       	<div class="btitle">可工作城市<br>【同城】和【异地】可多选</div>
			<input type="text" name="userBasicInfo.jobCity" id="jobCity" style="display:none" value="${userBasicInfo.jobCity }" style="width: 100%;"/>
			<ul class="clear g" id="hh">
                <li id="litc" <c:if test="${fn:contains(userBasicInfo.jobCity, '同城')}">class="on"</c:if>>
                	<a id="同城" onclick="ddd('同城','litc')" class="tccolor" >同城</a>
                </li>
				<li id="liyd" <c:if test="${fn:contains(userBasicInfo.jobCity, '异地')}">class="on"</c:if>>
					<a id="异地"  onclick="ddd('异地','liyd')" class="ydcolor">异地</a>
				</li>
			</ul>
        </div>
         <div class="cbg"> 
   			<div class="btitle">可实习场所</div>
            <ul class="clear g" id="ads" <c:if test="${!fn:contains(userBasicInfo.jobCity, '同城')}">style="display: none;"</c:if>>
				<li id="lizx" <c:if test="${fn:contains(userBasicInfo.jobCity, '需居家办公')}">class="on"</c:if>>
					<a onclick="ddd('需居家办公','lizx')" class="tccolor">需居家办公</a>
				</li>
                <li id="lidw" <c:if test="${fn:contains(userBasicInfo.jobCity, '在公司办公')}">class="on"</c:if>>
                	<a onclick="ddd('在公司办公','lidw')" class="tccolor">在公司办公</a>
                </li>
			</ul>
            <ul class="clear g" id="zhus" <c:if test="${!fn:contains(userBasicInfo.jobCity, '异地')}">style="display: none;"</c:if>>
				<li id="lizxjj" <c:if test="${fn:contains(userBasicInfo.jobCity, '自行解决住宿')}">class="on"</c:if>>
					<a onclick="ddd('可自行解决住宿','lizxjj')" class="ydcolor">可自行解决住宿</a>
				</li>
                <li id="ligstg" <c:if test="${fn:contains(userBasicInfo.jobCity, '公司解决住宿')}">class="on"</c:if>>
                	<a onclick="ddd('希望公司解决住宿','ligstg')" class="ydcolor">希望公司解决住宿</a>
                </li>
			</ul>
         </div>
       <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
     </div>
  </div>
  <div class="page page-3-1 hide">
  	<div class="wrap"><img class="tp" src="/res/weixin/resume/img/top.png" />
  		<div class="timejd" > 
   			<div class="btitle">每周可实习的时间段</div>
   			<input type="text" name="userBasicInfo.workReady" style="display:none" id="workday" value="${userBasicInfo.workReady }" style="width: 100%"/>
            <ul class="clear time" id="duox">
				<li id="zhouy" <c:if test="${fn:contains(userBasicInfo.workReady, '周一')}">class="on"</c:if>>
					<a onclick="sxz('周一','zhouy')">一</a>
				</li>
                <li id="zhoue" <c:if test="${fn:contains(userBasicInfo.workReady, '周二')}">class="on"</c:if>>
                	<a onclick="sxz('周二','zhoue')">二</a>
                </li>
                <li id="zhousan" <c:if test="${fn:contains(userBasicInfo.workReady, '周三')}">class="on"</c:if>>
                	<a onclick="sxz('周三','zhousan')">三</a>
                </li>
                <li id="zhousi" <c:if test="${fn:contains(userBasicInfo.workReady, '周四')}">class="on"</c:if>>
                	<a onclick="sxz('周四','zhousi')">四</a>
                </li>
                <li id="zhouwu" <c:if test="${fn:contains(userBasicInfo.workReady, '周五')}">class="on"</c:if>>
                	<a onclick="sxz('周五','zhouwu')">五</a>
                </li>
                <li id="zhouliu" <c:if test="${fn:contains(userBasicInfo.workReady, '周六')}">class="on"</c:if>>
                	<a onclick="sxz('周六','zhouliu')">六</a>
                </li>
                <li id="zhouri" <c:if test="${fn:contains(userBasicInfo.workReady, '周日')}">class="on"</c:if>>
                	<a onclick="sxz('周日','zhouri')">七</a>
                </li>
			</ul>
         </div>
        <div class="cbg"> 
   			<div class="btitle">每年可实习的时间段</div>
   			<input type="text" name="userBasicInfo.monthReady" style="display:none" id="monthReady" value="${userBasicInfo.monthReady }" style="width: 100%;">
            <ul class="clear m" id="duox">
				<li id="yi" <c:if test="${fn:contains(userBasicInfo.monthReady, '一月')}">class="on"</c:if>>
					<a onclick="sxy('一月','yi');">1月</a>
				</li>
                <li id="er" <c:if test="${fn:contains(userBasicInfo.monthReady, '二月')}">class="on"</c:if>>
                	<a onclick="sxy('二月','er');">2月</a>
                </li>
                <li id="san" <c:if test="${fn:contains(userBasicInfo.monthReady, '三月')}">class="on"</c:if>>
                	<a onclick="sxy('三月','san');">3月</a>
               	</li>
               	<li id="si" <c:if test="${fn:contains(userBasicInfo.monthReady, '四月')}">class="on"</c:if>>
               		<a onclick="sxy('四月','si');">4月</a>
               	</li>
               	<li id="wu" <c:if test="${fn:contains(userBasicInfo.monthReady, '五月')}">class="on"</c:if>>
               		<a onclick="sxy('五月','wu');">5月</a>
               	</li>
               	<li id="liu" <c:if test="${fn:contains(userBasicInfo.monthReady, '六月')}">class="on"</c:if>>
               		<a onclick="sxy('六月','liu');">6月</a>
               	</li>
               	<li id="qi" <c:if test="${fn:contains(userBasicInfo.monthReady, '七月')}">class="on"</c:if>>
               		<a onclick="sxy('七月','qi');">7月</a>
               	</li>
               	<li id="ba" <c:if test="${fn:contains(userBasicInfo.monthReady, '八月')}">class="on"</c:if>>
               		<a onclick="sxy('八月','ba');">8月</a>
               	</li>
               	<li id="jiu" <c:if test="${fn:contains(userBasicInfo.monthReady, '九月')}">class="on"</c:if>>
               		<a onclick="sxy('九月','jiu');">9月</a>
               	</li>
               	<li id="shi" <c:if test="${fn:contains(userBasicInfo.monthReady, '十月')}">class="on"</c:if>>
               		<a onclick="sxy('十月','shi');">10月</a>
               	</li>
               	<li id="shiyi" <c:if test="${fn:contains(userBasicInfo.monthReady, '十壹月')}">class="on"</c:if>>
               		<a onclick="sxy('十壹月','shiyi');">11月</a>
               	</li>
               	<li id="shier" <c:if test="${fn:contains(userBasicInfo.monthReady, '十贰月')}">class="on"</c:if>>
               		<a onclick="sxy('十贰月','shier');">12月</a>
               	</li>
			</ul>
         </div>
  	 	<img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
  	</div>
  </div>
<div class="page page-4-1 hide">
    <div class="wrap">
      <div style="height:20%"></div>
    <div class="jbxinxi" style="margin-top:0;">
     <img class="tp" src="/res/weixin/resume/img/top.png" />
    <div class="ones"><img src="/res/weixin/resume/img/iconfont-dianhua.png" width="35" > 
   	  	<input name="userBasicInfo.telPhone" id="telPhone" value="${userBasicInfo.telPhone }" type="tel" placeholder="电话号码">
   	</div>
    <div class="ones cbg"><img src="/res/weixin/resume/img/iconfont-youxiang.png" width="35" > 
   	  	<input name="userBasicInfo.email" id="email" value="${userBasicInfo.email }" type="text" placeholder="邮箱">
   	</div>
    <div class="ones"><img src="/res/weixin/resume/img/iconfont-xuexiaoguanli.png" width="35" > 
 	  <input  name="educationExperience.university" id="university" value="${education.university }" type="text" placeholder="学校"></div>
    <div class="ones cbg"><img src="/res/weixin/resume/img/iconfont-biaoqian.png" width="35" > 
   	  <input name="educationExperience.major" id="major" value="${education.major}" type="text" placeholder="专业">
   	</div>
      <div class="ac-custom ac-checkbox ac-checkmark" autocomplete="off">
				<input id="expose" name="userBasicInfo.expose" type="hidden" value="${userBasicInfo.expose}" ><br>
				<ul style="padding-left:5%">
					<li>
						<input type="checkbox" id="exposec" <c:if test="${fn:contains(userBasicInfo.expose, 2)}">checked="checked"</c:if> onclick="sfgk()" >
						<label for="exposec" style="font-size:12px;">允许对您感兴趣的注册企业查看联系方式</label>
						<c:if test="${fn:contains(userBasicInfo.expose,2)}"> 
						<svg id="mrdh" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
							<path d="M16.667,62.167c3.109,5.55,7.217,10.591,10.926,15.75 c2.614,3.636,5.149,7.519,8.161,10.853c-0.046-0.051,1.959,2.414,2.692,2.343c0.895-0.088,6.958-8.511,6.014-7.3 c5.997-7.695,11.68-15.463,16.931-23.696c6.393-10.025,12.235-20.373,18.104-30.707C82.004,24.988,84.802,20.601,87,16" style="stroke-dasharray: 126.36976623535156px, 126.36976623535156px; stroke-dashoffset: 0px; -webkit-transition: stroke-dashoffset 0.2s ease-in-out 0s; transition: stroke-dashoffset 0.2s ease-in-out 0s;"></path>
						</svg>
						</c:if>
					</li>
				</ul>
       		</div>
     </div> 
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
  </div>
  </div>
  
  <div class="page page-5-1 hide">
  <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
  <div style="height:20%"></div>
  <div class="cbg">
		  <div class="btitle">确认年级</div>
		  	<input type="text" name="educationExperience.education" style="display:none" id="education" value="${education.education }" style="width: 100%;"/>
          <ul class="clear nianji" id="nj">
                <li <c:if test="${fn:contains(education.education, '3')}">class="on"</c:if>>
                	<a onclick="xueli('3');">专科在读</a>
                </li>
                <li <c:if test="${fn:contains(education.education, '4')}">class="on"</c:if>>
                	<a onclick="xueli('4');">本科在读</a>
                </li>
                <li <c:if test="${fn:contains(education.education, '5')}">class="on"</c:if>>
                	<a onclick="xueli('5');">研究生在读</a>
                </li>
                <li <c:if test="${fn:contains(education.education, '6')}">class="on"</c:if>>
                	<a onclick="xueli('6');">博士在读</a>
                </li>
			</ul>
			
			<input name="educationExperience.grade" style="display:none" id="grade" type="text" value="${education.grade }" style="width: 100%;"/>
            <ul class="clear nianji" id="nj" style="margin-top:20px;">
            	<li <c:if test="${fn:contains(education.grade, '大一')}">class="on"</c:if>>
            		<a onclick="nianji('大一');" class="yellow">一年级</a>
            	</li>
            	<li <c:if test="${fn:contains(education.grade, '大二')}">class="on"</c:if>>
            		<a onclick="nianji('大二');" class="yellow">二年级</a>
            	</li>
            	<li <c:if test="${fn:contains(education.grade, '大三')}">class="on"</c:if>>
            		<a onclick="nianji('大三');" class="yellow">三年级</a>
            	</li>
            	<li <c:if test="${fn:contains(education.grade, '大四')}">class="on"</c:if>>
            		<a onclick="nianji('大四');" class="yellow">四年级</a>
            	</li>
            </ul>
           </div>
       <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
   </div>
  </div>
  
<div class="page page-6-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
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
  		 		<span id="yx${tagUsers.tagName}" onclick="yixbiaoqz('${tagUsers.tagName}',this)">${tagUsers.tagName}</span>
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
      <img class="yuan pt-page-scaleUp" src="/res/weixin/resume/img/dot1.png" />
      <!-- <div style="position: absolute;bottom: 0px;left: 34%;">&copy;远界科技技术支持</div> -->
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
	</div>
</div>
<div class="page page-6-2 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
       <div style="padding:5px 0;text-align:center;background-color:#f37157;color: #FFF;
width: 60%;margin:10px auto 0;">描述证书</div>
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
        	<input id="zdyzsbiaoq" name="" type="text" class="inputw" placeholder="再贴几个标签突出个人优势吧">
        	<input name="" type="button" onclick="tiezsbiaoq()" value="我贴" class="inputb">
        </div>
      <img class="yuan pt-page-scaleUp" src="/res/weixin/resume/img/dot2.png" />
      <!-- <div style="position: absolute;bottom: 0px;left: 34%;">&copy;远界科技技术支持</div> -->
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
	</div>
</div>
<div class="page page-6-3 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
     <div style="padding:5px 0;text-align:center;background-color:#f37157;color: #FFF;
width: 60%;margin:10px auto 0;">描述技能</div>
   <input type="hidden" name="userBasicInfo.skill" id="skill" value="${userBasicInfo.skill}"> 
     <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请选择中意的标签来表现自己。</div>
     	<div id="weixuanjnbq" class="tag">
       		<span id="熟练办公软件" onclick="weixjnbiaoqz('熟练办公软件')">熟练办公软件</span>
       		<span id="文字功底强" onclick="weixjnbiaoqz('文字功底强')">文字功底强</span>
       		<span id="擅长photoshop" onclick="weixjnbiaoqz('擅长photoshop')">擅长photoshop</span>
	  		<span id="擅长演讲" onclick="weixjnbiaoqz('擅长演讲')">擅长演讲 </span>
        	<span id="记忆力强" onclick="weixjnbiaoqz('记忆力强')">记忆力强</span>
        	<span id="小语种" onclick="weixjnbiaoqz('小语种')">小语种</span>
        	<span id="普通话标准" onclick="weixjnbiaoqz('普通话标准')">普通话标准 </span>
        </div>
        <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">属于自己的标签。</div>
        <div class="selecttag">
  		 <div id="yixuanjnbq"  class="spans">
  		 	<%-- <c:forEach items="${tagUsers}" var="tagUsers" varStatus="idxStatus">
  		 		<span id="${tagUsers.tagName}" onclick="yixbiaoqz('${tagUsers.tagName}',this)">${tagUsers.tagName}</span>
  		 	</c:forEach>  --%>
  		 </div>
          <label style="position:absolute; bottom:2px; right:2px; color:#666; font-size:12px;">只可以选择8个</label>
          <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除</label>
      
        </div>
        <p style="text-align: center; padding:5px 0; font-size: 12px;"><label id="jntishi" style="color: red"></label></p>
        <div class="wt">     	
        	<input id="zdyjnbiaoq" name="" type="text" class="inputw" placeholder="再贴几个标签突出个人优势吧">
        	<input name="" type="button" onclick="tiejnbiaoq()" value="我贴" class="inputb">
        </div>
      <img class="yuan pt-page-scaleUp" src="/res/weixin/resume/img/dot3.png" />
      <!-- <div style="position: absolute;bottom: 0px;left: 34%;">&copy;远界科技技术支持</div> -->
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
	</div>
</div>
<div class="page page-6-4 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
      <div style="padding:5px 0;text-align:center;background-color:#f37157;color: #FFF;
width: 60%;margin:10px auto 0;">描述经历/爱好</div>
    <input type="hidden" name="userBasicInfo.experience" id="experience" value="${userBasicInfo.experience}">
     <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请选择中意的标签来表现自己。</div>
     	<div id="weixuanjlbq" class="tag">
       		<span id="比赛" onclick="weixjlbiaoqz('比赛')">比赛</span>
       		<span id="实习" onclick="weixjlbiaoqz('实习')">实习</span>
       		<span id="兼职" onclick="weixjlbiaoqz('兼职')">兼职</span>
	  		<span id="志愿者" onclick="weixjlbiaoqz('志愿者')">志愿者</span>
        	<span id="项目" onclick="weixjlbiaoqz('项目')">项目</span>
        	
        	<span id="烹饪" onclick="weixjlbiaoqz('烹饪')">烹饪</span>
       		<span id="阅读" onclick="weixjlbiaoqz('阅读')">阅读</span>
       		<span id="组织聚会" onclick="weixjlbiaoqz('组织聚会')">组织聚会</span>
	  		<span id="运动" onclick="weixjlbiaoqz('运动')">运动</span>
        	<span id="养植物" onclick="weixjlbiaoqz('养植物')">养植物</span>
        	<span id="室内设计" onclick="weixjlbiaoqz('室内设计')">室内设计</span>
        	<span id="看艺术展" onclick="weixjlbiaoqz('看艺术展')">看艺术展</span>
        	<span id="与人交流" onclick="weixjlbiaoqz('与人交流')">与人交流</span>
        </div>
        <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">属于自己的标签。</div>
        <div class="selecttag">
  		 <div id="yixuanjlbq"  class="spans">
  		 	<%-- <c:forEach items="${tagUsers}" var="tagUsers" varStatus="idxStatus">
  		 		<span id="${tagUsers.tagName}" onclick="yixjlbiaoqz('${tagUsers.tagName}',this)">${tagUsers.tagName}</span>
  		 	</c:forEach>  --%>
  		 </div>
          <label style="position:absolute; bottom:2px; right:2px; color:#666; font-size:12px;">只可以选择8个</label>
          <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除</label>
      
        </div>
        <p style="text-align: center; padding:5px 0; font-size: 12px;"><label id="jltishi" style="color: red"></label></p>
        <div class="wt">     	
        	<input id="zdyjlbiaoq" name="" type="text" class="inputw" placeholder="再贴几个标签突出个人优势吧">
        	<input name="" type="button" onclick="tiejlbiaoq()" value="我贴" class="inputb">
        </div>
      <img class="yuan pt-page-scaleUp" src="/res/weixin/resume/img/dot4.png" />
      <!-- <div style="position: absolute;bottom: 0px;left: 34%;">&copy;远界科技技术支持</div> -->
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
	</div>
</div>
<%-- <div class="page page-6-5 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
    <div style="padding:5px 0;text-align:center;background-color:#f37157;color: #FFF;
width: 60%;margin:10px auto 0;">描述爱好</div>
    <input type="hidden" name="userBasicInfo.hobby" id="hobby" value="${userBasicInfo.hobby}">
     <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请选择中意的标签来表现自己。</div>
     	<div id="weixuanahbq" class="tag">
       		<span id="烹饪" onclick="weixahbiaoqz('烹饪')">烹饪</span>
       		<span id="阅读" onclick="weixahbiaoqz('阅读')">阅读</span>
       		<span id="组织聚会" onclick="weixahbiaoqz('组织聚会')">组织聚会</span>
	  		<span id="运动" onclick="weixahbiaoqz('运动')">运动</span>
        	<span id="养植物" onclick="weixahbiaoqz('养植物')">养植物</span>
        	<span id="室内设计" onclick="weixahbiaoqz('室内设计')">室内设计</span>
        	<span id="看艺术展" onclick="weixahbiaoqz('看艺术展')">看艺术展</span>
        	<span id="与人交流" onclick="weixahbiaoqz('与人交流')">与人交流</span>
        </div>
        <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">属于自己的标签。</div>
        <div class="selecttag">
  		 <div id="yixuanahbq"  class="spans">
  		 	<c:forEach items="${tagUsers}" var="tagUsers" varStatus="idxStatus">
  		 		<span id="${tagUsers.tagName}" onclick="yixahbiaoqz('${tagUsers.tagName}',this)">${tagUsers.tagName}</span>
  		 	</c:forEach> 
  		 </div>
          <label style="position:absolute; bottom:2px; right:2px; color:#666; font-size:12px;">只可以选择8个</label>
          <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除</label>
      
        </div>
        <p style="text-align: center; padding:5px 0; font-size: 12px;"><label id="ahtishi" style="color: red"></label></p>
        <div class="wt">     	
        	<input id="zdyahbiaoq" name="" type="text" class="inputw" placeholder="再贴几个标签突出个人优势吧">
        	<input name="" type="button" onclick="tieahbiaoq()" value="我贴" class="inputb">
        </div>
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
	</div>
</div> --%>
<div id="zuih" class="page page-7-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/resume/img/top.png" />
    
    	<div id="xingf" style="display: block;">
	        <img class="di" src="/res/weixin/resume/img/di.png" />
	        <div class="bai qq pt-page-moveFromBottom2">
		        <div style="line-height:25px;padding:10px; color:#666; text-align:center">
		        	<textarea name="userBasicInfo.giveHRword" rows="4px;" cols="22px;" style="padding:5px;border:1px solid #E6E6E6" placeholder="给帮你分享的好人的一句话！">${userBasicInfo.giveHRword}</textarea>
		        </div>
	        </div>
	        <img class="shang" src="/res/weixin/resume/img/shang.png" />
        </div>
        
         <div id="fabuhou" style="display: none;">
        	<div class="weixin_l" style="padding: 20px 10px 76px 20px;margin-top:86px;background-color: #EEECE9;width: 100%;">
		    	<a class="bdcg">
		    	恭喜你，已经成功创建简历<br>
		    	点击【预览并分享】可查看简历漂流瓶
		    	<!-- 发送给好友或朋友圈，工作机会只留给主动的人 -->
		    	</a>
		   </div>
	      	<div style="text-align:center; position:absolute;top:52%; width:100%; left:0;"> 
	      		<a id="yulang" href=""><input type="button" value="预览并分享" class="inputfb"></a>
	      	</div><br>
	      	<div style="text-align:center; position:absolute;top:68%; width:100%; left:0;"> 
	      		<input name="" id="" type="button" value="如何让简历漂流瓶获得更多关注" onclick="coled()" class="inputfb" style="width: 80%;background-color: #F79646;">
	      	</div>
        </div>
        
      <!--<div class="fb">已经编辑好您的微简历了，感觉发布吧!</div>-->
      <div id="saveId" style="text-align:center; position:absolute;top:70%; width:100%; left:;"> 
      	<input type="submit" id="saveBettn" style="display: none;">
      	<c:if test="${requestURLs==null || requestURLs==''}">
      		<input name="" id="fabu" type="button" value="保存" onclick="svaeResu(2)" class="inputfb">
      	</c:if>
      	<c:if test="${requestURLs!=null && requestURLs!=''}">
      		<input name="" id="fabu" type="button" value="保存" onclick="saveLs()" class="inputfb">
      	</c:if>
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
<script src="/res/weixin/resume/js/zepto.min.js"></script> 
<script src="/res/weixin/resume/js/touch.js"></script> 
<script src="/res/weixin/resume/js/index.js"></script> 
<script src="/res/weixin/resume/js/svgcheckbx.js"></script>
<script src="/res/weixin/resume/js/page.js"></script>
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
		str = str+"<span id=\"yx"+fss[j]+"\" onclick=\"yixuanzsbq('"+fss[j]+"','tieshang')\">"+fss[j]+"</span>";
	}
	document.getElementById("yixuanzsbq").innerHTML=str;
}
var skill = '${userBasicInfo.skill}';
if(skill != "" && skill != null){
	var fsd = skill.split(",");
	var std = "";
	for(var j=0;j<fsd.length;j++){
		std = std +"<span id=\"yx"+fsd[j]+"\" onclick=\"yixuanjnbq('"+fsd[j]+"','tieshang')\">"+fsd[j]+"</span>";
	}
	document.getElementById("yixuanjnbq").innerHTML=std;
}
var experience = '${userBasicInfo.experience}';
if(experience != "" && experience != null){
	var fsv = experience.split(",");
	var stv = "";
	for(var j=0;j<fsv.length;j++){
		stv = stv+"<span id=\"yx"+fsv[j]+"\" onclick=\"yixjlbiaoqz('"+fsv[j]+"','tieshang')\">"+fsv[j]+"</span>";
	}
	document.getElementById("yixuanjlbq").innerHTML=stv;
}
var hobby = '${userBasicInfo.hobby}';
if(hobby != "" && hobby != null){
	var fsg = hobby.split(",");
	var stg = "";
	for(var j=0;j<fsg.length;j++){
		stg = stg+"<span id=\"yx"+fsg[j]+"\" onclick=\"yixuanzsbq('"+fsg[j]+"','tieshang')\">"+fsg[j]+"</span>";
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

function saveLs(){
	var $form = $("#userFrom");
	$.ajax({
		type:'POST',
		url:'/user/saveResumeWx/${userBasicInfo.userId }',
		data:$form.serializeArray(),
		dataType:'html',
		success:function(jsons) {
			var json = JSON.parse(jsons);
			if(json.start==0){
				window.location.href='${requestURLs}';
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

</script>
<!-- <script src="/res/jianl/js/domeFriend.js"></script> -->
</html>
