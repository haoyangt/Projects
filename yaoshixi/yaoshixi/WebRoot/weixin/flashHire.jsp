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
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<title>编辑闪聘</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="msapplication-tap-highlight" content="no" />
<link rel="stylesheet" type="text/css" href="/res/weixin/invite/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/invite/css/index.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/invite/css/animations.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/invite/css/load.css" />
<link rel="stylesheet" type="text/css" href="/res/weixin/invite/css/component.css" />
<link rel="stylesheet" href="/res/css/jquery-ui.css">
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
<form id="jobForm" action="" method="post" >
  <div class="page page-1-1 page-current">
    <div class="wrap">
      <img class="tp" src="/res/weixin/invite/img/top.png" />
       <div style=" margin-top:50px; width:100%; color:#00B250; text-align:center; font-size:28px;">
       		闪聘<!-- &nbsp;<img width="20px;" src="/res/weixin/invite/img/freebadge-icon2.png"> -->
       		<img width="30px;" src="/res/weixin/invite/img/mf.png" style="position: absolute;top:-10px; right:5px; z-index:-1 ">
       	</div>
       <div class="nick cbg" style="margin-top:20%;color:#000;font-size:18px;"> 
       		<strong>基于社交</strong>新风潮<br><br>
			招聘<strong>简单有效率</strong><br><br>
			<strong>百万人才</strong>&nbsp;&nbsp;快到碗里来
       	</div>
       <div class="ac-custom ac-checkbox ac-checkmark" autocomplete="off">
			<ul style="width:90%">
					<c:if test="${compStart=='tures'}">
						<li id="xiyi" style="color: red;padding:4px 0;font-size: 12px;text-align: center;"></li>
						<li>
							<input id="cb6" name="cb6" type="checkbox" onabort="ysxXy()"> 
							<label for="cb6">我已阅读并同意
								<a href="/weixin/xieyi.jsp" style="color:#000">《用户协议》</a>
							</label>
						</li>
					</c:if>
					<c:if test="${compStart=='falses'}">
						<li id="xiyi" style="color: red;padding:4px 0;font-size: 12px;text-align: center;"></li>
						<li>
						<input id="cb6" name="cb6" type="checkbox" checked="checked" onabort="ysxXy()"> 
						<label for="cb6">我已阅读并同意
							<a href="/weixin/xieyi.jsp" style="color:#000">《用户协议》</a>
						</label>
						<svg id="sxxy" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
							<path d="M16.667,62.167c3.109,5.55,7.217,10.591,10.926,15.75 c2.614,3.636,5.149,7.519,8.161,10.853c-0.046-0.051,1.959,2.414,2.692,2.343c0.895-0.088,6.958-8.511,6.014-7.3 c5.997-7.695,11.68-15.463,16.931-23.696c6.393-10.025,12.235-20.373,18.104-30.707C82.004,24.988,84.802,20.601,87,16" style="stroke-dasharray: 126.36976623535156px, 126.36976623535156px; stroke-dashoffset: 0px; -webkit-transition: stroke-dashoffset 0.2s ease-in-out 0s; transition: stroke-dashoffset 0.2s ease-in-out 0s;"></path>
						</svg>
						</li>
					</c:if>
			</ul>
		</div>
       </div>
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
     </div>
  <%-- <div class="page page-2-1 hide">
     <div class="wrap">
     <img class="tp" src="/res/weixin/invite/img/top.png" />
	      <div class="cbg" style="margin-top: 50%"> 
	         <input type="hidden" name="job.jobType" id="jobType" value="${jobType }">
	   			<div class="btitle">请选择要招聘的人员：</div>
	            <ul class="clear xl" id="jobLx">
					<li id="招聘实习生" <c:if test="${fn:contains(jobType,'招聘实习生')}">class="on"</c:if>><a>招聘实习生</a></li>
	                <li id="招聘正式员工" <c:if test="${fn:contains(jobType,'招聘正式员工')}">class="on"</c:if>><a>招聘正式员工</a></li>
				</ul>
	       </div>
	       <div id="zhaopry" style="color: red;padding:4px 0;font-size: 12px; text-align: center;"></div>
    	 <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" />
  	 </div> 
  </div> --%>	   
  <div class="page page-2-1 hide">
    <div class="wrap">
     <img class="tp" src="/res/weixin/invite/img/top.png" />
         <div class="an" style="margin-top:15%" > 
   			<div class="btitle">请点击选择职位类别</div>
   			<input name="job.dacategory" id="dacategory" type="hidden" readonly="readonly" value="${dacategory}" >
            <ul class="clear post" id="zhiwlb">
				<li id="IT/互联网" <c:if test="${fn:contains(dacategory, 'IT/互联网')}">class="on"</c:if>><a onclick="getRegion('0')">IT/互联网</a></li>
                <li id="设计" <c:if test="${fn:contains(dacategory, '设计')}">class="on"</c:if>><a onclick="getRegion('1')">设计</a></li>
                <li id="生产/制造" <c:if test="${fn:contains(dacategory, '生产/制造')}">class="on"</c:if>><a onclick="getRegion('2')">生产/制造</a></li>
                <li id="行政/人事" <c:if test="${fn:contains(dacategory, '行政/人事')}">class="on"</c:if>><a onclick="getRegion('3')">行政/人事</a></li>
                <li id="教育/法律/咨询" <c:if test="${fn:contains(dacategory, '教育/法律/咨询')}">class="on"</c:if>><a onclick="getRegion('4')">教育/法律/咨询</a></li>
                <li id="市场" <c:if test="${fn:contains(dacategory, '市场')}">class="on"</c:if>><a onclick="getRegion('5')">市场</a></li>
                <li id="贸易/物流" <c:if test="${fn:contains(dacategory, '贸易/物流')}">class="on"</c:if>><a onclick="getRegion('6')">贸易/物流</a></li>
                <li id="财务" <c:if test="${fn:contains(dacategory, '财务')}">class="on"</c:if>><a onclick="getRegion('7')">财务</a></li>
                <li id="销售" <c:if test="${fn:contains(dacategory, '销售')}">class="on"</c:if>><a onclick="getRegion('8')">销售</a></li>
                <li id="其他" <c:if test="${dacategory=='' || dacategory==null}">class="on"</c:if>><a onclick="getRegion('8')">其他</a></li>
			</ul>
         </div>
         <div id="zwfanx" class="cbg" <c:if test="${jobName == null || jobName== ''}"> style="display: none;padding:10px 0;"</c:if>> 
   			<div class="btitle">点击选择职位方向</div>
   			<c:if test="${id != null && id != '' }">
   				<input name="job.id" type="hidden" value="${id }">
   			</c:if>
   			<input type="hidden" name="job.jobType" value="招聘实习生">
   			<input name="job.status" type="hidden" value="1">
   			<input name="job.category" id="category" type="hidden" readonly="readonly" value="${category}">
			<!-- <select id="postJob" name="job.postJob" class="slcte" onchange="jobss()">
				<option>请选择</option>
				<option>总监</option>
				<option>经理</option>
				<option>员工</option>
			</select> -->
			
			<select id="sscc" name="job.jobName" class="slcte" onchange="jobss()">
				<c:if test="${jobName == null || jobName == ''}">
					<option>请选择</option>
				</c:if>
				<c:if test="${jobName != null && jobName != ''}">
					<option>${jobName}</option>
				</c:if>
			</select>
         </div>
         <div id="zhiw" style="color: red;padding:4px 0;font-size: 12px;text-align: center;"></div>
         <div class="wt"> 
         	<input name="" id="jobName" type="text" class="inputw" onclick="" placeholder="没有你要的职位？自定义告诉我们吧！" value="${jobName}">
         	<input name="" type="button" onclick="tiezhiw()" value="我贴" class="inputb">
         	<p style="color:#CC6600;font-size: 12px;padding-top:5px;">没有你要的职位？自定义告诉我们吧！</p>
         </div>
       <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
     </div>
  </div>
  <div class="page page-3-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
    	<input type="hidden" name="job.jobRequest" id="jobRequest" value="${jobRequest}">
        <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请为<span style="color:#B52D04; font-weight: bold;">任职要求</span>选择标签。(摇摇试试！)</div>
     	<div id="weixuanbq" class="tag">

        </div>

         <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">已选任职要求标签。</div>
        <div class="selecttag">
       		 <div id="yixuanbq"  class="spans">
       		 </div>
             <label style="position:absolute; bottom:2px; right:2px; color:#C00; font-size:12px;">只可以选择8个</label>
              <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除！排名靠前的标签更重要！</label>
      
        </div>
        <p style="text-align: center; margin-top:25px; padding:5px 0; font-size: 12px;"><label id="tishi" style="color: red"></label></p>
        <div class="wt"> 
        	<input id="zdybiaoq" name="" type="text" class="inputw" placeholder="贴上自定义的标签（不超过6个字）">
        	<input name="" type="button" onclick="tiebiaoq()" value="我贴" class="inputb">
        </div>
   <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
	</div>
