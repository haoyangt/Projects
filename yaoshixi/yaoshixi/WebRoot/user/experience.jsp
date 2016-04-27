<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
                    
<c:forEach items="${experience }" var="experience" varStatus="s"> 
			<div class="xiangq" id="exShowDiv_${s.index }">
                    	<div class="xq_xin">
                           <div class="shix_li">
                           		<p><strong  class="f16">${experience.sxPosition} 
                           			&nbsp;&nbsp; ${experience.sxCompanyName }
                           			</strong></p>
                                <table>
                                	<tr>
                                	 <td>${experience.ksTime} &nbsp;至&nbsp;
                    					${experience.jsTime }
                                	 	&nbsp;&nbsp;
                                	 </td>
                                	</tr>
                                    <tr><td><label class="c008">实习内容：</label>${experience.sxConut}</td></tr>
                                </table>
                              <div class="bj_grxx">
	                              <a onclick="showEdit('#exShowDiv_${s.index }', '#exEditDiv_${s.index }');" class="a_edit_s">&nbsp;&nbsp;</a>
	                              <a onclick="deleteExperience(${s.index })" class="a_delete_s">&nbsp;&nbsp;
                              </a></div>
                            
                           </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    
                    
                     <div class="jyEdit_a" id="exEditDiv_${s.index }" style="display: none">
                    	<form id="expersForm_${s.index }">
                    		<%-- <input type="hidden" name="userBasicInfo.userId" value="${userId }">--%>
                        	<input type="hidden" name="experience.id" id="experienceId" value="${experience.id }"> 
                        	<table border="0">
                              <tr>
                                <td>公司：
                              		<input name="experience.sxCompanyName" id="sxCompanyName" type="text"  placeholder="公司名称" class="login_input input_w" value="${experience.sxCompanyName}">
                              	</td> 
                              	<td>职位：
	                               		<input name="experience.sxPosition" id="sxPosition" type="text"  placeholder="职位" class="login_input input_w" value="${experience.sxPosition }" >
	                             </td>
                              </tr>
                        	<tr>
                              	<td>开始：
	                                <input name="experience.ksTime" id="ksTime" onClick="WdatePicker();" type="text" placeholder="开始时间" class="login_input login_input_bg input_w"  value="${experience.ksTime}">
                               	</td>
                               	<td>结束：
	                                <input name="experience.jsTime" id="jsTime" onClick="WdatePicker();" type="text" placeholder="结束时间" class="login_input login_input_bg input_w"  value="${experience.jsTime}">
                               	</td>
                              </tr>
                               <tr>
		                              <td colspan="2">
		                              		<strong>实习内容：</strong><br/>
		                              		<textarea id="contentSxE_${s.index }" name="experience.sxConut" cols="20" rows="5" class="login_input" style="height:100px;width:636px;">${experience.sxConut }</textarea>
		                                    <div style="vertical-align: bottom; height: 20px; line-height: 20px; margin: 0px;color: Gray;">
												<label id="infoSxE2_${s.index }" style="float: right; font-size: 12px;padding-right: 46px;">个字</label>
						   						<span id="infoSxE_${s.index }" style="float: right; font-size: 20px; font-weight: bold;"></span>
						   						<label id="infoSxE1_${s.index }" style="float: right; font-size: 12px;">
						       						您输入了</label></div>
		                              </td>
		                       </tr>
                              <tr><td><span id="SpanWork" style="color: red;"></span></td></tr>
                              <tr>
                                <td colspan="2" style="text-align:center;"><input  type="button" onclick="saveExperses('_${s.index }');" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#exEditDiv_${s.index }', '#exShowDiv_${s.index }')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
        </c:forEach>
       			  <div class="bj_grxs"><a href="javascript:void(0);" class="a_add" onclick="showEdit('#exEditDiv', '#exAddDiv');">&nbsp;&nbsp;</a></div>
                       
                    <div class="jyEdit_a" id="exAddDiv" style="display: none">
                    	<form id="expersForm2">
                    		<%-- <input type="hidden" name="userBasicInfo.userId" value="${userId }">
                        	<input type="hidden" name="resume.userId" value="${userId }"> --%>
                        	<table   border="0">
                              <tr>
                                <td>公司：
                              		<input name="experience.sxCompanyName" id="sxCompanyName" type="text"  placeholder="公司名称" class="login_input input_w" value="">
                              	</td> 
                              	<td>职位：
	                               		<input name="experience.sxPosition" id="sxPosition" type="text"  placeholder="职位" class="login_input input_w" value="" >
	                             </td>
                              </tr>
                        	<tr>
                              	<td>开始：
	                                <input name="experience.ksTime" id="ksTime" onClick="WdatePicker();" type="text" placeholder="开始时间" class="login_input login_input_bg input_w"  value="">
                               	</td>
                               	<td>结束：
	                                <input name="experience.jsTime" id="jsTime" onClick="WdatePicker();" type="text" placeholder="结束时间" class="login_input login_input_bg input_w"  value="">
                               	</td>
                              </tr>
                               <tr>
		                              <td colspan="2">
		                              		<strong>实习内容：</strong><br/>
		                              		<textarea id="contentSx" name="experience.sxConut" cols="20" rows="5" class="login_input" style="height:100px;width:636px;"></textarea>
		                                    <div style="vertical-align: bottom; height: 20px; line-height: 20px; margin: 0px;color: Gray;">
												<label id="infoSx2" style="float: right; font-size: 12px;padding-right: 46px;">个字</label>
						   						<span id="infoSx" style="float: right; font-size: 20px; font-weight: bold;"></span>
						   						<label id="infoSx1" style="float: right; font-size: 12px;">
       											您输入了</label>
       										</div>
		                              </td>
		                       </tr>
                             <!--  <tr><td><span id="SpanWork" style="color: red;"></span></td></tr> -->
                              <tr>
                                <td colspan="2" style="text-align:center;"><input  type="button" onclick="AddExpers();" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#exAddDiv', '#exShowDiv')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
                    
                  <div class="xiangq_k" id="hideDiveSxjl" style="display: none;">
				      <table>
				          <tr>
				              <td rowspan="2" ><a onclick="showEdit('#exEditDiv', '#exAddDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
				              <td>实习经历可以充分体现你的工作能力……</td>
				          </tr>
				           <tr>
                                <td><a onclick="showEdit('#exEditDiv', '#exAddDiv');" class="h_b_under">添加实习经历</a></td>
                            </tr>
				      </table>
				  </div>  
