<%@page import="com.hy.biz.impl.FilmBizImpl"%>
<%@page import="com.hy.biz.IFilmBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HTML><HEAD>
<META content="text/html; charset=utf-8" 
http-equiv="Content-Type"><TITLE>正在上映的影片</TITLE><LINK rel="stylesheet" 
href="css/f2c00656.css">
<SCRIPT src="js/183.js"></SCRIPT>

<SCRIPT src="js/f2c00656.js"></SCRIPT>

<META name="GENERATOR" content="MSHTML 9.00.8112.16470"></HEAD>
<BODY class="movie_page"><!-- 导航顶部 start -->
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
<DIV class="menu_bd">
<A class="buy_record" href="javascript:void(0)" onclick="showLoginWindow()"><SPAN></SPAN>用户登录</A>
<A class="remind" href="javascript:void(0)" onclick="showRegisterWindow()"><SPAN></SPAN>用户注册</A></DIV></DIV></DIV></c:if>
<c:if test="${not empty sessionScope.user }"> ${sessionScope.user.username }
<SPAN 
class="icon"></SPAN></A>
<DIV class="menu_wrap">
<DIV class="menu_bd">
<A class="buy_record" href="displayAllBoughtTicket?uno=${sessionScope.user.uno }" ><SPAN></SPAN>订单管理</A>
<A class="remind" href="javascript:void(0)" onclick="showChangePwdWindow()"><SPAN></SPAN>修改密码</A>
<A class="reward" href="logout?jspComeFrom=film_released"><SPAN></SPAN>退出登录</A></DIV></DIV></DIV>
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
    <c:if test="${empty requestScope.allReleasedFilm && empty requestScope.allReleasedFilmByName}">
    	<script>location.href="displayAllReleasedFilm";</script>
    </c:if>
    
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
<form action="login?jspComeFrom=film_released" method="post">
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
<form action="register?jspComeFrom=film_released" method="post">
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
<form action="changePwd?jspComeFrom=film_released" method="post">
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
<DIV class="layout grid-960">
<DIV class="col-main">
<DIV class="main-wrap"><!-- 影片列表 start --><!-- 影片列表 start -->
<DIV id="mmovies_hot" class="block-box" bk="">
<DIV class="block-hd">
<UL class="block-tag">
<%IFilmBiz fb=new FilmBizImpl(); 
int allReleasedFilmCount=fb.findReleasedFilmCount();
fb=new FilmBizImpl(); 
int allReleaseSoonFilmCount=fb.findReleaseSoonFilmCount();%>
  <LI class="current"><A 
  href="./film_released.jsp"><SPAN>正在热映（<%=allReleasedFilmCount %>部）</SPAN></A></LI>
  <LI><A 
  href="./film_release_soon.jsp"><SPAN>即将上映（<%=allReleaseSoonFilmCount %>部）</SPAN></A></LI></UL>
<DIV class="movie-search">
<FORM id="qf" method="post" action="displayAllReleasedFilmByName"><INPUT name="do" value="filmlist" type="hidden"><INPUT 
class="movie-search-box" name="qf" type="text"><INPUT class="movie-search-sbmt" value="搜索" type="submit"></FORM></DIV></DIV>
<DIV class="block-bd">
<DIV class="movies">
<UL class="movies-list">
  <!-- 显示所有电影 -->
<c:if test="${requestScope.allReleasedFilm ne '' }">
<c:forEach items="${requestScope.allReleasedFilm.data }" var="film">
  <LI><A class="movies-img" href="filmDetail?fno=${film.fno }" 
  target="_blank"><IMG 
  src="image/film/${film.poster }"></A>
  <DIV class="movies-info"><A class="movies-name" href="filmDetail?fno=${film.fno }" 
  target="_blank">${film.fname }</A>
  <DIV class="movies-score">
  <DIV class="star-wrap">
  <DIV class="star"><SPAN style="width: ${film.grade*10 }%;"></SPAN></DIV></DIV><SPAN class="score">${film.grade }</SPAN></DIV>
  <P class="movies-desc">“${film.remark }”</P>
  <P class="movies-style">${film.type }</P>
  <P class="movies-country">${film.location }&nbsp;/&nbsp;${film.runtime }分钟</P>
  <P class="related-link"><A href="filmDetail?fno=${film.fno }" 
  target="_blank">查看详情</A><!--<em>|</em><a href="/?do=film&id=4639#mfilm_douban" target="_blank">看影评</a>--></P></DIV></LI>
  </c:forEach>
  </c:if>
  <!-- 显示所有根据影片名查询的电影 -->
  <c:if test="${requestScope.allReleasedFilmByName ne '' }">
