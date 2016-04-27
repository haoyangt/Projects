<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>要实习-对不起，我们只要奇葩面试！</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="format-detection" content="telephone=no"/>
<base href="<%= basePath%>">
<link rel="stylesheet" href="res/seajs/index.css"/>
</head>
<body>
    <div class="km-page-slide">
        <div id="theme">
            <div class="theme-con">
                <div class="theme-bg">

                </div>
                <div class="logo anim">
                    <img src="res/images/assets/logo.png" alt="Alibaba group"/>
                </div>
                <div class="year2014 anim0">
                    <img src="res/images/assets/kindel.png" alt="">
                </div>
                 <div class="ued anim1"><img src="res/images/assets/yqhr.png" alt="" ></div> 
               <!--  <div class="zhaopin anim1"><img src="" alt="" style="width:90px;"></div> -->
            </div>

        </div>
        <div class="arrow">
            向上滑动
        </div>
        <div style="position:absolute;width:100%;left:0;bottom:0px;text-align:left;height:48px;">
         	<img src="res/images/assets/wenxinjiemian_acc_10.png" alt="" style="width:100px;">
        </div>
    </div>
    <div class="km-page-slide arrow-up">
        <div id="position-detail" >
             <div class="recruitment-img">
                <img src="res/images/assets/pimg1.png" alt=""/>
            </div>
            <div class="recruitment-time">
                <img src="res/images/assets/pimg3.png" alt=""/>
            </div>
        </div>
     </div>
     <div class="km-page-slide  arrow-up">
        <div id="team">
            <div class="teamWrap" >
                <div class="teamImgs">
                  <ul>
                    	<li class="J_teamImg"><img src="res/images/assets/biaotitou.png" alt="" class="smwz"></li>
                    	<li class="J_teamImg" onclick="yaoqiu()"><img src="res/images/assets/yaoqiu.png" style="float: right;width:60px;margin-top:10px;" alt=""></li>
                        <li class="J_teamImg"><img src="res/images/assets/toux.png"  alt="" class="imgtx"></li>
                     </ul>
                </div>
                <div class="info">
  					
                </div>
               <div class="flipsnap"><!-- 这个div不要删 --></div>
            </div>

        </div>
    </div>
    
    <div class="km-page-slide  arrow-up">
        <div id="position-detail" >
            <div ><img src="res/images/assets/page4.png" alt="" style="width:100%;"/></div>
            <div class="recruitment-dfj">
                <img src="res/images/assets/fdj.png" alt="">
            </div>
            <div class="recruitment-sj">
                <img src="res/images/assets/pa4.png" alt=""/>
                 <div onclick="shili()" style="position: absolute;left:65px;bottom:20px;"><img src="res/images/assets/shil.png" style="width:60px;" alt=""/></div>
                <a style="position: absolute;right:45px;bottom:20px;" onclick="toupiaojs()"><img src="res/images/assets/kssj.png" style="width:130px;" alt=""/></a>
                <!-- href="openLogin/user/friendAnswer.jsp" -->
            </div>
        </div>
    </div>
   <!--  <div class="km-page-slide arrow-up">
        <div id="arrangement">
            <h1>UED 专场宣讲院校与时间</h1>
            <div class="arrangemenBox">
                    <ul class="arrangementGroup">
                        <li class="J_step step1">
                            <span class="city">杭州</span><span class="time"><span class="mon">3</span> 月 <span class="day">20</span> 日 </span>
                        </li>
                        <li class="J_step step2">
                            <span class="time"><span class="mon">3</span> 月 <span class="day">20</span> 日 </span><span class="city">西安</span>
                        </li>
                        <li class="J_step step3">
                            <span class="city">无锡</span><span class="time"><span class="mon">3</span> 月 <span class="day">25</span> 日 </span>
                        </li>
                        <li class="J_step step4">
                            <span class="time"><span class="mon">3</span> 月 <span class="day">26</span> 日 </span><span class="city">广州</span>
                        </li>
                        <li class="J_step step5">
                            <span class="city">上海</span><span class="time"><span class="mon">3</span> 月 <span class="day">26</span> 日 </span>
                        </li>
                        <li class="J_step step6">
                            <span class="time"><span class="mon">3</span> 月 <span class="day">27</span> 日 </span><span class="city">北京</span>
                        </li>
                        <li class="J_step step7">
                            <span class="city">长沙</span><span class="time"><span class="mon">3</span> 月 <span class="day">27</span> 日 </span>
                        </li>
                        <li class="J_step step8">
                            <span class="time">待定</span><span class="city">香港</span>
                        </li>
                    </ul>
            </div>

            <div class="desc">参与宣讲会现场互动，与 UED 大咖面对面，还有机会获得直通面试机会！</div>
        </div>
    </div>   -->
	
	<!-- <div class="km-page-slide arrow-down arrow-up">
		<div id="arrangement">
			<h1>投票系统</h1>
			<div class="arrangemenBox">
				<ul class="arrangementGroup">
					<li>sdsdsds</li>
				</ul>
			</div>
			<div class="desc">参与宣讲会现场互动，与 UED 大咖面对面，还有机会获得直通面试机会！</div>
		</div>
	</div>  -->
	
  <!--  <div class="km-page-slide arrow-down arrow-up">
        <div id="position-detail"> -->
           <!--  <div class="position-info">
                <img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1_P87FDtZXXXb4LL1-446-90.png" alt=""/>
            </div>
            <div class="recruitment-time">
                <img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T148CFFwxcXXX72Ukr-640-398.png" alt=""/>
            </div> 
             <div class="position-detail-info">
                <div class="intro">
                    <h2>UED 实习生职位</h2>
                    <p class="desc">
                        主要面向即将毕业于2015年及以后的本科、硕士、博士学生
                    </p>
                </div>
                <div class="position-list">-->
                    <!-- <div class="flipsnap">
                        <div class="J_PositionDetailItem item currentFlipItem" data-index="0" data-type="vd"><img
                                src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1jYuuFtNjXXavIYAB-191-231.png" alt=""/></div>
                        <div class="J_PositionDetailItem item" data-index="1" data-type="id"><img
                                src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1glPnFvdbXXavIYAB-191-231.png" alt=""/></div>
                        <div class="J_PositionDetailItem item" data-index="8" data-type="urdsdfs"><img
                                src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1moWAFAtcXXavIYAB-191-231.png" alt=""/></div>
                        <div class="J_PositionDetailItem item" data-index="3" data-type="fe"><img
                                src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1CFGkFtxgXXavIYAB-191-231.png" alt=""/></div>
                   </div> -->
                <!-- </div>
               <div class="title">
                    <h3>视觉设计师</h3>
                </div>
            </div> -->