</div>
 <div class="page page-4-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
    	<input name="job.temptation" id="temptation" type="hidden" value="${temptation}">
        <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请为<span style="color:#B52D04; font-weight: bold;">职位诱惑</span>标签。(摇摇试试！)</div>
     	<div id="youhweixbq" class="tag">
     		<span class="zwyhh4" id="公司漂亮妹子多" onclick="youhweixbqz('公司漂亮妹子多')">公司漂亮妹子多</span>
     		<span class="zwyhh4" id="一年加薪四次" onclick="youhweixbqz('一年加薪四次')">一年加薪四次</span>
     		<span class="zwyhh4" id="职业规划明确" onclick="youhweixbqz('职业规划明确')">职业规划明确</span>
     		<span class="zwyhh4" id="团队氛围好" onclick="youhweixbqz('团队氛围好')">团队氛围好</span>
     		<span class="zwyhh4" id="交通方便" onclick="youhweixbqz('交通方便')">交通方便</span>
     		<span class="zwyhh4" id="晋升空间大" onclick="youhweixbqz('带薪年假')">晋升空间大</span>
     		<span class="zwyhh4" id="无责任高额底薪" onclick="youhweixbqz('无责任高额底薪')">无责任高额底薪</span>
     		<span class="zwyhh4" id="绩效排名奖金" onclick="youhweixbqz('绩效排名奖金')">绩效排名奖金</span>
     		<span class="zwyhh4" id="岗位津贴" onclick="youhweixbqz('岗位津贴')">岗位津贴</span>
     		<span class="zwyhh4" id="商业保险" onclick="youhweixbqz('商业保险')">商业保险</span>
     		<span class="zwyhh4" id="十天带薪年假" onclick="youhweixbqz('十天带薪年假')">十天带薪年假</span>
     		<span class="zwyhh4" id="十天带薪病假" onclick="youhweixbqz('十天带薪病假')">十天带薪病假</span>
     		<span class="zwyhh4" id="住房无息贷款" onclick="youhweixbqz('住房无息贷款')">住房无息贷款</span>
     		<span class="zwyhh4" id="员工图书馆" onclick="youhweixbqz('员工图书馆')">员工图书馆</span>
     		<span class="zwyhh42" id="丰富的文娱活动" style="display: none;" onclick="youhweixbqz('丰富的文娱活动')">丰富的文娱活动</span>
          	<span class="zwyhh42" id="带薪年假" style="display: none;" onclick="youhweixbqz('带薪年假')">带薪年假</span>
       		<span class="zwyhh42" id="五险一金" style="display: none;" onclick="youhweixbqz('五险一金')">五险一金</span>
       		<span class="zwyhh42" id="年终双薪" style="display: none;" onclick="youhweixbqz('年终双薪')">年终双薪</span>
	  		<span class="zwyhh42" id="奖金丰厚" style="display: none;" onclick="youhweixbqz('奖金丰厚')">奖金丰厚</span>
        	<span class="zwyhh42" id="绩效奖金" style="display: none;" onclick="youhweixbqz('绩效奖金')">绩效奖金</span>
        	<span class="zwyhh42" id="全勤奖" style="display: none;" onclick="youhweixbqz('全勤奖')">全勤奖</span>
        	<span class="zwyhh42" id="专业培训" style="display: none;" onclick="youhweixbqz('专业培训')">专业培训</span>
        	<span class="zwyhh42" id="医疗保险" style="display: none;" onclick="youhweixbqz('医疗保险')">医疗保险</span>
        	<span class="zwyhh42" id="员工旅游" style="display: none;" onclick="youhweixbqz('员工旅游')">员工旅游</span>
        	<span class="zwyhh42" id="出国机会" style="display: none;" onclick="youhweixbqz('出国机会')">出国机会</span>
		  	<span class="zwyhh42" id="转正机会" style="display: none;" onclick="youhweixbqz('转正机会')">转正机会</span>
		  	<span class="zwyhh43" id="职业规划" style="display: none;" onclick="youhweixbqz('职业规划')">职业规划</span>
       		<span class="zwyhh43" id="弹性工作" style="display: none;" onclick="youhweixbqz('弹性工作')">弹性工作</span>
       		<span class="zwyhh43" id="晋升空间大" style="display: none;" onclick="youhweixbqz('晋升空间大')">晋升空间大</span>
	  		<span class="zwyhh43" id="办公环境优雅" style="display: none;" onclick="youhweixbqz('办公环境优雅')">办公环境优雅</span>
        	<span class="zwyhh43" id="交通方便" style="display: none;" onclick="youhweixbqz('交通方便')">交通方便</span>
        	<span class="zwyhh43" id="包吃" style="display: none;" onclick="youhweixbqz('包吃')">包吃</span>
        	<span class="zwyhh43" id="包住宿" style="display: none;" onclick="youhweixbqz('包住宿')">包住宿</span>
        	<span class="zwyhh43" id="加班工资高" style="display: none;"  onclick="youhweixbqz('加班工资高')">加班工资高</span>
        	<span class="zwyhh43" id="老板好" style="display: none;" onclick="youhweixbqz('老板好')">老板好</span>
        	<span class="zwyhh43" id="下午茶" style="display: none;" onclick="youhweixbqz('下午茶')">下午茶</span>
		  	<span class="zwyhh43" id="年假长" style="display: none;" onclick="youhweixbqz('年假长')">年假长</span>
		  	<span class="zwyhh43" id="公司大牛多" style="display: none;" onclick="youhweixbqz('公司大牛多')">公司大牛多</span>
		  	<span class="zwyhh43" id="着装随意" style="display: none;" onclick="youhweixbqz('着装随意')">着装随意</span>
        </div>

         <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">已选职位诱惑标签。</div>
        <div class="selecttag">
       		 <div id="youhyixbq"  class="spans">
       		 </div>
             <label style="position:absolute; bottom:2px; right:2px; color:#C00; font-size:12px;">只可以选择8个</label>
              <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除！排名靠前的标签更重要！</label>
      
        </div>
        <p style="text-align: center; padding:5px 0;margin-top:25px; font-size: 12px;"><label id="youhtishi" style="color: red"></label></p>
        <div class="wt"> 
        	<input id="youhzdybq" name="" type="text" class="inputw" placeholder="贴上自定义的标签（不超过6个字）">
        	<input name="" type="button" onclick="youhtiebiaoq()" value="我贴" class="inputb">
        </div>
     <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
	</div>
    </div>
    
  <div class="page page-5-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
    	<input name="job.jobDesc" id="jobDesc" type="hidden" value="${jobDesc}">
        <div style="font-size:14px; color:#666;padding:10px 0 0 10px;">请为<span style="color:#B52D04; font-weight: bold;">工作内容</span>标签。(摇摇试试！)</div>
     	<div id="gzneirweixbq" class="tag">
        
        </div>

         <div style="font-size:14px; color:#666;padding:0px 0 5px 10px;">已选工作内容标签。</div>
        <div class="selecttag">
       		 <div id="gzneiryixuanbq"  class="spans">
       		 </div>
             <label style="position:absolute; bottom:2px; right:2px; color:#C00; font-size:12px;">只可以选择8个</label>
              <label style="position:absolute; bottom:-28px; left:8px; color:#FFF; font-size:0.7em; background-color:rgba(0,0,0,0.2);padding:5px;border-radius:15px;">点击已选标签可以删除！排名靠前的标签更重要！</label>
      
        </div>
        <p style="text-align: center; padding:5px 0;margin-top:25px; font-size: 12px;"><label id="gzneirtishi" style="color: red"></label></p>
        <div class="wt"> 
        	<input id="gzneirzdybiaoq" name="" type="text" class="inputw" placeholder="贴上自定义的标签（不超过6个字）">
        	<input name="" type="button" onclick="gzneirtiebq()" value="我贴" class="inputb">
        </div>
    <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
	</div>
    </div> 
