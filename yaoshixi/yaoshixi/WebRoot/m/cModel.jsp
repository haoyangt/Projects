<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>

<ul class="listzw">
	<input type="hidden" id="num" value="${num }">
   <input type="hidden" id="companyCount" value="${companyCount }">
   <input type="hidden" id="companyNames" value="${companyName }">
 	<c:forEach items="${company}" var="company">
     <li><a href="c/indexPhone/${company.companyId }">
       <div class="com-list">
    	  <div class="fl"><img src="${company.companyLogo }" class="com-logo"></div>
         <p class="comname">${company.companyName }</p><p class="fbxx">发布了${company.jobsNum }条职位</p>
         <div class="jt"><img src="res/assets/images/jt.png" width="20"></div>
      </div>
       </a></li>
    </c:forEach>
</ul>