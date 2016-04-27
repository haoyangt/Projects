<%@page import="com.hy.po.Film"%>
<%@page import="java.util.List"%>
<%@page import="com.hy.vo.PageBean"%>
<%@page import="com.hy.po.Cinema"%>
<%@page import="com.hy.biz.impl.FilmBizImpl"%>
<%@page import="com.hy.biz.IFilmBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HEAD>
<META content="text/html; charset=utf-8" http-equiv="Content-Type">
<TITLE>${requestScope.cinema.cname }-详情页</TITLE><LINK rel="stylesheet" href="css/f2c00656.css">
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
<A class="reward" href="logout?jspComeFrom=cinema_detail&cno=${cinema.cno }&currentPage=${listFilm.currentPage }"><SPAN></SPAN>退出登录</A></DIV></DIV></DIV>
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
	<LINK rel="stylesheet" href="css/mycss.css" type="text/css">
	<script type="text/javascript" src="js/myjs.js" charset="gbk"></script>
 
 <!-- 登录div -->
<div id="window_login" class="window">
<div class="window_title">
	<H2>用户登录</H2>
	<a href = "javascript:void(0)" onclick = "closeLoginWindow()"><SPAN class=window_close></SPAN></a>
</div>
<div class="window_content">
<form action="login?jspComeFrom=cinema_detail&cno=${cno }&currentPage=${listFilm.currentPage }" method="post">
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
<form action="register?jspComeFrom=cinema_detail" method="post">
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
<form action="changePwd?jspComeFrom=cinema_detail&cno=${cno }&currentPage=${listFilm.currentPage }" method="post">
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

<DIV clas="wrapper clearfix"><!-- 影视导航 start -->
<DIV id="mindex_menu" class="menu-wrap" bk="">
<DIV class="menu-movie clearfix">
<H2><A href="./index.jsp">电影频道</A></H2>
<UL>
  <LI class="menu-index"><A href="./index.jsp"></A></LI>
  <LI class="menu-film"><A href="./film_released.jsp"></A></LI>
  <LI class="menu-cinema"><A class="current" href="./cinema_list.jsp"></A></LI></UL></DIV></DIV><!-- 影视导航 end -->
<DIV class="content-wrap">
<DIV class="layout grid-960">
<DIV class="col-main">
<DIV class="main-wrap"><!-- 影院详情 start --><!-- 影院 start -->
<DIV class=cinema>
<DIV class=cinema-img><IMG 
src="image/cinema/${requestScope.cinema.logo }"> </DIV>
<DIV class=cinema-info>
<H3><SPAN>${requestScope.cinema.cname }</SPAN> <SPAN class=score>${requestScope.cinema.grade }</SPAN> <A 
class=schedule-link 
href="http://tuan.360.cn/?do=cinema&amp;id=5551#mcinema_schedule">【查看影院排期】</A> 
</H3>
<DIV class=service-icon><A id=movie_seatonline class=seat-selection1 
href="#">在线选座</A><font color="grey" size="1"> (营业时间：${requestScope.cinema.openinghours })</font> </DIV>
<DL>
  <DT>地址：</DT>
  <DD>${requestScope.cinema.location }</DD></DL>
<DL>
  <DT>电话：</DT>
  <DD>${requestScope.cinema.tel }</DD></DL>
<DL>
  <DT>线路：</DT>
  <DD>${requestScope.cinema.route }</DD></DL>
