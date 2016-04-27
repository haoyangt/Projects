 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <script type="text/javascript">
   
	function saveBasicInfo() {
		var userName = $("#userNames").val();
		var city = $("#currentCity").val();
		var birthDay = $("#birthDay").val();
		var email = $("#email").val();
		var telPhone = $("#telPhone").val();
		if(userName!='' && birthDay!='' && email!='' && telPhone!='' && city!='' && userName!='用户名' && birthDay!='出生年月' && email!='联系邮箱' && telPhone!='联系电话' && city!='所在城市'){
			var szReg=/(^1[0-9]{10}$)|(^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)/;
			var ssd= szReg.test(email);
			if(!ssd) {
				$("#Span").text("邮箱格式输入不正确");
				return;
			}
			var $form = $("#userBasicForm");
			 $.ajax({
				type:'POST',
				url:'user/saveUserBasicInfo',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#userBasicInfoDiv").html(html);
					showEdit('#jbEditDiv', '#jbShowDiv');
				}
			}); 
		}else{
			$("#Span").text("带*的信息没有填写完整！");
		}
	}
</script>
<%@ include file="/jstl.jsp" %>
 				<div class="xiangq" id="jbShowDiv">
                    	<div class="xq_xin">
                            <p><label>姓名：${userBasicInfo.userName }</label>|<label>性别：${userBasicInfo.gender eq 0?"男":"女" }</label>|<label>出生日期：<fmt:formatDate value="${userBasicInfo.birthDay }" pattern="yyyy-MM-dd"/></label>|<label>身高：${userBasicInfo.stature}</label></p>
                            <p><label>联系电话：${userBasicInfo.telPhone }</label>|<label>联系邮箱：${userBasicInfo.email }</label></p>
                            <p><label>所居城市：</label><label>${userBasicInfo.city}</label></p>
                            <p><label>希望的工作所在城市：</label><label>${userBasicInfo.jobCity}</label></p>
                            <p><label>希望的职位类别：</label><label>${userBasicInfo.category}</label></p>
                            <p>
                            	<label>期望的工作性质：</label>
                            	<label>
                            		<c:if test="${userBasicInfo.jobCategory eq 1 }">全职</c:if>
                            		<c:if test="${userBasicInfo.jobCategory eq 2 }">按天</c:if>
                            		<c:if test="${userBasicInfo.jobCategory eq 3 }">按小时</c:if>
                            	</label>
                            </p>
                            
                            <c:if test="${userBasicInfo.workReady !='' && userBasicInfo.workReady!=null}">
                            	<p><label>可工作的日子：</label><label>${userBasicInfo.workReady}</label></p>
                            </c:if>
                        </div> 
                        <div class="qt_r">
                        	<c:if test="${userBasicInfo.headImg=='' || userBasicInfo.headImg ==null}"><img  src="res/images/cor.png" width="118" height="119"></c:if>
                        	<c:if test="${userBasicInfo.headImg!='' && userBasicInfo.headImg !=null}"><img  src="user/getHeadPhoto?ImgPath=${userBasicInfo.headImg }" width="118" height="119"></c:if>
                        </div>
                        <div class="bj_grxs"><a href="javascript:void(0);" class="a_edit" onclick="showEdit('#jbShowDiv', '#jbEditDiv')">&nbsp;&nbsp;</a></div>
                        <div class="clear">
                        	<p>
                            	<label style="padding:0 5px;">自我描述：</label>
                            	<label>${userBasicInfo.selfDescription}</label>
                            </p>
                        </div>
                    </div>
                    <div class="basicEdit_a" id="jbEditDiv" style="display: none">
                    	<div class="register_left">
                    		 <div id="facediv">  
                           		 <p>
	                            	 <a>
	                            	    <c:if test="${userBasicInfo.headImg=='' || userBasicInfo.headImg ==null}"><img id ="face" src="res/images/cor.png" width="118" height="119"></c:if>
	                            	    <c:if test="${userBasicInfo.headImg!='' && userBasicInfo.headImg !=null}">
	                            	    	<c:if test="${fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn')}">
                   								<img id ="face"  src="${userBasicInfo.headImg}" width="118" height="119">
                   							</c:if>
					                   		<c:if test="${!fn:contains(userBasicInfo.headImg,'http://wx.qlogo.cn')}">
					                   			<img id ="face" src="user/getHeadPhoto?ImgPath=${userBasicInfo.headImg}" width="118" height="119">
					                   		</c:if> 
	                            	    <%-- <img id ="face"  src="user/getHeadPhoto?ImgPath=${userBasicInfo.headImg }" width="118" height="119"> --%>
	                            	    </c:if>
	                           		 </a>
                             	</p>	
                              </div> 
                            <p>尺寸：120*20px<br/>大小：小于5M</p>
                       	
                            <!-- onchange="uploadHead();" -->
                          <p style="width:100%;overflow: hidden;"><input type="button" value="上传" name="fileToUpload" id="fileToUpload"  style="width:65px"/></p>
                          
                       </div>
                        <div class="register_right">
                            <form id="userBasicForm" >
                            
                            <div class="login_top">真实姓名:
                            	<input name="userBasicInfo.userName" id="userNames" value="${userBasicInfo.userName }" validate="required::请输入用户名" placeholder="姓名，请填写真实姓名" type="text" class="login_input" > 
                              &nbsp; &nbsp;
                                <label>
                                  <input type="radio" name="userBasicInfo.gender"   <c:if test="${userBasicInfo.gender==0 }">checked="checked"</c:if>  value="0" id="RadioGroup1_0">男</label>
                             
                                <label>
                                  <input type="radio" name="userBasicInfo.gender" <c:if test="${userBasicInfo.gender==1 }">checked="checked"</c:if> value="1" id="RadioGroup1_1">女</label>
                            </div>
                            <div class="login_top">出生日期:
                            	<input name="userBasicInfo.birthDay" id="birthDay" value="<fmt:formatDate value="${userBasicInfo.birthDay }" pattern="yyyy-MM-dd"/>" type="text"  validate="required::请输入出生日期" onclick="WdatePicker();" placeholder="出生年月"  class="login_input login_input_bg"><font style="color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;例：1991-01-01</font>
                            </div>
                            <div class="login_top">身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高:
                            	<input name="userBasicInfo.stature" id="stature" value="${userBasicInfo.stature }" type="text"  placeholder="身高"  class="login_input"><font style="color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;请填写数字，例：170</font>
                            </div>
                            <div class="login_top">联系邮箱:
                            	<input name="userBasicInfo.email" id="email" value="${userBasicInfo.email }" type="text" validate="required::请输入联系邮箱"  placeholder="联系邮箱" class="login_input register_input_w">
                            </div>
                            <div class="login_top">联系电话:
                           		<input name="userBasicInfo.telPhone" id="telPhone" value="${userBasicInfo.telPhone }" type="text" validate="required::请输入联系电话" placeholder="联系电话" class="login_input register_input_w">
                            </div>
                            <div class="login_top">所在城市:
                            	<input name="userBasicInfo.city" id="currentCity" value="${userBasicInfo.city }" type="text" style="width: 350px" validate="required::请输入所在城市" placeholder="所在城市" class="login_input kt_input_w login_input_bg">
                            </div>
                            <div class="login_top">希望职位所在城市:
                            	<input name="userBasicInfo.jobCity" id="jobCity" value="${userBasicInfo.jobCity }" type="text" style="width:295px;" validate="required::请输入希望职位所在城市" placeholder="希望职位所在城市" class="login_input kt_input_w login_input_bg">
                            </div>
                            <div class="login_top">希望职位类别:
                            	<input  id="category" value="${userBasicInfo.category }" type="text" style="width: 323px" validate="required::请输入希望职位类别" placeholder="希望职位类别" class="login_input kt_input_w login_input_bg">
                            	<input name="userBasicInfo.category" type="hidden" id="jobAttrValue" value="${userBasicInfo.category }">
                            </div>
                            <div class="login_top">期望的工作性质：
                            	<label>
                                  <input type="radio" name="userBasicInfo.jobCategory" id="workday" value="1" <c:if test="${userBasicInfo.jobCategory==1 }">checked="checked" </c:if> onchange="OnCworkReady(1)">全职
                                </label>
                                <label>
                                  <input type="radio" name="userBasicInfo.jobCategory" id="weekend" value="2" <c:if test="${userBasicInfo.jobCategory==2 }">checked="checked" </c:if> onchange="OnCworkReady(2)">按天
                                </label>
                                <label>
                                  <input type="radio" name="userBasicInfo.jobCategory" id="holiday" value="3" <c:if test="${userBasicInfo.jobCategory==3 }">checked="checked" </c:if> onchange="OnCworkReady(3)">按小时
                                </label>
                            </div>
                            <div id="WorkReadyId" <c:if test="${userBasicInfo.jobCategory==1 }">style="display: none;"</c:if>>可工作的日子：
								<label>
                                  <input type="checkbox" name="userBasicInfo.workReady" id="workday" value="周一" <c:if test="${fn:contains(userBasicInfo.workReady, '周一')}">checked="checked" </c:if>>周一
                                </label>
                                <label>
                                  <input type="checkbox" name="userBasicInfo.workReady" id="weekend" value="周二" <c:if test="${fn:contains(userBasicInfo.workReady, '周二')}">checked="checked" </c:if>>周二
                                </label>
                                <label>
                                  <input type="checkbox" name="userBasicInfo.workReady" id="holiday" value="周三" <c:if test="${fn:contains(userBasicInfo.workReady, '周三')}">checked="checked" </c:if>>周三
                                </label>
                                <label>
                                  <input type="checkbox" name="userBasicInfo.workReady" id="holiday" value="周四" <c:if test="${fn:contains(userBasicInfo.workReady, '周四')}">checked="checked" </c:if>>周四
                                </label>
                                <label>
                                  <input type="checkbox" name="userBasicInfo.workReady" id="holiday" value="周五" <c:if test="${fn:contains(userBasicInfo.workReady, '周五')}">checked="checked" </c:if>>周五
                                </label>
                                <label>
                                  <input type="checkbox" name="userBasicInfo.workReady" id="holiday" value="周六" <c:if test="${fn:contains(userBasicInfo.workReady, '周六')}">checked="checked" </c:if>>周六
                                </label>
                                <label>
                                	<input type="checkbox" name="userBasicInfo.workReady" id="holiday" value="周日" <c:if test="${fn:contains(userBasicInfo.workReady, '周日')}">checked="checked" </c:if>>周日
                                </label>                            	
                            </div>
                            <div class="login_top">自我描述:
                            	<textarea name="userBasicInfo.selfDescription" id="description" cols="20" rows="5" class="login_input" style="height:100px;width:415px;">${userBasicInfo.selfDescription }</textarea>
                            </div>
                            <span id="Span" style="color: red;"></span>
							<input type="hidden" name="userBasicInfo.userId" value="${userBasicInfo.userId }">
                            <div class="login_top" style="text-align:center;"><input  type="button" onclick="saveBasicInfo();" value="保存" class="btn_style1"/>
                            <input class="btn_cancel" type="button" onclick="showEdit('#jbEditDiv', '#jbShowDiv')" value="取消">
                            </div>
                        </form>
                        </div>
                    </div>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.7.1.js',
			artLab: 'res/artDialog/artLab',
			placeholder: 'res/js/placeholder',
			ajaxfileupload: 'res/js/ajaxfileupload'
		},
		shim: {
			'ajaxfileupload': {
				deps: ['jquery'],
				exports: 'ajaxfileupload'
			}
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe", "placeholder", "ajaxfileupload"], function($, artLab, art, placeholder, ajaxfileupload){
		top.dialog = art;
		$("#currentCity").click(function(){
			art({
				id: 'artBoxForCurrentCity',
				title: "选择所在城市",
				data: {currentCity:""},
				url: 'company/currentCity.jsp',
				quickClose: true,
				cancel: false,
				width: 350,
				height: 60,
				onclose:function(){
					$("#currentCity").val(this.data.currentCity);
				}
			}).show(document.getElementById('currentCity'));
		});
	$("#jobCity").click(function(){
		art({
			id: 'artBoxForjobCity',
			title: "选择希望职位所在城市",
			data: {jobCity:""},
			url: 'company/jobCity.jsp',
			quickClose: true,
			cancel: false,
			width: 350,
			height: 60,
			onclose:function(){
				$("#jobCity").val(this.data.jobCity);
			}
		}).show(document.getElementById('jobCity'));
	});
	
	$("#category").click(function(){
		//var jobAttrValue = document.getElementById('jobAttrValue').value.slice(",");
		var _jobAttrValue ;
		if($('#jobAttrValue').val() !== "") {
			_jobAttrValue = $('#jobAttrValue').val().split(",");
		} else {
			_jobAttrValue = [];
		}
		art({
			id: 'artBoxForJobAttr',
			title: "选择职位类别（最多选择3项）",
			data: {jobAttr:"", jobAttrValue:_jobAttrValue},
			url: 'job/jobAttr.jsp',
			quickClose: true,
			cancel: true,
			cancelValue: '确定',
			width: 550,
			height:260,
			onclose:function(){
				$("#category").val(this.data.jobAttr);
				$("#jobAttrValue").val(this.data.jobAttrValue);
				
				jobAttrValue = this.data.jobAttrValue.toString();
			}
		}).show(document.getElementById('category'));
	});
});
	
	
	$('#fileToUpload').on("click", function(){
		var title = "上传头像";
        var url = "user/headImgEdit.jsp";
		top.dialog({
			id: 'artBoxForResume',
			title: title,
			url: url,
			quickClose: false,
			width: '700px',
			height: '520px',
			onclose: function(){
				if(this.returnValue){
					$("#face").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
				}
			}
		}).showModal();
	});
	
	$('#fileResume').on("click", function(){
		var title = "上传简历附件";
        var url = "user/fileResume.jsp";
		top.dialog({
			id: 'artBoxForResume',
			title: title,
			url: url,
			quickClose: false,
			width: '500px',
			height: '120px',
			onclose: function(){
				if(this.returnValue){
					$("#accessory").text(this.returnValue);
				}
			}
		}).showModal();
	});
	
	function OnCworkReady(num){
		if(num==1){
			document.getElementById("WorkReadyId").style.display="none";
		}else{
			document.getElementById("WorkReadyId").style.display="block";
		}
	}
</script>