<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
  	<ul>
  		<c:forEach items="${companys }" var="company">
	   		<li>
	   		<a target="_blank" href="c/index/${company.id }" class="ggs">
	   			<div class="com_img">
	   				<img width="120" height="120" alt="${company.companyName }" src="${company.companyLogo }"/> 
	   			</div>
	   		  	<div class="com_info">
		          <%-- <h3>${company.companyShortName }</h3> --%>
		          <c:if test="${company.companySlogan ==null || company.companySlogan =='' }">
		          	<p style="padding-top: 30px;">${company.companyDesc }</p>
		          </c:if>
		          <c:if test="${company.companySlogan !=null && company.companySlogan !='' }">
		          	<p style="padding-top: 30px;">${company.companySlogan }</p>
		          </c:if>
		        </div>
	   		</a>
	   		</li>
	   	</c:forEach>
	   	<!-- <li style="margin:0;width:94px;"><a target="_blank" href="c/index" class="gg_more" style="margin:0"></a></li>	 -->
	</ul>