<div class="page page-6-1 hide">
	<div class="wrap"><img class="tp" src="/res/weixin/invite/img/top.png" />
	<div class="cbg" style="margin-top:20%"> 
	   <div class="btitle">选择工作城市</div>
	   			<input name="job.city" id="city" type="hidden" readonly="readonly" value="${city}">
	            <ul class="clear g" id="gzcs" style="text-align: center;">
	            	<li id="北京" <c:if test="${fn:contains(city, '北京')}">class="on"</c:if>><a style="padding: 10px 0;">北京</a></li>
	            	<li id="上海" <c:if test="${fn:contains(city, '上海')}">class="on"</c:if>><a style="padding: 10px 0;">上海</a></li>
					<li id="深圳" <c:if test="${fn:contains(city, '深圳')}">class="on"</c:if>><a style="padding: 10px 0;">深圳</a></li>
	                <li id="广州" <c:if test="${fn:contains(city, '广州')}">class="on"</c:if>><a style="padding: 10px 0;">广州</a></li>
	                <li class="sdycity" style="display: none"><a style="padding: 12px 0;" id="cittt"></a></li>
				</ul>
	   </div>
	   
		<div class="wt" > 
	       	<input id="shurcity" name="" type="text" class="inputw" placeholder="输入城市名称">
	       	<input name="" type="button" onclick="xuanzct()" value="我贴" class="inputb">
	      	</div>
	   <div id="gzcsyj" style="color: red;padding:4px 0;font-size: 12px;text-align: center;"></div>
	  <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
	</div>
