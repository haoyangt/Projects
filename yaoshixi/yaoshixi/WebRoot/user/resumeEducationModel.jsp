<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<script type="text/javascript">
function saveEducation(num) {
	var university = document.getElementById("university"+num).value;
	var eduBackground = document.getElementById("eduBackground"+num).value;
	var college = document.getElementById("college"+num).value;
	var enterUniversityYear = document.getElementById("enterUniversityYear"+num).value;
	var endUniversityYear = document.getElementById("endUniversityYear"+num).value;
	if(university!='' && eduBackground!='' && college!='' && enterUniversityYear!='' && endUniversityYear !='' && university!='学校名称' && eduBackground!='学历' && college!='专业名称' && enterUniversityYear!='入学时间' && endUniversityYear!='毕业时间'){
		var $form = $("#educationForm"+num);
		 $.ajax({
				type:'POST',
				url:'user/saveEducation',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#educationDiv").html(html);
					showEdit('#jyEditDiv'+num, '#jyShowDiv'+num);
				}
			}); 
	}else{
		/* document.getElementById("SpanWork").style.display="block"; */
		$("#SpanWorkToE").text("带*号栏没有填写完整！");
	}	 
}

function AddEducation(){
	var university = document.getElementById("universityes").value;
	var eduBackground = document.getElementById("eduBackground2").value;
	var college = document.getElementById("college2").value;
	var enterUniversityYear = document.getElementById("enterUniversityYear2").value;
	var endUniversityYear = document.getElementById("endUniversityYear2").value;
	if(university!='' && eduBackground!='' && college!='' && enterUniversityYear!='' && endUniversityYear !='' && university!='学校名称' && eduBackground!='学历' && college!='专业名称' && enterUniversityYear!='入学时间' && endUniversityYear!='毕业时间'){
		var $form = $("#educationForm2");
		 $.ajax({
				type:'POST',
				url:'user/AddEducation',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#educationDiv").html(html);
					showEdit('#jyAddDiv', '#jyShowDiv');
				}
			}); 
	}else{
		/* document.getElementById("SpanWork2").style.display="block"; */
		$("#SpanWork2").text("带*号栏没有填写完整！");
	}
}
function deleteEducation(id){
	$.ajax({
		type:'POST',
		url:'user/deleteEducation',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#educationDiv").html(html);
			showEdit('#jyAddDiv', '#jyShowDiv');
		}
	}); 
}

