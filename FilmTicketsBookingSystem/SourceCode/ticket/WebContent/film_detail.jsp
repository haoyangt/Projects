<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HEAD>
<META content="text/html; charset=utf-8" 
http-equiv="Content-Type"><TITLE>${film.fname }-详情页</TITLE><LINK rel="stylesheet" 
href="css/f2c00656.css">
<SCRIPT src="js/183.js"></SCRIPT>

<SCRIPT src="js/f2c00656.js"></SCRIPT>

<META name="GENERATOR" content="MSHTML 9.00.8112.16470"></HEAD>
<BODY class="movie_page"><!-- 导航顶部 start -->
${message }
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
<A class="buy_record" href="displayAllBoughtTicket?uno=${sessionScope.user.uno }" ><SPAN></SPAN>订单管理</A>
<A class="remind" href="javascript:void(0)" onclick="showChangePwdWindow()"><SPAN></SPAN>修改密码</A>
<A class="reward" href="logout?jspComeFrom=film_detail&fno=${fno }&currentPage=${listCinema.currentPage }"><SPAN></SPAN>退出登录</A></DIV></DIV></DIV>
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

<!-- 弹出登录、注册和修改密码窗口 -->
	<LINK rel="stylesheet" href="css/mycss.css">
    <script type="text/javascript" src="js/myjs.js" charset="gbk"></script>
  
 <!-- 登录div --> 
<div id="window_login" class="window">
<div class="window_title">
	<H2>用户登录</H2>
	<a href = "javascript:void(0)" onclick = "closeLoginWindow()"><SPAN class=window_close></SPAN></a>
</div>
<div class="window_content">
<form action="login?jspComeFrom=film_detail&fno=${fno }&currentPage=${listCinema.currentPage }" method="post">
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
<form action="register?jspComeFrom=film_detail" method="post">
	<table width="34%">
		<tr>
			<td width="32%" align="right">用 户 名：</td>
			<td width="68%" align="left"><input type="text" maxlength="30" id= "username" name="username" > </td>
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
<form action="changePwd?jspComeFrom=film_detail&fno=${fno }&currentPage=${listCinema.currentPage }" method="post">
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

<DIV class="wrapper clearfix"><!-- 影视导航 start -->
<DIV id="mindex_menu" class="menu-wrap" bk="">
<DIV class="menu-movie clearfix">
<H2><A href="./index.jsp">电影频道</A></H2>
<UL>
  <LI class="menu-index"><A href="./index.jsp"></A></LI>
  <LI class="menu-film"><A class="current" href="./film_released.jsp"></A></LI>
  <LI class="menu-cinema"><A href="./cinema_list.jsp"></A></LI></UL></DIV></DIV><!-- 影视导航 end -->
<DIV class="content-wrap">
<DIV class="layout grid-960"><!-- 影片详情 start -->
<DIV class="movie-detail clearfix">
<DIV class="pic"><IMG style="width: 230px;" title="${requestScope.film.fname }" alt="${requestScope.film.fname }" src="image/film/${requestScope.film.poster }">
<P>${requestScope.film.remark }</P></DIV>
<DIV class="cont">
<DIV class="counTitle">
<H1>${requestScope.film.fname }</H1><SPAN class="time reying"><c:set var="rdate" value="${requestScope.film.rdate }"></c:set>${fn:substring(rdate,0,10) } 上映</SPAN></DIV>
<DIV class="ranking movie-detail-ranking">
<DIV class="wrap">
<DIV class="movies-score">
<P class="star"><SPAN style="width: ${requestScope.film.grade*10 }%;"></SPAN></P><SPAN 
class="score">${requestScope.film.grade }</SPAN></DIV></DIV>
</DIV><A 
id="movie_buytic" class="tickets" href="http://tuan.360.cn/?do=film&amp;id=4377#">排期/购票</A>
<DIV class="txtInfo">
<DL>
  <DT>导演：</DT>
  <DD>${requestScope.film.director }</DD>
  <DT>主演：</DT>
  <DD>${requestScope.film.protagonist }</DD>
  <DT>地区：</DT>
  <DD>${requestScope.film.location }</DD>
  <DT>类型：</DT>
  <DD>${requestScope.film.type }</DD></DL>