</div>
<div class="page page-7-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
        <div class="cbg" style="margin-top:40%"> 
		  <div class="btitle">请输入薪资范围</div>
		  <ul id="xzleix">
			  <li onclick="payType('年薪')" class="input-date ond" style="display: inline-block;">年薪</li>
			  <li onclick="payType('月薪')" class="input-date" style="display: inline-block;">月薪</li>
			  <li onclick="payType('日薪')" class="input-date" style="display: inline-block;">日薪</li>
		  </ul>
		  <input type="hidden" id="smxin" value="">
		  <input name="job.payment" id="payment" type="hidden" readonly="readonly" value="${payment}">
           <div style="text-align: center;padding-bottom: 20px;">
	    	<div style="text-align: 8px;">
	    		<div class="slider-box">
				  	<div class="item">
				   		<div class="wage">最低薪资：</div>
				   		<input type="tel" value="" name="budget" id="budget" class="inputw" style="border: 1px solid #999;padding: 5px;border-radius: 5px;"/>
				  	</div>
				  	<div class="clr"></div>
			  		<div class="item">
				   		<div class="wage">最高薪资：</div>
				   		<input type="tel" value="" name="days" id="days" class="inputw" style="border: 1px solid #999;padding: 5px;border-radius: 5px;"/>
				  	</div>
				  	<div class="clr"></div>
			 	</div>
	        </div>          
        </div>
      </div>
      <div id="gzxsss" style="color: red;padding:4px 0;font-size: 12px; text-align: center;"></div>
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
  </div>
  </div>
 <div class="page page-8-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
	  <input type="hidden" name="job.educationalReq" id="educationalReq" value="${educationalReq }">
     	<div class="sxcity" style="margin-top:20%;">
       	<div class="btitle">职位学历要求：</div>
			<ul class="clear xl" id="xlyq">
				<li id="1" <c:if test="${educationalReq==1 }">class="on"</c:if>><a>不限</a></li>
                <li id="3" <c:if test="${educationalReq==3 }">class="on"</c:if>><a>专科</a></li>
                 <li id="4" <c:if test="${educationalReq==4 }">class="on"</c:if>><a>本科</a></li>
                  <li id="5" <c:if test="${educationalReq==5 }">class="on"</c:if>><a>研究生</a></li>
			</ul>
        </div>
         <div class="cbg" > 
         <input type="hidden" name="job.workTime" id="workTime" value="${workTime }">
   			<div class="btitle">工作性质：</div>
            <ul class="clear xl" id="gzxz">
				<li id="1" <c:if test="${workTime==1 }">class="on"</c:if>><a>全职</a></li>
                <li id="2" <c:if test="${workTime==2 }">class="on"</c:if>><a>实习兼职</a></li>
			</ul>
         </div>
      <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png"/> 
	</div>
