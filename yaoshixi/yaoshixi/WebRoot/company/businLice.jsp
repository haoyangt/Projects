<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp"%>
<script type="text/javascript">
function businLiceUpdate(){
	var businessLicense2 = $("#businessLicense2").val();
	var organizationCode2 = $("#organizationCode2").val();
	if(businessLicense2!=null && businessLicense2!='' && organizationCode2!=null && organizationCode2!=''){
		var $form = $("#businLiceFrom");
		 $.ajax({
			type:'POST',
			url:'company/saveEdit',
			data:$form.serializeArray(),
			cache:false,
			dataType:'html',
			success:function(html){
				$("#businLiceDiv").html(html);
				showEdit('#businLiceEditDiv', '#businLiceShowDiv');
			}
		}); 
	}else{
		$("#Spane").text("照片不能为空！");
	}
}
</script>
<div class="s_qt">
<p><label>营业执照</label></p>
<div class="s_cs" id="businLiceShowDiv">
	<div class="bj_grxx">
		<a href="javascript:void(0);" onclick="showEdit('#businLiceShowDiv', '#businLiceEditDiv')"  class="a_edit">&nbsp;&nbsp;</a>
	</div>
	 <p style="padding-bottom: 10px">
		<img alt="营业执照" width="100px" src="user/getHeadPhoto?ImgPath=${company.businessLicense}">
	</p>	
	<p style="padding-bottom: 10px">
		<img alt="组织机构代码证" width="100px" src="user/getHeadPhoto?ImgPath=${company.organizationCode}">
	</p> 
</div>
</div>
<!-- 编辑创始团队 -->
<div class="s_cs_edit" style="display: none;" id="businLiceEditDiv">
	<form action=""id="businLiceFrom">
		 <div class="fl" style="width:100%">
	            <div class="register_left" style="width:200px;">
           		    <div id="facediv">  
                     	<p>
                       	 	<a>
                       	 	<c:if test="${company.businessLicense==null || company.businessLicense==''}">
                       	    	<img id ="face" src="res/images/cor.png" width="118" height="119">
                       	    </c:if>
                       	    <c:if test="${company.businessLicense!=null && company.businessLicense!=''}">
                       	    <img alt="营业执照" id ="face" width="100px" src="user/getHeadPhoto?ImgPath=${company.businessLicense}">
                       	    </c:if>
                      		</a>
                       	</p>	
                    </div> 
                   	<p style="width:100%;overflow: hidden;">
                   		<input type="button" value="上传营业执照"  id="businessLicense"  style="width:100px"/>
                   		<input type="hidden" name="companyInfo.businessLicense" id="businessLicense2" value="${company.businessLicense}" style="width:100px"/>
                   	</p>
                 </div>
                 <div class="register_left" style="width:200px;">
           		    <div id="facediv2">  
                     	<p>
                       	 	<a>
                       	 	<c:if test="${company.organizationCode==null || company.organizationCode==''}">
                       	   	 <img id ="face2" src="res/images/cor.png" width="118" height="119">
                       	    </c:if>
                       	    <c:if test="${company.organizationCode!=null && company.organizationCode!=''}">
                       	    	<img alt="组织机构代码证" id ="face2" width="100px" src="user/getHeadPhoto?ImgPath=${company.organizationCode}">
                       	    </c:if>
                      		</a>
                       	</p>	
                    </div> 
                   	<p style="width:100%;overflow: hidden;">
                   		<input type="button" value="组织机构代码证" id="organizationCode"  style="width:104px"/>
                   		<input type="hidden" name="companyInfo.organizationCode" id="organizationCode2" value="${company.organizationCode}" style="width:104px"/>
                   	</p>
                 </div></div>
                 <span id="Spane" style="color: red;"></span>
         <div class="login_top">
			<input type="button" onclick="businLiceUpdate()" value="保存" class="btn_style1" />
			<input type="button" value="取消" class="btn_cancel" onclick="showEdit('#businLiceEditDiv', '#businLiceShowDiv')" />
		</div>
	</form>
</div>