<P>“${requestScope.film.remark }”</P></DIV>
<DIV class="imgInfo clearfix">
<DL class="poster">
  <DT>海报剧照：</DT>
  <DD id="movie_image">
  <c:set var="stills" value="${requestScope.film.still }"></c:set>
  <c:forEach items="${fn:split(stills,';') }" var="still">
  <A href="#">
  <IMG src="image/film/${still }" height="65px" width="105px"></A>
  </c:forEach>
  </DD></DL>
<DL class="view">
  <DT>预告片/花絮：</DT>
  <DD id="movie_prev">
  <c:set var="stills" value="${requestScope.film.still }"></c:set>
  <c:forEach items="${fn:split(stills,';') }" var="still" begin="1" end="4" step="2">
  <A href="#">
  <IMG src="image/film/${still }" height="65px" width="105px"><SPAN></SPAN></A>
  </c:forEach>
  </DD></DL></DIV></DIV>
</DIV><!-- 影片详情 end -->
<DIV class="col-main">
<DIV class="main-wrap"><!-- 影片信息 start -->
<DIV id="movie_area" class="block-box" bk="">
<DIV class="block-hd">
<UL class="block-tag">
  <LI class="current"><A 
  href="http://tuan.360.cn/?do=film&amp;id=4377#"><SPAN>排期/购票</SPAN></A></LI>
  <LI id="movie_filmarea"><A 
  href="http://tuan.360.cn/?do=film&amp;id=4377#"><SPAN>电影介绍</SPAN></A></LI>
 </UL></DIV>