</script>
  <c:forEach items="${education}" var="education" varStatus="s"> 
              
              <div class="xiangq" id="jyShowDiv_${s.index }">
                    	<div class="xq_xin">
                           <div class="shix_li">
                           		<p><strong  class="f16">${education.university}</strong>&nbsp;&nbsp;
                           			<c:if test="${education.education==2 }">高中 </c:if>
                               	 	<c:if test="${education.education==3 }">专科</c:if>
                               	 	<c:if test="${education.education==4 }">本科 </c:if>
                               	 	<c:if test="${education.education==5 }">硕士</c:if>
                               	 	<c:if test="${education.education==6 }">博士</c:if> 
                           		</p>
                                <table>
                                	<tr>
                                	 <td><fmt:formatDate value="${education.enterUniversityYear}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${education.endUniversityYear}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                                	 	${education.major}
                                	 </td>
                                	</tr>
                                    <tr><td><label class="c008">专业能力：</label>${education.majorAbility}</td></tr>
                                    <%-- <tr><td><label class="c008">特长：</label>${speciality}</td></tr> --%>
                                </table>
                             <div class="bj_grxx"><a onclick="showEdit('#jyShowDiv_${s.index }', '#jyEditDiv_${s.index }')" class="a_edit_s">&nbsp;&nbsp;</a>
                             <a onclick="deleteEducation(${education.id })" class="a_delete_s">&nbsp;&nbsp;</a></div>
                          
                           </div>
                          
                        </div>
                        
                    </div>
          
                    	<!-- onclick="showEdit('#jyShowDiv', '#jyEditDiv')" -->
                     <div  class="jyEdit_a" id="jyEditDiv_${s.index }" style="display: none">
                    	<form id="educationForm_${s.index }">
                    		<input type="hidden" name="educationExperience.userId" value="${education.userId }">
                    		<input type="hidden" name="educationExperience.id" id="educationExperienceId" value="${education.id }">
                        	<table border="0">
                              <tr>
                                <td >学校名称:<span class="kt_font_x">(双击输入框可以选择)</span>
                              <input name="educationExperience.university" id="university_${s.index }" type="text" validate="required::请输入学校名称"  placeholder="学校名称" class="login_input login_input_bg input_w" value="${education.university}"></td> 
                                <td>学历:&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                	<c:if test="${education.education == null || education.education == ''}">
                               			<input name="educationExperience.education" id="eduBackground_${s.index }" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="">
                               		</c:if>
                                	<c:if test="${education.education==2 }">
                               			<input name="educationExperience.education" id="eduBackground_${s.index }" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="高中">
                               		</c:if>
                               		<c:if test="${education.education==3 }">
                               			<input name="educationExperience.education" id="eduBackground_${s.index }" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="专科">
                               		</c:if>
                               		<c:if test="${education.education==4 }">
                               			<input name="educationExperience.education" id="eduBackground_${s.index }" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="本科">
                               		</c:if>
                               		<c:if test="${education.education==5 }">
                               			<input name="educationExperience.education" id="eduBackground_${s.index }" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="硕士">
                               		</c:if>
                               		<c:if test="${education.education==6 }">
                               			<input name="educationExperience.education" id="eduBackground_${s.index }" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="博士">
                               		</c:if>
                               		</td>
                              </tr>
                               <tr>
                                <td>入学时间:&nbsp;&nbsp;&nbsp;&nbsp;<br>
	                                <input name="educationExperience.enterUniversityYear" id="enterUniversityYear_${s.index }" onClick="WdatePicker();" type="text" validate="required::请输入入学时间" placeholder="入学时间" class="login_input login_input_bg input_w"  value="<fmt:formatDate value="${education.enterUniversityYear}" pattern="yyyy-MM-dd"/>">
                               </td>
                                <td>毕业时间:&nbsp;&nbsp;&nbsp;&nbsp;<br>
	                                <input name="educationExperience.endUniversityYear" id="endUniversityYear_${s.index }" onClick="WdatePicker();" type="text" validate="required::请输入毕业时间" placeholder="毕业时间" class="login_input login_input_bg input_w"  value="<fmt:formatDate value="${education.endUniversityYear}" pattern="yyyy-MM-dd"/>">
                               </td>
                              </tr>
                              <tr>
                              		<td>专业名称:&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                 <input name="educationExperience.major" id="college_${s.index }" type="text" validate="required::请输入专业名称" placeholder="专业名称" class="login_input input_w" value="${education.major }">
                                </td>
                              </tr>
                              <tr><td colspan="2">
                              		<strong>专业介绍</strong>（描述你所学专业的主修课程）<br/>
                              		<textarea id="contentJyE_${s.index }" name="educationExperience.majorAbility" cols="20" rows="5" class="login_input" style="height:100px;width:634px;">${education.majorAbility }</textarea>
                                    <div style="vertical-align: bottom; height: 20px; line-height: 20px; margin: 0px;color: Gray;">
										<label id="infoJyE2_${s.index }" style="float: right; font-size: 12px;padding-right: 46px;">个字</label>
				   						<span id="infoJyE_${s.index }" style="float: right; font-size: 20px; font-weight: bold;"></span>
				   						<label id="infoJyE1_${s.index }" style="float: right; font-size: 12px;">
				       						您输入了</label>
				       					<span id="SpanWorkToE" style="color: red;float: left;"></span>
				       				</div>
                              </td></tr>
                              <tr>
                                <td colspan="2" style="text-align:center;">
	                                <input  type="button" onclick="saveEducation('_${s.index }');" value="修改" class="btn_style1"/>
	                                <input class="btn_cancel" type="button" onclick="showEdit('#jyEditDiv_${s.index }', '#jyShowDiv_${s.index }')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
                
      </c:forEach>  
      			<div class="bj_grxs" style=""> 
             				<a href="javascript:void(0);"  class="a_add" onclick="showEdit('#jyEditDiv', '#jyAddDiv');" ></a>
             	</div>  
                  <div class="jyEdit_a" id="jyAddDiv" style="display: none">
                    	<form id="educationForm2">
                        	<table border="0">
                              <tr>
                                <td >学校名称：<span class="kt_font_x">(双击输入框可以选择)</span>
                              		<input name="educationExperience.university" id="universityes" type="text" validate="required::请输入学校名称" placeholder="学校名称" class="login_input login_input_bg input_w" value="">
                              	</td> 
                                <td>学历:&nbsp;&nbsp;&nbsp;&nbsp;<br>
                           			<input name="educationExperience.education" id="eduBackground2" type="text" readonly="readonly" validate="required::请输入学历" placeholder="学历" class="login_input login_input_bg input_w" value="">
                           		</td>
                              </tr>
                               <tr>
                                <td>入学时间:&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                <input name="educationExperience.enterUniversityYear" id="enterUniversityYear2" onClick="WdatePicker();" type="text" validate="required::请输入入学时间" placeholder="入学时间" class="login_input login_input_bg input_w"  value="">
                               </td>
                                <td>毕业时间:&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                <input name="educationExperience.endUniversityYear" id="endUniversityYear2" onClick="WdatePicker();" type="text" validate="required::请输入毕业时间" placeholder="毕业时间" class="login_input login_input_bg input_w"  value="">
                               </td>
                              </tr>
                              <tr>
                              	<td>专业名称:&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                 <input name="educationExperience.major" id="college2" type="text" validate="required::请输入专业名称" placeholder="专业名称" class="login_input input_w" value="">
                                </td>
                              </tr>
                              <tr><td colspan="2">
                              		<strong>专业介绍</strong>（描述你所学专业的主修课程）<br/>
                              		<textarea id="contentJy" name="educationExperience.majorAbility" cols="20" rows="5" class="login_input" style="height:100px;width:634px;"></textarea>
                                    <div style="vertical-align: bottom; height: 20px; line-height: 20px; margin: 0px;color: Gray;">
										<label id="infoJy2" style="float: right; font-size: 12px;padding-right: 46px;">个字</label>
				   						<span id="infoJy" style="float: right; font-size: 20px; font-weight: bold;"></span>
				   						<label id="infoJy1" style="float: right; font-size: 12px;">
				       						您输入了</label>
				       					<span id="SpanWork2" style="color: red;float: left;"></span>
				       				</div>
                              </td></tr>
                              <tr>
                                <td colspan="2" style="text-align:center;">
	                                <input  type="button" onclick="AddEducation();" value="添加" class="btn_style1"/>
	                                <input class="btn_cancel" type="button" onclick="showEdit('#jyAddDiv', '#jyShowDiv')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
      
                
                    <div class="xiangq_k" id="hideDivJybj" style="display: none;">
				      <table>
				          <tr>
				              <td rowspan="2" ><a onclick="showEdit('#jyEditDiv', '#jyAddDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
				              <td>教育背景可以充分体现你的学习和专业能力……<br/>且完善后才可投递简历哦！</td>
				          </tr>
				           <tr>
                                <td><a onclick="showEdit('#jyEditDiv', '#jyAddDiv');" class="h_b_under">添加教育经历</a></td>
                            </tr>
				      </table>
				  </div>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
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
		var educationExperienceId = $("#educationExperienceId").val();
		if(educationExperienceId=='' || educationExperienceId==null){
			$("#hideDivJybj").show();
		}
		$("#contentJy").focus(checkJy);
	    $("#contentJyE_0").focus(checkJyE0);
	    $("#contentJyE_1").focus(checkJyE1);
	    $("#contentJyE_2").focus(checkJyE2);
	    $("#contentJyE_3").focus(checkJyE3);
	    $("#contentJyE_4").focus(checkJyE4);
	    $("#contentJyE_5").focus(checkJyE5);
	    $("#contentJyE_6").focus(checkJyE6);
	    $("#contentJy").keyup(checkJy);
	    $("#contentJyE_0").keyup(checkJyE0);
	    $("#contentJyE_1").keyup(checkJyE1);
	    $("#contentJyE_2").keyup(checkJyE2);
	    $("#contentJyE_3").keyup(checkJyE3);
	    $("#contentJyE_4").keyup(checkJyE4);
	    $("#contentJyE_5").keyup(checkJyE5);
	    $("#contentJyE_6").keyup(checkJyE6);
		$("body").mousedown(checkJy);
		function checkJy() {
		    var str = $("#contentJy").val();
		    var len = strlen(str);
		   /*  var info = 300 - len; */
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		   /*  if (len <= 300) { */
		        $("#infoJy1").html("您输入了");
		        $("#infoJy").css('color', 'gray');
		        $("#infoJy").html(info);
		   /*  } else {
		        info = info.substr(1)
		        $("#infoJy1").html("超过");
		        $("#infoJy").css('color', 'red');
		        $("#infoJy").html(info);
		    } */
		}
		function checkJyE0() {
		    var str = $("#contentJyE_0").val();
		    var len = strlen(str);
		   /*  var info = 300 - len; */
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		   /*  if (len <= 300) { */
		        $("#infoJyE1_0").html("您输入了");
		        $("#infoJyE_0").css('color', 'gray');
		        $("#infoJyE_0").html(info);
		   /*  } else {
		        info = info.substr(1)
		        $("#infoJyE1_"+num).html("超过");
		        $("#infoJyE_"+num).css('color', 'red');
		        $("#infoJyE_"+num).html(info);
		    } */
		}
		function checkJyE1() {
		    var str = $("#contentJyE_1").val();
		    var len = strlen(str);
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		        $("#infoJyE1_1").html("您输入了");
		        $("#infoJyE_1").css('color', 'gray');
		        $("#infoJyE_1").html(info);
		}
		function checkJyE2() {
		    var str = $("#contentJyE_2").val();
		    var len = strlen(str);
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		        $("#infoJyE1_2").html("您输入了");
		        $("#infoJyE_2").css('color', 'gray');
		        $("#infoJyE_2").html(info);
		}
		function checkJyE3() {
		    var str = $("#contentJyE_3").val();
		    var len = strlen(str);
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		        $("#infoJyE1_3").html("您输入了");
		        $("#infoJyE_3").css('color', 'gray');
		        $("#infoJyE_3").html(info);
		}
		function checkJyE4() {
		    var str = $("#contentJyE_4").val();
		    var len = strlen(str);
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		        $("#infoJyE1_4").html("您输入了");
		        $("#infoJyE_4").css('color', 'gray');
		        $("#infoJyE_4").html(info);
		}
		function checkJyE5() {
		    var str = $("#contentJyE_5").val();
		    var len = strlen(str);
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		        $("#infoJyE1_5").html("您输入了");
		        $("#infoJyE_5").css('color', 'gray');
		        $("#infoJyE_5").html(info);
		}
		function checkJyE6() {
		    var str = $("#contentJyE_6").val();
		    var len = strlen(str);
		    info = len + "";
		    if (info.indexOf('.') > 0)
		        info = info.substring(0, info.indexOf('.'));
		        $("#infoJyE1_6").html("您输入了");
		        $("#infoJyE_6").css('color', 'gray');
		        $("#infoJyE_6").html(info);
		}
		$("#university_0").dblclick(function(){
			art({
				id: 'artBoxForUniversity',
				title: "选择学校",
				data: {university:""},
				url: 'user/university.jsp',
				quickClose: true,
				cancel: false,
				width: 650,
				height:365,
				onclose:function(){
					$("#university_0").val(this.data.university);
				}
			}).show(document.getElementById('university_0'));
		});
		
		$("#eduBackground_0").click(function(){
			art({
				id: 'artBoxForEduBackground',
				title: "选择学历",
				data: {},
				url: 'user/eduBackground.jsp',
				quickClose: true,
				cancel: false,
				width: 300,
				height:120,
				onclose:function(){
					$("#eduBackground_0").val(this.data.eduBackground);
				}
			}).show(document.getElementById('eduBackground_0'));
		});
		
		$("#university_1").dblclick(function(){
			art({
				id: 'artBoxForUniversity',
				title: "选择学校",
				data: {university:""},
				url: 'user/university.jsp',
				quickClose: true,
				cancel: false,
				width: 650,
				height:365,
				onclose:function(){
					$("#university_1").val(this.data.university);
				}
			}).show(document.getElementById('university_1'));
		});
		
		$("#eduBackground_1").click(function(){
			art({
				id: 'artBoxForEduBackground',
				title: "选择学历",
				data: {},
				url: 'user/eduBackground.jsp',
				quickClose: true,
				cancel: false,
				width: 300,
				height:120,
				onclose:function(){
					$("#eduBackground_1").val(this.data.eduBackground);
				}
			}).show(document.getElementById('eduBackground_1'));
		});
		$("#university_2").dblclick(function(){
			art({
				id: 'artBoxForUniversity',
				title: "选择学校",
				data: {university:""},
				url: 'user/university.jsp',
				quickClose: true,
				cancel: false,
				width: 650,
				height:365,
				onclose:function(){
					$("#university_2").val(this.data.university);
				}
			}).show(document.getElementById('university_2'));
		});
		
		$("#eduBackground_2").click(function(){
			art({
				id: 'artBoxForEduBackground',
				title: "选择学历",
				data: {},
				url: 'user/eduBackground.jsp',
				quickClose: true,
				cancel: false,
				width: 300,
				height:120,
				onclose:function(){
					$("#eduBackground_2").val(this.data.eduBackground);
				}
			}).show(document.getElementById('eduBackground_2'));
		});
		$("#university_3").dblclick(function(){
			art({
				id: 'artBoxForUniversity',
				title: "选择学校",
				data: {university:""},
				url: 'user/university.jsp',
				quickClose: true,
				cancel: false,
				width: 650,
				height:365,
				onclose:function(){
					$("#university_3").val(this.data.university);
				}
			}).show(document.getElementById('university_3'));
		});
		
		$("#eduBackground_3").click(function(){
			art({
				id: 'artBoxForEduBackground',
				title: "选择学历",
				data: {},
				url: 'user/eduBackground.jsp',
				quickClose: true,
				cancel: false,
				width: 300,
				height:120,
				onclose:function(){
					$("#eduBackground_3").val(this.data.eduBackground);
				}
			}).show(document.getElementById('eduBackground_3'));
		});
		
		$("#universityes").dblclick(function(){
			art({
				id: 'artBoxForUniversity',
				title: "选择学校",
				data: {university:""},
				url: 'user/university.jsp',
				quickClose: true,
				cancel: false,
				width: 650,
				height:365,
				onclose:function(){
					$("#universityes").val(this.data.university);
				}
			}).show(document.getElementById('universityes'));
		});
		
		$("#eduBackground2").click(function(){
			art({
				id: 'artBoxForEduBackground',
				title: "选择学历",
				data: {},
				url: 'user/eduBackground.jsp',
				quickClose: true,
				cancel: false,
				width: 300,
				height:120,
				onclose:function(){
					$("#eduBackground2").val(this.data.eduBackground);
				}
			}).show(document.getElementById('eduBackground2'));
		});
	});

	
	
</script>