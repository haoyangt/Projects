<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
<script type="text/javascript">
function saveSocial(num) {
	/* var university = document.getElementById("university").value;
	var eduBackground = document.getElementById("eduBackground").value;
	var college = document.getElementById("college").value;
	var enterUniversityYear = document.getElementById("enterUniversityYear").value; */
	//if(university!='' && eduBackground!='' && college!='' && enterUniversityYear!='' && university!='学校名称' && eduBackground!='学历' && college!='专业名称' && enterUniversityYear!='入学时间'){
		var $form = $("#socialForm"+num);
		 $.ajax({
				type:'POST',
				url:'user/saveSocialpractice',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#socialDiv").html(html);
					showEdit('#sjEditDiv'+num, '#sjShowDiv'+num);
				}
			}); 
	//}else{
		//$("#SpanWork").text("带*号栏没有填写完整！");
	//}	 
}

function addSocial(){
	var $form = $("#socialForm2");
	 $.ajax({
			type:'POST',
			url:'user/addSocialpractice',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#socialDiv").html(html);
				showEdit('#sjEditDiv', '#sjShowDiv');
			}
		}); 
}
function deleteSocial(id){
	$.ajax({
		type:'POST',
		url:'user/deleteSocial',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#socialDiv").html(html);
			showEdit('#sjEditDiv', '#sjShowDiv');
		}
	}); 
}
</script>
   <c:forEach items="${social}" var="social" varStatus="s">         
      <div class="xiangq" id="sjShowDiv_${s.index }">
    	<div class="xq_xin">
           <div class="shix_li">
           		<p><strong  class="f16">${social.school}</strong></p>
                <table>
                	<tr>
                	 <td>${social.starDayNum} ~ ${social.endDayNum }&nbsp;&nbsp;
                	 	${social.position}
                	 	&nbsp;&nbsp;
                	 </td>
                	</tr>
                    <tr><td><label class="c008">活动内容：</label>${social.activityContent}</td></tr>
                </table>
             <div class="bj_grxx">
             <a onclick="showEdit('#sjShowDiv_${s.index }', '#sjEditDiv_${s.index }');" class="a_edit_s">&nbsp;&nbsp;</a>
             <a onclick="deleteSocial(${social.id })" class="a_delete_s">&nbsp;&nbsp;</a>
             </div>
          
           </div>
           
        </div>
        <div class="clear"></div>
    </div>
     <div class="jyEdit_a" id="sjEditDiv_${s.index }" style="display: none">
    	<form id="socialForm_${s.index }">
        	<input type="hidden" name="socialPractice.id" id="socialPracticeId" value="${social.id }">
        	<table border="0">
           <tr>
	          	<td>开始：&nbsp;&nbsp;&nbsp;&nbsp;<br>
	             <input name="socialPractice.starDayNum" id="starDayNum" onClick="WdatePicker();" type="text" placeholder="开始时间" class="login_input login_input_bg input_w"  value="${social.starDayNum}">
	           	</td>
	           	<td>结束：
	             <input name="socialPractice.endDayNum" id="endDayNum" onClick="WdatePicker();" type="text" placeholder="结束时间" class="login_input login_input_bg input_w"  value="${social.endDayNum}">
	           	</td>
          </tr>
   		  <tr>
            <td>社团/部门：
          		<input name="socialPractice.school" id="school" type="text" placeholder="学校名称" class="login_input input_w" value="${social.school}">
          	</td> 
            <td>职位：
           		<input name="socialPractice.position" id="position" type="text"  placeholder="职位" class="login_input input_w" value="${social.position }" >
           	</td>
         </tr>
         <tr>
            <td colspan="2">
            		<strong>活动内容：</strong>（英语协会策划活动等等）<br/>
            		<textarea id="contentE_${s.index }" name="socialPractice.activityContent" cols="20" rows="5" class="login_input" style="height:100px;width:646px;">${social.activityContent }</textarea>
                  	<div style="vertical-align: bottom; height: 20px; line-height: 20px; margin: 0px;color: Gray;">
						<label id="infoE2_${s.index }" style="float: right; font-size: 12px;padding-right: 35px;">个字</label>
   						<span id="infoE_${s.index }" style="float: right; font-size: 20px; font-weight: bold;"></span>
   						<label id="infoE1_${s.index }" style="float: right; font-size: 12px;">
       						您输入了</label></div>
            </td>
        </tr>        
              <!-- <tr><td><span id="SpanWork" style="color: red;"></span></td></tr> -->
              <tr>
                <td colspan="2" style="text-align:center;"><input  type="button" onclick="saveSocial('_${s.index }');" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#sjEditDiv_${s.index }', '#sjShowDiv_${s.index }')" value="取消"/>
              </tr>
            </table>
        </form>
    </div>
