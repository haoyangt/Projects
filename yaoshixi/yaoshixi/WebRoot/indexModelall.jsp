<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>


    <c:forEach items="${page.results }" var="jobs" varStatus="idxStatus"> 
    <%-- ${jobs.ratio} 11  --%>   
      <div class="zwnews">
          <div class="index_logo"><img width="110" height="110" src="${jobs.companyLogo }"></div>
          <div class="zwnews_left">
           <div class="inde_t"><a target="_blank" href="c/index/${jobs.companyId }">${jobs.companyShortName }</a></div>
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
          <%--  <div class="biaoq_list">
           	<c:forTokens items="${jobs.tags }" delims="," var="tag">
           		<span><c:out value="${tag }"></c:out></span>
           	</c:forTokens>
           </div> --%>
         </div>
        
         <!-- 只显示三个职位 -->
       		<c:if test="${jobs.id1 != '' && jobs.id1 != null && (jobs.id3 == '' || jobs.id3 == null)}">
       		 <div class="zwnews_right">
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16"><strong>${jobs.jobName }</strong></a>
         			<label class="color_c">&nbsp;&nbsp;[${jobs.city } ${jobs.area }]</label>
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
         			<label class="color_c">&nbsp;&nbsp;[${jobs.city1 } ${jobs.area1 }]</label>
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
         			<label class="color_c">&nbsp;&nbsp;[${jobs.city2 } ${jobs.area2 }]</label>
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
         		</div>	
       		</c:if>
       		
       		<!-- 显示三个职位 加更多 -->
       		<c:if test="${jobs.id3 != '' && jobs.id3 != null }">
       		 <div class="zwnews_right" style="padding-bottom:30px;">
         		<div class="inde_t">
         			<a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16"><strong>${jobs.jobName }</strong></a>
         			<label class="color_c">&nbsp;&nbsp;[${jobs.city } ${jobs.area }]</label>
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
         			<label class="color_c">&nbsp;&nbsp;[${jobs.city1 } ${jobs.area1 }]</label>
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
         			<label class="color_c">&nbsp;&nbsp;[${jobs.city2 } ${jobs.area2 }]</label>
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
         		
         		<div class="tjl_ag"><a id="moverGz" target="_blank" href="c/index/${jobs.companyId }" ><input type="button" class="btn_tjlm" title="更多"/></a></div>
       		</div>
       		</c:if>
       		
       		<!-- 只显示一个职位 -->
       		<c:if test="${jobs.id1 == '' || jobs.id1 == null }">
       		<div class="zwnews_right">
       		 <div class="inde_t">
	           	<a target="_blank" href="jobDetail/${jobs.id }" class="h_b f16"><strong>${jobs.jobName }</strong></a>
	           &nbsp;&nbsp;
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
         &nbsp;&nbsp;
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
           		<c:if test="${jobs.employ != 0 && jobs.employ !=null && jobs.employ !='' }">${jobs.employ }人</c:if>&nbsp;&nbsp;
           	<label class="color_c">工作性质：</label>
           		<c:if test="${jobs.workTime=='' && jobs.workTime==null }">未提供</c:if>
           		<c:if test="${jobs.workTime==1 }">全职</c:if>
           		<c:if test="${jobs.workTime==2 }">按天</c:if>
           		<c:if test="${jobs.workTime==3 }">按小时</c:if>
           </p>
           <p class="txt_hiddle">
       		<label class="color_c">职位诱惑：</label>
           		<c:if test="${jobs.temptation == '' || jobs.temptation == null || jobs.temptation == '无' }">未提供</c:if>
           		<c:if test="${jobs.temptation != null && jobs.temptation != '' && jobs.temptation != '无' }">${fn:replace(jobs.temptation, '<br>','') }</c:if>
           	</p>
          </div>
           </c:if>
         
         </div>
</c:forEach>
<%@ include file="/pager.jsp"%>

<script type="text/javascript" charset="utf-8">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab',
		lazyload: 'res/js/jquery.lazyload.min'
	},
	shim: {
		'lazyload': {
			deps: ['jquery'],
			exports: 'lazyload'
		}
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe", "lazyload"], function($, artLab, art){	
	/* jQuery(document).ready(function ($) {
        $("img").lazyload({
            placeholder: "http://jileiba.com/wp-includes/images/loading03.gif",
            effect: "fadeIn"
        });
    }) */;
	top.dialog = art;
	$("a#diliverResumeBtn").each(function(){
		var a_diliver = $(this);
		a_diliver.click(function(){
			var jobId = a_diliver.children("input[type='hidden']").val();
			/* var userId = ${sessionScope.userId};
			alert(userId);  */
			var ratio = '${sessionScope.university}';
			var userName = '${sessionScope.userName}';
			var email = '${sessionScope.userEmail}';
			var quantity = '${sessionScope.quantityHH}';
			if('${sessionScope.userId}'!='' && '${sessionScope.roleId}' != '1' && ratio!='' && userName!='' && email!='' && quantity>0){
				createArtBox("让企业hr了解你更加适合我们企业或这个岗位的个人优势", "user/declaration/"+jobId);
				$(this).addClass("tjlcurr").siblings().removeClass("btn_tjls");
			}else if('${sessionScope.userId}'==''){
				artLab.msg("请先登录");
				window.location.href="login.jsp";
			}else if('${sessionScope.roleId}' == '1'){
				artLab.msg("企业用户暂不能投递职位");
			}else if(ratio=='' || ratio==null || userName=='' || userName==null || email=='' || email==null){
				artLab.msg("你的简历不够完善，暂不能投递职位，请先完善简历");
				window.location.href="user/resume";
			}else if(quantity<=0){
				artLab.msg("您今天可投递的简历量已满");
			}
			//diliverResume(jobId);
		});
		
		function createArtBox(title, url, data) {
			var artBox = art({
				id: 'artBoxForResume',
				title: title,
				data: data,
				url: url,
				quickClose: false,
				cancel:false,
				width: 600
			});
			return artBox.show();
		}
		
		function diliverResume(id) {
			$.ajax({
				type:'POST',
				url:'user/diliverResume',
				data:{"jobId":id},
				dataType:'json',
				success:function(json) {
					artLab.msg(json.msg);
					if(json.msg=="请先登录"){
						window.location.href="login.jsp"; 
					}
				}
			});
		}
	});	
});
function page(pageNum,ps) {
	var offset =  ((pageNum-1)*(ps));
	var keyword = $("#keyword").val();
	$.ajax({
		type:'POST',
		url:'indexModelall',
		data:{'pageNum':pageNum,'pager.offset':offset,"keyword":keyword},
		dataType:'html',
	    success:function(html) {
	    	$("#alljobsContent").html(html);
	    }
	});
}

</script>
