<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
       <p style="padding-left:10px;"><strong  class="f14">语言能力</strong></p>
   <div style="position: relative;">
     <c:forEach items="${vocational }" var="vocational" varStatus="s">
    
<div class="xiangq" id="vsShowDiv_${s.index }">
                    	<div class="xq_xin">
                           <div class="shix_li">
                           <p style="height: 6px;">
                           			语种:${vocational.language} 
                           			&nbsp;&nbsp; 听说:${vocational.hearOf }
                           			&nbsp;&nbsp; 读写:${vocational.readWrite }
                  				<c:if test="${vocational.language == '英语' || vocational.language == '日语'}">
                           			&nbsp;&nbsp; 等级:${vocational.grade }
                           		</c:if>	
                      			<c:if test="${vocational.language == '英语'}">
                           			&nbsp;&nbsp; 分数:${vocational.score }
                      			</c:if>
                           			</p>
                           		 <div class="bj_grxx">
	                           		 <a onclick="deleteVocational(${vocational.id })" class="a_delete_s">&nbsp;&nbsp;</a>
                           		 </div>
                           </div>
                        </div>
                        <div class="clear">
                        	<input type="hidden" id="vocationalId" value="${vocational.id }">
                        </div>
                    </div>
       </c:forEach>
         <div class="bj_grxs"><a href="javascript:void(0);" class="a_add" onclick="showEdit('#vsEditDiv', '#vsAddDiv');">&nbsp;&nbsp;</a></div>
        </div>            
        <div class="jyEdit_a" id="vsAddDiv" style="display: none">
                    	<form id="vocationalSkillsForm">
                    		<%-- <input type="hidden" name="userBasicInfo.userId" value="${userId }">
                        	<input type="hidden" name="resume.userId" value="${userId }"> --%>
                        	<table   border="0">
                      			<tr>
                                <td>语种：
                              		<%-- <input name="schoolRewards.language" id="language" type="text"  placeholder="公司名称" class="login_input input_w" value="${language}"> --%>
                              		<select onchange="conceal();" id="language" name="vocationalSkills.language">
                              				<option value="粤语">粤语</option>
                              				<option value="英语">英语</option>
                              				<option value="日语">日语</option>
                              				<option value="韩语">韩语</option>
                              				<option value="西班牙语">西班牙语</option>
                              				<option value="法语">法语</option>
                              				<option value="其他">其他</option>
                              		</select>
                              	</td> 
                              	<td>听说：
	                               	<%-- <input name="schoolRewards.hearOf" id="hearOf" type="text"  placeholder="职位" class="login_input input_w" value="${hearOf }" > --%>
	                             	<select name="vocationalSkills.hearOf">
                              				<option>一般</option>
                              				<option>良好</option>
                              				<option>熟练</option>
                              		</select>
	                             </td>
                              	<td>读写：
	                                <%-- <input name="schoolRewards.readWrite" id="rewardTime" onClick="WdatePicker();" type="text" placeholder="得奖时间" class="login_input login_input_bg input_w"  value="${rewardTime}"> --%>
	                                <select name="vocationalSkills.readWrite">
                              				<option>一般</option>
                              				<option>良好</option>
                              				<option>熟练</option>
                              		</select>
                               	</td>
                               	<td id="gradeYy" style="display: none;">等级：
	                                <select id="SgradeYy" name="">
                              				<option>CET四级</option>
                              				<option>CET六级</option>
                              				<option>TEM四级</option>
                              				<option>TEM八级</option>
                              				<option>雅思</option>
                              				<option>托福</option>
                              				<option>GRE</option>
                              				<option>GMAT</option>
                              				<option>BEC中级</option>
                              				<option>BEC高级</option>
                              		</select>
                               	</td>
                               	<td id="gradeRy" style="display: none;">等级：
	                                <select id="SgradeRy" name="">
                              				<option>一级</option>
                              				<option>二级</option>
                              				<option>三级</option>
                              				<option>四级</option>
                              		</select>
                               	</td>
                               	<td id="score" style="display: none;">分数：
	                                <input name="vocationalSkills.score" type="text"  style="width:60px" value="0">
                               	</td>
                              </tr>
                              <tr>
                                <td colspan="4" style="text-align:center;"><input  type="button" onclick="addVocation();" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#vsAddDiv', '#vsShowDiv')" value="取消"/>
                              </tr>
                                </table>
                        </form>
                    </div>
                    <div class="xiangq_k" id="hideDivYuYan" style="display: none;">
				      <table>
				          <tr>
				              <td rowspan="2" ><a  onclick="showEdit('#vsEditDiv', '#vsAddDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
				              <td>添加语言能力……</td>
				          </tr>
				           <tr>
                                <td><a  onclick="showEdit('#vsEditDiv', '#vsAddDiv');" class="h_b_under">添加语言能力</a></td>
                            </tr>
				      </table>
				  </div>
        
         <p style="padding-left:10px;"><strong  class="f14">IT技能</strong></p>
         <p style="padding-left:10px;">精通的技能：<span class="kt_font_x">(双击输入框可以选择)</span></p>
       <div style="position: relative;">
        <c:forEach items="${itSkillJt }" var="itSkillJt" varStatus="s">    
        		<div class="xiangq" id="vsShowJtDiv_${s.index }">
                           <div class="xq_xin">
                           <div class="shix_li">
                           		<p style="height: 6px;">${itSkillJt.skill }</p>
                           		 <div class="bj_grxx">

                           		 	<%-- <a onclick="showEdit('#vsShowJtDiv_${s.index }', '#vsEditJtDiv_${s.index }');" class="a_edit_s">&nbsp;&nbsp;</a> --%>
                           		 	<a href="javascript:void(0);" class="a_delete_s" onclick="deleteJtSkill(${itSkillJt.id})">&nbsp;&nbsp;</a>

                           		 </div>        	
                        
                           </div>
                           
                        </div>   
                        <div class="clear"></div>
                    </div>
               
                   <div class="jyEdit_a" id="vsEditJtDiv_${s.index }" style="display: none">
                    	<form id="JtSkillsForm_${s.index }">
                    		<input type="hidden" name="itSkill.id" id="itSkillIdJt" value="${itSkillJt.id }">
                        	<table   border="0">           
                              <tr>
                              		<td colspan="3"><input type="text" name="itSkill.skill" id="skillMastery_${s.index }" value="${itSkillJt.skill}" class="login_input input_w"/></td>
                              </tr>
                              <tr>
                                <td colspan="4" style="text-align:center;"><input  type="button" onclick="saveJtSkill('_${s.index }');" value="修改" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#vsEditJtDiv_${s.index }', '#vsShowJtDiv_${s.index }')" value="取消"/>
                              </tr>
                    </table>
                        </form>
                    </div> 
        </c:forEach>        
         <div class="bj_grxs"><a href="javascript:void(0);" class="a_add" onclick="showEdit('#vsEditJtDiv', '#vsAddJtDiv');">&nbsp;&nbsp;</a></div>
          </div>                               
              <div class="jyEdit_a" id="vsAddJtDiv" style="display: none">
                    	<form id="JtSkillsForm2">
                        	<table   border="0">           
                              <tr>
                              		<td colspan="3">
                              		<input type="text" name="itSkill.skill" id="skillMastery" value="" class="login_input input_w"/>
                              		</td>
                              		<td>
                              <span id="SpanJt" style="color: red;"></span>
                              		</td>
                              </tr>
                              <tr>
                                <td colspan="3" style="text-align:center;"><input  type="button" onclick="AddJtSkill();" value="添加" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#vsAddJtDiv', '#vsShowJtDiv')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
                    <div class="xiangq_k" id="hideDivJt" style="display: none;">
				      <table>
				          <tr>
				              <td rowspan="2" ><a onclick="showEdit('#vsEditJtDiv', '#vsAddJtDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
				              <td>添加精通的技能……</td>
				          </tr>
				           <tr>
                                <td><a onclick="showEdit('#vsEditJtDiv', '#vsAddJtDiv');" class="h_b_under">添加精通的技能</a></td>
                            </tr>
				      </table>
				  </div>
         <!-- 精通的技能 --> 
         
          <!-- 熟悉的技能 -->
      
          <p style="padding-left:10px;">熟悉的技能：<span class="kt_font_x">(双击输入框可以选择)</span></p>
         <div style="position: relative;">
            <c:forEach items="${itSkillPt }" var="itSkillPt" varStatus="s"> 
         		<div class="xiangq" id="vsShowPtDiv_${s.index }">
                    	<div class="xq_xin">
                           <div class="shix_li">
                           		<p style="height: 6px;">	${itSkillPt.skill }</p>
                           <div class="bj_grxx">
	                           <%-- <a onclick="showEdit('#vsShowPtDiv_${s.index }', '#vsEditPtDiv_${s.index }');" class="a_edit_s">&nbsp;&nbsp;</a> --%>
	                           <a onclick="deletePtSkill(${itSkillPt.id})" class="a_delete_s">&nbsp;&nbsp;</a>
                           </div>
                          
                           </div>
                           
                        </div>
                       <div class="clear"></div>
                    </div>          
                   <div class="jyEdit_a" id="vsEditPtDiv_${s.index }" style="display: none">
                    	<form id="itSkillPtFormPt_${s.index }">
                    		<input type="hidden" name="itSkill.id" id="itSkillPtId" value="${itSkillPt.id }">
                        	<table border="0">                                
                              <tr>
                              		<td colspan="3"><input type="text" name="itSkill.skill" id="skilledCraft_${s.index }" value="${itSkillPt.skill }" class="login_input input_w"/></td>
                              </tr>
                              <tr>
                                <td colspan="4" style="text-align:center;"><input  type="button" onclick="saveItSkillPt('_${s.index }');" value="保存" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#vsEditPtDiv_${s.index }', '#vsShowPtDiv_${s.index }')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div> 
        </c:forEach>    
       <div class="bj_grxs"><a href="javascript:void(0);" class="a_add" onclick="showEdit('#vsEditPtDiv', '#vsAddPtDiv');">&nbsp;&nbsp;</a></div>
         </div>            
        <div class="jyEdit_a" id="vsAddPtDiv" style="display: none">
                    	<form id="itSkillPtForm2">
                        	<table   border="0">           
                              <tr>
                              		<td colspan="3">
                              			<input type="text" name="itSkill.skill" id="skilledCraft" value="" class="login_input input_w"/>
                              		</td>
                              		<td>
                              			<span id="SpanPt" style="color: red;"></span>
                              		</td>
                              </tr>
                              <tr>
                                <td colspan="3" style="text-align:center;"><input  type="button" onclick="addItSkillPt();" value="添加" class="btn_style1"/> <input class="btn_cancel" type="button" onclick="showEdit('#vsAddPtDiv', '#vsShowPtDiv')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    </div>
                    <div class="xiangq_k" id="hideDivesyPt" style="display: none;">
				      <table>
				          <tr>
				              <td rowspan="2" ><a onclick="showEdit('#vsEditPtDiv', '#vsAddPtDiv');"><img src="res/images/tjqw.png" width="95" height="71"></a></td>
				              <td>添加熟悉的技能……</td>
				          </tr>
				           <tr>
                                <td><a onclick="showEdit('#vsEditPtDiv', '#vsAddPtDiv');" class="h_b_under">添加熟悉的技能</a></td>
                            </tr>
				      </table>
				  </div> 
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
	top.dialog = art;
	var itSkillPtId = $("#itSkillPtId").val();
	var itSkillIdJt = $("#itSkillIdJt").val();
	var vocationalId = $("#vocationalId").val();
	if(itSkillPtId==null || itSkillPtId==''){
		$("#hideDivesyPt").show();
	}
	if(itSkillIdJt==null || itSkillIdJt==''){
		$("#hideDivJt").show();
	}
	if(vocationalId==null || vocationalId==''){
		$("#hideDivYuYan").show();
	}
	$("#skillMastery").dblclick(function(){
			art({
				id: 'artBoxForSkillMastery',
				title: "选择技能",
				data: {skillMastery:""},
				url: 'job/skilledness.jsp',
				quickClose: true,
				cancel: false,
				width: 658,
				height:365,
				onclose:function(){
					$("#skillMastery").val(this.data.skillMastery);
				}
			}).show(document.getElementById('skillMastery'));
		});
	$("#skilledCraft").dblclick(function(){
		art({
			id: 'artBoxForSkilledCraft',
			title: "选择技能",
			data: {skilledCraft:""},
			url: 'job/skillednessCraft.jsp',
			quickClose: true,
			cancel: false,
			width: 658,
			height:365,
			onclose:function(){
				$("#skilledCraft").val(this.data.skilledCraft);
			}
		}).show(document.getElementById('skilledCraft'));
	});
	
});	
function conceal(){
	var language = document.getElementById("language").value;
	if(language=='英语'){
		$("#score").show();
		$("#gradeYy").show();
		$("#SgradeRy").attr("name","");
		$("#SgradeYy").attr("name","vocationalSkills.grade");
		$("#gradeRy").hide();
	}else if(language=='日语'){
		$("#gradeRy").show();
		$("#SgradeYy").attr("name","");
		$("#SgradeRy").attr("name","vocationalSkills.grade");
		$("#score").hide();
		$("#gradeYy").hide();
	}else{
		document.getElementById("score").style.display="none";
		document.getElementById("gradeYy").style.display="none";
		document.getElementById("gradeRy").style.display="none";
	}
}