<script type="text/javascript">
$(function() {
	var experienceId = $("#experienceId").val();
	if(experienceId=='' || experienceId==null){
		$("#hideDiveSxjl").show();
	}
	 $("#contentSx").focus(checkSx);
	    $("#contentSxE_0").focus(checkSxE0);
	    $("#contentSxE_1").focus(checkSxE1);
	    $("#contentSxE_2").focus(checkSxE2);
	    $("#contentSxE_3").focus(checkSxE3);
	    $("#contentSxE_4").focus(checkSxE4);
	    $("#contentSxE_5").focus(checkSxE5);
	    $("#contentSxE_6").focus(checkSxE6);
    $("#contentSx").keyup(checkSx);
    $("#contentSxE_0").keyup(checkSxE0);
    $("#contentSxE_1").keyup(checkSxE1);
    $("#contentSxE_2").keyup(checkSxE2);
    $("#contentSxE_3").keyup(checkSxE3);
    $("#contentSxE_4").keyup(checkSxE4);
    $("#contentSxE_5").keyup(checkSxE5);
    $("#contentSxE_6").keyup(checkSxE6);
	$("body").mousedown(checkSx);
});

function checkSx() {
    var str = $("#contentSx").val();
    var len = strlen(str);
   /*  var info = 300 - len; */
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
    /* if (len <= 300) { */
        $("#infoSx1").html("您输入了");
        $("#infoSx").css('color', 'gray');
        $("#infoSx").html(info);
    /* } else {
        info = info.substr(1);
        $("#infoSx1").html("超过");
        $("#infoSx").css('color', 'red');
        $("#infoSx").html(info);
    } */
}
function checkSxE0() {
    var str = $("#contentSxE_0").val();
    var len = strlen(str);
   /*  var info = 300 - len; */
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
   /*  if (len <= 300) { */
        $("#infoSxE1_0").html("您输入");
        $("#infoSxE_0").css('color', 'gray');
        $("#infoSxE_0").html(info);
    /* } else {
        info = info.substr(1);
        $("#infoSxE1").html("超过");
        $("#infoSxE").css('color', 'red');
        $("#infoSxE").html(info);
    } */
}
function checkSxE1() {
    var str = $("#contentSxE_1").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoSxE1_1").html("您输入");
        $("#infoSxE_1").css('color', 'gray');
        $("#infoSxE_1").html(info);
}
function checkSxE2() {
    var str = $("#contentSxE_2").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoSxE1_2").html("您输入");
        $("#infoSxE_2").css('color', 'gray');
        $("#infoSxE_2").html(info);
}
function checkSxE3() {
    var str = $("#contentSxE_3").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoSxE1_3").html("您输入");
        $("#infoSxE_3").css('color', 'gray');
        $("#infoSxE_3").html(info);
}
function checkSxE4() {
    var str = $("#contentSxE_4").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoSxE1_4").html("您输入");
        $("#infoSxE_4").css('color', 'gray');
        $("#infoSxE_4").html(info);
}
function checkSxE5() {
    var str = $("#contentSxE_5").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoSxE1_5").html("您输入");
        $("#infoSxE_5").css('color', 'gray');
        $("#infoSxE_5").html(info);
}
function checkSxE6() {
    var str = $("#contentSxE_6").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoSxE1_6").html("您输入");
        $("#infoSxE_6").css('color', 'gray');
        $("#infoSxE_6").html(info);
}
function saveExperses(num) {
	//var university = document.getElementById("university").value;
	//var eduBackground = document.getElementById("eduBackground").value;
	//var college = document.getElementById("college").value;
	//var enterUniversityYear = document.getElementById("enterUniversityYear").value;
	//if(university!='' && eduBackground!='' && college!='' && enterUniversityYear!='' && university!='学校名称' && eduBackground!='学历' && college!='专业名称' && enterUniversityYear!='入学时间'){
		var $form = $("#expersForm"+num);
		 $.ajax({
				type:'POST',
				url:'user/saveExperience',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#experienceDiv").html(html);
					showEdit('#exEditDiv'+num, '#exShowDiv'+num);
				}
			}); 
	//}else{
	//	$("#SpanWork").text("带*号栏没有填写完整！");
	//}	 
}

function AddExpers(){
	var $form = $("#expersForm2");
	 $.ajax({
			type:'POST',
			url:'user/AddExperience',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#experienceDiv").html(html);
				showEdit('#exEditDiv', '#exShowDiv');
			}
		});
}

function deleteExperience(id){
	$.ajax({
		type:'POST',
		url:'user/deleteExperience',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#experienceDiv").html(html);
			showEdit('#exEditDiv', '#exShowDiv');
		}
	}); 
}
</script>