</div>

<c:if test="${compStart=='tures' }">
	<div class="page page-9-1 hide">
    <div class="wrap">
     <img class="tp" src="/res/weixin/invite/img/top.png" />
         <div class="" style="margin-top:20%"> 
   			<div class="btitle">请填写公司信息</div>
         </div>
         <div class="nick cbg">
   			<input type="text" name="companyInfo.companyName" id="companyName" value="${companyName }" class="inputw" placeholder="请填写公司名称">
   			<br><span id="companySpan" style="color: red;"></span><br><br>
   			<input type="text" name="companyInfo.companyShortName" id="companyShortName" value="${companyShortName }" class="inputw" placeholder="请填写公司简称，如：远界科技">
   			<br><span id="companyShortSpan" style="color: red;"></span><br><br>
   			<input type="text" name="companyInfo.phone" id="comPhone" class="inputw" value="${phone }" placeholder="请填写联系电话">
   			<br><span id="comPhoneSpan" style="color: red;"></span><br><br>
   			<input type="text" name="companyInfo.email" id="comEmail" class="inputw" value="${email }" placeholder="请填写E-mail">
   			<br><span id="comEmailSpan" style="color: red;"></span><br><br>
   			<input type="text" name="companyInfo.addr" id="addrEmail" class="inputw" value="${addr }" placeholder="请填写公司地址">
   			<br><span id="comAddrSpan" style="color: red;"></span>
         </div>
         <img class="icon pt-page-moveIconUp" src="/res/weixin/resume/img/icon_up.png" /> 
     </div>
  </div>
  <div id="zuih" class="page page-10-1 hide">
    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
    
    	<div id="xingf" style="display: block;">
	        <img class="di" src="/res/weixin/invite/img/di.png" />
	        <div class="bai qq pt-page-moveFromBottom2">
	        	<div style="line-height:25px;padding:10px; color:#666; text-shadow:1px 1px 2px #CCC; text-align:center">
	        		分享到朋友圈或让好友转发，让招聘飞一会，坐等人才到碗里来。
	        	</div>
	        </div>
	        <img class="shang" src="/res/weixin/invite/img/shang.png" />
        </div>
        
        <div id="fabuhou" style="display: none;">
        	<div class="weixin_l" style="padding: 20px 10px 112px 20px;margin-top:98px;background-color: #EEECE9;width: 100%;">
		    	<a class="bdcg">
			    	恭喜你，职位发布成功！<br>
			    	可在要实习首页【收到的简历】查看投递情况要实习每周将统计数据发送至您的邮箱敬请期待
				</a>
		   </div>
	      	<div style="text-align:center; position:absolute;top:60%; width:100%; left:0%;"> 
	      		<a id="lookFx" href=""><input type="button" value="查看并分享" class="inputfb"></a>
	      	</div><br>
	      	<div style="text-align:center; position:absolute;top:71%; width:100%; left:0;"> 
	      		<a id="zaifabu" href=""><input type="button" value="再创建一个" onclick="" class="inputfb"></a>
	      	</div><br>
	      	<div style="text-align:center; position:absolute;top:82%; width:100%; left:0;"> 
	      		<input name="" id="" type="button" value="如何让发布的职位获得更多关注" onclick="coled()" class="inputfb" style="width: 80%;background-color: #F79646;">
	      	</div>
        </div>
        
      <!--<div class="fb">已经编辑好您的微简历了，感觉发布吧!</div>-->
      		<input name="job.skip" id="skip" type="hidden">
       		<input type="submit" id="subfb" style="display: none;">
      	<div id="fabu" style="text-align:center; position:absolute;top:70%; width:100%; left:0;"> 
      		<input name="" type="button" onclick="fabuss('2')" value="发布" class="inputfb">
      	</div>
      	<div style="position: absolute;bottom: 0px;width:100%;left:50%;margin-left:-50%;color:#CC6600;font-size: 12px;text-align: center;">&copy;远界科技技术支持</div>
    </div>
 </div>
