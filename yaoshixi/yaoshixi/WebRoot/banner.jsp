<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="res/images/favicon.ico">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	/* $("#jishu").mouseover(function(){
   		$("#dds").attr("class","menu_sub");        
    }).mouseout(function(){
    	$("#dds").attr("class","menu_sub dn");
   	}); */
$("#jishu").hover(function(){
	$("#dds").removeClass("dn");
	$("#jishu").addClass("cnt");
}, function(){
	$("#dds").addClass("dn");
	$("#jishu").removeClass("cnt");
});
$("#wenyuan").hover(function(){
	$("#cp").removeClass("dn");
	$("#wenyuan").addClass("cnt");
}, function(){
	$("#cp").addClass("dn");
	$("#wenyuan").removeClass("cnt");
});
$("#caiwu").hover(function(){
	$("#cw").removeClass("dn");
	$("#caiwu").addClass("cnt");
}, function(){
	$("#cw").addClass("dn");
	$("#caiwu").removeClass("cnt");
});
$("#xiaoshou").hover(function(){
	$("#xs").removeClass("dn");
	$("#xiaoshou").addClass("cnt");
}, function(){
	$("#xs").addClass("dn");
	$("#xiaoshou").removeClass("cnt");
});



});
   	
	function genKeyord(city) {
		var keyword = '';
		if(city!=''){
			keyword=city;
		}else{
			keyword = $("#search_input").val();
		}
		var url2 = "searchJobs.jsp?keyword="+keyword;
		var url = encodeURI(url2);
		$("#ycbq").attr("href",url);
		document.getElementById("ycbq").click();
	}
	function genCompany(cname) {
		var keyword = '';
		if(cname!=''){
			keyword=cname;
		}else{
			keyword = $("#search_input").val();
		}
		var url2 = "c/index.jsp?keyword="+keyword;
		var url = encodeURI(url2);
		$("#ycbq").attr("href",url);
		document.getElementById("ycbq").click();
	}
	