/* function saveVocation(num) {
		var $form = $("#vocationalSkillsForm"+num);
		 $.ajax({
				type:'POST',
				url:'user/saveVocationalSkills',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#vocationalSkillsDiv").html(html);
					showEdit('#vsEditDiv'+num, '#vsShowDiv'+num);
				}
			}); 
} */

function addVocation(){
	var $form = $("#vocationalSkillsForm");
	 $.ajax({
			type:'POST',
			url:'user/addVocationalSkills',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#vocationalSkillsDiv").html(html);
				showEdit('#vsAddDiv', '#vsShowDiv');
			}
		}); 
}
function saveJtSkill(num){
	var $form = $("#JtSkillsForm"+num);
	 $.ajax({
			type:'POST',
			url:'user/saveJtSkills',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#vocationalSkillsDiv").html(html);
				showEdit('#vsAddJtDiv'+num, '#vsShowJtDiv'+num);
			}
		}); 
}
function AddJtSkill(){
	var skillMastery = $("#skillMastery").val();
	if(skillMastery==null || skillMastery==''){
		$("#SpanJt").text("精通的技能不能为空！");
	}else{
		var $form = $("#JtSkillsForm2");
		 $.ajax({
			type:'POST',
			url:'user/addJtSkills',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#vocationalSkillsDiv").html(html);
				showEdit('#vsAddJtDiv', '#vsShowJtDiv');
			}
		}); 
	} 
}