</c:if>
<c:if test="${compStart=='falses' }">
<div id="zuih" class="page page-9-1 hide">

    <div class="wrap"> <img class="tp" src="/res/weixin/invite/img/top.png" />
    
    	<div id="xingf" style="display: block;">
	        <img class="di" src="/res/weixin/invite/img/di.png" />
	        <div class="bai qq pt-page-moveFromBottom2">
	        	<div style="line-height:25px;padding:10px; color:#666; text-shadow:1px 1px 2px #CCC; text-align:center">
	        		分享到朋友圈或让好友转发，让招聘飞一会，坐等人才到碗里来。
	        	</div>
	        </div>
	        <img class="shang" src="/res/weixin/invite/img/shang.png" />
        </div>
        
        <div id="fabuhou" style="display: none;">
        	<div class="weixin_l" style="padding: 20px 10px 112px 20px;margin-top:98px;background-color: #EEECE9;width: 100%;">
		    	<a class="bdcg">
			    	恭喜你，职位发布成功！<br>
			    	可在要实习首页【收到的简历】查看投递情况要实习每周将统计数据发送至您的邮箱敬请期待
				</a>
		   </div>
	      	<div style="text-align:center; position:absolute;top:60%; width:100%; left:0%;"> 
	      		<a id="lookFx" href=""><input type="button" value="查看并分享" class="inputfb"></a>
	      	</div><br>
	      	<div style="text-align:center; position:absolute;top:71%; width:100%; left:0;"> 
	      		<a id="zaifabu" href=""><input type="button" value="再创建一个" onclick="" class="inputfb"></a>
	      	</div><br>
	      	<div style="text-align:center; position:absolute;top:82%; width:100%; left:0;"> 
	      		<input name="" id="" type="button" value="如何让发布的职位获得更多关注" onclick="coled()" class="inputfb" style="width: 80%;background-color: #F79646;">
	      	</div>
        </div>
        
      <!--<div class="fb">已经编辑好您的微简历了，感觉发布吧!</div>-->
      		<input name="job.skip" id="skip" type="hidden">
       		<input type="submit" id="subfb" style="display: none;">
      	<div id="fabu" style="text-align:center; position:absolute;top:70%; width:100%; left:0;"> 
      		<input name="" type="button" onclick="fabuss('2')" value="发布" class="inputfb">
      	</div>
      	<div style="position: absolute;bottom: 0px;width:100%;left:50%;margin-left:-50%;color:#CC6600;font-size: 12px;text-align: center;">&copy;远界科技技术支持</div>
    </div>
 </div>
 </c:if>
