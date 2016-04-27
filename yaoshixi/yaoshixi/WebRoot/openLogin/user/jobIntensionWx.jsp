<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/weixin.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<link href="http://www.yaoshixi.com/res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript">
$(function(){
	validateUtil.init($(document));
	/* $('input, textarea').placeholder(); */
});
function objSelect0(){
var category0 = document.getElementById("category0").value;
var objSelect1 = document.getElementById("category1");
var objSelect2 = document.getElementById("category2");
    for (var i = 0; i < objSelect1.options.length; i++) {       
        if (objSelect1.options[i].value == category0) {       
        	objSelect1.options.remove(i);       
            break;       
        }       
    } 
    for (var i = 0; i < objSelect2.options.length; i++) {       
        if (objSelect2.options[i].value == category0) {       
        	objSelect2.options.remove(i);       
            break;       
        }       
    }
}
function objSelect1(){
	var category1 = document.getElementById("category1").value;
	var objSelect0 = document.getElementById("category0");
	var objSelect2 = document.getElementById("category2");
    for (var i = 0; i < objSelect0.options.length; i++) {       
        if (objSelect0.options[i].value == category1) {       
        	objSelect0.options.remove(i);       
            break;       
        }       
    } 
    for (var i = 0; i < objSelect2.options.length; i++) {       
        if (objSelect2.options[i].value == category1) {       
        	objSelect2.options.remove(i);       
            break;       
        }       
    }
}
function objSelect2(){
	var category2 = document.getElementById("category2").value;
	var objSelect0 = document.getElementById("category0");
	var objSelect1 = document.getElementById("category1");
    for (var i = 0; i < objSelect0.options.length; i++) {       
        if (objSelect0.options[i].value == category2) {       
        	objSelect0.options.remove(i);       
            break;       
        }       
    } 
    for (var i = 0; i < objSelect1.options.length; i++) {       
        if (objSelect1.options[i].value == category2) {       
        	objSelect1.options.remove(i);       
            break;       
        }       
    }
}