<P class=service-icon></P></DIV></DIV>
<!-- 弹出订票窗口 -->
<style> 
        .black_overlay{ 
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
        .window_ticketselection { 
            display: none; 
            position: absolute; 
            top: 65%;
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
<P>影片：<STRONG id=movie_filmname>${requestScope.fname }</STRONG></P>
<P>影院：<STRONG id=movie_cinemaname>${requestScope.cinema.cname }</STRONG></P>
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
<form action="getseatsequence?jspComeFrom=cinema_detail&cno=${cno }&currentPage=${listFilm.currentPage }" method="post" id="datas">
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
<form action="buyticket?jspComeFrom=cinema_detail&cno=${cno }&tno=${tno }&currentPage=${listFilm.currentPage }" method="post">
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


<SCRIPT type=text/javascript>
    
    ;(function($){
        $(function(){
            $("#movie_seatonline").live("click",function(){
                var obj = $("#movie_area .block-tag li").eq(0);
                obj.click(); 
                $(document.body).scrollTop(obj.offset().top);
                return false;
            });
                }); 
    })(window.jQuery);

    
</SCRIPT>

<DIV id=movie_area class=block-box bk>
<DIV class=block-hd>
<UL class=block-tag>
  <LI class=current><A 
  href="http://tuan.360.cn/?do=cinema&amp;id=5551#"><SPAN>在线选座</SPAN></A> </LI>
  <LI><A href="http://tuan.360.cn/?do=cinema&amp;id=5551#"><SPAN>影院介绍</SPAN></A> 
  </LI></UL></DIV>
<DIV class="block-bd default">
<DIV style="DISPLAY: block" class="block-item cinemaSchedule">
<DIV class=cinemaSchedule-hd>
<H2>${requestScope.cinema.cname }</H2>
</DIV>
<DIV id=moviePlans>
<DIV id=otherlist>
<UL class=cinema-schedule>
<%int count=0; %>
<c:forEach items="${requestScope.listFilm.data }" var="film">
  <LI hover="current"><A class=movies-img 
  href="filmDetail?fno=${film.fno }" target=_blank><IMG 
  src="image/film/${film.poster }"></A> 
  <DIV class=movies-info>
  <P class=movieName><A 
  href="filmDetail?fno=${film.fno }" 
  target=_blank>${film.fname }</A><SPAN class=movies-time><c:set var="rdate" value="${film.rdate }"></c:set>${fn:substring(rdate,0,10) }上映</SPAN></P>
  <DL>
    <DT>主演：</DT>
    <DD>${film.protagonist }</DD></DL>
  <DL>
    <DT>导演：</DT>
    <DD>${film.director }</DD></DL>
  <DL>
    <DT>时间：</DT>
    <DD>
    <% 
    	//获取cno
    	int cno=((Cinema)request.getAttribute("cinema")).getCno();
    	//获取fno
    	IFilmBiz fb=new FilmBizImpl();
    	List<Film> listFilm=((PageBean)request.getAttribute("listFilm")).getData();
    	int fno=listFilm.get(count).getFno();
    	//计数器自增
      	count++;
    	//调用函数，获取放映时间字符串
    	String time=fb.findFilmShowtime(fno, cno);
    	
    %>
    <%=time %>
    </DD></DL>
    
    <A  class="seat-selection1" 
  href="displayTicketInCinemaDetail?cno=${cinema.cno}&fno=${film.fno }&currentPage=${requestScope.listFilm.currentPage }&random=<%=(int)(Math.random()*100) %>#movie_area"   >在线选座</A>
  </DIV>
   
  
  <DIV class="ranking cinemaSchedule-ranking">
  <DIV class="wrap clearfix">
  <DIV class=movies-score>
  <P class=star><SPAN style="WIDTH: ${film.grade*10 }%"></SPAN></P><SPAN 
  class=score>${film.grade }</SPAN> </DIV></DIV></DIV></LI>
</c:forEach>
</UL>
<DIV class="moviepage">
<DIV id="movie_page" class="pg" bk="mmovies_hot_page">
<SPAN 
id="page_num2">
<c:forEach var="i" begin="1" end="${requestScope.listFilm.totalPages }" >
<c:if test="${requestScope.listFilm.currentPage eq i }"><SPAN class="current">${i }</SPAN></c:if>
<c:if test="${requestScope.listFilm.currentPage ne i }"><A href="cinemaDetail?cno=${cinema.cno }&currentPage=${i }#movie_area" rel="">${i }</A></c:if>
</c:forEach>
</SPAN></DIV></DIV>
</DIV></DIV></DIV>
<DIV class="block-item movieInfo cinemaInfo">
<DIV class=movieDesc>
<H2>影院介绍</H2>
<P 
id=movie_short>${requestScope.cinema.introduction }</P></DIV>
<DIV class=movieStills>
<H2>影院图片</H2>
<DIV id=movie_picscroll class=stills>
<DIV id=movie_pic class=stills-big hover="stills-big-hover"><A class=pre 
href="http://tuan.360.cn/?do=cinema&amp;id=5551#">
<P></P><SPAN></SPAN></A><A class=next 
href="http://tuan.360.cn/?do=cinema&amp;id=5551#">
<P></P><SPAN></SPAN></A>
<DIV class=movie_wp>
<UL style="MARGIN-LEFT: 0px">
<c:set var="images" value="${requestScope.cinema.image }"></c:set>
<c:forEach items="${fn:split(images,';') }" var="image">
  <LI><IMG src="image/cinema/${image }"> </LI>
</c:forEach>
</UL></DIV></DIV>
<DIV id=movie_smallpic class=stills-small>
<UL class="stills-smallList clearfix">
<c:set var="images" value="${requestScope.cinema.image }"></c:set>
<c:forEach items="${fn:split(images,';') }" var="image">
  <LI><IMG src="image/cinema/${image }" height="60px" width="80px"> </LI>
</c:forEach>
</UL></DIV></DIV></DIV>
<DIV class=movieDesc>
<H2>优惠信息</H2>
<P 
id=movie_short>${requestScope.cinema.remark } </P></DIV></DIV>
<SCRIPT>
            
            $('#more-other a').live('click',function(){
                $('#more-other').hide();
                $('#otherlist').show();
                return false;
            });
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
            
        </SCRIPT>
</DIV></DIV></DIV></DIV>
<DIV class=col-sub><!-- 影院地图 start -->
<DIV class=sidebar>
<DIV class=sidebar-t>
<DIV class=wrap>
<H2>影院位置</H2></DIV></DIV>
<DIV id=goodsmap class=cinema-map>
<DIV isd="goodsmap"></DIV></DIV><!--    <div class="cinema-map-ft"><a href="" target="_blank">查看完整地图</a></div>--></DIV>
<input type="hidden" id="latitude" value="${requestScope.cinema.latitude }">
<input type="hidden" id="longitude" value="${requestScope.cinema.longitude }">
<SCRIPT src="js/js.js"></SCRIPT>

<SCRIPT>
    
    $(function(){
        var latitude,longitude;
        try{
        	latitude=document.getElementById("latitude").value;
        	longitude=document.getElementById("longitude").value;
        }catch(e){}
        if(!latitude || !longitude) return ;
        var latlng = new google.maps.LatLng(+latitude,+longitude);
        var mapIns =  new google.maps.Map(document.getElementById('goodsmap'), {
            center:latlng,
            scaleControl:false,
            streetViewControl:false,
            navigationControl:true,
            mapTypeControl:false,
            zoom: 13,
            mapTypeId: 'roadmap',
            mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU}
        });
        var marker = new google.maps.Marker({
            map: mapIns,
            position:latlng
        });
    });
    
</SCRIPT>
<!-- 影院地图 end --></DIV></DIV></DIV>
<DIV><!-- 底部 start -->
<SCRIPT type=text/javascript 
src="js/newfeedback2.js"></SCRIPT>

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

<STYLE>.footer {
	TEXT-ALIGN: center; LINE-HEIGHT: 22px; MARGIN: 0px auto; WIDTH: 960px; CLEAR: both; PADDING-TOP: 40px
}
.footer A {
	MARGIN: 0px 5px; COLOR: #2e74d3
}
</STYLE>

<DIV class="footer"><A href="displayIndex" ></A>
<P>Copyright@Tian Haoyang,TJNU                 &nbsp;&nbsp;<A class="fgray" href="http://www.miibeian.gov.cn/"></A></P>
</DIV>
<SCRIPT src="js/m_v3.js" $end_footer$></SCRIPT>

<SCRIPT src="js/emonitor.js"></SCRIPT>

<SCRIPT $merger$>
    
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
<NOSCRIPT></NOSCRIPT><!-- 底部 end -->
<SCRIPT>
        var cinemaId = '5551';
        var city = 'tian_jin';
        var fid = '0';
    </SCRIPT>

<SCRIPT type=text/javascript 
src="js/movielist.js"></SCRIPT>
</DIV></DIV>

</BODY></HTML>