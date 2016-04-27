<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
    <c:forEach items="${page.results }" var="jobs" varStatus="idxStatus">      
      <div class="zwnews">
          <div class="index_logo"><img width="80" height="80" src="${jobs.companyLogo }" ></div>
          <div class="zwnews_left">
           <div class="inde_t"><a href="c/index/${jobs.companyId }">${jobs.companyShortName }</a></div>
           <p><label class="color_c">领域：</label>
           		<c:if test="${jobs.field == '' || jobs.field == null}">未提供</c:if>
           		<c:if test="${jobs.field != '' && jobs.field != null}">${jobs.field }</c:if>
           		</p>
           <p><label class="color_c">阶段：</label>
           		<c:if test="${jobs.growthStage == '' || jobs.growthStage == null}">未提供</c:if>
           		<c:if test="${jobs.growthStage != '' && jobs.growthStage != null}">${jobs.growthStage }</c:if>
           &nbsp;&nbsp;&nbsp;&nbsp;<label class="color_c">规模：</label>
           		<c:if test="${jobs.scale == '' || jobs.scale == null }">未提供</c:if>
           		<c:if test="${jobs.scale != '' && jobs.scale != null }">${jobs.scale }</c:if>
           </p>
            <p>${myfn:friendlyTime(jobs.publishTime)}发布</p>
           <div class="biaoq_list">
           	<c:forTokens items="${jobs.tags }" delims="," var="tag">
           		<span><c:out value="${tag }"></c:out></span>
           	</c:forTokens>
           </div>
         </div>
         <div class="zwnews_right">
         <!-- 只显示三个职位 -->
       		<c:if test="${jobs.id1 != '' && jobs.id1 != null && (jobs.id3 == '' || jobs.id3 == null)}">
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16"><strong>${jobs.jobName }</strong></a>
         			<label class="color_c fr">[${jobs.city } ${jobs.area }]</label>
         			<div class="tjl_a">
	           			<c:if test="${jobs.status != 1 }">
		          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
	           				<input type="hidden" value="${jobs.id }">
		          			</a>
	         			</c:if>
	         			<c:if test="${jobs.status == 1 }">
	         				<a class="tjlcurr" title="已投简历">
	         				<input type="hidden" value="${jobs.id }">
	         				</a>
	         			</c:if>
         			</div>	
         		</div>
         		<div class="inde_t">	
         			<a target="_blank" href="jobDetail/${jobs.id1 }" class="h_b f16"><strong>${jobs.jobName1 }</strong></a>
         			<label class="color_c fr">[${jobs.city1 } ${jobs.area1 }]</label>
	          		<div class="tjl_a">
	           			<c:if test="${jobs.status1 != 1 }">
		          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
	           				<input type="hidden" value="${jobs.id1 }">
		          			</a>
	         			</c:if>
	         			<c:if test="${jobs.status1 == 1 }">
	         				<a class="tjlcurr" title="已投简历">
	         				<input type="hidden" value="${jobs.id1 }">
	         				</a>
	         			</c:if>
         			</div>	
         		</div>
         		<c:if test="${jobs.id2 !='' && jobs.id2 != null}">
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id2 }" class="h_b f16"><strong>${jobs.jobName2 }</strong></a>
         			<label class="color_c fr">[${jobs.city2 } ${jobs.area2 }]</label>
	          		<div class="tjl_a">
	           			<c:if test="${jobs.status2 != 1 }">
		          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
	           				<input type="hidden" value="${jobs.id2 }">
		          			</a>
	         			</c:if>
	         			<c:if test="${jobs.status2 == 1 }">
	         				<a class="tjlcurr" title="已投简历">
	         				<input type="hidden" value="${jobs.id2 }">
	         				</a>
	         			</c:if>
         			</div>	
         		</div>
         		</c:if>		
       		</c:if>
       		
       		<!-- 显示三个职位 加更多 -->
       		<c:if test="${jobs.id3 != '' && jobs.id3 != null }">
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16"><strong>${jobs.jobName }</strong></a>
         			<label class="color_c fr">[${jobs.city } ${jobs.area }]</label>
	          		<div class="tjl_a">
	           			<c:if test="${jobs.status != 1 }">
		          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
	           				<input type="hidden" value="${jobs.id }">
		          			</a>
	         			</c:if>
	         			<c:if test="${jobs.status == 1 }">
	         				<a class="tjlcurr" title="已投简历">
	         				<input type="hidden" value="${jobs.id }">
	         				</a>
	         			</c:if>
         			</div>	
         		</div>
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id1 }" class="h_b f16"><strong>${jobs.jobName1 }</strong></a>
         			<label class="color_c fr">[${jobs.city1 } ${jobs.area1 }]</label>
	          		<div class="tjl_a">
	           			<c:if test="${jobs.status1 != 1 }">
		          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
	           				<input type="hidden" value="${jobs.id1 }">
		          			</a>
	         			</c:if>
	         			<c:if test="${jobs.status1 == 1 }">
	         				<a class="tjlcurr" title="已投简历">
	         				<input type="hidden" value="${jobs.id1 }">
	         				</a>
	         			</c:if>
         			</div>	
         		</div>
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id2 }" class="h_b f16"><strong>${jobs.jobName2 }</strong></a>
         			<label class="color_c fr">[${jobs.city2 } ${jobs.area2 }]</label>
	          		<div class="tjl_a">
	           			<c:if test="${jobs.status2 != 1 }">
		          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
	           				<input type="hidden" value="${jobs.id2 }">
		          			</a>
	         			</c:if>
	         			<c:if test="${jobs.status2 == 1 }">
	         				<a class="tjlcurr" title="已投简历">
	         				<input type="hidden" value="${jobs.id2 }">
	         				</a>
	         			</c:if>
         			</div>	
         		</div>		
         		<a id="moverGz" target="_blank" href="c/index/${jobs.companyId }" ></a>
         		<div class="tjl_a"><input type="button" onclick="moverGz();" class="btn_tjlm" title="更多"></input></div>
       		</c:if>
       		
       		<!-- 只显示一个职位 -->
       		<c:if test="${jobs.id1 == '' || jobs.id1 == null }">
       		 <div class="inde_t">
	           	<a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16"><strong>${jobs.jobName }</strong></a>
	           &nbsp;&nbsp;&nbsp;&nbsp;
	           <c:if test="${jobs.city == '' || jobs.city == null }"><label class="color_c">未提供</label></c:if>
	           <c:if test="${jobs.city != null && jobs.city != '' }"><label class="color_c">[${jobs.city } ${jobs.area }]</label></c:if>
           		<div class="tjl_a">
           			<c:if test="${jobs.status != 1 }">
	          			<a id="diliverResumeBtn"  class="btn_tjls" title="投递简历">
           				<input type="hidden" value="${jobs.id }">
	          			</a>
         			</c:if>
         			<c:if test="${jobs.status == 1 }">
         				<a class="tjlcurr" title="已投简历">
         				<input type="hidden" value="${jobs.id }">
         				</a>
         			</c:if>
         		</div>	
           </div>  
         <p><label class="color_c">月薪：</label>
         	<c:if test="${jobs.payment == '' || jobs.payment == null}">未提供</c:if>
		    <c:if test="${jobs.payment != '' && jobs.payment != null}">${jobs.payment }</c:if>
         &nbsp;&nbsp;&nbsp;&nbsp;
           	<label class="color_c">最低学历：</label>
	           <c:if test="${jobs.educationalReq == '' || jobs.educationalReq == null || jobs.educationalReq == 1 }">不限</c:if>
	           <c:if test="${jobs.educationalReq == 2 }">高中</c:if>
	           <c:if test="${jobs.educationalReq == 3 }">专科</c:if>
	           <c:if test="${jobs.educationalReq == 4 }">本科</c:if>
	           <c:if test="${jobs.educationalReq == 5 }">硕士</c:if>
	           <c:if test="${jobs.educationalReq == 6 }">博士</c:if>
	       </p>
	       <p>    
           	<label class="color_c">招聘人数：</label>
           		<c:if test="${jobs.employ == 0 }">若干</c:if>
           		<c:if test="${jobs.employ != 0 && jobs.employ !=null && jobs.employ !='' }">${jobs.employ }人</c:if>
           </p>
           <p>
       		<label class="color_c">职位诱惑：</label>
           		<c:if test="${jobs.temptation == '' || jobs.temptation == null || jobs.temptation == '无' }">未提供</c:if>
           		<c:if test="${jobs.temptation != null && jobs.temptation != '' && jobs.temptation != '无' }">${jobs.temptation }</c:if>
           	</p>
          
           	</c:if>
            <input type="hidden" id="jobName" value="${jobs.jobName }">
            <input type="hidden" id="city" value="${jobs.city }">
            <input type="hidden" id="scope" value="${jobs.scope }">
            <input type="hidden" id="xueli" value="${jobs.xueli }">
            <input type="hidden" id="jobCategory" value="${jobs.jobCategory }">
            <input type="hidden" id="releaseTime" value="${jobs.releaseTime }">
            <input type="hidden" id="jobAttrValue" value="${jobs.jobAttrValue }">
         </div>
      </div>