</script>
</head>
<!-- 左边导航  -->
<div class="header">
<%--  <div class="logo_h">
  <input type="hidden" id="roleId" value="${roleId}">
 	<a href="index"><img src="res/images/logo.gif" /></a>
 </div> --%>

 <!-- <div class="banner">
   		<ul class="reset" id="navheader">
   			<li><a href="index" id="homePage" class="a_sy c_click" style="">首页</a></li>
   			<li><a id="companys" class="a_gs c_click" style="">公司</a>
	   			 <div class="zhi_li">
	   			 	<a href="c/index" id="hotCompany" >热门公司</a>
	   			 </div>
   			</li>
   			<li id="release" style="display: none;"><a id="PostedJob" class="a_zw c_click" style="">发布职位</a>
		   		<div class="zhi_li">
		   		   <a href="company/job/addEdit" id="PostedJobNew">发布新职位</a>
	               <a href="company/job/index" id="myPostedJob">我发布的职位</a>
	               <a href="company/job/invitation.jsp" id="InviteIntern">邀请实习生</a>
		   		</div>
   			</li>
   		 <li id="manage" style="display: none;"><a href="company/index" id="myCompanyPage" class="a_zw c_click" style="">我的公司主页</a>
   			</li> 
   			<li id="Resume" style="display: none;"><a class="a_jl c_click" id="myResumeOne" style="">我的简历</a>
   				<div class="zhi_li">
   					<a href="user/resume" id="myResumeTwo">我的简历</a>
                    <a href="user/jobList" id="myPosition">我投递的职位</a>
   				</div>
   			</li>
   			<li id="forum"><a href="forum/index.jsp" class="a_lt c_click" style="">论坛</a></li>
   		</ul>
    </div> -->
   
   <div id="sidebar">
	<div class="mainNavs">
		<div class="menu_box" id="jishu">
          <div class="menu_main" >
	            <h2>技术 <span></span></h2>
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=技术研发">技术研发</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=平面设计">平面设计</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=设计">设计/创意</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=科研">科研</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=技术指导">技术指导</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=运营">运营</a> 
          </div>
          <div class="menu_sub dn" id="dds" style="top: 0px;">
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=市场">市场</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=市场营销">市场营销</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=市场策划" class="curr">市场策划</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=市场专员" class="curr">市场专员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=市场推广">市场推广</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=活动策划">活动策划</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=商务拓展">商务拓展</a> 
              </dd>
            </dl>
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=设计">设计 </a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=平面设计">平面设计</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=美术设计">美术设计</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=flash设计/开发">flash设计/开发</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=UI设计">UI设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=特效设计">特效设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=美术编辑">美术编辑</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=园林设计">园林设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=包装设计">包装设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=家居设计">家居设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=工业设计">工业设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=游戏界面设计">游戏界面设计</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=原画师">原画师</a>
              </dd>
            </dl>
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=IT/互联网">IT/互联网 </a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=软件开发">软件开发</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=测试人员">测试人员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=网络管理员">网络管理员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=网络维护运营">网络维护运营</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=IT销售">IT销售</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=网站编辑">网站编辑</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=网站运营专员/助理">网站运营专员/助理</a> 
              </dd>
            </dl>
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=贸易/物流 ">贸易/物流</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=采购专员/助理">采购专员/助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=外贸跟单员">外贸跟单员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=贸易助理">贸易助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=报关员">报关员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=单证员">单证员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=仓库管理员">仓库管理员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=供应链管理">供应链管理</a> 
              </dd>
            </dl>
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=生产/制造 ">生产/制造</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=产品管理" class="curr">产品管理</a>
	               <a target="_blank" href="searchJobs.jsp?jobAttrValue=生产运营" class="curr">生产运营</a>  
	               <a target="_blank" href="searchJobs.jsp?jobAttrValue=汽车制造" class="curr">汽车制造</a>  
	               <a target="_blank" href="searchJobs.jsp?jobAttrValue=机械制造" class="curr">机械制造</a>  
	               <a target="_blank" href="searchJobs.jsp?jobAttrValue=生物制药" class="curr">生物制药</a>  
              </dd>
            </dl>
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=教育/法律/咨询">教育/法律/咨询</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=专业顾问" class="curr">专业顾问</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=兼职教师">兼职教师</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=培训策划">培训策划</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=课程顾问">课程顾问</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=律师助理">律师助理</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=法务专员/助理">法务专员/助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=合同管理">合同管理</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=调研员">调研员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=咨询项目管理">咨询项目管理</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=笔译">笔译</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=口译">口译</a> 
              </dd>
            </dl>
            <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=其他">其他</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=管培生" class="curr">管培生</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=公务员">公务员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=社区服务">社区服务</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=志愿者">志愿者</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=地勤人员">地勤人员</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=其他">其他</a> 
              </dd>
            </dl>
          </div>
		</div>
		<div class="menu_box" id="wenyuan" >
          <div class="menu_main" >
               <h2>文员 <span></span></h2>
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=文员">文员</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=行政">行政</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=编辑/文案">编辑/文案</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=公关">公关</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=客服">客服</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=客户服务">客户服务</a> 
            </div>
         <div class="menu_sub dn" id="cp" style="top:137px;min-height: 115px;">
           <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=行政/人事">行政/人事</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=前台" class="curr">前台</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=行政专员/助理">行政专员/助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=人事专员">人事专员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=HR实习生">HR实习生</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=媒体公关">媒体公关</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=客服人员">客服人员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=招聘助理">招聘助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=部门秘书">部门秘书</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=后勤人员">后勤人员</a> 
              </dd>
            </dl>
          </div>
       </div>
       <div class="menu_box" id="caiwu" >
          <div class="menu_main" >
               <h2>财务<span></span></h2>
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=会计/出纳">会计/出纳</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=财务">财务</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=>审计">审计</a> 
            </div>
         <div class="menu_sub dn" id="cw" style="top:274px;min-height: 88px;">
           <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=金融/财务">金融/财务</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=会计/出纳">会计/出纳</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=审计">审计</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=保险业务员">保险业务员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=信托服务">信托服务</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=证券投资">证券投资</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=银行业务">银行业务</a>
              </dd>
            </dl>
          </div>
       </div>
       <div class="menu_box" id="xiaoshou" >
          <div class="menu_main" >
               <h2>销售<span></span></h2>
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=会计/出纳">销售</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=财务">商务拓展</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=>审计">渠道/分销</a> 
	            <a target="_blank" href="searchJobs.jsp?jobAttrValue=>审计">市场营销</a> 
            </div>
         <div class="menu_sub dn" id="xs" style="top:384px;min-height:115px;">
          <dl class="reset">
              <dt> <a target="_blank" href="searchJobs.jsp?jobAttrValue=销售">销售</a> </dt>
              <dd> <a target="_blank" href="searchJobs.jsp?jobAttrValue=区域销售助理" class="curr">区域销售助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=大客户销售助理" class="curr">大客户销售助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=电话销售" class="curr">电话销售</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=渠道/分销专员">渠道/分销专员</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=网络/在线销售" class="curr">网络/在线销售</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=业务拓展专员/助理">业务拓展专员/助理</a> 
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=销售顾问">销售顾问</a>
	              <a target="_blank" href="searchJobs.jsp?jobAttrValue=售前支持">售前支持</a> 
              </dd>
            </dl>
          </div>
       </div>
 	</div>
 </div>
 
    <c:if test="${roleId==2}">
	    <div class="ban_wex">当前每日投递量：${sessionScope.quantity }份</div>
	    <div class="sha_wex" style="height: 10px;"></div>
	   	<div class="sha_wex" style="height: 40px;"><a  target="_blank" href="user/quantityFull.jsp" style="text-decoration:underline;">邀请好友，提升投递量</a> </div>
    </c:if>
     <div class="ban_wex">扫一扫</div>
    <div class="sha_wex"><img src="res/images/wxEwm.jpg" width="168px" />
    </div>
    <!-- <div class="ban_sina">
    	<iframe width="100%" height="120" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=120&fansRow=2&ptype=1&speed=0&skin=9&isTitle=1&noborder=1&isWeibo=0&isFans=0&uid=3971198910&verifier=c19c1e0f&dpc=1"></iframe>
    </div> -->
</div>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	$(".zhi_li").css("display", "none");
	$(".c_click").click(function(){
		var $This = $(this);
		var show = $This.attr("show");
		
		var parent = $This.parent();
		if(show == 'yes')
		{
		   $(parent).find(".zhi_li").hide();
			$This.attr("show", "");
		}else
		{
			$(parent).find(".zhi_li").show();
			$This.attr("show", "yes");
		}
	});
	
	
	 
</script>
</html>
