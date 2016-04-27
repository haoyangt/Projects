 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>


    <div class="xiangq" id="msShowDiv">
                    	<div class="xq_xin">
                            <p style="padding-right:40px;">${resumeSelf.selfDescription }</p>
                        </div>
                        <div class="bj_grxx"><a href="javascript:void(0);" class="a_edit" onclick="showEdit('#msShowDiv', '#msEditDiv')">&nbsp;&nbsp;</a></div>
                        <div class="clear"></div>
                    </div>
                    
                     <div class="zwEdit_a" id="msEditDiv" style="display: none">
                    	<form id="selfDescForm">
                    	<input type="hidden" name="userBasicInfo.userId" value="${resumeSelf.userId }">
                        	<table border="0">
                              <tr><td colspan="2">
                             	描述你的性格、爱好以及工作经历、学习经历、获奖项等等<br/>
                              		<textarea name="userBasicInfo.selfDescription" id="description" cols="20" rows="5" class="login_input" style="height:100px">${resumeSelf.selfDescription }</textarea>
                                    <div class="word_c" style="padding-right:0;">你可以输入<span>500</span>字</div>
                              </td></tr>
                              <tr>
                                <td colspan="2" style="text-align:center;"><input type="button" onclick="saveSelfDescForm();" value="保存" class="btn_style1"/>
                                <input class="btn_cancel" type="button" onclick="showEdit('#msEditDiv', '#msShowDiv')" value="取消"/>
                              </tr>
                            </table>
                        </form>
                    
                    </div>
                    
                    <div class="xiangq_k" id="hideDiv2" >
                        <table>
                            <tr>
                                <td rowspan="2" ><a onclick="showEdit('#msShowDiv', '#msEditDiv');"><img src="res/images/tjqw.png" width="65" height="41"></a></td>
                                <td>描述你的性格，爱好以及工作经历、学习经历、获奖项等等……<br/>让企业了解多元化的你！</td>
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
		if($("#description").val() =='' || $("#description").val()==null){
			$("#hideDiv2").show();
		}else{
			$("#hideDiv2").hide();
		}
	
});
	function saveSelfDescForm() {
		var $form = $("#selfDescForm");
		 $.ajax({
				type:'POST',
				url:'user/saveSelfsDesc',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#selfDescDiv").html(html);
					showEdit('#msEditDiv', '#msShowDiv');
				}
			}); 
	}
	
</script>                   