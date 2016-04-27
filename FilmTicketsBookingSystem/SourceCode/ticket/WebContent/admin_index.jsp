<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
<LINK rel="stylesheet" href="css/f2c00656.css">
</head>
<body style="background-color: #EFEFEF">
<SCRIPT src="js/183.js"></SCRIPT>
<SCRIPT src="js/f2c00656.js"></SCRIPT>
<!-- 导航顶部 start -->
<DIV class="detail_head_wrap" bk="top_tuan_nav">
<DIV class="detail_head"><A class="detail_logo" href="index.jsp"></A>
<DIV id="tuan_nav" class="detail_nav" bk="">
您好[&nbsp;<strong>${sessionScope.user.permission.pname }</strong>&nbsp;]，今天是${sessionScope.now }
</DIV>
<DIV class="detail_mytuan"><A class="mytuan_link" 
href="#"><SPAN id="checkLogin"><!--此处需做判断： 登录后class为islogin；未登录class为islogout --></SPAN>

  ${sessionScope.user.username }
<SPAN 
class="icon"></SPAN></A>
<DIV class="menu_wrap">
<DIV class="menu_bd">
<A class="reward" href="logout?jspComeFrom=index"><SPAN></SPAN>退出登录</A></DIV></DIV></DIV>
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
    

<ul>
	<c:forEach items="${sessionScope.user.permission.percontent }" var="menu">
		<li><a href="${menu.purl }" target="myframe" class="seatSub">${menu.pname }</a></li>
	</c:forEach>
</ul>
<div style="text-align: center;border: 0px 0px;" >
<iframe name="myframe"  height=550px; width=99%; style="background-color: #FFFF00;"></iframe>
</div>
</body>
</html>