<!--         </div>
    </div>  -->

   <!-- <div class="km-page-slide arrow-up">
        <div id="welcome">
            <div class="welcomeWrap">
                <div class="uedImages">
                    <div class="image left step1"><img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1gzYnFx4dXXbwW_3t-185-219.png" alt="">
                    </div>
                    <div class="image right step1"><img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1kkHnFsBdXXbwW_3t-185-219.png" alt="">
                    </div>
                    <div class="image left step2"><img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1w9GlFBFdXXbwW_3t-185-219.png" alt="">
                    </div>
                    <div class="image right step2"><img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1u3mqFvJdXXbwW_3t-185-219.png" alt="">
                    </div>
                    <div class="image left step3"><img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1258UFpJlXXbwW_3t-185-219.png" alt="">
                    </div>
                    <div class="image right step3"><img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1.R01FvxrXXbwW_3t-185-219.png" alt="">
                    </div>
                </div>
                <a class="link"
                   href="http://v.youku.com/v_show/id_XNjg0OTUxNzUy.html">
                    <img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1BQTlFD4cXXavOdDF-577-114.png" alt=""
                        style="width:280px; margin-bottom:7px;">
                </a>
                <a class="link" href="http://campus.alibaba.com/">
                    <img src="http://g.tbcdn.cn/tb/joinued/1.0.4/img/T1y8abFuBeXXavOdDF-577-114.png" alt=""
                        style="width:280px; margin-bottom:25px;">
                </a>

                <div class="manifesto">
                    <div class="title">让我们一起<br>创造触动<br>人心的设计<br>！！！</div>
                </div>
            </div>

        </div>
    </div> -->
   <div id="J_alert" class="ecc-alert" style="display: none;">
	<div class="mask"></div>
	<div class="msgbox alert">
		<div class="msg">
			 <div class="info-title">
				<div class="desc">
					<img src="res/images/assets/wenxinjiemian_acc_10.png">
				</div>
				<h3>要求</h3>
			</div>
			<div class="info-main">
				<p>设计包含面试职位、面试形式、面试描述等，并说明你设计的目的是为了考察面试者哪方面的技能或能力。要求条理清晰，具备可实现性。</p>
				<p></p>
			</div>
		</div>
		<div class="button-panel">
			<a class="button button-close" onclick="clockAll()">×</a>
		</div>
	</div>
 </div>
 <div id="J_alert2" class="ecc-alert" style="display: none;">
	<div class="mask"></div>
	<div class="msgbox alert">
		<div class="msg">
		    <div class="info-title">
				<div class="desc">
					<img src="res/images/assets/wenxinjiemian_acc_10.png">
				</div>
				<h3>示例</h3>
			</div>
			<div class="info-main" style="-webkit-overflow-scrolling:touch;">
				<p><b>面试职位：</b>销售</p>
				<p><b>设计目的：</b>考查面试者的推销能力</p>
				<p><b>面试形式：</b>一对一单独面试</p>
				<p><b>面试描述：</b>面试官给面试者一支笔，要求面试者要想尽一切办法向他推销这一支笔。</p>
				<p><b>参考思路：</b>面试者会先设定一个紧急情景，急需面试官在一份文件上签名确认，在面试官没有笔又要签名的情况下，只能买下这一支笔。</p>
			</div>
			 <!-- <img src="res/images/assets/ct3.png" alt="" style="width:100%"/> -->
		</div>
		<div class="button-panel">
			<a class="button button-close" onclick="clockAll2()">×</a>
		</div>
	</div>
 </div>
<script src="res/seajs/sea.js"></script>
<script type="text/javascript">
 seajs.config({
     paths: {
        assets: "http://g.tbcdn.cn/tb/joinued/1.0.4",
     }
 });
 seajs.use("assets/pages/index/main");
 function yaoqiu(){
	 document.getElementById("J_alert").style.display="block";
 }
 function clockAll(){
	 document.getElementById("J_alert").style.display="none";
 }
 function shili(){
	 document.getElementById("J_alert2").style.display="block";
 }
 function clockAll2(){
	 document.getElementById("J_alert2").style.display="none";
 }
 function toupiaojs(){
	 alert("对不起，该活动已经结束！");
 }
</script> 

</body>
</html>