<DIV class="block-bd">
<DIV style="display: block;" class="block-item">
<DIV class="cinemaSearch">
<FIELDSET class="clearfix"><LEGEND>影院搜索：</LEGEND>
<FORM id="qmovie" method="post" action="filmDetail?fno=${requestScope.film.fno }"><INPUT name="do" value="cinemalist" 
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
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }#movie_area" >全部<SPAN>(${requestScope.all })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'all' }">
  <A href="filmDetail?fno=${requestScope.film.fno }#movie_area" id="all">全部<SPAN>(${requestScope.all })</SPAN></A>
  </c:if>
   <c:if test="${requestScope.simpleloc eq 'heping' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=heping#movie_area" >和平区<SPAN>(${requestScope.heping })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'heping' }">
  <A  href="filmDetail?fno=${requestScope.film.fno }&simpleloc=heping#movie_area" >和平区<SPAN>(${requestScope.heping })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'nankai' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=nankai#movie_area" >南开区<SPAN>(${requestScope.nankai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'nankai' }">
  <A href="filmDetail?fno=${requestScope.film.fno }&simpleloc=nankai#movie_area">南开区<SPAN>(${requestScope.nankai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'hexi' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=hexi#movie_area" >河西区<SPAN>(${requestScope.hexi })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'hexi' }">
  <A  href="filmDetail?fno=${requestScope.film.fno }&simpleloc=hexi#movie_area" >河西区<SPAN>(${requestScope.hexi })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'binhai' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=binhai#movie_area" >滨海新区<SPAN>(${requestScope.binhai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'binhai' }">
  <A  href="filmDetail?fno=${requestScope.film.fno }&simpleloc=binhai#movie_area" >滨海新区<SPAN>(${requestScope.binhai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'beichen' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=beichen#movie_area" >北辰区<SPAN>(${requestScope.beichen })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'beichen' }">
  <A href="filmDetail?fno=${requestScope.film.fno }&simpleloc=beichen#movie_area" >北辰区<SPAN>(${requestScope.beichen })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'hongqiao' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=hongqiao#movie_area" >红桥区<SPAN>(${requestScope.hongqiao })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'hongqiao' }">
  <A href="filmDetail?fno=${requestScope.film.fno }&simpleloc=hongqiao#movie_area" >红桥区<SPAN>(${requestScope.hongqiao })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'hedong' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=hedong#movie_area" >河东区<SPAN>(${requestScope.hedong })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'hedong' }">
  <A href="filmDetail?fno=${requestScope.film.fno }&simpleloc=hedong#movie_area" >河东区<SPAN>(${requestScope.hedong })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'jinghai' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=jinghai#movie_area" >静海县<SPAN>(${requestScope.jinghai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'jinghai' }">
  <A href="filmDetail?fno=${requestScope.film.fno }&simpleloc=jinghai#movie_area" >静海县<SPAN>(${requestScope.jinghai })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc eq 'baodi' }">
  <A class="current" href="filmDetail?fno=${requestScope.film.fno }&simpleloc=baodi#movie_area" >宝坻区<SPAN>(${requestScope.baodi })</SPAN></A>
  </c:if>
  <c:if test="${requestScope.simpleloc ne 'baodi' }">
  <A href="filmDetail?fno=${requestScope.film.fno }&simpleloc=baodi#movie_area" >宝坻区<SPAN>(${requestScope.baodi })</SPAN></A>
  </c:if>
  </DD></DL></DIV>
<DIV class="hot-cinema">
<DIV class="hotCinema-hd">
<H2>《${requestScope.film.fname }》放映排期</H2>
</DIV>
<DIV id="otherlist">
<UL id="movie_cinemalist">
 <!-- 显示所有电影院 -->
<c:if test="${requestScope.listCinema ne '' }">
<c:forEach items="${requestScope.listCinema.data }" var="cinema">
  <LI class="item" name="${cinema.cname }">
  <DIV class="hd">
  <H3><A href="cinemaDetail?cno=${cinema.cno }" target="_blank" cid="5551">${cinema.cname }</A></H3><SPAN 
  class="score">${cinema.grade }</SPAN></DIV>
  <DIV class="bd">
  <DL class="info">
    <DT>地址：</DT>
    <DD>${cinema.location }&nbsp;</DD>
    <DT>电话：</DT>
    <DD>${cinema.tel }&nbsp;</DD></DL>
  <DIV class="extend">
  <UL>
    <LI><A class="movie_tuan" href="displayTicketInFilmDetail?cno=${cinema.cno }&fno=${film.fno }&currentPage=${requestScope.listCinema.currentPage }&random=<%=(int)(Math.random()*100) %>#movie_area" 
     cid="5551">在线选座</A>
    </LI>
    </UL></DIV></DIV></LI>
 </c:forEach>
 </c:if>
  </UL>
<DIV class="moviepage">
<DIV id="movie_page" class="pg" bk="mmovies_hot_page">
<SPAN 
id="page_num">
<c:forEach var="i" begin="1" end="${requestScope.listCinema.totalPages }" >
<c:if test="${requestScope.listCinema.currentPage eq i }"><SPAN class="current">${i }</SPAN></c:if>
<c:if test="${requestScope.listCinema.currentPage ne i }"><A href="filmDetail?fno=${film.fno }&currentPage=${i }#movie_area" rel="">${i }</A></c:if>
</c:forEach>
</SPAN></DIV></DIV></DIV></DIV>
<SCRIPT>$('#more-other a').click(function(){
                    $('#more-other').hide();
                    $('#otherlist').show();
                    return false;
                });
                
            </SCRIPT>
</DIV>
<DIV class="block-item movieInfo">
<DIV class="movieDesc">
<H2>剧情介绍</H2>
<P id="movie_short"><c:set var="plot" value="${requestScope.film.plot }"></c:set>${fn:substring(plot,0,150) }...... &nbsp;<A id="movie_down" class="down" href="#">展开</A></P>
<P style="display: none;" id="movie_long">
${requestScope.film.plot }&nbsp;<A id="movie_up" class="up" 
href="http://tuan.360.cn/?do=film&amp;id=4377#">收起</A></P></DIV>
<DIV class="movieStills">
<H2>海报剧照</H2>
<DIV id="movie_picscroll" class="stills">
<DIV id="movie_pic" class="stills-big" hover="stills-big-hover"><A class="pre" 
href="http://tuan.360.cn/?do=film&amp;id=4377#">
<P></P><SPAN></SPAN></A><A class="next" href="http://tuan.360.cn/?do=film&amp;id=4377#">
<P></P><SPAN></SPAN></A>
<DIV class="movie_wp">
<UL>
<c:set var="stills" value="${requestScope.film.still }"></c:set>
  <c:forEach items="${fn:split(stills,';') }" var="still">
  <LI>
  	<IMG src="image/film/${still }">
  </LI>
  </c:forEach>
</UL></DIV></DIV>
<DIV id="movie_smallpic" class="stills-small">
<UL class="stills-smallList clearfix">
  <c:set var="stills" value="${requestScope.film.still }"></c:set>
  <c:forEach items="${fn:split(stills,';') }" var="still">
  <LI>
  	<IMG src="image/film/${still }" height="65px" width="105px">
  </LI>
  </c:forEach>
</UL></DIV></DIV></DIV>
<DIV class="movieView">
<c:set var="prevues" value="${requestScope.film.prevue }"></c:set>
  <c:forEach items="${fn:split(prevues,';') }" var="prevue" varStatus="step">
  	<H2><c:if test="${step.index eq 0 }">预告片</c:if><c:if test="${step.index eq 1 }">花絮</c:if></H2>
	<DIV class="view-wrap"><EMBED height="402" type="application/x-shockwave-flash" 
	width="650" src="${prevue }" 
	wmode="opaque" allowfullscreen="true" allowscriptaccess="always"></DIV>
  </c:forEach>

</DIV></DIV>
</DIV></DIV>
<SCRIPT type="text/javascript">
    
    ;(function($){
        $(function(){
        Qtool.slide({
                    container:'#movie_picscroll',
                    show: {
                        container:'#movie_pic div.movie_wp ul'
                                },
                    operate:{
                                    container:'#movie_smallpic ul',
                                    hoverClass:'current'
                    },
                    controlInfo:{
                                    loadData:false,
                                    width:'610',
                                    prev:'#movie_pic .pre',
                                    next:'#movie_pic .next'
                                }
                }); 
    
                $('#movie_smallpic .pre,#movie_smallpic .next,#movie_pic .pre,#movie_pic .next').live("click",function(){return false;}); 
                Qtool.newsuggest({input:'#movie-search-box',
                    nameSpace:'movie_cinema',
                    key:'name',
                    url:'/?do=cinemasug&city=bei_jing&q=',
                    tpls:{base:'<div class="cinema_ediv">{name}</div>'},
                style:'#movie_cinema .e_suggest_box{border:1px solid #67b3da;}#movie_cinema .cinema_ediv{padding-left:5px;line-height:22px;}'});

                $("#movie_down").live("click",function(){
                    $(this).parent().hide().next().show();
                    return false;
                });
                $("#movie_up").live("click",function(){
                    $(this).parent().hide().prev().show();
                    return false;
                });
   }); 
    
    
    })(window.jQuery);


    
</SCRIPT>
<!-- 影片信息 end --></DIV></DIV>
<DIV class="col-sub"><!-- <div class="sidebar" >
    <a href="http://tuan.360.cn/static/subject/tequan02.html?fname=weishi_filmimg_0112_tuan_tequan&fsign=a1fb3a5783" class="c_gg" target="_blank" ><img src="http://p4.qhimg.com/t010456105484be9295.jpg" width="240" style="padding:4px 4px;display:block;" /></a>
</div> --><!-- 热映影片 start --><!-- 热映影片 start -->
<DIV id="mfilm_hot" class="sidebar" bk="">
<DIV class="sidebar-t">
<DIV class="wrap">
<H2>天津热映电影</H2><A href="displayAllReleasedFilm" 
target="_blank">全部&gt;&gt;</A></DIV></DIV>
<DIV class="sidebar-m">
<UL class="hot-movies">
<c:forEach items="${requestScope.lstFilm.data }" var="film">
  <LI><A class="movies-img" href="filmDetail?fno=${film.fno }" 
  target="_blank"><IMG src="image/film/${film.poster }"></A>
  <DIV class="movies-info"><A class="movies-name" href="filmDetail?fno=${film.fno }" 
  target="_blank">${film.fname }</A>
  <DIV class="movies-score">
  <DIV class="star-wrap">
  <P class="star"><SPAN style="width: ${film.grade*10 }%;"></SPAN></P></DIV><!--<span class="score">7.6</span>--><SPAN 
  class="score">${film.grade }</SPAN></DIV>
  <P class="movies-desc"></P>
  <P class="movies-style">${film.type }</P>
  <P class="movies-country">${film.location }</P></DIV></LI>
</c:forEach>
  </UL></DIV></DIV><!-- 热映影片 end --><!-- 热映影片 end --><!-- 网络首播 start --><!-- 网络首播影片 start --><!-- 网络首播影片 end --><!-- 网络首播 end --></DIV></DIV></DIV></DIV><!-- 底部 start -->
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

<DIV class="footer"><A href="displayIndex" ></A>
<P>Copyright@Tian Haoyang,TJNU                 &nbsp;&nbsp;<A class="fgray" href="http://www.miibeian.gov.cn/"></A></P>
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
/&gt;</NOSCRIPT><!-- 底部 end -->

<!-- 弹出订票窗口 -->
<style> 
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 245%; 
            background-color:#000000;
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=80); 
        } 
        .window_ticketselection { 
            display: none; 
            position: absolute; 
            top: 100%;
            left: 25%; 
            width: 50%; 
            height: 70%; 
            padding: 0px; 
            border: 10px solid #1A1A1A; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style>
    <script>
    
    function showWindow(){
    	document.getElementById('light').style.display='block';
    	document.getElementById('fade').style.display='block';
    }
    </script>
  
<div id="light" class="window_ticketselection">
<DIV class=seatPop-hd >
<H2>在线订票 - 选择观影场次</H2><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><SPAN class=seatPop-close></SPAN></a></DIV>
<DIV class=seatPop-bd>
<P>影片：<STRONG id=movie_filmname>${requestScope.film.fname }</STRONG></P>
<P>影院：<STRONG id=movie_cinemaname>${requestScope.cname }</STRONG></P>
<P class=seatTips>选择场次<SPAN>选择场次后，您可以进行选座操作</SPAN></P>
<DIV class=seatTab>
<TABLE>
  <THEAD>
  <TR>
    <TH>场次</TH>
    <TH>语言</TH>
    <TH>类型</TH>
    <TH>厅</TH>
    <TH class=price>会员价/<SPAN>VIP</SPAN></TH></TR></THEAD>
   
  <TBODY id=movie_seat>
  <c:forEach items="${requestScope.listTicket }" var="ticket">
	<TR class="ticketTR" tno=${ticket.tno } hno=${ticket.hno }>
    <TD>${ticket.time }</TD>
    <TD>${ticket.language }</TD>
    <TD>${ticket.type }</TD>
    <TD class=seat>${ticket.hname }<SPAN><c:if test="${ticket.restseat eq -1 }">${ticket.maxseat }</c:if> <c:if test="${ticket.restseat ne -1 }">${ticket.restseat }</c:if>座 / ${ticket.maxseat }座</SPAN></TD>
    <TD class=price>￥${ticket.price }</TD></TR>
   </c:forEach>
 </TBODY></TABLE></DIV>
  <script type="text/javascript">
 $("tr.ticketTR").hover(function()
		 {
			 $(this).addClass("hover2");
		 },
		 function()
		{
			 $("tr.ticketTR").removeClass("hover2");
		 }
 ).click(function()
		 {
			 $("tr.ticketTR").removeClass("hover2");
		    $("tr.ticketTR").removeClass("select");
		    $(this).addClass("select");
		    $("#tno").val($(this).attr('tno'));
		    $("#hno").val($(this).attr('hno'));
	 });
 </script>
 <form action="getseatsequence?jspComeFrom=film_detail&fno=${fno }&currentPage=${listCinema.currentPage }" method="post" id="datas">
	<input type="hidden" id="tno" name="tno" value="">
	<input type="hidden" id="hno" name="hno" value="">
</form>
<DIV class=clearfix><A class=seatSub href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';document.getElementById('datas').submit();">选座购票</A> 
</DIV></DIV>
</div> 
    <div id="fade" class="black_overlay"></div> 
 <c:if test="${!empty requestScope.listTicket  }">
 <script>
 	showWindow();
 </script>
 </c:if>  
<!-- 弹出订票窗口 end-->
<!-- 弹出选座窗口 -->
<style> 
        .window_seatselection { 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%;
            width: 100%; 
            height: 230%; 
            background-color:#000000;
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=80); 
        } 
        .submitButton{
        	width:100px;    
         	height:40px;   
         	left:200px;
        	background:url(image/button.png) no-repeat center;    
         	cursor:pointer; 
        }
    </style>
    <script>
    function showSeatWindow(){
    	document.getElementById('seatselection').style.display='block';
    }
    </script>
<div id="seatselection" class="window_seatselection">
<c:set var="seatsequence" value="${requestScope.seatsequence }"></c:set>
<c:set var="row" value="1"></c:set>
<c:set var="column" value="1"></c:set>
<H2><font color="#FFFFFF" size="2"><strong> >>请选择合适的座位</strong></font><a href="javascript:void(0)" onclick="document.getElementById('seatselection').style.display='none';"> <SPAN class=seatPop-close></SPAN></a></H2>
<br>
<form action="buyticket?jspComeFrom=film_detail&fno=${fno }&tno=${tno }&currentPage=${listFilm.currentPage }" method="post">
<table align="center" id="ticketTable">
<c:forEach begin="0" end="${fn:length(seatsequence) }" step="1" var="i">
	<c:if test="${fn:substring(seatsequence,i,i+1) eq ';' }"> <tr> <c:set var="row" value="${row+1 }"></c:set><c:set var="column" value="1"></c:set></c:if>
		<td>
			  <c:if test="${fn:substring(seatsequence,i,i+1) eq '2' }"><img src="image/grey.png" title="${row }行${column }列" row=${row } column=${column }>&nbsp;<c:set var="column" value="${column+1 }"></c:set></c:if>
			  <c:if test="${fn:substring(seatsequence,i,i+1) eq '1' }"><input type="checkbox" style="display:none" id="${row }_${column }" name="seats" value="${row }_${column }"><img src="image/green.png" title="${row }行${column }列" row=${row } column=${column }>&nbsp;<c:set var="column" value="${column+1 }"></c:set></c:if>
			  <c:if test="${fn:substring(seatsequence,i,i+1) eq '0' }"><img src="image/blank.png">&nbsp;</c:if>
		</td>
	<c:if test="${fn:substring(seatsequence,i,i+1) eq ';' }"> </tr> </c:if>
</c:forEach>
</table>
<br>
<div align="center" >
<input type="submit" value="确认" class="submitButton" onclick="if(!confirm('是否确认订票？'))return false;" > 
</div>
</form>
</div> 
 <script type="text/javascript">
 $("#ticketTable img").click(function()
		 {
		if($(this).attr('src')=='image/green.png'){
			$(this).attr('src','image/blue.png');
			$('#'+$(this).attr('row')+'_'+$(this).attr('column')).attr('checked','true');
		}
		else if($(this).attr('src')=='image/blue.png'){
			$(this).attr('src','image/green.png');
			$('#'+$(this).attr('row')+'_'+$(this).attr('column')).removeAttr("checked");;
		}
	 });
 </script>
<c:if test="${not empty requestScope.seatsequence  }">
 <script>
 	showSeatWindow();
 </script>
 </c:if>  
  <c:if test="${not empty requestScope.closeseat }">
	<script>
		document.getElementById('seatselection').style.display='none';
	</script>
</c:if>
<!-- 弹出选座窗口 end-->


<SCRIPT type="text/javascript">var city = 'tian_jin';
            
            ;(function($){
                $('.synopsis a').click(function(){
                    $(this).parent('dd').hide().siblings().show();
                    return false;
                });
                $("#movie_image a").live("click",function(){
                    $("#movie_area ul li#movie_filmarea").click(); 
                    var top = $("#movie_area .movieStills h2").offset().top; 
                    $(window).scrollTop(top);
                    return false; 
                });
                $("#movie_prev a").live("click",function(){
                    var index = $(this).index();
                    $("#movie_area ul li#movie_filmarea").click(); 
                    var top = $("#movie_area .movieView h2").eq(index).offset().top; 
                    $(window).scrollTop(top);
                    return false;
                });
                $("#movie_buytic").live("click",function(){
                   var obj =  $("#movie_area .block-tag li") ;
                   obj.eq(0).click();
                   $(window).scrollTop(obj.offset().top);
                   return false;
                });               
                $("#movie_douban").live("click",function(){
                   var obj =  $("#movie_area .block-tag li") ;
                   obj.last().click();
                   $(window).scrollTop(obj.offset().top);
                   return false;
                }); 
            })(jQuery); 
             
        </SCRIPT>
</BODY></HTML>