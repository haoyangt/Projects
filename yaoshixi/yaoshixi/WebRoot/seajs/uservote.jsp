<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<base href="<%= basePath%>">
<title>要实习-对不起，我们只要奇葩面试！</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<LINK rel="stylesheet" type="text/css" href="res/seajs/jquery.mobile-1.4.2.min.css"></LINK>
<LINK rel="stylesheet" type="text/css" href="res/seajs/Style.css"></LINK>
<LINK rel="stylesheet" type="text/css" href="res/seajs/Layout.css"></LINK>
<LINK rel="stylesheet" type="text/css" href="res/seajs/colorbox.css"></LINK>
<script id="f2ced6d109849795" src="http://static.vote8.cn/JS/jquery.min.js" type="text/javascript"></script>
<script id="a3c5aa933d372de7" src="http://static.vote8.cn/JqueryMobile/jquery.mobile-1.4.2.min.js" type="text/javascript"></script>
<script id="87ef8b1a70a76f9d" src="http://static.vote8.cn/JS/UI.js" type="text/javascript"></script>
<script id="d139c32a368075b7" src="http://static.vote8.cn/JS/jquery.countdown.min.js" type="text/javascript"></script>
<script id="1cfafae21f8c5c6c" src="http://static.vote8.cn/JS/jquery.colorbox-min.js" type="text/javascript"></script>
<script id="178790ed6cfde793" src="http://static.vote8.cn/JS/jquery.json.min.js" type="text/javascript"></script>
<script id="29d0c5973d4afff8" src="http://static.vote8.cn/JS/imgReady.js" type="text/javascript"></script>
<script id="ea4e625dcd640dc5" src="http://static.vote8.cn/JS/Common.js" type="text/javascript"></script>
<script id="e618fa287dabb653" src="http://static.vote8.cn/JS/Front/Mobile/Global.js" type="text/javascript"></script>
<script type="text/javascript">
$.ajax({
	type:'POST',
	url:'<%=request.getContextPath() %>/huoDtouPiao',
	data:{"id":0},
	dataType:'html',
	success:function(html) {
		$("#content_ulOptionList").html(html);
	}
});
</script>
<style type="text/css">
.ui-mobile [data-role=page]{position: static;width:800px;margin:0 auto;}
@media screen and (max-width:600px){
.ui-mobile [data-role=page]{position: static;width:100%;}
}
</style>
</head>
<body>
    <form method="post" action="car" id="theform" >
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTEzMDEyNjM0OTdkZJHySiyBJmIOtSHJkhlJuM/iSSdCJL1X7UB99Za09OV1" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['theform'];
if (!theForm) {
    theForm = document.theform;
}
function doPostBack() {
	var id = $("input:radio[name=VoteOption]:checked").val();
	//alert("投票成功！");
	$.ajax({
		type:'POST',
		url:'<%=request.getContextPath() %>/huoDtouPiao',
		data:{"id":id},
		dataType:'html',
		success:function(html) {
			$("#content_ulOptionList").html(html);
		}
	});
	$("#sfyxs").attr("style","height: 68px;");
	document.getElementById("content_pnlVoteDisabledNotify").style.display="block";
    /* if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    } */
}
//]]>
/* //<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'theform', ['tctl00$content$UpdatePanelComment','content_UpdatePanelComment'], ['ctl00$content$btnPostComment','content_btnPostComment'], [], 90, 'ctl00');
//]]> */
</script>
    <script type="text/javascript">
        //是否允许投票全局变量
        var isQQVerifyDone=true;
        var isWaitTimeDone=true;
        var isGetLocationDone=true;
        //加载次数统计
        var loadTimesCounter=0;
        //listview里面如果有链接，jqm会强制渲染，此处去除jqm的渲染效果
        $(function() {
            $(".OptionList ul li a").removeClass("ui-btn");
            $(".OptionList ul li").addClass("ui-li-static ui-body-inherit");
        });

        //如果屏幕过窄，且投票带图片，将选项标题设为单独一行显示
        $(function() {
            var width=document.body.clientWidth;
            if (width<300 && $(".OptionImageWrapper").length>0) {
                $(".OptionList .OptionTitle").css("display","block");
                $(".OptionList .OptionTitle").css("margin-top","4px");
            }
        });
            



        //更新投票按钮状态
        function UpdateVoteButtonStatus() {
            if (isQQVerifyDone && isWaitTimeDone && isGetLocationDone) {
                EnabledVoteButton(true);
            }
            else {
                EnabledVoteButton(false);
            }
        }

        //强制停留
        var waitTimeBeforeVote = 0;
        $(function () {

            if (waitTimeBeforeVote>0) {
                isWaitTimeDone=false;
                UpdateVoteButtonStatus();
                $(".WaittingMessage").show();
                $(".WaittingMessage span").text(waitTimeBeforeVote.toString());
            }

            for (i = 1; i <= waitTimeBeforeVote; i++) {
                window.setTimeout("updateTimer(" + i + ")", i * 1000);
            }
        });

        //updateTimer
        function updateTimer(num) {
            if (num == waitTimeBeforeVote) {
                isWaitTimeDone=true;
                UpdateVoteButtonStatus();
                $(".WaittingMessage").hide();
            }
            else {
                remainSecs = waitTimeBeforeVote - num;
                $(".WaittingMessage span").text(remainSecs.toString());
            }
        }
        //禁止或启用投票按钮
        function EnabledVoteButton(enabled) {
            $(function () {
                if (enabled) {
                    $("#lbtnVote").show();
                }
                else {

                    $("#lbtnVote").hide();
                }
            });
        }

        $(function () {
            var selectionType = 2;
            var maxVoteQuantity = -1;
            var minVoteQuantity = 1;
            var action='Home';
            $("#lbtnVote").click(function() {
                //选项数量判断
                if (action=='Home') {
                    if (selectionType==1) //单选
                    {
                        if ($("input:radio[name=VoteOption]:checked").val()==undefined) {
                            alert("请选择投票选项。");
                            return false;
                        }
                    }else{ //多选
                        if ($("input:radio[name=VoteOption]:checked").length < minVoteQuantity) {
                            alert("麻烦选一个嘛亲！");
                            return false;
                        }
                        if (maxVoteQuantity!=-1 && $("input:radio[name=VoteOption]:checked").length!=1) {
                            alert("只能选一项目哦亲！");
                            return false;
                        }
                    }
                }

                //必填自定义项目判断
                var isRequiredMiss=false;
                $(".CustomItemWrapper div input:text[class='IsRequired']").each(function(i){
                    if ($(this).val()=="") {
                        var title=$(this).closest("div.CustomItemWrapper").find("label span.CustomItemTitle").text();
                        var message="请填写“" + title + "”";
                        //alert(message);
                        isRequiredMiss=true;
                    }
                });
                if (isRequiredMiss) {
                    return false;
                }
                //更新自定义项目json
               // UpdateCustomItemsJson();
                //验证码-此步骤必须放在后面位置
                if (typeof(IsVerifyCodeInput)=="function") {
                    var rt=IsVerifyCodeInput();
                    if (!rt["verifyResult"]) {
                        if (rt["isShowAlert"]) {
                            alert("请填写验证码。");
                        }
                        return false;
                    }
                }
                //提示信息
                $.mobile.loading('show', {
                    text: '投票中，请稍候...',
                    textVisible: true
                });

            });
        });

        //UpdateCustomItemsJson
        function UpdateCustomItemsJson() {
            var objCustomItems = {};
            $(".CustomItemWrapper").children("div").each(function (i) {
                var content = $(this).find("input:text").val();
                var customItemID = $(this).attr("customItemID");
                objCustomItems[i] = { content: content,customItemID:customItemID };
            });
            var json = $.toJSON(objCustomItems);
            $("#hiddenCustomItems").val(json);
        }
        //条形显示
        $(function() {
            function GetMaxStat(){
                var maxStat=0;
                $("span.Bar").each(function(i){
                    var stat=parseInt($(this).attr("stat"));
                    if (stat>maxStat) {
                        maxStat=stat;
                    }
                });
                return maxStat;
            }
            $("span.Bar").each(function(i){
                var stat=$(this).attr("stat");
                var maxWidth=$(this).width();
                var maxStat=GetMaxStat();
                var barLength=parseInt(maxWidth*stat/maxStat);
                $(this).width(barLength);
                var className="Color_"+(i%8+1).toString();
                $(this).find("i").addClass(className);
            });
        });
            //option colorbox
            $(function() {
                $(".DescriptionLink[isPopupImage='true']").colorbox({
                    maxWidth: "100%",
                    maxHeight: "100%"
                });
            });
            //sms验证码输入
            $(function() {
                $("#hplGetSmsVerifyCode").colorbox({
                    iframe: true , width: '95%', innerHeight: 150, title: '获取验证码短信'
                });
            });
            //email验证码输入
            $(function() {
                $("#hplGetEmailVerifyCode").colorbox({
                    iframe: true , width: '95%', innerHeight: 170, title: '获取验证码邮件'
                });
            });
    </script>