</c:forEach> 
      <div class="bj_grxs"><a href="javascript:void(0);" class="a_add" onclick="showEdit('#sjEditDiv', '#sjAddDiv');">&nbsp;&nbsp;</a></div>
                   
      <div class="jyEdit_a" id="sjAddDiv" style="display: none">
      	<form id="socialForm2">
      		<%-- <input type="hidden" name="userBasicInfo.userId" value="${userId }">
          	<input type="hidden" name="resume.userId" value="${userId }"> --%>
          	<table border="0">
                <tr>
                	<td>开始：&nbsp;&nbsp;&nbsp;&nbsp;<br>
                   <input name="socialPractice.starDayNum" id="starDayNum" onClick="WdatePicker();" type="text" placeholder="开始时间" class="login_input login_input_bg input_w"  value="">
                 	</td>
                 	<td>结束：
                   <input name="socialPractice.endDayNum" id="endDayNum" onClick="WdatePicker();" type="text" placeholder="结束时间" class="login_input login_input_bg input_w"  value="">
                 	</td>
                </tr>
                 <tr>
                  <td>社团/部门：
                		<input name="socialPractice.school" id="school" type="text" placeholder="社团/部门名称" class="login_input input_w" value="">
                	</td> 
                   <td>职位：
                  		<input name="socialPractice.position" id="position" type="text"  placeholder="职位" class="login_input input_w" value="" >
                  	</td>
           </tr>
           <tr>
                  <td colspan="2">
              		<strong>活动内容：</strong>（英语协会策划活动等等）<br/>
              		<textarea id="content" name="socialPractice.activityContent" cols="20" rows="5" class="login_input" style="height:100px;width:646px;"></textarea>
                    <!-- <div id="info1" class="word_c">你可以输入<span>500</span>字</div> -->
                    <div style="vertical-align: bottom; height: 20px; line-height: 20px; margin: 0px;color: Gray;">
						<label id="info2" style="float: right; font-size: 12px;padding-right: 35px;">个字</label>
   						<span id="info" style="float: right; font-size: 20px; font-weight: bold;"></span>
   						<label id="info1" style="float: right; font-size: 12px;">
       						您输入了</label></div>
                  </td>
          </tr>        
               <!--  <tr><td><span id="SpanWork" style="color: red;"></span></td></tr> -->
                <tr>
                  <td colspan="2" style="text-align:center;"><input  type="button" onclick="addSocial();" value="添加" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#sjAddDiv', '#sjShowDiv')" value="取消"/>
                </tr>
              </table>
          </form>
         </div>                
         <div class="xiangq_k" id="hideDivsShsj" style="display: none;">
      <table>
          <tr>
              <td rowspan="2" ><a onclick="showEdit('#sjEditDiv', '#sjAddDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
              <td>社团实践可以充分体现你的社交能力……</td>
          </tr>
           <tr>
                <td><a onclick="showEdit('#sjEditDiv', '#sjAddDiv');" class="h_b_under">添加工作经历</a></td>
           </tr>
      </table>
  </div> 

<script type="text/javascript">
$(function() {
	var socialPracticeId = $("#socialPracticeId").val();
	if(socialPracticeId=='' || socialPracticeId==null){
		$("#hideDivsShsj").show();
	}
	$("#content").focus(check);
    $("#contentE_0").focus(checkE0);
    $("#contentE_1").focus(checkE1);
    $("#contentE_2").focus(checkE2);
    $("#contentE_3").focus(checkE3);
    $("#contentE_4").focus(checkE4);
    $("#contentE_5").focus(checkE5);
    $("#contentE_6").focus(checkE6);
    $("#content").keyup(check);
    $("#contentE_0").keyup(checkE0);
    $("#contentE_1").keyup(checkE1);
    $("#contentE_2").keyup(checkE2);
    $("#contentE_3").keyup(checkE3);
    $("#contentE_4").keyup(checkE4);
    $("#contentE_5").keyup(checkE5);
    $("#contentE_6").keyup(checkE6);
	$("body").mousedown(check);
});

function check() {
    var str = $("#content").val();
    var len = strlen(str);
   /*  var info = 300 - len; */
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
    /* if (len <= 300) { */
        $("#info1").html("您输入了");
        $("#info").css('color', 'gray');
        $("#info").html(info);
    /* } else {
        info = info.substr(1)
        $("#info1").html("超过");
        $("#info").css('color', 'red');
        $("#info").html(info);
    } */
}
function checkE0() {
    var str = $("#contentE_0").val();
    var len = strlen(str);
    /* var info = 300 - len; */
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
    /* if (len <= 300) { */
        $("#infoE1_0").html("您输入了");
        $("#infoE_0").css('color', 'gray');
        $("#infoE_0").html(info);
   /*  } else {
        info = info.substr(1)
        $("#infoE1").html("超过");
        $("#infoE").css('color', 'red');
        $("#infoE").html(info);
    } */
}
function checkE1() {
    var str = $("#contentE_1").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoE1_1").html("您输入了");
        $("#infoE_1").css('color', 'gray');
        $("#infoE_1").html(info);
}
function checkE2() {
    var str = $("#contentE_2").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoE1_2").html("您输入了");
        $("#infoE_2").css('color', 'gray');
        $("#infoE_2").html(info);
}
function checkE3() {
    var str = $("#contentE_3").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoE1_3").html("您输入了");
        $("#infoE_3").css('color', 'gray');
        $("#infoE_3").html(info);
}
function checkE4() {
    var str = $("#contentE_4").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoE1_4").html("您输入了");
        $("#infoE_4").css('color', 'gray');
        $("#infoE_4").html(info);
}
function checkE5() {
    var str = $("#contentE_5").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoE1_5").html("您输入了");
        $("#infoE_5").css('color', 'gray');
        $("#infoE_5").html(info);
}
function checkE6() {
    var str = $("#contentE_6").val();
    var len = strlen(str);
    info = len + "";
    if (info.indexOf('.') > 0)
        info = info.substring(0, info.indexOf('.'));
        $("#infoE1_6").html("您输入了");
        $("#infoE_6").css('color', 'gray');
        $("#infoE_6").html(info);
}
</script>