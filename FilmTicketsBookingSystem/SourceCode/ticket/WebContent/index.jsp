<%@page import="com.hy.po.User"%>
<%@page import="com.hy.biz.impl.UserBizImpl"%>
<%@page import="com.hy.biz.IUserBiz"%>
<%@page import="com.hy.po.SlideImg"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HEAD>
<META content="text/html; charset=utf-8" 
http-equiv="Content-Type"><TITLE>天津电影在线订票</TITLE><LINK rel="stylesheet" href="css/f2c00656.css">
<SCRIPT src="js/183.js"></SCRIPT>

<SCRIPT src="js/f2c00656.js"></SCRIPT>

<META name="GENERATOR" content="MSHTML 9.00.8112.16470"></HEAD>
<BODY class="movie_page">

<c:if test="${empty indexReleasedFilm }">
	<script>location.href="displayIndex"</script>
</c:if>
<!-- 弹出登录、注册和修改密码窗口 -->
	<LINK rel="stylesheet" href="css/mycss.css">
    <script type="text/javascript" src="js/myjs.js" charset="gbk"></script>
  
 <!-- 登录div --> 
<div id="window_login" class="window">
<div class="window_title">
	<H2>用户登录</H2>
	<a href = "javascript:void(0)" onclick = "closeLoginWindow()"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="login?jspComeFrom=index" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">用户名：</td>
			<td width="68%" align="left"><input type="text" name="username"> </td>
		</tr>
		<tr>
			<td align="right">密　码：</td>
			<td align="left"><input type="password" name="password"></td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><input type="checkbox" name="usecookie" value="yes"/>下次自动登录 </td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><font color="red" size="1">${errorLoginMsg }</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="登录" class="button">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="closeLoginWindow()"> </td>
        </tr>
	</table>
	</form>
</div>
</div> 

<!--注册div --> 
<div id="window_register" class="window">
<div class="window_title">
	<H2>用户注册</H2>
	<a href = "javascript:void(0)" onclick = "closeRegisterWindow()"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="register?jspComeFrom=index" method="post" onsubmit="if(document.getElementById('result').innerHTML.indexOf('error.png')>0){alert('用户名已存在,请重新填写');return false;}">
	<table width="34%">
		<tr>
			<td width="32%" align="right">用 户 名：</td>
			<td width="68%" align="left"><input type="text" maxlength="30" id= "rusername" name="username"  onchange="isExist();"> <span id="result"></span></td>
		</tr>
		<tr>
			<td width="32%" align="right">新 密 码：</td>
			<td width="68%" align="left"><input type="password" maxlength="30" id= "newpwd" name="newpwd" onblur="checkpwd()" onkeyup="checkpwd()"><span id="newpwdimg"></span> </td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><span id="magnitude"></span></td>
		</tr>
		<tr>
			<td align="right">密码验证：</td>
			<td align="left"><input type="password" maxlength="30" id="vpwd" name="vpwd" onblur="checkvpwd()" onkeyup="checkvpwd()"><span id="vpwdimg"></span></td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><font color="red" size="1">${errorRegisterMsg }</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="注册" class="button">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="closeRegisterWindow()"> </td>
        </tr>
	</table>
	</form>
</div>
</div> 

<!-- 修改密码div --> 
<div id="window_changepwd" class="window">
<div class="window_title">
	<H2>修改密码</H2>
	<a href = "javascript:void(0)" onclick = "closeChangePwdWindow()"><SPAN class="window_close"></SPAN></a>
</div>
<div class="window_content">
<form action="changePwd?jspComeFrom=index" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">新 密 码：</td>
			<td width="68%" align="left"><input type="password" maxlength="30" id= "newpwd" name="newpwd" onblur="checkpwd()" onkeyup="checkpwd()"><span id="newpwdimg"></span> </td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><span id="magnitude"></span></td>
		</tr>
		<tr>
			<td align="right">密码验证：</td>
			<td align="left"><input type="password" maxlength="30" id="vpwd" name="vpwd" onblur="checkvpwd()" onkeyup="checkvpwd()"><span id="vpwdimg"></span></td>
		</tr>
		<tr >
			<td  colspan="2" align="center" ><font color="red" size="1">${errorChangePwdMsg }</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input name="submit" type="submit" id="submit" value="修改" class="button">
				<input name="cancel" type="button" id="cancel" value="取消" class="button" onclick="closeChangePwdWindow()"> </td>
        </tr>
	</table>
	</form>
</div>
</div>

<!-- 阴影div -->
<div id="fade" class="black_overlay"></div> 
<c:if test="${ not empty sessionScope.errorLoginMsg }">
	<script>showLoginWindow()</script>
</c:if>
<c:if test="${ not empty sessionScope.errorRegisterMsg }">
	<script>showRegisterWindow()</script>