<c:forEach items="${requestScope.allReleasedFilmByName.data }" var="film">
  <LI><A class="movies-img" href="filmDetail?fno=${film.fno }" 
  target="_blank"><IMG 
  src="image/film/${film.poster }"></A>
  <DIV class="movies-info"><A class="movies-name" href="filmDetail?fno=${film.fno }" 
  target="_blank">${film.fname }</A>
  <DIV class="movies-score">
  <DIV class="star-wrap">
  <DIV class="star"><SPAN style="width: ${film.grade*10 }%;"></SPAN></DIV></DIV><SPAN class="score">${film.grade }</SPAN></DIV>
  <P class="movies-desc">“${film.remark }”</P>
  <P class="movies-style">${film.type }</P>
  <P class="movies-country">${film.location }&nbsp;/&nbsp;${film.runtime }分钟</P>
  <P class="related-link"><A href="filmDetail?fno=${film.fno }" 
  target="_blank">查看详情</A><!--<em>|</em><a href="/?do=film&id=4639#mfilm_douban" target="_blank">看影评</a>--></P></DIV></LI>
  </c:forEach>
  </c:if>
  
  </UL>
<DIV class="moviepage">
<DIV id="movie_page" class="pg" bk="mmovies_hot_page">
<SPAN id="page_num">
<c:forEach var="i" begin="1" end="${requestScope.allReleasedFilm.totalPages }" >
<c:if test="${requestScope.allReleasedFilm.currentPage eq i }"><SPAN class="current">${i }</SPAN></c:if>
<c:if test="${requestScope.allReleasedFilm.currentPage ne i }"><A href="displayAllReleasedFilm?currentPage=${i }" rel="">${i }</A></c:if>
</c:forEach>
</SPAN></DIV></DIV></DIV></DIV></DIV>
<SCRIPT>var movieQ = '';
    
    var defVal = '输入影片名称';
    ;(function($){
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
    ;(function($){
        $(function(){
            Qtool.newsuggest({input:'#qf .movie-search-box',
                nameSpace:'cinema_film',
                key:'name',
                url:'/?do=filmsug&city='+city+'&q=',
                tpls:{base:'<div class="cinema_ediv">{name}</div>'},
                style:'#cinema_film .e_suggest_box{border:1px solid #67b3da;}#cinema_film .cinema_ediv{padding-left:5px;line-height:22px;}'});
        }) 
       })(window.jQuery);
    
</SCRIPT>
<!-- 影片列表 end --><!-- 影片列表 end --></DIV></DIV>
<DIV class="col-sub"><!-- 热门影院 start --><!-- 北京热门影院 start -->
<DIV id="mfilmlist_cinema" class="sidebar" bk="">
<DIV class="sidebar-t">
<DIV class="wrap">
<H2>天津热门影院</H2><A href="displayAllCinema" target="_blank">全部&gt;&gt;</A></DIV></DIV>
<DIV class="sidebar-m">
<UL class="s-hot-cinema">
<c:forEach items="${requestScope.listCinema.data }" var="cinema">
  <LI><A class="group-img" href="cinemaDetail?cno=${cinema.cno }" 
  target="_blank"><IMG 
  src="image/cinema/${cinema.logo }"></A>
  <DIV class="group-info"><A class="group-desc" href="cinemaDetail?cno=${cinema.cno }" 
  target="_blank">${cinema.cname }</A>
  <P class="group-tel">${cinema.tel }</P>
  <P> <A href="cinemaDetail?cno=${cinema.cno }" 
  target="_blank">查看详情</A></P></DIV></LI>
</c:forEach>
  </UL></DIV></DIV><!-- 北京热门影院 end --><!-- 热门影院 end --></DIV></DIV></DIV></DIV><!-- 底部 start -->
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
/&gt;</NOSCRIPT><!-- 底部 end --></BODY></HTML>