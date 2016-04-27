<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<%@ include file="/basePath.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="要实习™是远界咨询旗下的实习生招聘网站,专注于提供实习生职位信息,为企业和实习生建立方便快捷的合作通道。" name="description">
<meta content="要实习,实习,要实习招聘,要实习网,实习生招聘,要实习实习生招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 远界咨询官网, 远界百科,跳槽, 高薪职位, 互联网圈子, 招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招" name="keywords">
<title>要实习-专注于实习生招聘的微信平台</title>
<style>
body {
	height: 100%;
	min-height: 700px;
	background: #4e5359 url(/res/weixin/s/bg.png) repeat 0 0;
	color: #666;
	font: 14px/1.5 Helvetica, "微软雅黑", "黑体", Arial, Tahoma;
	text-align: center;
	overflow-y: auto;
}
.main {
	width: 600px;
	margin: 0 auto;
	position: relative;
}
.dd {
	margin-top: 50px;
}
.dd img {
	box-shadow: 0 4px 3px #333333;
	border: none;
}
.i {
	position: absolute;
	top: 100px;
	left: 120px;
	opacity: 0;	   filter:alpha(opacity=0);
	-webkit-transition: all 1s ease-in-out;
	-o-transition: all 1s ease-in-out;
	-moz-transition: all 1s ease-in-out;
	transition: all 1s ease-in-out;
}
.b{ position:absolute;top: 185px;left: 140px;width: 320px;height: 320px;z-index:2; background-color:rgba(0,0,0,0);}
.b:hover{background-color:rgba(0,0,0,0.2);}
.vvvv{
	opacity: 1;  filter:alpha(opacity=100);
	transform: translateX(100%);
	-moz-transform: translateX(100%);-webkit-transition: all 1s ease-in-out;
	-o-transition: all 1s ease-in-out;
	-moz-transition: all 1s ease-in-out;
	transition: all 1s ease-in-out;
	-webkit-transform: translateX(100%);
}
.bbb{opacity: 0;filter:alpha(opacity=0);
	transform: translateX(0%);
	-moz-transform: translateX(0%);
	-webkit-transform: translateX(0%);
	-webkit-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	}
.loginTip{background: url(/res/weixin/s/bg_login_scan2.png) repeat-x scroll 0 0 transparent;
font-size: 12px;
height: 48px;
margin: 10px auto;position: relative;
width:350px;}

.loginTipL{background: url(/res/weixin/s/bg_login_scan1.png) no-repeat scroll 0 0 transparent;
display: block;
float: left;
height: 48px;
margin-left: -26px;
width: 26px;}
.loginTipR{background:  url(/res/weixin/s/bg_login_scan3.png) no-repeat scroll 0 0 transparent;
display: block;
float: right;
height: 48px;
margin-right: -26px;
width: 26px;}
.loginTip p{color: #B4B7BC;font-size: 12px;line-height: 48px;text-shadow: 0 1px 1px #333333;}
.footer{color: #B4B7BC;font-size: 12px;line-height: 48px;text-shadow: 0 1px 1px #333333;position: absolute;
bottom: 20px; left:50%; text-align:center; width:500px; margin-left:-250px;}
.title{padding-top:50px;color:#FFF;font-size: 30px;line-height: 48px;text-shadow: 0 1px 1px #333333;}
</style>
<script type="text/javascript" src="/res/weixin/s/jquery-1.7.1.js"></script>
<script type="text/javascript">
//$(document).ready(function(){
//$('.i').hover(function(){
//   $(this).removeClass("bbb");
//
//    
//  $(this).addClass("vvvv");
//  //$(this).show(3000);//you can give it a speed
//  },
//  function(){
// $(this).addClass("bbb");
// $(this).removeClass("vvvv");
//  });
//});
  $(document).ready(function(){
$('.b').mousemove(function(){
  $('.i').removeClass("bbb");//you can give it a speed
  $('.i').addClass("vvvv");
  });
  $('.b').mouseleave(function(){
    $('.i').addClass("bbb");
	 $('.i').removeClass("vvvv");
  });
	  
	});
  
  
</script>
</head>

<body>
<div class="main">
  <div class="title">
  		走！让全世界帮你找工作！<br>
		 <div style="font-size:20px;color:#c7c8c9">    社交招聘    更快更广</div> 
</div>
  <div class="dd"><img src="/res/weixin/s/jimg.jpg" width="301" height="301"></div>
 <a class="i" ><img src="/res/weixin/s/login.png" width="330" height="490" ></a>
 <div class="b"></div>
 <div class="loginTip"><div class="loginTipL"></div><div class="loginTipR"></div><p>请使用微信扫描二维码，免费制作简历漂流瓶和发布实习职位</p></div>
 
 
</div>
<div class="footer">
©2013-2015要实习网 粤ICP备10202188号-4 深圳市远界信息科技有限公司
 </div>
</body>
</html>