</c:if>
<c:if test="${ not empty sessionScope.errorChangePwdMsg }">
	<script>showChangePwdWindow()</script>
</c:if>
<!-- 弹出登录、注册和修改密码窗口 end-->
<%
	String username=null;String password=null;
	Cookie[] cookie=request.getCookies();
	if(cookie!=null){
	   for(Cookie c:cookie){
	      if(c.getName().equals("username")){
	          username=c.getValue();	      
	      }
	      if(c.getName().equals("password")){
	          password=c.getValue();	      
	      }
	   }
	}
	if(username!=null&&password!=null&&(request.getAttribute("readCookie")==null)){
		IUserBiz ub=new UserBizImpl();
		User user=ub.findUser(username, password);
		session.removeAttribute("user");
		session.setAttribute("user", user);
	}
%>


<!-- 导航顶部 start -->
<DIV class="detail_head_wrap" bk="top_tuan_nav">
<DIV class="detail_head"><A class="detail_logo" href="index.jsp"></A>
<DIV id="tuan_nav" class="detail_nav" bk="">
您好[&nbsp;<strong><c:if test="${empty sessionScope.user.permission.pname }">游客</c:if>${sessionScope.user.permission.pname }</strong>&nbsp;]，今天是${sessionScope.now } 
</DIV>
<DIV class="detail_mytuan"><A class="mytuan_link" 
href="#"><SPAN id="checkLogin"><!--此处需做判断： 登录后class为islogin；未登录class为islogout --></SPAN>
<c:if test="${empty sessionScope.user  }"> 尚未登录<SPAN 
class="icon"></SPAN></A>
<DIV class="menu_wrap">
<DIV class="menu_bd"><A class="buy_record" href="javascript:void(0)" onclick="showLoginWindow()"><SPAN></SPAN>用户登录</A>
<A class="remind" href="javascript:void(0)" onclick="showRegisterWindow()"><SPAN></SPAN>用户注册</A></DIV></DIV></DIV></c:if>
<c:if test="${not empty sessionScope.user }"> ${sessionScope.user.username }
<SPAN 
class="icon"></SPAN></A>
<DIV class="menu_wrap">
<DIV class="menu_bd">
<A class="buy_record" href="displayAllBoughtTicket?uno=${sessionScope.user.uno }"><SPAN></SPAN>订单管理</A>
<A class="remind" href="javascript:void(0)" onclick="showChangePwdWindow()"><SPAN></SPAN>修改密码</A>
<A class="reward" href="logout?jspComeFrom=index"><SPAN></SPAN>退出登录</A></DIV></DIV></DIV>
</c:if>
<DIV class="detail_top_search">
</DIV></DIV></DIV>
<SCRIPT src="js/login_v5.js"></SCRIPT>

<SCRIPT type="text/javascript">
    
    var search = $('#keywords');
    var defKeyword = '输入电影或电影院';
    var city = Qtool.cookie('_citycode')? Qtool.cookie('_citycode'): 'bei_jing';
    Qtool.placeholder({'form':'#tsearch','input':search,'empty':true,'defKeyword':defKeyword});

    var suggest_url = "/api/suggest.php?city="+city+"&kw=";                        
    Qtool.newsuggest({input:'#keywords',url:suggest_url,tpls:{base:'<div class="left">{0}</div><div class="right">约<font color="red">{1}</font>个团购</div> '},style:'.e_suggest_box{border-color:#ccc;}.e_suggest_box .current{background-color:#ffe9be;}.e_suggest_box .left{float:left;padding-left:5px;}.e_suggest_box .right{float:right;padding-right:5px;}'});
    $('.detail_mytuan').hover(function(){
        $(this).addClass('mytuan_hover');
    },function(){
        $(this).removeClass('mytuan_hover');
    });     
    ELogin.init({
        'ischeck':true,
        'loginevent':function(){ 
            $('#checkLogin').attr('class','islogin');
        },
        'logoutevent':function(){ 
            $('#checkLogin').attr('class','islogout');
        }});

        
    </SCRIPT>
<!-- 导航顶部 end -->
<DIV class="wrapper clearfix"><!-- 影视导航 start -->
<DIV id="mindex_menu" class="menu-wrap" bk="">
<DIV class="menu-movie clearfix">
<H2><A href="./index.jsp">电影频道</A></H2>
<UL>
  <LI class="menu-index"><A class="current" href="./index.jsp"></A></LI>
  <LI class="menu-film"><A href="./film_released.jsp"></A></LI>
  <LI class="menu-cinema"><A href="./cinema_list.jsp"></A></LI></UL>
