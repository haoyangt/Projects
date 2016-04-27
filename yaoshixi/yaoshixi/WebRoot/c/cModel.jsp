<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<c:forEach items="${page.results}" var="companyInfo" varStatus="index">
	<c:set var="col" value="${index.count % 4}"></c:set>
	<c:if test="${col == 1 }">
		<div class="one_li" style="float:left;">
	</c:if>
		<!-- 公司单元 开始-->
     <div class="gs_list" style="background-color: #F2F2F2">
     	<a href="c/index/${companyInfo.companyId }" target="_blank">
	         <p class="c_logogram">${companyInfo.companyName }</p>
	         <p class="c_con">${companyInfo.growthStage }</p>
	         <div  class="gs_img_1"> <img src="${companyInfo.companyLogo }" width="110" height="110"/></div>
        </a>
            <div class="gs_zhaop">
               <ul>
           		<c:if test="${companyInfo.jobsNum == 0}">
           			<li>&nbsp;&nbsp;</li>
           			<li>&nbsp;&nbsp;</li>
           		</c:if> 
               	<c:forEach var="jobs" items="${companyInfo.jobs}" varStatus="jobIndex">
	               	<c:if test="${companyInfo.jobsNum ==1 && jobIndex.index==0}">
	               		<li>&nbsp;&nbsp;</li>
		               	<li>
		                  <a href="jobDetail/${jobs.id }" target="_blank" class="h_a">
		                  	<c:if test="${fn:length(jobs.jobName)>8}">
			                  		${fn:substring(jobs.jobName, 0, 8)}...
			                  	</c:if>
			                  	<c:if test="${fn:length(jobs.jobName)<=8}">
			                  		${jobs.jobName}
			                  	</c:if>
		                  </a>
		                </li>
	                </c:if>
	                <c:if test="${companyInfo.jobsNum >1 }">
	                	<c:if test="${jobIndex.index==0 }">
			                <li>
			                  <a href="jobDetail/${jobs.id }" target="_blank" class="h_a">
			                  	<c:if test="${fn:length(jobs.jobName)>8}">
			                  		${fn:substring(jobs.jobName, 0, 8)}...
			                  	</c:if>
			                  	<c:if test="${fn:length(jobs.jobName)<=8}">
			                  		${jobs.jobName}
			                  	</c:if>
			                  </a>
			                </li>
	                	</c:if>
	                	<c:if test="${jobIndex.index==1 }">
		                	<li>
		                		<a href="jobDetail/${jobs.id }" target="_blank" class="h_a">
		                			<c:if test="${fn:length(jobs.jobName)>8}">
			                  			${fn:substring(jobs.jobName, 0, 8)}...
				                  	</c:if>
				                  	<c:if test="${fn:length(jobs.jobName)<=8}">
				                  		${jobs.jobName}
				                  	</c:if>
		                		</a>
		                	</li>
	                	</c:if>
	                </c:if>
                </c:forEach>
               </ul>
            </div>
            <div class="gs_bq" style="clear:both">
            	<c:forTokens items="${companyInfo.tags }" delims="," var="tag">
                	<span><c:out value="${tag }"></c:out></span>
                </c:forTokens>
            </div>
    </div>
    <!-- 公司单元 结束-->
   <c:if test="${col == 0 }"> 
    	</div>
    </c:if>		    	
   </c:forEach>

<%@ include file="/pager.jsp"%>
<!-- <script src="res/jquery/jquery-1.10.2.js"></script>
<script src="res/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" charset="utf-8">
$(function() {
	   $("img").lazyload(
	      {
	       effect : "fadeIn"
	   }
	    )
	});
</script> -->
