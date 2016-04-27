 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>我的简历-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script>
<script src="res/js/require.js"></script>
<!-- 提醒插件 -->
	<script type="text/javascript">
	$(function(){
		$("#bangzhu").removeClass("licurrent");
		$("#forum").removeClass("licurrent");
		$("#companys").removeClass("licurrent");
		$("#indexSy").removeClass("licurrent");
		$("#release").removeClass("licurrent");
		$("#manage").removeClass("licurrent");
		$("#Resume").addClass("licurrent");
		validateUtil.init($(document));
		/* $('input, textarea').placeholder(); */
	});
		function perfectResume() {
			showEdit('#jbShowDiv', '#jbEditDiv');
			showEdit('#jyShowDiv', '#jyEditDiv');
			showEdit('#msShowDiv', '#msEditDiv');
			showEdit('#frShowDiv', '#frEditDiv');
		}
	</script>
</head>

<body  class="body_cs">
	<div id="body">
		
		<!-- 顶部 LOGO、登录部分  -->
		<%@include file="/header.jsp" %>
		
	   <div id="main"> 
	   
	   	<!-- 左边导航 -->
		<%@include file="/banner_zw.jsp" %>
	   
	    <div class="container">
        
        <div class="kt_zw">
       		<!-- <div class="login_top fl">
            	<div class="jl_title">我的简历</div>
            </div> -->
          	 <div class="kt_bo">
             	<div class="jl_top">
             		<input type="hidden" id="userId" value="${userId }"/>
                	<div class="jl_ne">
                		<div class="jl_on"><div class="jl_bg2"><label class="f18">我的简历</label></div><div class="jl_bg3"></div></div>   	
                    	<div class="jlimg">
                    	    <label class="fins">${finish}</label> ${ratio}<!-- <img src="res/images/jd.png" width="117" height="106"/> -->
                    	 </div>
                        <div class="jlxq">
                        	<p>工作经历最能体现自己的工作能力，且完善后才可投递简历哦</p>
                            <p style="height:25px;"><input type="button" onclick="perfectResume();" value="马上去完善" class="btn_style1">
                             	<input type="button" onclick="previewResume();" value="预览" class="btn_style1"></p>
                            <p style="height:6px;">简历设置：
	                            <input type="radio" <c:if test="${userBasicInfo.expose==2 }"> checked="checked" </c:if> name="expose" onchange="exposeSet(2)" >公开
	                            <input type="radio" <c:if test="${userBasicInfo.expose==1 }"> checked="checked" </c:if> name="expose" onchange="exposeSet(1)">不公开
	                        </p>
                            <p style="height:2px;">公开个人简历能让各个企业的HR查看简历信息，主动邀请给予实习机会。</p>
                             <a href="user/preview/hh" target="_blank" id="preview" class="hover_b"></a>
                        </div>
                    </div>
                </div>
             	
               <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">基本信息</div>
                 	<div id="userBasicInfoDiv">
                 	 	<%@include file="resumeBasicInfoModel.jsp" %>
                 	</div>
                 </div>
               </div>
             
             <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">教育背景（投递简历时必填）</div>
                    <div id="educationDiv" style=" position: relative;">
                    	<%@include file="resumeEducationModel.jsp" %>
                    </div>
                 </div>
               </div>
             
            <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">社团实践</div>
                    <div id="socialDiv" style=" position: relative;">
                    	<%@include file="socialPractice.jsp" %> 
                    </div>
                 </div>
               </div>
               
             <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">实习经历</div>
                    <div id="experienceDiv" style=" position: relative;">
                    	<%@include file="experience.jsp" %> 
                    </div>
                 </div>
               </div>
               
             <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">获奖情况</div>
                    <div id="awardDiv" style=" position: relative;">
                    	<%@include file="schoolAward.jsp" %> 
                    </div>
                 </div>
               </div>
               
               <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">职业技能</div>
                    <div id="vocationalSkillsDiv" style=" position: relative;">
                    	<%@include file="vocationalSkills.jsp"%> 
                    </div>
                 </div>
               </div>
             
             	<%-- <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">自我描述</div>
                    <div id="selfDescDiv">
                    	<%@include file="resumeSelfDesc.jsp" %>
                    </div>
                 </div>
               </div> --%>
               
               <div class="jl_qt">
               	 <div class="qt_l">
                 	<div class="js_n">简历附件</div>
                    <div id="fileResumeDiv" style=" position: relative;">
                   		<%@include file="fileResume.jsp" %> 
                    </div>
                 </div>
               </div>
               
               
             </div>
           <div style="clear:both"></div>
        </div>
    
    </div>
	    <%@include file="/footer.jsp" %>
	    <%-- <!-- 二维码扫一扫 -->
	    <%@include file="/scanner.jsp" %>
	     --%>
	 </div>
	 <div style="clear:both"></div>
	</div>
</body>
<script type="text/javascript">

function showEdit(hideDiv, showDiv){
		$(hideDiv).hide();
		$(showDiv).show();
}
function previewResume(){
	document.getElementById("preview").click();
}

function trim(str) {
    return (str + '').replace(/(\s+)$/g, '').replace(/^\s+/g, '');
}

function strlen(str) {
    var str = trim(str);
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        len += str.charCodeAt(i) > 0 && str.charCodeAt(i) < 255 ? 0.5 : 1;
    }
    return len;
}

function exposeSet(num){
	$.ajax({
		type:'POST',
		url:'user/exposeSet',
		data:{"num":num},
		dataType:'json',
		success:function(json){
			alert(json.msg);
		}
	}); 
}
</script>
</html> 