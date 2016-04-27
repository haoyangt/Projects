<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>

<c:if test="${empty page.results }">
	<div style="text-align: center;"> <strong>目前没有招聘信息。</strong></div>
</c:if>
<c:if test="${not empty page.results }">
	<c:forEach var="job" items="${page.results }">
		<div class="zp_list">
			<p class="ts_s"><a target="_blank" href="jobDetail/${job.id }" class="hover_y f16">${job.jobName }</a>
				<c:if test="${job.city == '' || job.city == null }"><label class="color_c">未提供</label></c:if>
	           <c:if test="${job.city != null && job.city != '' }"><label class="color_c">[${job.city } ${job.area }]</label></c:if>
			</p>
		    <div class="bq_li"><span>薪资：
		    <c:if test="${job.payment == '' || job.payment == null}">未提供</c:if>
		    <c:if test="${job.payment != '' && job.payment != null}">${job.payment }</c:if>
		    </span><span>
		    最低学历：
		   <c:if test="${job.educationalReq == '' || job.educationalReq == null || job.educationalReq == 1 }">不限</c:if>
           <c:if test="${job.educationalReq == 2 }">高中</c:if>
           <c:if test="${job.educationalReq == 3 }">专科</c:if>
           <c:if test="${job.educationalReq == 4 }">本科</c:if>
           <c:if test="${job.educationalReq == 5 }">硕士</c:if>
           <c:if test="${job.educationalReq == 6 }">博士</c:if>
		    </span></div>
			<p><label class="f12 c5">${myfn:friendlyTime(job.publishTime)}发布</label></p>
		</div>
	</c:forEach>
	
	<!-- 分页  -->
	<%@ include file="/simplePager.jsp"%>
</c:if>