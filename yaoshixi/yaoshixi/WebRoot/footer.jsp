<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<!--脚本信息  -->
<div class="footer">
	     	 <a href="index" class="zy_dd fl">大学生要实习</a><a target="_blank" href="contact.jsp" class="fl cont_us" >联系我们</a>
	     	 <div class="fl" style="padding-left:20px;">©2013-2014要实习网   <a href="http://www.miitbeian.gov.cn" target="_blank">粤ICP备10202188号-4</a></div>
	     	 <div class="to_top fr" ><a onclick="pageScroll()" class="btn_top">回到顶部</a></div>
	     	 <div class="fr gzysx">
	     	    <label>关注要实习社交平台</label><a target="_blank"  href="http://weibo.com/yaoshixi?wvr=5&topnav=1&mod=logo" ><img alt="" src="res/images/xlwb.gif" width="20px" height="20px"></a>
	     	     <a href="http://t.qq.com/iyaoshixi" target="_blank" ><img alt=""  src="res/images/txwb.gif" width="20px" height="20px"></a>
	        </div>
	</div>
<script type="text/javascript">
	var scrolldelay;
		function pageScroll() { 
			window.scrollBy(0,-500); 
			scrolldelay = setTimeout('pageScroll()',100);
			var sTop=document.body.scrollTop+document.documentElement.scrollTop;
			if(sTop==0) clearTimeout(scrolldelay);
		}

</script>
</html>
