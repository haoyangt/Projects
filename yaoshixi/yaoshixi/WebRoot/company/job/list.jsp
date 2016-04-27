<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>

<c:if test="${empty page.results }">
	还没有发过招聘信息，点击<a href="company/job/addEdit.jsp">发布职位</a>。
</c:if>
<c:if test="${not empty page.results }">
	<c:forEach items="${page.results }" var="job">
		<div class="zw_one">
			<div class="fbzw_l">
	        	<div class="fbzw_name">
	            	<a href="jobDetail/${job.id }" class="hover_g f16">${job.jobName }</a>[${empty job.city ? '不限' : job.city} ${job.area}]
	            </div>
	        	<div class="xq_l">
	            	<span>${job.jobName }</span>
	            	<span>${job.payment }</span>
	            	<span>
	            		<c:if test="${job.educationalReq==1 }">不限 </c:if>
	            		<c:if test="${job.educationalReq==2 }">高中 </c:if>
                   	 	<c:if test="${job.educationalReq==3 }">专科 </c:if>
                   	 	<c:if test="${job.educationalReq==4 }">本科 </c:if>
                   	 	<c:if test="${job.educationalReq==5 }">硕士</c:if>
                   	 	<c:if test="${job.educationalReq==6 }">博士</c:if> 
	            	</span>
	            	<span>
	            		<fmt:formatDate value="${job.publishTime }" pattern="yyyy-MM-dd" type="date"/>
	            	</span>
	            </div>
	          
	          <!--   有效的职位显示 -->
	          	<c:if test="${job.status eq 1 }">
	            	<p class="jge"><a href="company/job/modifyEdit/${job.id}" class="hover_g">修改职位</a>•<a href="company/job/offline/${job.id}" onclick="return confirm('确定要结束招聘吗');" class="hover_g">结束招聘</a></p>
	          	</c:if>
	          <!--   有效的职位显示 -->
	          
	          <!--   下线的职位显示 -->
	          	<c:if test="${job.status eq 2 }">
	            	<p class="jge">
	            		<a href="company/job/modifyEdit/${job.id}" onclick="return confirm('确定要重新发布吗');" class="hover_g">重新发布</a>
	            		•
	            		<a href="company/job/delete/${job.id}" onclick="return clickDeleteJob(this);" class="hover_g">删除</a></p>
	            </c:if>
	          <!-- 下线的职位显示 -->
	          
	          
	        </div>
	        <div class="fbzw_r">
	        	<a <c:if test="${job.receivedResumeNum gt 0}"> href="company/resume/jobResume/${job.id}"</c:if> >
	        		<div class="kuai">
	        			<p class="f24">${job.receivedResumeNum }</p><p>收到简历</p>
	        		</div>
	        	</a>
	        	<!-- <div class="kuai"><p class="f24">4</p><p>邀请应聘</p></div> -->
	        </div>
	       </div>
	</c:forEach>
	
	<!-- 分页  -->
	<%@ include file="/pager.jsp"%>
	
</c:if>

<div style="clear:both"></div>

<script type="text/javascript">
	function clickDeleteJob(a)
	{
		$.ajax({
			url: $(a).attr("href"),
			type: "post",
			dataType: "html",
			success: function(html){
				$("#companyJobListDiv").html(html);
			}
		});
		return false;
	}
</script>