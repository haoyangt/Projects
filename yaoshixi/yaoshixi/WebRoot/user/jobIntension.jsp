 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="res/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript" src="res/js/md5.js"></script>
<script type="text/javascript" src="res/js/placeholder.js"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
data-appid="101026976" data-redirecturi="http://www.yaoshixi.com/qc_callback.jsp" charset="utf-8"></script>
   <script type="text/javascript">
   $(function(){
		validateUtil.init($(document));
		$('input, textarea').placeholder();
	});
	function saveBasicInfos() {
		var jobCity = $("#jobCity").val();
		var jobAttrValue = $("#jobAttrValue").val();
		var canStart = $("#canStart").val();
		var canEnd = $("#canEnd").val();
		if(jobCity!='' && jobAttrValue!='' && canStart!='' && canEnd!='' && jobCity!='希望职位所在城市' && jobAttrValue!='希望职位类别' && canStart!='实习开始时间' && canEnd!='实习结束时间'){
			var $form = $("#userBasicForm");
			 $.ajax({
				type:'POST',
				url:'user/saveUserBasicInfo',
				data:$form.serializeArray(),
				cache:false,
				dataType:'html',
				success:function(html){
					$("#userBasicInfoDiv").html(html);
					showEdit('#jbEditDivs', '#jbShowDivs');
				}
			}); 
			 $.ajax({
					type:'POST',
					url:'user/resume',
					data:{"userId":$("#userId").val()},
				    success:function(html) {
				    }
				});
		}else{
			$("#Span").text("带*的信息没有填写完整！");
		}
		
	}
//-->
</script>
<%@ include file="/jstl.jsp" %>
			
 				<div class="xiangq" id="jbShowDivs">
                    	<div class="xq_xin">
                            <p><label>希望的工作所在城市：</label><label>${jobCity}</label></p>
                            <p><label>希望的职位类别：</label><label>${category}</label></p>
                            <p>
                            	<label>期望的工作性质：</label>
                            	<label>
                            		<c:if test="${timeAvailable==1 }">全职</c:if>
                            		<c:if test="${timeAvailable==2 }">按天</c:if>
                            		<c:if test="${timeAvailable==3 }">按小时</c:if>
                            	</label>
                            </p>
                            <c:if test="${canStart !='' && canStart!=null}">
                            	<p><label>实习时间：</label><label>${canStart}到${canEnd}</label></p>
                            </c:if>
                        </div> 
                        <div class="bj_grxx"><a href="javascript:void(0);" class="a_edit" onclick="showEdit('#jbShowDivs', '#jbEditDivs')">&nbsp;&nbsp;</a></div>
                        <div class="clear"></div>
                    </div>
                    
                    
                    <div class="basicEdit_a" id="jbEditDivs" style="display: none">
                        <div class="register_right">
                            <form id="userBasicForm" >
                            <div class="login_top">希望职位所在城市:
                            	<input name="userBasicInfo.jobCity" id="jobCity" value="${jobCity }" type="text" style="width: 350px" validate="required::请输入希望职位所在城市" placeholder="希望职位所在城市" class="login_input kt_input_w login_input_bg">
                            </div>
                            <div class="login_top">希望职位类别:
                            	<input  id="category" value="${category }" type="text" style="width: 350px" validate="required::请输入希望职位类别" placeholder="希望职位类别" class="login_input kt_input_w login_input_bg">
                            	<input name="userBasicInfo.category" type="hidden" id="jobAttrValue">
                            </div>
                             <div class="login_top">实习时间:<br>
                            	<input name="userBasicInfo.canStart" id="canStart" value="${canStart }" type="text"  validate="required::请输入实习开始时间" onclick="WdatePicker();" placeholder="实习开始时间"  class="login_input login_input_bg">到
                            	<input name="userBasicInfo.canEnd" id="canEnd" value="${canEnd }" type="text"  validate="required::请输入实习结束时间" onclick="WdatePicker();" placeholder="实习结束时间"  class="login_input login_input_bg"><font style="color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;例：1991-01-01</font>
                            </div>
                            <div class="login_top"><span class="bt">*</span>
                            	 <label>
                                  <input type="radio" name="resume.timeAvailable" id="workday" value="1" checked="checked" <c:if test="${timeAvailable==1 }">checked="checked" </c:if>>全职
                                </label>
                                <label>
                                  <input type="radio" name="resume.timeAvailable" id="weekend" value="2" <c:if test="${timeAvailable==2 }">checked="checked" </c:if>>按天
                                </label>
                                <label>
                                  <input type="radio" name="resume.timeAvailable" id="holiday" value="3" <c:if test="${timeAvailable==3 }">checked="checked" </c:if>>按小时
                                </label>
                                <span id="Span" style="color: red;"></span>
                            </div>
                            
							<input type="hidden" name="userBasicInfo.userId" value="${userId }">
							<input type="hidden" name="resume.userId" value="${userId }">
                            <div class="login_top" style="text-align:center;"><input  type="button" onclick="saveBasicInfos();" value="保存" class="btn_style1"/>
                            <input class="btn_cancel" type="button" onclick="showEdit('#jbEditDivs', '#jbShowDivs')" value="取消">
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
			cancel: false,
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
	
	/* $('#fileResume').on("click", function(){
		var title = "上传简历附件";
        var url = "user/fileResume.jsp";
		top.dialog({
			id: 'artBoxForFileResume',
			title: title,
			url: url,
			quickClose: false,
			width: '500px',
			height: '120px',
			onclose: function(){
				if(this.returnValue){
					$("#accessory").attr("src","user/getHeadPhoto?ImgPath="+this.returnValue);
				}
			}
		}).showModal();
	}); */
	
	function ddd(){
		 $.ajax({
				type:'POST',
				url:'user/uploadImg',
				data:"",
				cache:false,
				dataType:'json',
				success:function(json){
					alert(json);
				}
			}); 
	}
</script>