<P class="new-mes">天津地区今日共有<A href="film_released.jsp" target="_blank">${requestScope.allFilmCount }</A>部电影，在<A 
href="cinema_list.jsp" target="_blank">${requestScope.indexCinemaCount }</A>家影院上映</P></DIV>
</DIV><!-- 影视导航 end --><!-- 焦点图 start --><!-- 轮播图 start -->
<DIV class="slide">
<DIV class="slide-wrap">
<DIV id="focus_slide" class="focus" bk="mindex_rotate">
<UL id="focus_img" class="focus-img"></UL>
<DIV class="focus-nav">
<UL id="focus_nav" class="focus-triggers"></UL>
<UL class="focus-desc">
  <LI id="movie_info"></LI></UL>
<DIV class="bg"></DIV></DIV></DIV>
<DIV id="mindex_movie" class="focus-side" bk="">
<DIV class="tags">
<DIV class="wrap">
<UL id="new_movies_tab">
  <LI class="current"><A href="./film_released.jsp" 
  target="_blank">正在热映</A></LI>
  <LI><A href="./film_release_soon.jsp" 
  target="_blank">即将上映</A></LI></UL><A class="more" href="./film_released.jsp" 
target="_blank">全部电影</A></DIV>
<P class="hr"></P></DIV>
<DIV id="new_movies" class="new-info" bk="">
<UL style="display: block;" class="new-movies-item">
<c:forEach items="${requestScope.indexReleasedFilm.data }" var="rfilm" varStatus="step">
  <c:if test="${step.index eq 0 }"><LI class="toggle"></c:if>
  <c:if test="${step.index ne 0 }"><LI></c:if>
  <P class="short-news"><SPAN><EM><c:set var="type" value="${rfilm.type}"></c:set> ${fn:substring(type, 0,2)}
  <B>|</B></EM>${rfilm.fname }</SPAN><STRONG>${rfilm.grade }</STRONG></P>
  <DIV class="detail">
  <DIV class="wrap"><A class="movies-pic" href="filmDetail?fno=${rfilm.fno }" 
  target="_blank"><IMG src="image/film/${rfilm.poster }"></A>
  <DIV class="movies-info"><A class="movies-name" href="filmDetail?fno=${rfilm.fno }" 
  target="_blank">${rfilm.fname }</A>
  <DIV class="movies-score">
  <DIV class="star-wrap">
  <P class="star"><SPAN style="width: ${rfilm.grade*10 }%;"></SPAN></P></DIV><SPAN 
  class="score">${rfilm.grade }</SPAN></DIV>
  <P class="movies-time"><c:set var="rdate" value="${rfilm.rdate}"></c:set> ${fn:substring(rdate, 0,10)}上映</P><A class="movies-mes" href="filmDetail?fno=${rfilm.fno }" 
  target="_blank">查影讯</A></DIV></DIV></DIV></LI>
</c:forEach>
  </UL>
<UL class="new-movies-item">
<c:forEach items="${requestScope.indexReleaseSoonFilm.data }" var="rsfilm" varStatus="step" >
  <c:if test="${step.index eq 0 }"><LI class="toggle"></c:if>
  <c:if test="${step.index ne 0 }"><LI></c:if>
  <P class="short-news"><SPAN><EM><c:set var="type" value="${rsfilm.type}"></c:set> ${fn:substring(type, 0,2)}
  <B>|</B></EM>${rsfilm.fname }</SPAN><EM><c:set var="rdate" value="${rsfilm.rdate}"></c:set> ${fn:substring(rdate, 0,10)}</EM></P>
  <DIV class="detail">
  <DIV class="wrap"><A class="movies-pic" href="filmDetail?fno=${rsfilm.fno }" 
  target="_blank"><IMG src="image/film/${rsfilm.poster }"></A>
  <DIV class="movies-info"><A class="movies-name" href="filmDetail?fno=${rsfilm.fno }" 
  target="_blank">${rsfilm.fname }</A>
  <P class="movies-time"><c:set var="rdate" value="${rsfilm.rdate}"></c:set> ${fn:substring(rdate, 0,10)}上映</P><A class="movies-mes" href="filmDetail?fno=${rsfilm.fno }" 
  target="_blank">查影讯</A></DIV></DIV>
  <P class="hr"></P></DIV></LI>
</c:forEach>
  </UL></DIV></DIV></DIV></DIV><!-- 轮播图 end --><!-- 焦点图 end --><!-- layout start -->
<DIV class="content-wrap">
<DIV class="layout grid-960 clearfix">
<DIV class="col-main">
<DIV class="main-wrap"><!-- 热门影院 start -->
<DIV id="mmovie_cinema" class="block-box" bk="">
<DIV class="block-hd">
<H2>天津热门影院</H2></DIV>
<DIV class="block-bd">
<DIV class="cinemaSearch">
<FIELDSET class="clearfix"><LEGEND>影院搜索：</LEGEND>
<FORM id="qmovie" method="post" action="displayAllCinemaByName"><INPUT name="do" value="cinemalist" 
type="hidden"><INPUT id="movie-search-box" class="cinemaSearch-txt" name="movieq" 
type="text"><INPUT class="cinemaSearch-sub" value="搜索" type="submit"></FORM></FIELDSET>
<DL id="movie_oftengo" class="often-go">
  <DT>你最近去的影院：</DT>
  <DD></DD></DL></DIV>