</form>

<div id="share" onClick="closeDialog()">
    	<div class="shareImg"></div>
 </div>	
 <div id="sharesc" onClick="closeDialogsc()" >
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
<script src="/res/weixin/invite/js/zepto.min.js"></script> 
<script src="/res/weixin/invite/js/touch.js"></script> 
<script src="/res/weixin/invite/js/index.js"></script> 
<script src="/res/weixin/invite/js/svgcheckbx.js"></script>
<script src="/res/weixin/invite/js/province.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script> 
<script type="text/javascript">

var jobRequest = '${jobRequest}';
if(jobRequest != "" && jobRequest != null){
	var ds = jobRequest.split(",");
	var str = "";
	for(var i=0;i<ds.length;i++){
		str = str +"<span name=\"tagName"+(Number(i)+1)+"\" id=\""+ds[i]+"\" onclick=\"yixbiaoqz('"+ds[i]+"',this)\">"+ds[i]+"</span>";
	}
	document.getElementById("yixuanbq").innerHTML=str; 
}
var temptation = '${temptation}';
if(temptation != "" && temptation != null){
	var fs = temptation.split(",");
	var std = "";
	for(var j=0;j<fs.length;j++){
		std=std+"<span name=\"tagName"+(Number(j)+1)+"\" id=\""+fs[j]+"\" onclick=\"youhyixbiaoqz('"+fs[j]+"',this)\">"+fs[j]+"</span>";
	}
	document.getElementById("youhyixbq").innerHTML=std; 
}
var jobDesc = '${jobDesc}';
if(jobDesc != "" && jobDesc != null){
	var gs = jobDesc.split(",");
	var stg = "";
	for(var n=0;n<gs.length;n++){
		stg=stg+"<span name=\"tagName"+(Number(n)+1)+"\" id=\""+gs[n]+"\" onclick=\"gzneiryixbqz('"+gs[n]+"',this)\">"+gs[n]+"</span>";
	}
	document.getElementById("gzneiryixuanbq").innerHTML=stg; 
}
var payment='${payment}';
if(payment != null && payment != ""){
	var arr = new Array();
	arr = payment.split("-");
	var budget = arr[0];
	if(arr[1] != null && arr[1] != ''){
		var days = arr[1].replace("元","");
		$("#days").val(days);
	}
	$("#budget").val(budget);
}
var pg = 0;
init(); 
$('#xlyq li').click(function (){
	$(this).addClass('on').siblings().removeClass('on');
	$("#educationalReq").val($(this).attr("id"));
});
$('#gzxz li').click(function (){
	$(this).addClass('on').siblings().removeClass('on');
	$("#workTime").val($(this).attr("id"));
});

$('#xzleix li').click(function (){
	$(this).addClass('ond').siblings().removeClass('ond');
	//$("#workTime").val($(this).attr("id"));
});
$('#zhiwlb li').click(function (){
	$(this).addClass('on').siblings().removeClass('on');
	$("#dacategory").val($(this).attr("id"));
});

$('#jobLx li').click(function (){
	var sdd= $(this).attr("id");
	$(this).addClass('on').siblings().removeClass('on');
	$("#jobType").val(sdd);
	if(sdd=='招聘实习生'){
		$("#postJob").hide();
	}else{
		$("#postJob").show();
	}
	$("#zhaopry").text("");
});

$('#gzcs li').click(function (){
	$(this).addClass('on').siblings().removeClass('on');
	$("#city").val($(this).attr("id"));
    $("#gzcsyj").text("");
});
$('#duox li').click(function (){
	$(this).addClass('on');
});
$('#nj li').click(function (){
	$(this).addClass('on').siblings().removeClass('on');
});

var jobId = '';
var userName = '';
var url ='';
var pages = "";

