<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
     <c:forEach items="${award }" var="award" varStatus="s">              
<div class="xiangq" id="saShowDiv_${s.index }">
                    	<div class="xq_xin">
                           <div class="shix_li">
                           		<p><strong  class="f16"> ${award.seminary } 
                           			&nbsp;&nbsp;${award.schoolReward}</strong></p>
                                <table>
                                	<tr>
                                	 <td>${award.rewardTime}
                                	 </td>
                                	</tr>
                                </table>
                                 <div class="bj_grxx"><a onclick="showEdit('#saShowDiv_${s.index }', '#saEditDiv_${s.index }')" class="a_edit_s">&nbsp;&nbsp;</a>
                                 <a onclick="deleteAward(${award.id })" class="a_delete_s">&nbsp;&nbsp;</a></div>
                          
                           </div>
                           
                        </div>
                       <div class="clear"></div>
                    </div>
                    
                    
                     <div class="jyEdit_a" id="saEditDiv_${s.index }" style="display: none">
                    	<form id="schoolAwardForm_${s.index }">
                        	<input type="hidden" name="schoolRewards.id" id="schoolRewardsId" value="${award.id }">
                        	<table   border="0">
                        	
                              <tr>
                                <td>学校/活动：<!-- <span class="kt_font_x">(双击输入框可以选择学校)</span> -->
                              		<input name="schoolRewards.seminary" id="seminary_${s.index }" type="text"  placeholder="学校名称或活动名称" class="login_input input_w" value="${award.seminary}">
                              	</td> 
                              	<td>奖项：
	                               		<input name="schoolRewards.schoolReward" id="schoolReward" type="text"  placeholder="奖项" class="login_input input_w" value="${award.schoolReward }" >
	                             </td>
                              </tr>
                               <tr>
                              	<td>时间：&nbsp;&nbsp;&nbsp;&nbsp;<br>
	                                <input name="schoolRewards.rewardTime" id="rewardTime" onClick="WdatePicker();" type="text" placeholder="得奖时间" class="login_input login_input_bg input_w"  value="${award.rewardTime}">
                               	</td>
                              </tr>
                              <!-- <tr><td><span id="SpanWork" style="color: red;"></span></td></tr> -->
                              <tr>
                                <td colspan="2" style="text-align:center;"><input  type="button" onclick="saveExpers('_${s.index }');" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#saEditDiv_${s.index }', '#saShowDiv_${s.index }')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
     </c:forEach>     
      <div class="bj_grxs"><a href="javascript:void(0);" class="a_add" onclick="showEdit('#saEditDiv', '#saAddDiv');">&nbsp;&nbsp;</a></div>
                        
          <div class="jyEdit_a" id="saAddDiv" style="display: none">
                    	<form id="schoolAwardForm2">
                    		<%-- <input type="hidden" name="userBasicInfo.userId" value="${userId }">
                        	<input type="hidden" name="resume.userId" value="${userId }"> --%>
                        	<table   border="0">
                        	
                              <tr>
                                <td id="school">学校/活动：<span class="kt_font_x">(双击输入框可以选择学校)</span>
                              		<input name="schoolRewards.seminary" id="seminary" type="text"  placeholder="学校名称或活动名称" class="login_input input_w" value="">
                              	</td> 
                              	<td>奖项：
	                               		<input name="schoolRewards.schoolReward" id="schoolReward" type="text"  placeholder="奖项" class="login_input input_w" value="" >
	                             </td>
                              </tr>
                               <tr>
                              	<td>时间：&nbsp;&nbsp;&nbsp;&nbsp;<br>
	                                <input name="schoolRewards.rewardTime" id="rewardTime" onClick="WdatePicker();" type="text" placeholder="得奖时间" class="login_input login_input_bg input_w"  value="">
                               	</td>
                              </tr>
                             <!--  <tr><td><span id="SpanWork" style="color: red;"></span></td></tr> -->
                              <tr>
                                <td colspan="2" style="text-align:center;"><input  type="button" onclick="addExpers();" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#saAddDiv', '#saShowDiv')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>   
                       
                    <div class="xiangq_k" id="hideDivesyXNjl" style="display: none;">
				      <table>
				          <tr>
				              <td rowspan="2" ><a onclick="showEdit('#saEditDiv', '#saAddDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
				              <td>奖项奖杯可以充分体现你的学习能力……</td>
				          </tr>
				           <tr>
                                <td><a onclick="showEdit('#saEditDiv', '#saAddDiv');" class="h_b_under">添加获奖情况</a></td>
                            </tr>
				      </table>
				  </div> 
<script src="res/js/require.js"></script>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
	top.dialog = art;
	var schoolRewardsId = $("#schoolRewardsId").val();
	if(schoolRewardsId==null || schoolRewardsId==''){
		$("#hideDivesyXNjl").show();
	}
	$("#seminary").dblclick(function(){
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
				$("#seminary").val(this.data.university);
			}
		}).show(document.getElementById('seminary'));
	});
});	
function saveExpers(num) {
	//var university = document.getElementById("university").value;
	//var eduBackground = document.getElementById("eduBackground").value;
	//var college = document.getElementById("college").value;
	//var enterUniversityYear = document.getElementById("enterUniversityYear").value;
	//if(university!='' && eduBackground!='' && college!='' && enterUniversityYear!='' && university!='学校名称' && eduBackground!='学历' && college!='专业名称' && enterUniversityYear!='入学时间'){
		var $form = $("#schoolAwardForm"+num);
		 $.ajax({
				type:'POST',
				url:'user/saveSchoolAward',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#awardDiv").html(html);
					showEdit('#saEditDiv'+num, '#saShowDiv'+num);
				}
			}); 
	//}else{
	//	$("#SpanWork").text("带*号栏没有填写完整！");
	//}	 
}
function addExpers(){
	var $form = $("#schoolAwardForm2");
	 $.ajax({
			type:'POST',
			url:'user/addSchoolAward',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#awardDiv").html(html);
				showEdit('#saAddDiv', '#saShowDiv');
			}
		}); 
}
function deleteAward(id){
	$.ajax({
		type:'POST',
		url:'user/deleteAward',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#awardDiv").html(html);
			showEdit('#saAddDiv', '#saShowDiv');
		}
	}); 
}

</script>