<div data-role="page" >
	<div data-role="header" style="background-color:#007dd1;color:#FFF;text-shadow:none;">
    	<h1 style="margin:0;">要实习-对不起，我们只要奇葩面试！</h1>
    </div>
    <div data-role="content">
		<div class="AD ADTop">
		</div>
    	<div id="content_pnlMain">
	        <!-- <div id="content_pnlDescription" class="Description ContentField">
	           	 经过一周的征集，<b>要实习™</b>见识到了小伙伴们的奇思妙想，妙笔生花。若将此等奇妙设计跟大家分享，想必是极好的。当然，如果你的朋友位列投票专区，您还可以帮ta多多宣传哦～<br>
	           	 所有参与投票并转发到朋友圈的小伙伴们100%参与抽奖，中奖者可获得本网站送出的百元手机充值卡。只要活动一下拇指，三个月的话费就全免啦！
			</div> -->
        	<div class="TitleBar" id="sfyxs" style="">
        		<div id="content_pnlVoteDisabledNotify" class="VoteDisabledNotify" style="display: none;">
    				<span id="content_lbVoteDisabledNotify" class="Success" >已成功投票！</span>
				</div>
				<div style="height: 10px;">  </div>
            	<div id="content_pnlTimelineStatus" class="TimelineStatus" >
                	<span id="content_lbTimelineStatus" >投票已开始,【投票日期】7月22日-7月27日。</span>
				</div>
           	 	<!-- <div id="content_pnlCounter" class="Counter">277</div> -->
        	</div>
        	<div id="content_pnlOptionList " class="OptionList">
            	 <ul id="content_ulOptionList"  data-role="controlgroup"> 
            		
           	</ul> 
			</div>
        	<div class="ContentField WaittingMessage">请先认真查看投票选项，等候<span></span>秒后才能提交投票...</div>
            <script type="text/javascript">
                /***********获取地理位置：开始***********/
                var isLocationLimit = false;
                var isGetLocationViaBrowser = false;
                var isMustGetLocationViaBrowser = false;
                var latitude="";
                var longitude="";
                $(function() {
                    if (isLocationLimit) {
                        isGetLocationDone = false;
                        UpdateVoteButtonStatus();
                        //显示等待定位提示
                        $("#LocationVerifyProcessing").show();
                        if (isGetLocationViaBrowser) {
                            getLocation();
                        }else {
                            checkIsCurrentCityVoteEnabled();
                        }
                    }
                });

                ///检查当前城市是否允许投票
                function checkIsCurrentCityVoteEnabled() {
                    var subjectID = 3472;
                    var geoLocationEncode=$("#hiddenGeoLocationEncode").val();
                    $.getJSON("/Front/Ajax/LocationLimitVerify.ashx",
                        { SubjectID: subjectID, Latitude: latitude, Longitude: longitude,GeoLocationEncode:geoLocationEncode }, function(data){
                            var isCurrentCityVoteEnabled = data.IsCurrentCityVoteEnabled;
                            if (isCurrentCityVoteEnabled) {
                                isGetLocationDone = true;
                                UpdateVoteButtonStatus();
                                showLocationVerifyResult(data.ReturnMessage,"success");
                            }else {
                                showLocationVerifyResult(data.ReturnMessage,"failure");
                            }
                            $("#LocationVerifyProcessing").hide();
                        });
                }

                function getLocation() {
                    if (navigator.geolocation) {
                        navigator.geolocation.getCurrentPosition(savePosition,errorHandle);
                    }else{ 
                        getGeoLocationError("您当前所用浏览器不支持地理位置定位功能，请升级为更高版本的浏览器。");
                    }
                }

                //成功获取经纬度
                function savePosition(position) {
                    latitude=position.coords.latitude;
                    longitude=position.coords.longitude;

                    $.get("/Front/Ajax/EncodeGeoLocation.ashx", { SubjectID: 3472 , Latitude: latitude, Longitude: longitude },
                      function(data){
                          $("#hiddenGeoLocationEncode").val(data);
                          $("#hiddenLatitude").val(latitude);
                          $("#hiddenLongitude").val(longitude);
                          checkIsCurrentCityVoteEnabled();
                      });
                }

                //获取经纬度失败
                function errorHandle(error) {
                    var reloadHhtml='<a href="javascript:;" onclick="location=location;">[刷新重试]</a>';
                    switch (error.code) {
                        case error.PERMISSION_DENIED:
                            getGeoLocationError( "您拒绝了通过浏览器获取位置。" +reloadHhtml);
                            break;
                        case error.POSITION_UNAVAILABLE:
                            getGeoLocationError( "无法通过浏览器获取有效位置。" +reloadHhtml);
                            break;
                        case error.TIMEOUT:
                            getGeoLocationError( "通过浏览器获获取位置超时。" +reloadHhtml);
                            break;
                        case error.UNKNOWN_ERROR:
                            getGeoLocationError( "通过浏览器获获取位置信息失败。" +reloadHhtml);
                            break;
                    }
                }

                //显示当前城市禁止投票信息
                function getGeoLocationError(message) {
                    if (isMustGetLocationViaBrowser) {
                        showLocationVerifyResult(message,"failure");
                        $("#LocationVerifyProcessing").hide();
                    }else{
                        checkIsCurrentCityVoteEnabled();
                    }
                }

                //显示定位相关的错误信息
                function showLocationVerifyResult(message,type) {
                    $("#LocationVerifyResult").show();
                    $("#LocationVerifyResult").html(message);
                    var cssName;
                    switch (type) {
                        case "failure":
                            cssName="LocationVerifyFailure";
                            break;
                        case "success":
                            cssName="LocationVerifySuccess";
                            break;
                    }
                    $("#LocationVerifyResult").addClass(cssName);
                }

                //提示信息
                $(function() {
                    var message;
                    if (isGetLocationViaBrowser) {
                        message='本次投票有地区限制，正在确定您的所在地区，请稍候...<a href="javascript:;" onclick="location=location;">[刷新重试]</a><br />如果浏览器提示请您授权获取地理位置，请点击同意，该信息仅用于判断您是否在允许投票地区。';
                    }else {
                        message='本次投票有地区限制，正在确定您的所在地区，请稍候...<a href="javascript:;" onclick="location=location;">[刷新重试]</a>';
                    }
                    $("#LocationVerifyProcessing").html(message);
                });
                /***********获取地理位置：结束***********/
            </script>
            <div id="LocationVerifyProcessing" class="ContentField" style="display: none;">本次投票有地区限制，正在进行定位，请稍候... <a href="javascript:;" onclick="location=location;">[刷新重试]</a></div>
            <div id="LocationVerifyResult" class="ContentField" style="display: none;"></div>
        	<div id="pnlButtonWrapper" class="ButtonWrapper">
            <div id="content_pnlVerifyCode" class="VerifyCode">
 <script type='text/javascript' charset='utf-8' src='http://js.touclick.com/js.touclick?b=f073e638-9106-43d9-8ed5-03a37550d05e&pf=api&v=v2-2'></script>
