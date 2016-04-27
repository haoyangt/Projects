<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>

<ul class="listzw">
   <input type="hidden" id="num" value="${num }">
   <input type="hidden" id="jobsCount" value="${jobsCount }">
   <input type="hidden" id="CjNames" value="${CjName }">
	<c:forEach items="${page.results  }" var="jobs" varStatus="idxStatus"> 
          <li><a href="jobDetailPhone/${jobs.id }">
            <div class="zw_list">
              <div class="zwtitle"><div class="zw-m">${jobs.jobName }</div><span class="zwdate">${myfn:friendlyTime(jobs.publishTime)}</span></div>
              <p class="zw-xx">
              	<span>
					<c:if test="${jobs.payment == '' || jobs.payment == null}">未提供</c:if>
		    		<c:if test="${jobs.payment != '' && jobs.payment != null}">${jobs.payment }</c:if>
				</span>
				<span>|</span>
				<span>${jobs.city } ${jobs.area }</span>
				<span>|</span>
				<span>${jobs.companyShortName }</span>
			  </p>
              <div class="jt"><img src="res/assets/images/jt.png" width="20"></div>
            </div>
            </a>
           </li>
	</c:forEach>
</ul>