function saveBasicInfo(){
	var jobCity = $('#jobCity').val();
	if(jobCity != null && jobCity != ''){
		$("#saveQw").click();
	}else{
		$("#Spansd").text("带*号内容未填写完整！");
	}
}
</script>
</head>
<body>
<div class="weixin_body">
<div class="main_j">
<div id="jbEditDiv">
    <div>
        <form action="user/saveJobIntensionWx" id="userBasicForm" >
         <div class="login_top">希望职位所在城市:<br/>
         	<input name="userBasicInfo.jobCity" id="jobCity" value="${userBasicInfo.jobCity }" type="text" style="width:100%" validate="required::请输入希望职位所在城市" placeholder="希望职位所在城市" class="login_input">
         </div>
         <div class="login_top">希望职位类别:<span class="kt_font_x">(可选3个)</span><br/>
         	<%-- <input name="userBasicInfo.category" id="category" value="${userBasicInfo.category }" type="text"  style="width:100%" validate="required::请输入希望职位类别" placeholder="希望职位类别" class="login_input"> --%>
         	<select name="userBasicInfo.category" id="category0" onchange="objSelect0();" style="width:30%" class="login_input">
				<option value="会计/出纳" <c:if test="${category0=='会计/出纳' }">selected="selected"</c:if>>会计/出纳</option>
				<option value="财务" <c:if test="${category0=='财务' }">selected="selected"</c:if>>财务</option> 
				<option value="审计" <c:if test="${category0=='审计' }">selected="selected"</c:if>>审计</option> 
				<option value="金融" <c:if test="${category0=='金融' }">selected="selected"</c:if>>金融</option> 
				<option value="技术研发" <c:if test="${category0=='技术研发' }">selected="selected"</c:if>>技术研发</option>
				<option value="文员" <c:if test="${category0=='文员' }">selected="selected"</c:if>>文员</option>
				<option value="咨询/顾问" <c:if test="${category0=='咨询/顾问' }">selected="selected"</c:if>>咨询/顾问</option>
				<option value="产品" <c:if test="${category0=='产品' }">selected="selected"</c:if>>产品</option>
				<option value="运营" <c:if test="${category0=='运营' }">selected="selected"</c:if>>运营</option>
				<option value="质量管理" <c:if test="${category0=='质量管理' }">selected="selected"</c:if>>质量管理</option>
				<option value="项目管理" <c:if test="${category0=='项目管理' }">selected="selected"</c:if>>项目管理</option>
				<option value="销售" <c:if test="${category0=='销售' }">selected="selected"</c:if>>销售</option>
				<option value="客服" <c:if test="${category0=='客服' }">selected="selected"</c:if>>客服</option>
				<option value="商务拓展" <c:if test="${category0=='商务拓展' }">selected="selected"</c:if>>商务拓展</option>
				<option value="渠道/分销" <c:if test="${category0=='渠道/分销' }">selected="selected"</c:if>>渠道/分销</option>
				<option value="客户服务" <c:if test="${category0=='客户服务' }">selected="selected"</c:if>>客户服务</option>
				<option value="市场营销" <c:if test="${category0=='市场营销' }">selected="selected"</c:if>>市场营销</option>
				<option value="公关" <c:if test="${category0=='公关' }">selected="selected"</c:if>>公关</option>
				<option value="生产/制造" <c:if test="${category0=='生产/制造' }">selected="selected"</c:if>>生产/制造</option>
				<option value="编辑/文案" <c:if test="${category0=='编辑/文案' }">selected="selected"</c:if>>编辑/文案</option>
				<option value="管理" <c:if test="${category0=='管理' }">selected="selected"</c:if>>管理</option>
				<option value="人力资源" <c:if test="${category0=='人力资源' }">selected="selected"</c:if>>人力资源</option>
				<option value="法律" <c:if test="${category0=='法律' }">selected="selected"</c:if>>法律</option>
				<option value="行政" <c:if test="${category0=='行政' }">selected="selected"</c:if>>行政</option>
				<option value="教师" <c:if test="${category0=='教师' }">selected="selected"</c:if>>教师</option>
				<option value="服务员" <c:if test="${category0=='服务员' }">selected="selected"</c:if>>服务员</option>
				<option value="收银员" <c:if test="${category0=='收银员' }">selected="selected"</c:if>>收银员</option>
				<option value="平面设计" <c:if test="${category0=='平面设计' }">selected="selected"</c:if>>平面设计</option>
				<option value="培训" <c:if test="${category0=='培训' }">selected="selected"</c:if>>培训</option>
				<option value="贸易/进出口" <c:if test="${category0=='贸易/进出口' }">selected="selected"</c:if>>贸易/进出口</option>
				<option value="采购" <c:if test="${category0=='采购' }">selected="selected"</c:if>>采购</option>
				<option value="物流/供应链" <c:if test="${category0=='物流/供应链' }">selected="selected"</c:if>>物流/供应链</option>
				<option value="医疗/健康" <c:if test="${category0=='医疗/健康' }">selected="selected"</c:if>>医疗/健康</option>
				<option value="艺术" <c:if test="${category0=='艺术' }">selected="selected"</c:if>>艺术</option>
				<option value="设计/创意" <c:if test="${category0=='设计/创意' }">selected="selected"</c:if>>设计/创意</option>
				<option value="工程" <c:if test="${category0=='工程' }">selected="selected"</c:if>>工程</option>
				<option value="物业管理" <c:if test="${category0=='物业管理' }">selected="selected"</c:if>>物业管理</option>
				<option value="科研" <c:if test="${category0=='科研' }">selected="selected"</c:if>>科研</option>
				<option value="翻译" <c:if test="${category0=='翻译' }">selected="selected"</c:if>>翻译</option> 
				<option value="公务员" <c:if test="${category0=='公务员' }">selected="selected"</c:if>>公务员</option> 
				<option value="技术支持" <c:if test="${category0=='技术支持' }">selected="selected"</c:if>>技术支持</option> 
				<option value="其他" <c:if test="${category0=='其他' }">selected="selected"</c:if>>其他</option> 
         	</select>
         	&nbsp;
         	<select name="userBasicInfo.category" id="category1" onchange="objSelect1();" style="width:30%" class="login_input">
	         	<option value="会计/出纳" <c:if test="${category1=='会计/出纳' }">selected="selected"</c:if>>会计/出纳</option>
				<option value="财务" <c:if test="${category1=='财务' }">selected="selected"</c:if>>财务</option> 
				<option value="审计" <c:if test="${category1=='审计' }">selected="selected"</c:if>>审计</option> 
				<option value="金融" <c:if test="${category1=='金融' }">selected="selected"</c:if>>金融</option> 
				<option value="技术研发" <c:if test="${category1=='技术研发' }">selected="selected"</c:if>>技术研发</option>
				<option value="文员" <c:if test="${category1=='文员' }">selected="selected"</c:if>>文员</option>
				<option value="咨询/顾问" <c:if test="${category1=='咨询/顾问' }">selected="selected"</c:if>>咨询/顾问</option>
				<option value="产品" <c:if test="${category1=='产品' }">selected="selected"</c:if>>产品</option>
				<option value="运营" <c:if test="${category1=='运营' }">selected="selected"</c:if>>运营</option>
				<option value="质量管理" <c:if test="${category1=='质量管理' }">selected="selected"</c:if>>质量管理</option>
				<option value="项目管理" <c:if test="${category1=='项目管理' }">selected="selected"</c:if>>项目管理</option>
				<option value="销售" <c:if test="${category1=='销售' }">selected="selected"</c:if>>销售</option>
				<option value="客服" <c:if test="${category1=='客服' }">selected="selected"</c:if>>客服</option>
				<option value="商务拓展" <c:if test="${category1=='商务拓展' }">selected="selected"</c:if>>商务拓展</option>
				<option value="渠道/分销" <c:if test="${category1=='渠道/分销' }">selected="selected"</c:if>>渠道/分销</option>
				<option value="客户服务" <c:if test="${category1=='客户服务' }">selected="selected"</c:if>>客户服务</option>
				<option value="市场营销" <c:if test="${category1=='市场营销' }">selected="selected"</c:if>>市场营销</option>
				<option value="公关" <c:if test="${category1=='公关' }">selected="selected"</c:if>>公关</option>
				<option value="生产/制造" <c:if test="${category1=='生产/制造' }">selected="selected"</c:if>>生产/制造</option>
				<option value="编辑/文案" <c:if test="${category1=='编辑/文案' }">selected="selected"</c:if>>编辑/文案</option>
				<option value="管理" <c:if test="${category1=='管理' }">selected="selected"</c:if>>管理</option>
				<option value="人力资源" <c:if test="${category1=='人力资源' }">selected="selected"</c:if>>人力资源</option>
				<option value="法律" <c:if test="${category1=='法律' }">selected="selected"</c:if>>法律</option>
				<option value="行政" <c:if test="${category1=='行政' }">selected="selected"</c:if>>行政</option>
				<option value="教师" <c:if test="${category1=='教师' }">selected="selected"</c:if>>教师</option>
				<option value="服务员" <c:if test="${category1=='服务员' }">selected="selected"</c:if>>服务员</option>
				<option value="收银员" <c:if test="${category1=='收银员' }">selected="selected"</c:if>>收银员</option>
				<option value="平面设计" <c:if test="${category1=='平面设计' }">selected="selected"</c:if>>平面设计</option>
				<option value="培训" <c:if test="${category1=='培训' }">selected="selected"</c:if>>培训</option>
				<option value="贸易/进出口" <c:if test="${category1=='贸易/进出口' }">selected="selected"</c:if>>贸易/进出口</option>
				<option value="采购" <c:if test="${category1=='采购' }">selected="selected"</c:if>>采购</option>
				<option value="物流/供应链" <c:if test="${category1=='物流/供应链' }">selected="selected"</c:if>>物流/供应链</option>
				<option value="医疗/健康" <c:if test="${category1=='医疗/健康' }">selected="selected"</c:if>>医疗/健康</option>
				<option value="艺术" <c:if test="${category1=='艺术' }">selected="selected"</c:if>>艺术</option>
				<option value="设计/创意" <c:if test="${category1=='设计/创意' }">selected="selected"</c:if>>设计/创意</option>
				<option value="工程" <c:if test="${category1=='工程' }">selected="selected"</c:if>>工程</option>
				<option value="物业管理" <c:if test="${category1=='物业管理' }">selected="selected"</c:if>>物业管理</option>
				<option value="科研" <c:if test="${category1=='科研' }">selected="selected"</c:if>>科研</option>
				<option value="翻译" <c:if test="${category1=='翻译' }">selected="selected"</c:if>>翻译</option> 
				<option value="公务员" <c:if test="${category1=='公务员' }">selected="selected"</c:if>>公务员</option> 
				<option value="技术支持" <c:if test="${category1=='技术支持' }">selected="selected"</c:if>>技术支持</option> 
				<option value="其他" <c:if test="${category1=='其他' }">selected="selected"</c:if>>其他</option>           	
         	</select>
         	&nbsp;
         	<select name="userBasicInfo.category" id="category2" onchange="objSelect2();" style="width:30%" class="login_input">
         		<option value="会计/出纳" <c:if test="${category2=='会计/出纳' }">selected="selected"</c:if>>会计/出纳</option>
				<option value="财务" <c:if test="${category2=='财务' }">selected="selected"</c:if>>财务</option> 
				<option value="审计" <c:if test="${category2=='审计' }">selected="selected"</c:if>>审计</option> 
				<option value="金融" <c:if test="${category2=='金融' }">selected="selected"</c:if>>金融</option> 
				<option value="技术研发" <c:if test="${category2=='技术研发' }">selected="selected"</c:if>>技术研发</option>
				<option value="文员" <c:if test="${category2=='文员' }">selected="selected"</c:if>>文员</option>
				<option value="咨询/顾问" <c:if test="${category2=='咨询/顾问' }">selected="selected"</c:if>>咨询/顾问</option>
				<option value="产品" <c:if test="${category2=='产品' }">selected="selected"</c:if>>产品</option>
				<option value="运营" <c:if test="${category2=='运营' }">selected="selected"</c:if>>运营</option>
				<option value="质量管理" <c:if test="${category2=='质量管理' }">selected="selected"</c:if>>质量管理</option>
				<option value="项目管理" <c:if test="${category2=='项目管理' }">selected="selected"</c:if>>项目管理</option>
				<option value="销售" <c:if test="${category2=='销售' }">selected="selected"</c:if>>销售</option>
				<option value="客服" <c:if test="${category2=='客服' }">selected="selected"</c:if>>客服</option>
				<option value="商务拓展" <c:if test="${category2=='商务拓展' }">selected="selected"</c:if>>商务拓展</option>
				<option value="渠道/分销" <c:if test="${category2=='渠道/分销' }">selected="selected"</c:if>>渠道/分销</option>
				<option value="客户服务" <c:if test="${category2=='客户服务' }">selected="selected"</c:if>>客户服务</option>
				<option value="市场营销" <c:if test="${category2=='市场营销' }">selected="selected"</c:if>>市场营销</option>
				<option value="公关" <c:if test="${category2=='公关' }">selected="selected"</c:if>>公关</option>
				<option value="生产/制造" <c:if test="${category2=='生产/制造' }">selected="selected"</c:if>>生产/制造</option>
				<option value="编辑/文案" <c:if test="${category2=='编辑/文案' }">selected="selected"</c:if>>编辑/文案</option>
				<option value="管理" <c:if test="${category2=='管理' }">selected="selected"</c:if>>管理</option>
				<option value="人力资源" <c:if test="${category2=='人力资源' }">selected="selected"</c:if>>人力资源</option>
				<option value="法律" <c:if test="${category2=='法律' }">selected="selected"</c:if>>法律</option>
				<option value="行政" <c:if test="${category2=='行政' }">selected="selected"</c:if>>行政</option>
				<option value="教师" <c:if test="${category2=='教师' }">selected="selected"</c:if>>教师</option>
				<option value="服务员" <c:if test="${category2=='服务员' }">selected="selected"</c:if>>服务员</option>
				<option value="收银员" <c:if test="${category2=='收银员' }">selected="selected"</c:if>>收银员</option>
				<option value="平面设计" <c:if test="${category2=='平面设计' }">selected="selected"</c:if>>平面设计</option>
				<option value="培训" <c:if test="${category2=='培训' }">selected="selected"</c:if>>培训</option>
				<option value="贸易/进出口" <c:if test="${category2=='贸易/进出口' }">selected="selected"</c:if>>贸易/进出口</option>
				<option value="采购" <c:if test="${category2=='采购' }">selected="selected"</c:if>>采购</option>
				<option value="物流/供应链" <c:if test="${category2=='物流/供应链' }">selected="selected"</c:if>>物流/供应链</option>
				<option value="医疗/健康" <c:if test="${category2=='医疗/健康' }">selected="selected"</c:if>>医疗/健康</option>
				<option value="艺术" <c:if test="${category2=='艺术' }">selected="selected"</c:if>>艺术</option>
				<option value="设计/创意" <c:if test="${category2=='设计/创意' }">selected="selected"</c:if>>设计/创意</option>
				<option value="工程" <c:if test="${category2=='工程' }">selected="selected"</c:if>>工程</option>
				<option value="物业管理" <c:if test="${category2=='物业管理' }">selected="selected"</c:if>>物业管理</option>
				<option value="科研" <c:if test="${category2=='科研' }">selected="selected"</c:if>>科研</option>
				<option value="翻译" <c:if test="${category2=='翻译' }">selected="selected"</c:if>>翻译</option> 
				<option value="公务员" <c:if test="${category2=='公务员' }">selected="selected"</c:if>>公务员</option> 
				<option value="技术支持" <c:if test="${category2=='技术支持' }">selected="selected"</c:if>>技术支持</option> 
				<option value="其他" <c:if test="${category2=='其他' }">selected="selected"</c:if>>其他</option>         	
         	</select>
         </div>
          <div class="login_top"><span class="bt">*</span>
         	 <label>
         	 	<c:if test="${userBasicInfo.jobCategory==1 || userBasicInfo.jobCategory=='' || userBasicInfo.jobCategory==null}">
              	 <input type="radio" name="userBasicInfo.jobCategory" id="workday" value="1" checked="checked" >全职
             	</c:if>
             </label>
             <label>
               <input type="radio" name="userBasicInfo.jobCategory" id="weekend" value="2" <c:if test="${userBasicInfo.jobCategory==2 }">checked="checked" </c:if>>按天
             </label>
             <label>
               <input type="radio" name="userBasicInfo.jobCategory" id="holiday" value="3" <c:if test="${userBasicInfo.jobCategory==3 }">checked="checked" </c:if>>按小时
             </label><br>
             <span id="Spansd" style="color: red;"></span>
         </div>
				<input type="hidden" name="userBasicInfo.userId" value="${userBasicInfo.userId }">
         <div class="login_top" style="text-align:center;">
         	<input type="submit" id="saveQw" style="display: none;" >
         	<input  type="button" onclick="saveBasicInfo();" value="保存" class="btn_style1" style="-webkit-appearance:none;"/>
         </div>
     </form>
      </div>
 </div>
    </div>
</div>
</body>
</html>