</c:forEach>

<%@ include file="/pager.jsp"%>

<script type="text/javascript">
require(["jquery", "artLab"], function($, artLab){
var jobName = $("#jobName").val();
var city = $("#city").val();
var scope = $("#scope").val();
var xueli = $("#xueli").val();
var jobCategory = $("#jobCategory").val();
var releaseTime = $("#releaseTime").val();
var jobAttrValue = $("#jobAttrValue").val();

	$("a#diliverResumeBtn").each(function(){
		var a_diliver = $(this);
		a_diliver.click(function(){
			var id = a_diliver.children("input[type='hidden']").val();
			diliverResume(id);
		});
		function diliverResume(id) {
			$.ajax({
				type:'POST',
				url:'user/diliverResume',
				data:{"jobId":id},
				dataType:'json',
				success:function(json) {
					artLab.msg(json.msg);
					$.ajax({
						type:'POST',
						url:'refresh',
						data:{"jobName":jobName,"city":city,"xueli":xueli,"jobCategory":jobCategory,"releaseTime":releaseTime,"scope":scope, "jobAttrValue": jobAttrValue},
						dataType:'html',
						success:function(html) {
							$("#jobsContent").html(html);
						}
					});
				}
			});
		}
	});	
});

function moverGz(){
	document.getElementById("moverGz").click();
}
</script>
