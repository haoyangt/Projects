<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="要实习™是远界咨询旗下的实习生招聘网站,专注于提供实习生职位信息,为企业和实习生建立方便快捷的合作通道。" name="description">
<meta content="要实习,实习,要实习招聘,要实习网,实习生招聘,要实习实习生招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 远界咨询官网, 远界百科,跳槽, 高薪职位, 互联网圈子, 招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招" name="keywords">
<!-- <meta property="qc:admins" content="22002637076117301016375" />
<meta property="wb:webmaster" content="0b8bc29c69e3fafd" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<!-- <meta name="baidu-tc-verification" content="41dbffbf3db2f940e910480ddef74b25" />
<meta name="baidu-site-verification" content="bQDq1z3HVL" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"> -->
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script src="http://siteapp.baidu.com/static/webappservice/uaredirect.js" type="text/javascript"></script>
<style type="text/css">
	.curre{color:#007dd1;}
</style>
<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50387653-1', 'yaoshixi.com');
  ga('send', 'pageview');

$(document).ready(function(){
	var system ={}; 
	var p = navigator.platform;      
	system.win = p.indexOf("Win") == 0; 
	system.mac = p.indexOf("Mac") == 0; 
	system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);    
	if(system.win||system.mac||system.xll){//如果是电脑跳转到百度 
	    window.location.href="index.jsp"; 
	}else{  //如果是手机,跳转到谷歌
	    window.location.href="<%=request.getContextPath()%>/m/index.jsp"; 
	}
});
</script>
</head>
<body>

</body>
</html>