function saveItSkillPt(num){
	var $form = $("#itSkillPtFormPt"+num);
	 $.ajax({
			type:'POST',
			url:'user/saveJtSkills',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#vocationalSkillsDiv").html(html);
				showEdit('#vsAddPtDiv'+num, '#vsShowPtDiv'+num);
			}
		}); 
}
function addItSkillPt(){
	var skilledCraft = $("#skilledCraft").val();
	if(skilledCraft==null || skilledCraft==''){
		$("#SpanPt").text("熟悉的技能不能为空！");
	}else{
		var $form = $("#itSkillPtForm2");
		 $.ajax({
			type:'POST',
			url:'user/addPtSkills',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#vocationalSkillsDiv").html(html);
				showEdit('#vsAddPtDiv', '#vsShowPtDiv');
			}
		}); 
	}
}

function deleteVocational(id) {
	$.ajax({
		type:'POST',
		url:'user/deleteVocational',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#vocationalSkillsDiv").html(html);
			showEdit('#vsAddDiv', '#vsShowDiv');
		}
	});  
}

function deleteJtSkill(id){
	$.ajax({
		type:'POST',
		url:'user/deleteJtSkills',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#vocationalSkillsDiv").html(html);
			showEdit('#vsAddJtDiv', '#vsShowJtDiv');
		}
	}); 
}

function deletePtSkill(id){
	$.ajax({
		type:'POST',
		url:'user/deleteJtSkills',
		data:{'id':id},
		cache:false,
		dataType:'html',
		success:function(html){
			$("#vocationalSkillsDiv").html(html);
			showEdit('#vsAddJtDiv', '#vsShowJtDiv');
		}
	}); 
}
</script>