if('${compStart}'=='tures' ){
	url='/company/job/addJobWeixinCom/${userId }';
	pages=10;
}else{
	url='/company/job/addJobWeixin/${companyId }';
	pages=9;
}
function fabuss(n){
	  $("#skip").val(n);
	var $form = $("#jobForm");
	$.ajax({
		type:'POST',
		url:url,
		data:$form.serializeArray(),
		dataType:'html',
		success:function(jsons) {
			var da = JSON.parse(jsons);
			if(da.start==0){ 
				if('${requestURLt}' != '' && '${requestURLt}' != 'null'){
					window.location.href='${requestURLt}';
				}else{
					jobId = da.jobId;
					userName = da.companyName;
					$("#xingf").attr("style","display:none;");
					$("#fabu").hide();
					$("#fabuhou").attr("style","display:block;");
					$("#zuih").attr("class","page page-1-1 page-current");
					$("#lookFx").attr("href","/user/jobDetailWeix/"+da.jobId);
					/* $("#yulang").attr("href","/user/jobDetailWeixYl/"+da.jobId);  */
					$("#zaifabu").attr("href","/user/flashHire/${userId}");
				}	
			}
		}
	});	  
} 

  function tiezhiw(){
		var jobName = $("#jobName").val();
		var str = "";
		if(jobName != null){
			str=str+"<option value="+jobName+">"+jobName+"</option>";     
			document.getElementById("sscc").innerHTML=str; 
			$("#category").val(jobName);
			$("#zwfanx").show();
		}else{
			alert("不能为空！");
		}
	}
function shareDialog(){
	 $("#share").show();
}
function closeDialog(){
	$("#share").hide();
}	

function coled(){
	wx.closeWindow();
}

//影藏微信分享菜单栏
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
function onBridgeReady(){
	 WeixinJSBridge.call('hideOptionMenu');
}

//摇一摇脚本
var SHAKE_THRESHOLD = 3000;
var last_update = 0;
var x = y = z = last_x = last_y = last_z = 0;
function init() {
    if (window.DeviceMotionEvent) {
        window.addEventListener('devicemotion', deviceMotionHandler, false);
        return;
    } else {
        alert('not support mobile event');
    }
}
var i=0;
//摇一摇脚本
function deviceMotionHandler(eventData) {
    var acceleration = eventData.accelerationIncludingGravity;
    var curTime = new Date().getTime();
    if ((curTime - last_update) > 100) {
        var diffTime = curTime - last_update;
        last_update = curTime;
        x = acceleration.x;
        y = acceleration.y;
        z = acceleration.z;
        var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;
		
        if (speed > SHAKE_THRESHOLD) {
        	if(i<6){
        		i=i+1;
        	}else{
        		i=0;
        	}
        	if(pg==3){
        		if(i==2){
        			$(".zwyhh32").attr("style","");
        			$(".zwyhh3").attr("style","display:none;");
        			$(".zwyhh33").attr("style","display:none;");
        			return;
        		}else if(i==4){
        			$(".zwyhh33").attr("style","");
        			$(".zwyhh32").attr("style","display:none;");
        			$(".zwyhh3").attr("style","display:none;");
        			return;
        		}else{
        			$(".zwyhh3").attr("style","");
        			$(".zwyhh33").attr("style","display:none;");
        			$(".zwyhh32").attr("style","display:none;");
        			return;
        		}
        	}else if(pg==4){
        		if(i==2){
        			$(".zwyhh42").attr("style","");
	        		$(".zwyhh4").attr("style","display:none;");
	        		$(".zwyhh43").attr("style","display:none;");
	        		return;
        		}else if(i==4){
        			$(".zwyhh43").attr("style","");
	        		$(".zwyhh4").attr("style","display:none;");
	        		$(".zwyhh42").attr("style","display:none;");
	        		return;
        		}else{
        			$(".zwyhh42").attr("style","");
	        		$(".zwyhh4").attr("style","display:none;");
	        		$(".zwyhh43").attr("style","display:none;");
	        		return;
        		}
        	}else if(pg==5){
        		var df = $(".zwyhh52").attr("style");
	        	if(df=="display:none;"){
	        		$(".zwyhh52").attr("style","");
	        		$(".zwyhh5").attr("style","display:none;");
	        		return;
	        	}else{
	        		$(".zwyhh5").attr("style","");
	        		$(".zwyhh52").attr("style","display:none;");
	        		return;
	        	}
        	}
        }
        last_x = x;
        last_y = y;
        last_z = z;
    }
} 

function xuanzct(){
	$("#北京").removeClass('on');
	$("#上海").removeClass('on');
	$("#广州").removeClass('on');
	$("#深圳").removeClass('on');
	$("#city").val($("#shurcity").val());
	$("#cittt").text($("#shurcity").val());
	$(".sdycity").addClass('on');
	$(".sdycity").attr('id',$("#shurcity").val());
	$(".sdycity").attr('style',"");
}

function payType(n){
	$("#smxin").val(n+"：");
}
</script>

</html>