<script type='text/javascript'>
    var is_checked = false;
    function tou_submit() {
        if (is_checked === true) {
            return true;
        }else{
            window.TouClick.Start({
                website_key: 'f073e638-9106-43d9-8ed5-03a37550d05e',
                position_code: 0,
                args: { 'this_form': $('form').get(0) },
                //captcha_style: { 'marginLeft': '250px', 'marginTop': '200px' },
                onSuccess: function (args, check_obj) {
                    is_checked = true;
                    var this_form = args.this_form;
                    var hidden_input_key = document.createElement('input');
                    hidden_input_key.name = 'check_key';
                    hidden_input_key.value = check_obj.check_key;
                    hidden_input_key.type = 'hidden';
                    this_form.appendChild(hidden_input_key);
                    var hidden_input_address = document.createElement('input');
                    hidden_input_address.name = 'check_address';
                    hidden_input_address.value = check_obj.check_address;
                    hidden_input_address.type = 'hidden';
                    this_form.appendChild(hidden_input_address);
                    doPostBack();
                },
                onError: function (args) {
                }
            });
            return false;
        }
    }
    function IsVerifyCodeInput() {
        return { verifyResult: tou_submit(), isShowAlert: false };
    }
</script>
		</div>
            <a id="lbtnVote" data-role="button" data-theme="b" href="javascript:doPostBack()">投 票！</a>
	</div>
        <a name="Comment"></a>
        <div id="content_pnlComment" class="Comment">
            <!-- <div class="Sender">
                <input name="ctl00$content$tbCommentContent" type="text" id="content_tbCommentContent" class="CommentInput Blur" placeholder="评论内容..." data-mini="true" />
                <input name="ctl00$content$tbNickname" type="text" id="content_tbNickname" class="NicknameInput Blur" placeholder="您的昵称" data-mini="true" />
                <input type="submit" name="ctl00$content$btnPostComment" value="发表评论" id="content_btnPostComment" class="ButtonGray ButtonPostComment" data-mini="true" />
                <input type="hidden" name="ctl00$content$hiddenFace" id="hiddenFace" value="0" />
            </div> -->
            <!-- <div id="content_UpdatePanelComment">
               <script type="text/javascript">
                   //为确保jquery与updatepanel兼容性，此代码需要在此位置
                   Sys.Application.add_load(function() {
                       if (loadTimesCounter>0) {
                           var offset=$('.Comment').offset().top;
                           $(document).scrollTop(offset);
                       }
                       loadTimesCounter=loadTimesCounter+1;
                   });
               </script>
			AspNetPager 7.3.2  Copyright:2003-2010 Webdiyer (www.webdiyer.com)
			记录总数只有一页，AspNetPager已自动隐藏，若需在只有一页数据时显示AspNetPager，请将AlwaysShow属性值设为true！
			AspNetPager 7.3.2  Copyright:2003-2010 Webdiyer (www.webdiyer.com)
		</div> -->
	</div>
</div>
    <input type="hidden" name="ctl00$content$hiddenRefererUrl" id="content_hiddenRefererUrl" />
    <input type="hidden" name="ctl00$content$hiddenTimeStampEncodeString" id="content_hiddenTimeStampEncodeString" value="2014/7/18 11:07:53,4ca2a6a610bf8de27b6692a99398e3ff" />
    <input type="hidden" name="ctl00$content$hiddenLatitude" id="hiddenLatitude" />
    <input type="hidden" name="ctl00$content$hiddenLongitude" id="hiddenLongitude" />
    <input type="hidden" name="ctl00$content$hiddenGeoLocationEncode" id="hiddenGeoLocationEncode" />
            </div>
<div class="InvisibleCounter">
            <script src="http://s5.cnzz.com/stat.php?id=5855278&web_id=5855278" language="JavaScript"></script>
</div>
           <!--  <div data-role="popup" id="popupDialog">
                <div data-role="header">
                    <h1>提示信息</h1>
                </div>
                <div data-role="content">
                    <p></p>
                    <a href="#" data-role="button" data-rel="back" data-mini="true">确 认</a>
                </div>
            </div> -->
        </div>
    </form>
</body>
</html>