<DIV class="filter-area">
<DL>
  <DT>所在地区：</DT>
  <DD>
   <c:if test="${requestScope.simpleloc eq ''||requestScope.simpleloc eq 'all' }">
  <A class="current" href="displayAllCinema" >全部<SPAN>(${requestScope.all })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'all' }">
  <A href="displayAllCinema" id="all">全部<SPAN>(${requestScope.all })</SPAN></A>
  </c:if>
   <c:if test="${requestScope.simpleloc eq 'heping' }">
  <A class="current" href="displayAllCinema?simpleloc=heping" >和平区<SPAN>(${requestScope.heping })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'heping' }">
  <A  href="displayAllCinema?simpleloc=heping" >和平区<SPAN>(${requestScope.heping })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'nankai' }">
  <A class="current" href="displayAllCinema?simpleloc=nankai" >南开区<SPAN>(${requestScope.nankai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'nankai' }">
  <A href="displayAllCinema?simpleloc=nankai">南开区<SPAN>(${requestScope.nankai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'hexi' }">
  <A class="current" href="displayAllCinema?simpleloc=hexi" >河西区<SPAN>(${requestScope.hexi })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'hexi' }">
  <A  href="displayAllCinema?simpleloc=hexi" >河西区<SPAN>(${requestScope.hexi })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'binhai' }">
  <A class="current" href="displayAllCinema?simpleloc=binhai" >滨海新区<SPAN>(${requestScope.binhai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'binhai' }">
  <A  href="displayAllCinema?simpleloc=binhai" >滨海新区<SPAN>(${requestScope.binhai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'beichen' }">
  <A class="current" href="displayAllCinema?simpleloc=beichen" >北辰区<SPAN>(${requestScope.beichen })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'beichen' }">
  <A href="displayAllCinema?simpleloc=beichen" >北辰区<SPAN>(${requestScope.beichen })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'hongqiao' }">
  <A class="current" href="displayAllCinema?simpleloc=hongqiao" >红桥区<SPAN>(${requestScope.hongqiao })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'hongqiao' }">
  <A href="displayAllCinema?simpleloc=hongqiao" >红桥区<SPAN>(${requestScope.hongqiao })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'hedong' }">
  <A class="current" href="displayAllCinema?simpleloc=hedong" >河东区<SPAN>(${requestScope.hedong })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'hedong' }">
  <A href="displayAllCinema?simpleloc=hedong" >河东区<SPAN>(${requestScope.hedong })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'jinghai' }">
  <A class="current" href="displayAllCinema?simpleloc=jinghai" >静海县<SPAN>(${requestScope.jinghai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'jinghai' }">
  <A href="displayAllCinema?simpleloc=jinghai" >静海县<SPAN>(${requestScope.jinghai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'baodi' }">
  <A class="current" href="displayAllCinema?simpleloc=baodi" >宝坻区<SPAN>(${requestScope.baodi })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'baodi' }">
  <A href="displayAllCinema?simpleloc=baodi" >宝坻区<SPAN>(${requestScope.baodi })</SPAN></A>
  </c:if>
  </DD></DL></DIV>
<DIV class="hot-cinema">
<UL id="movie_cinemalist">
<c:forEach items="${indexCinema.data }" var="cinema">
  <LI class="item" name="${cinema.cname }">
  <DIV class="hd">
  <H3><A href="cinemaDetail?cno=${cinema.cno }" target="_blank" cid="${cinema.cno }">${cinema.cname }</A></H3><SPAN 
  class="score">${cinema.grade }</SPAN></DIV>
  <DIV class="bd">
  <DL class="info">
    <DT>地址：</DT>
    <DD>${cinema.location }&nbsp;</DD></DL>
  <DIV class="extend">
  <UL>
    <LI><A class="movie_tuan" href="cinemaDetail?cno=${cinema.cno }" 
    target="_blank" cid="${cinema.cno }">查看详情</A></LI></UL></DIV></DIV></LI>
 </c:forEach>
  </UL></DIV></DIV>
</DIV>
<SCRIPT>
    var movieQ = '';
    
    var defVal = '输入影院名称';
    ;(function($){
        $('.hot-cinema li').hover(function(){
            $(this).addClass('current');
            },function(){
            $(this).removeClass('current');
        });
        if(movieQ){
            $('#movie-search-box').val(movieQ);
            }else{
            $('#movie-search-box').val(defVal).css('color','#ccc');
        }
        $('#movie-search-box').focus(function(){
            var thisVal = $(this).val();
            if(thisVal == defVal){
                $(this).val('');
            }
            $(this).css('color','#333');
        }).blur(function(){
            var thisVal = $(this).val();
            if(thisVal == ''){
                $(this).val(defVal).css('color','#ccc');
            }
        });
        $('#qmovie').submit(function(){
            var mq = $('#movie-search-box').val();
            if(mq == defVal) return false;
        });
    })(jQuery)
    
</SCRIPT>
<!-- 北京热门影院 end -->
</DIV></DIV></DIV><!-- layout end --></DIV><!-- footer start -->
<SCRIPT type="text/javascript" src="js/newfeedback2.js"></SCRIPT>

<SCRIPT>
    
    feedbackBiz.main({objectNameId:53,inputName:'movieitem',callback:1,image:'http://p0.qhimg.com/t01f6cc3e8ab0860bf5.png',hdimage:'http://p0.qhimg.com/t01ae308426434363f0.png',position:'rb'});
    Qtool.float({
        pageWidth:960,
        width:32,
        position:2,
        preTop:300,
        offsetTop:20,
        content:'<div class="go-top"> <a href="javascript:document.body.scrollTop=0;document.documentElement.scrollTop=0;void(0);" target="_self">回顶部</a> </div>',
        zIndex:99
    });
    
</SCRIPT>

<SCRIPT src="js/newmovie.js"></SCRIPT>

<STYLE>

.footer{clear:both;padding-top:40px;text-align:center;line-height:22px;width:960px;margin:0 auto;}
.footer a{margin:0 5px;color:#2E74D3;}

</STYLE>
<DIV class="footer"><A href="http://jc.360.cn/" target="_blank"></A>
<P>Copyright @Tian Haoyang,TJNU.                &nbsp;&nbsp;<A class="fgray" href="http://www.miibeian.gov.cn/"></A></P>
</DIV>

<SCRIPT src="js/m_v3.js" $end_footer$=""></SCRIPT>

<SCRIPT src="js/emonitor.js"></SCRIPT>

<SCRIPT $merger$="">
    
    Qtool.cookie('_resw',(screen.width >= 1280 ? 1 : 0),93,'/');
    emonitor.setHostname('tuan.360.cn');
    ;(function($){
        var mid = Qtool.getSeMid();
        if(mid){
            emonitor.setExComInfo('|'+mid);
        }
        var from = Qtool.href.from;
        $('a').live('click',function(){
            var $this = $(this);
            var href = $this.attr('href');
            if(href.indexOf('open.union.360.cn') > -1){
                var fname = Qtool.cookie('fname');
                var fsign = Qtool.cookie('_fsign');
                if(mid && href.indexOf('mid=')==-1){
                    href += '&mid='+mid;
                }
                if(from && href.indexOf('src=')==-1){
                    href += '&src='+encodeURIComponent(from);
                }
                if(fname && href.indexOf('fname=')==-1){
                    href += '&fname='+encodeURIComponent(fname);
                }
                if(fsign && href.indexOf('fsign=')==-1){
                    href += '&fsign='+encodeURIComponent(fsign);
                }
                $this.attr('href',href);
            }
        });

    })(window.jQuery);
    //taoge img error
    ;(function(){
        var taogeId = Qtool.cookie('Q');
        var imgerrn = 0;
        var errs = [];
        var eUrl = 'http://s.1360.cn/p.gif?';
        var curUrl = document.URL;
        var wmon = function (img){
            if(imgerrn  > 10 || !img )return;
            var src = img.src;
            if(errs[src]) return;
            errs[src] = true;
            var qid = taogeId || '';
            var dataUrl = eUrl + 'u=' + encodeURIComponent(src) + '&f=tuan&q=' + qid+'&c='+encodeURIComponent(curUrl)+'&t=' + +new Date;
            Qtool.image({src :dataUrl});
            imgerrn++;
        }
        window.WMon = wmon;
    }());

    //google
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-30957131-1']);
    _gaq.push(['_trackPageview']);
    (function() { 
        var ga = document.createElement('script'); 
        ga.type = 'text/javascript'; 
        ga.async = true; 
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; 
        var s = document.getElementsByTagName('script')[0]; 
        s.parentNode.insertBefore(ga, s); 
    })();

    //艾瑞
    var _iwt_UA="UA-360-000001";
    (function (D) {
        var s=D.createElement("script"),h=D.getElementsByTagName("head")[0];s.src="http://h.qhimg.com/js/iwt.js";s.type="text/javascript";s.charset="utf-8";h.appendChild(s);
    })(document);

    //comscore 统计
    var _comscore = _comscore || [];
    _comscore.push({ c1: "2", c2: "7129932" });
    (function() {
        var s = document.createElement("script"), el = document.getElementsByTagName("script")[0]; s.async = true;
        s.src = (document.location.protocol == "https:" ? "https://sb" : "http://b") + ".scorecardresearch.com/beacon.js";
        el.parentNode.insertBefore(s, el);
    })();
    
</SCRIPT>
<NOSCRIPT>&lt;img 
src="http://b.scorecardresearch.com/p?c1=2&amp;c2=7129932&amp;cv=2.0&amp;cj=1" 
/&gt;</NOSCRIPT><!-- footer end -->
<SCRIPT type="text/javascript">
            
            var city = Qtool.cookie('_citycode'); 
            ;(function($){
                var timer;
                $('#new_movies_tab li').mouseenter(function(){
                    var $this = $(this);
                    var i = $this.index();
                    //$(this).css('color','#f38e32');
                    timer = setTimeout(function(){
                        $this.addClass('current').siblings().removeClass('current');
                        $('#new_movies ul').eq(i).show().siblings().hide();
                    },300);

                }).mouseleave(function(){
                    if(timer) clearTimeout(timer);
                    //$(this).css('color','#fff');
                });
                $('.new-movies-item li,.amusement-group li,.food-group li').mouseover(function(){
                    $(this).addClass('toggle').siblings().removeClass('toggle'); 
                });

                try{
                    
                    
var slideData = [
<%
	List<SlideImg> slideimg=(List<SlideImg>)request.getAttribute("slideimg");
	for(int i=0;i<slideimg.size();i++){
		if((i+1)!=slideimg.size()){
%>
			{name:'<%=slideimg.get(i).getSname() %>',href:'<%=slideimg.get(i).getHref() %>',fen:'<%=slideimg.get(i).getScore1() %>.<%=slideimg.get(i).getScore2() %>',fen1:'<%=slideimg.get(i).getScore1() %>',fen2:'<%=slideimg.get(i).getScore2() %>',title:'<%=slideimg.get(i).getTitle() %>',pic:'image/slide_picture/<%=slideimg.get(i).getImg() %>',picsrc:'<%=slideimg.get(i).getHref() %>'},
<%		}else{
	%>
	{name:'<%=slideimg.get(i).getSname() %>',href:'<%=slideimg.get(i).getHref() %>',fen:'<%=slideimg.get(i).getScore1() %>.<%=slideimg.get(i).getScore2() %>',fen1:'<%=slideimg.get(i).getScore1() %>',fen2:'<%=slideimg.get(i).getScore2() %>',title:'<%=slideimg.get(i).getTitle() %>',pic:'image/slide_picture/<%=slideimg.get(i).getImg() %>',picsrc:'<%=slideimg.get(i).getHref() %>'}
	<%
		}
	}
%>

];
//最后一个数据后面不要逗号 

                    

                    var getSlideHtml = function(i){
                        var data = slideData[i];
                        var html = '\
                        <span class="desc-name"><strong><a href="'+data.href+'" target="_blank">'+data.name+'</a></strong><em>'+data.fen1+'<small>.'+data.fen2+'</small></em></span>\
                            <span class="desc-info">'+data.title+'</span>\
                            <!--<a class="movies-mes" href="'+data.href+'" target="_blank">查影讯</a>-->';
                        $('#movie_info').html(html);
                    }
                    getSlideHtml(0);
                    var pics = [],href = [];
                    for(var i=0, len=slideData.length;i<len;i++){
                        var temp = slideData[i];
                        pics.push(temp.pic);
                        href.push(temp.picsrc);
                    }
                    Qtool.slide({
                        container:'#focus_slide',
                        show:{
                            container:'#focus_img',
                            pics:pics,
                            href:href,
                            alt:[''],
                            template:'<li><a href="{href}" target="_blank"><img alt="" src="{src}" width="650" height="300" /></a></li>'
                        },
                        operate:{
                            container:'#focus_nav',
                            template:'<li></li>',
                            hoverClass:'current',
                            fun:getSlideHtml
                        },
                        controlInfo:{
                            width:650
                        }
                    });
                }catch(e){
                }
            })(jQuery);
            
        </SCRIPT>
        
        <!-- 悬浮图 start -->
 <style type="text/css">
	
	#screen {
		display: block; 
        position: absolute;
		left: 10%;
		top: 10%;
        width: 80%; 
        height: 80%; 
        background-color:#000000;
        z-index:1002; 
        -moz-opacity: 0.9; 
        opacity:.90; 
        filter: alpha(opacity=90);
	}
	#screen1 {
		display: block; 
        position: absolute;
		left: 0%;
		top: 0%;
        width: 100%; 
        height: 10%; 
        background-color:#000000;
        z-index:1001; 
        -moz-opacity: 0.9; 
        opacity:.90; 
        filter: alpha(opacity=90);
	}
	#screen2 {
		display: block; 
        position: absolute;
		left: 0%;
		top: 10%;
        width: 10%; 
        height: 80%; 
        background-color:#000000;
        z-index:1001; 
        -moz-opacity: 0.9; 
        opacity:.90; 
        filter: alpha(opacity=90);
	}
	#screen3 {
		display: block; 
        position: absolute;
		left: 90%;
		top: 10%;
        width: 10%; 
        height: 80%; 
        background-color:#000000;
        z-index:1001; 
        -moz-opacity: 0.9; 
        opacity:.90; 
        filter: alpha(opacity=90);
	}
	#screen4 {
		display: block; 
        position: absolute;
		left: 0%;
		top: 90%;
        width: 100%; 
        height: 100%; 
        background-color:#000000;
        z-index:1001; 
        -moz-opacity: 0.9; 
        opacity:.90; 
        filter: alpha(opacity=90);
	}
	#screen img {
		position: absolute;
		cursor: pointer;
		visibility: hidden;
		width: 0px;
		height: 0px;
	}
	#screen .tvover {
		border: solid #876;
		opacity: 1;
		filter: alpha(opacity=100);
	}
	#screen .tvout {
		border: solid #fff;
		opacity: 0.7;
	}
	#bankImages {
		display: none;
	}
