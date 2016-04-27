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

function svaeResu(){
	var userName = $("#userNames").val();
	var telPhone = $("#telPhone").val();
	var email = $("#email").val();
	var jobInterview = $("#jobInterview").val();
	var designGoal = $("#designGoal").val();
	var interviewForm = $("#interviewForm").val();
	var descriptionInterview = $("#descriptionInterview").val();
	var referenceIdeas = $("#referenceIdeas").val();
	if(userName!='' && telPhone != '' && email != '' && jobInterview != '' && designGoal !='' && interviewForm != '' && descriptionInterview !='' && referenceIdeas != ''){
		$("#saveBettn").click();
	}else{
		$("#Spandds").text("带*号内容未填写完整！");
	}
}
</script>
</head>
<body>
<div class="weixin_body">
	<div class="main_j">
                    <div id="jbEditDiv">
                        <div >
                            <form action="saveFriendProposals" method="post" id="comon">
                            
                            <div class="login_top">真实姓名:
                            	<input type="text" name="friendProposals.userName" id="userNames" placeholder="姓名，请填写真实姓名" validate="required::请输入用户名" class="login_input" > 
                               </div>
                            <div class="login_top">性别:
                                  <input type="radio" name="friendProposals.sex" checked="checked" value="0" id="RadioGroup1_0">男
                                  <input type="radio" name="friendProposals.sex" value="1" id="RadioGroup1_1">女
                            </div>
                            <div class="login_top">联系电话:
                           		<input name="friendProposals.telPhone" id="telPhone" type="text" validate="required::请输入联系电话" placeholder="联系电话" class="login_input">
                            </div>
                            <div class="login_top">联系邮箱:
                            	<input name="friendProposals.email" id="email" type="text" validate="required::请输入联系邮箱"  placeholder="联系邮箱" class="login_input">
                            </div>
                            
                            <div class="login_top">面试职位:
                            	<textarea name="friendProposals.jobInterview" id="jobInterview" placeholder="输入面试职位" validate="required::请输入面试职位" class="login_input" style="height: 100px;"></textarea>
                            </div>
                            <div class="login_top">设计目的:
                            	<textarea name="friendProposals.designGoal" id="designGoal" placeholder="输入设计目的" validate="required::请输入设计目的" class="login_input" style="height: 100px;"></textarea>
                            </div>
                            <div class="login_top">面试形式:
                            	<textarea name="friendProposals.interviewForm" id="interviewForm" placeholder="请输入面试形式" validate="required::请输入面试形式" class="login_input" style="height: 100px;"></textarea>
                            </div>
                            <div class="login_top">面试描述:
                            	<textarea name="friendProposals.descriptionInterview" id="descriptionInterview" placeholder="请输入面试描述" validate="required::请输入面试描述" class="login_input" style="height: 100px;"></textarea>
                            </div>
                            <div class="login_top">参考思路:
                            	<textarea name="friendProposals.referenceIdeas" id="referenceIdeas" placeholder="请输入参考思路" validate="required::请输入参考思路" class="login_input" style="height: 100px;"></textarea>
                            </div>
                            <span id="Spandds" style="color: red;"></span>
                            <div class="login_top" style="text-align:center;">
                            	<input type="submit" id="saveBettn" style="display: none;">
                            	<input  type="button" onclick="svaeResu()" value="提交" class="btn_style1" style="-webkit-appearance:none;"/>
                            </div>
                        </form>
                        </div>
                    </div>
              </div>
          </div>
</body>
</html>
