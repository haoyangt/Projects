<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>



<c:if test="${not empty page.results }">
	<c:forEach items="${page.results }" var="job">
		<div>
				<div>
	            	<a class="hover_g f16">${job.jobName }</a>
	            	[${empty job.city ? '不限' : job.city} ${job.area}]
	            	
	            </div>
	            
				<div>
				发布时间：<fmt:formatDate value="${job.publishTime }" pattern="yyyy-MM-dd" type="date"/>
				</div>
		
	        <div class="fbzw_r" style="margin-left: 130px;">
	        	<%-- <a <c:if test="${job.receivedResumeNum gt 0}"> href="company/resume/jobResume/${job.id}"</c:if> >
	        		<div class="kuai">
	        			<p class="f24">${job.receivedResumeNum }</p><p>收到简历</p>
	        		</div>
	        	</a>
	        	<div class="kuai"><p class="f24">4</p><p>邀请应聘</p></div> --%>
	        	<a  href="company/resume/jobResumeOnWx/${job.id}/${sessionScope.userId}">
	        		收到${job.receivedResumeNum }份简历
	        	</a>
	        </div>
	   </div>    
	</c:forEach>
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