</style>

<script type="text/javascript">
var Library = {};
Library.ease = function () {
	this.target = 0;
	this.position = 0;
	this.move = function (target, speed)
	{
		this.position += (target - this.position) * speed;
	}
}

var tv = {
	/* ==== variables ==== */
	O : [],
	screen : {},
	grid : {
		size       : 4,  // 4x4 grid
		borderSize : 6,  // borders size
		zoomed     : false
	},
	angle : {
		x : new Library.ease(),
		y : new Library.ease()
	},
	camera : {
		x    : new Library.ease(),
		y    : new Library.ease(),
		zoom : new Library.ease(),
		focalLength : 750 // camera Focal Length
	},

	/* ==== init script ==== */
	init : function ()
	{
		this.screen.obj = document.getElementById('screen');
		var img = document.getElementById('bankImages').getElementsByTagName('img');
		this.screen.obj.onselectstart = function () { return false; }
		this.screen.obj.ondrag        = function () { return false; }
		/* ==== create images grid ==== */
		var ni = 0;
		var n = (tv.grid.size / 2) - .5;
		for (var y = -n; y <= n; y++)
		{
			for (var x = -n; x <= n; x++)
			{
				/* ==== create HTML image element ==== */
				var o = document.createElement('img');
				var i = img[(ni++) % img.length];
				o.className = 'tvout';
				o.src = i.src;
				tv.screen.obj.appendChild(o);
				/* ==== 3D coordinates ==== */
				o.point3D = {
					x  : x,
					y  : y,
					z  : new Library.ease()
				};
				/* ==== push object ==== */
				o.point2D = {};
				o.ratioImage = 1;
				tv.O.push(o);
				/* ==== on mouse over event ==== */
				o.onmouseover = function ()
				{
					if (!tv.grid.zoomed)
					{
						if (tv.o)
						{
							/* ==== mouse out ==== */
							tv.o.point3D.z.target = 0;
							tv.o.className = 'tvout';
						}
						/* ==== mouse over ==== */
						this.className = 'tvover';
						this.point3D.z.target = -.5;
						tv.o = this;
					}
				}
				/* ==== on click event ==== */
				o.onclick = function ()
				{
					if (!tv.grid.zoomed)
					{
						/* ==== zoom in ==== */
						tv.camera.x.target = this.point3D.x;
						tv.camera.y.target = this.point3D.y;
						tv.camera.zoom.target = tv.screen.w * 1.25;
						tv.grid.zoomed = this;
					} else {
						if (this == tv.grid.zoomed){
							/* ==== zoom out ==== */
							tv.camera.x.target = 0;
							tv.camera.y.target = 0;
							tv.camera.zoom.target = tv.screen.w / (tv.grid.size + .1);
							tv.grid.zoomed = false;
						}
					}
				}
				/* ==== 3D transform function ==== */
				o.calc = function ()
				{
					/* ==== ease mouseover ==== */
					this.point3D.z.move(this.point3D.z.target, .5);
					/* ==== assign 3D coords ==== */
					var x = (this.point3D.x - tv.camera.x.position) * tv.camera.zoom.position;
					var y = (this.point3D.y - tv.camera.y.position) * tv.camera.zoom.position;
					var z = this.point3D.z.position * tv.camera.zoom.position;
					/* ==== perform rotations ==== */
					var xy = tv.angle.cx * y  - tv.angle.sx * z;
					var xz = tv.angle.sx * y  + tv.angle.cx * z;
					var yz = tv.angle.cy * xz - tv.angle.sy * x;
					var yx = tv.angle.sy * xz + tv.angle.cy * x;
					/* ==== 2D transformation ==== */
					this.point2D.scale = tv.camera.focalLength / (tv.camera.focalLength + yz);
					this.point2D.x = yx * this.point2D.scale;
					this.point2D.y = xy * this.point2D.scale;
					this.point2D.w = Math.round(
					                   Math.max(
					                     0,
					                     this.point2D.scale * tv.camera.zoom.position * .8
					                   )
					                 );
					/* ==== image size ratio ==== */
					if (this.ratioImage > 1)
						this.point2D.h = Math.round(this.point2D.w / this.ratioImage);
					else
					{
						this.point2D.h = this.point2D.w;
						this.point2D.w = Math.round(this.point2D.h * this.ratioImage);
					}
				}
				/* ==== rendering ==== */
				o.draw = function ()
				{
					if (this.complete)
					{
						/* ==== paranoid image load ==== */
						if (!this.loaded)
						{
							if (!this.img)
							{
								/* ==== create internal image ==== */
								this.img = new Image();
								this.img.src = this.src;
							}
							if (this.img.complete)
							{
								/* ==== get width / height ratio ==== */
								this.style.visibility = 'visible';
								this.ratioImage = this.img.width / this.img.height;
								this.loaded = true;
								this.img = false;
							}
						}
						/* ==== HTML rendering ==== */
						this.style.left = Math.round(
						                    this.point2D.x * this.point2D.scale +
						                    tv.screen.w - this.point2D.w * .5
						                  ) + 'px';
						this.style.top  = Math.round(
						                    this.point2D.y * this.point2D.scale +
						                    tv.screen.h - this.point2D.h * .5
						                  ) + 'px';
						this.style.width  = this.point2D.w + 'px';
						this.style.height = this.point2D.h + 'px';
						this.style.borderWidth = Math.round(
						                           Math.max(
						                             this.point2D.w,
						                             this.point2D.h
						                           ) * tv.grid.borderSize * .01
						                         ) + 'px';
						this.style.zIndex = Math.floor(this.point2D.scale * 100);
					}
				}
			}
		}
		/* ==== start script ==== */
		tv.resize();
		mouse.y = tv.screen.y + tv.screen.h;
		mouse.x = tv.screen.x + tv.screen.w;
		tv.run();
	},

	/* ==== resize window ==== */
	resize : function ()
	{
		var o = tv.screen.obj;
		tv.screen.w = o.offsetWidth / 2;
		tv.screen.h = o.offsetHeight / 2;
		tv.camera.zoom.target = tv.screen.w / (tv.grid.size + .1);
		for (tv.screen.x = 0, tv.screen.y = 0; o != null; o = o.offsetParent)
		{
			tv.screen.x += o.offsetLeft;
			tv.screen.y += o.offsetTop;
		}
	},

	/* ==== main loop ==== */
	run : function ()
	{
		/* ==== motion ease ==== */
		tv.angle.x.move(-(mouse.y - tv.screen.h - tv.screen.y) * .0025, .1);
		tv.angle.y.move( (mouse.x - tv.screen.w - tv.screen.x) * .0025, .1);
		tv.camera.x.move(tv.camera.x.target, tv.grid.zoomed ? .25 : .025);
		tv.camera.y.move(tv.camera.y.target, tv.grid.zoomed ? .25 : .025);
		tv.camera.zoom.move(tv.camera.zoom.target, .05);
		/* ==== angles sin and cos ==== */
		tv.angle.cx = Math.cos(tv.angle.x.position);
		tv.angle.sx = Math.sin(tv.angle.x.position);
		tv.angle.cy = Math.cos(tv.angle.y.position);
		tv.angle.sy = Math.sin(tv.angle.y.position);
		/* ==== loop through all images ==== */
		for (var i = 0, o; o = tv.O[i]; i++)
		{
			o.calc();
			o.draw();
		}
		/* ==== loop ==== */
		setTimeout(tv.run, 32);
	}
}

/* ==== global mouse position ==== */
var mouse = {
	x : 0,
	y : 0
}
document.onmousemove = function(e)
{
	if (window.event) e = window.event;
	mouse.x = e.clientX;
	mouse.y = e.clientY;
	return false;
}

</script>
<div id="screen1"><font color="#FFFFFF">>>>>>>>以下为最新即将上映和已上映电影</font></div>
<div id="screen2"></div>
<div id="screen3"><img title="关闭" src="image/xx.png" onclick="document.getElementById('screen').style.display='none';document.getElementById('screen1').style.display='none';document.getElementById('screen2').style.display='none';document.getElementById('screen3').style.display='none';document.getElementById('screen4').style.display='none';"></div>
<div id="screen4"></div>
<div id="screen"></div>

<div id="bankImages">
<c:forEach items="${requestScope.suspensionFilm }" var="poster">
	<img alt="" src="image/film/${poster }">
</c:forEach>
</div>

<script type="text/javascript">
	/* ==== start script ==== */
	onresize = tv.resize;
	tv.init();
</script>
<br>
        
</BODY></HTML>