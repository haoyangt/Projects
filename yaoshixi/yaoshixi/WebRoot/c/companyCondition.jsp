<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<title>company tags</title>
<style type="text/css">
	.field{float: left; margin-left:10px; width: 950px;}
	.field2{float: left; width: 300px; margin-left: 10px; margin-top: 10px;}
	.title_f{width:85px; font-weight: bold;color:#9C7C3A;}
	.title_f2{width:85px; font-weight: bold;color:#1C80A6;}
	.dd_s{float: left; border-right: 1px solid #D9D9D9;padding:10px;width: 290px;}
	.dl_s{float: left;  margin-bottom:5px;width: 290px;}
	.dl_s dd a{padding: 0 8px;white-space: nowrap;float:left; margin-bottom: 3px;}
	.dl_s dd a:hover{color:#fff;background-color:#5C5C5C;}
	.field2 dd a{padding: 0 8px;white-space: nowrap;float:left; margin-bottom: 3px;}
	.field2 dd a:hover{color:#fff;background-color:#5C5C5C;}
	.a_condition_current{color:#FFF;background-color:#66B3E0;}
	.a_condition{color:#FFF;background-color:#66B3E0;display: block;background-image: url("../../images/003_50.gif");border:1px solid #FFF;background-position:right center;background-repeat: no-repeat;padding: 2px 15px 2px 5px;word-break:keep-all;}
</style>
</head>
<body>
<div id="search_box">
    	<div class="re-dropdown-layout">
                    <div class="re-dropdown" title="全职">
                        <span>公司</span>
                        <i class="caret"></i>
                    </div>
                    <!-- <ul >
                        <li>
                            <a href="#">职位
                            </a>
                        </li>
                        <li>
                            <a href="#">公司
                            </a>
                        </li>
                    </ul> -->
                </div>
		<input id="search_input"  type="text" placeholder="请输入公司名称" value="" tabindex="1" name="companyName" >
   	    <input id="submit" type="button" class="search_button" onclick="autoSubmit();" value="搜索">
   	    </div>
        <div class="com_feiy">
	        <div class="fl" style="width:100%">
			      <b style="float:left;">城　　市：</b>
			      <ul id="cityes">
			      	<li><a id="unlimited1" onclick="companyCity('')">不限</a></li>
			   		<li><a name="condition_city" id="gzCity" class="lei_s" onclick="companyCity('广州');">广州</a></li>
			   		<li><a name="condition_city" id="szCity" class="lei_s" onclick="companyCity('深圳');">深圳</a></li>	
			     </ul>
			</div>
			<div class="fl" style="width:100%">
			      <b style="float:left;">企业认证：</b>
			      <ul id="renz">
			      	<li><a id="unlimited4" onclick="authentication('')">不限</a></li>
			   		<li><a name="condition_city" id="gzRz" class="lei_s" onclick="authentication('1');">已认证</a></li>
			   		<li><a name="condition_city" id="szRz" class="lei_s" onclick="authentication('0');">未认证</a></li>	
			     </ul>
			</div>
			<div class="fl" style="width:100%">
			      <b style="float:left;">规　　模：</b>
			      <ul id="scales">
			      	<li><a id="unlimited2" onclick="companyScale('')">不限</a></li>
			   		<li><a name="condition_scale" class="lei_s" onclick="companyScale('少于15人')">少于15人</a></li>
					<li><a name="condition_scale" class="lei_s" onclick="companyScale('15-50人')">15-50人</a></li>
					<li><a name="condition_scale" class="lei_s" onclick="companyScale('50-150人')">50-150人</a></li>
					<li><a name="condition_scale" class="lei_s" onclick="companyScale('150-500人')">150-500人</a></li>
					<li><a name="condition_scale" class="lei_s" onclick="companyScale('500-2000人')">500-2000人</a></li>
					<li><a name="condition_scale" class="lei_s" onclick="companyScale('2000人以上')">2000人以上</a></li>
			   	  </ul>
			</div>
			<div class="fl" style="width:100%">
			      <b style="float:left;height: 50px;">公司性质：</b>
			      <ul id="natures">
			      	<li><a id="unlimited3" onclick="companyNature('')">不限</a></li>
			   		<li><a name="condition_nature" class="lei_s" onclick="companyNature('有限责任公司')">有限责任公司</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('股份有限公司')">股份有限公司</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('国有独资公司')">国有独资公司</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('个人独资企业')">个人独资企业</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('合伙企业')">合伙企业</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('个体工商户')">个体工商户</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('私营企业')">私营企业</a></li>
					<li><a name="condition_nature" class="lei_s" onclick="companyNature('外商投资企业')">外商投资企业</a></li>
			   	</ul>
			</div>
		  <div class="fl" style="width:100%">
			      <b style="float:left;height: 50px;">行业类别：</b>
			      <ul>
			   		<li><a  id="it"  name="condition_field" class="leib_x">IT行业</a></li>
					<li><a  id="finance" name="condition_field" class="leib_x">金融行业</a></li>
					<li><a  id="professional" name="condition_field" class="leib_x">专业服务</a></li>
					<li><a  id="education" name="condition_field" class="leib_x">教育培训行业</a></li>
					<li><a  id="consumable" name="condition_field" class="leib_x">消费品行业</a></li>
					<li><a  id="medical" name="condition_field" class="leib_x">医疗/卫生</a></li>
					<li><a  id="manufacturing" name="condition_field" class="leib_x">制造工业</a></li>
					<li><a  id="culture" name="condition_field" class="leib_x">文化传媒行业</a></li>
					<li><a  id="building" name="condition_field" class="leib_x">建筑/房地产</a></li>
					<li><a  id="trade" name="condition_field" class="leib_x">贸易物流行业</a></li>
					<li><a  id="service" name="condition_field" class="leib_x">服务业</a></li>
					<li><a  id="other" name="condition_field" class="leib_x">其他</a></li>
			   	</ul>
			</div>
		</div>

</body>
<script type="text/javascript" src="res/js/require.js"></script>
<script type="text/javascript">
var companyName = '';//公司名称
var city = '';//城市
var scale = '';//规模
var nature = '';//公司性质
var field = '';//从事领域
var major = '';//行业类别
var authent = '';//企业认证
companyName = "<%=request.getParameter("keyword") %>";
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
	top.dialog = art;
	
	if(companyName != 'null' && companyName != ''){
		$("#search_input").val(companyName);
	}
	$("#unlimited1").addClass("a_condition_current");
	$("#unlimited2").addClass("a_condition_current");
	$("#unlimited3").addClass("a_condition_current");
	$("#unlimited4").addClass("a_condition_current");
	$('#cityes li').click(function(){
		$(this).addClass("a_condition_current").siblings().removeClass("a_condition_current");
		$("#unlimited1").removeClass("a_condition_current");
	});
	$('#renz li').click(function(){
		$(this).addClass("a_condition_current").siblings().removeClass("a_condition_current");
		$("#unlimited4").removeClass("a_condition_current");
	});
	$('#scales li').click(function(){
		$(this).addClass("a_condition_current").siblings().removeClass("a_condition_current");
		$("#unlimited2").removeClass("a_condition_current");
	});
	$('#natures li').click(function(){
		$(this).addClass("a_condition_current").siblings().removeClass("a_condition_current");
		$("#unlimited3").removeClass("a_condition_current");
	});
	$("a[name='condition_field']").each(function () { 
	    $(this).click(function(){
	    	if($(this).attr('class') == "a_condition") {
				$(this).attr('class', 'leib_x');
				/* document.getElementById("field").value = "";
				document.getElementById("majorArray").value = ""; */
				field = "";
				major = "";
				autoSubmit();
			} else {
				field = $(this).html();
				major = "";
				$(this).attr('class', 'leib_x');
				var tag = document.getElementsByName("condition_field");
				for ( var i = 0; i < tag.length; i++) {
					if(tag[i].innerHTML == $(this).html()) {
						tag[i].className = "a_condition";
					} else {
						tag[i].className = "leib_x";
					}
				}
				/* autoSubmit(); */
				var _majorArray;
		    	if(major != "") {
		    		_majorArray = $('#majorArray').val().split(",");
		    	} else {
		    		_majorArray = [];
		    	}
				art({
					id: 'artBoxForCMajor',
					title: "选择企业（最多选择3项）",
					data: {fieldId:$(this).attr("id"), majorArray:_majorArray},
					url: 'c/cMajor.jsp',
					quickClose: true,
					cancel: true,
					cancelValue: '搜索',
					width: 400,
					height:120,
					onclose:function(){
		 				//$("#majorArray").val(this.data.majorArray);	
						major = this.data.majorArray.toString();
		 				autoSubmit();
					}
				}).show(document.getElementById($(this).attr("id")));
			}
	    });
	});
});

function companyCity(date){
	city = date;
	autoSubmit();
}
function companyScale(dates){
	scale = dates;
	autoSubmit();
}
function companyNature(dds){
	nature = dds;
	autoSubmit();
}
function authentication(rz){
	authent = rz;
	autoSubmit();
}
function autoSubmit() {
	companyName = $("#search_input").val();
	$.ajax({
		type:'POST',
		url:'c/model',
		data:{"companyName":companyName,"city":city,"scale":scale,"nature":nature,"field":field,"major":major,"authentication":authent},
		dataType:'html',
		success:function(html) {
			$("#cPanel").html(html);
		}
	});	
}
</script>
</html>