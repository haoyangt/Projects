<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
      <ul>	
		   <c:forEach items="${page.results }" var="topic">
      		<li>
      	     <div class="lt_list_l">
				<a class="lt_a" target="_blank" href="forum/topicDetail/${topic.id }">
					${topic.title }
				</a>
					<span class="c7">${topic.userNames }</span> · <span class="c9">${myfn:friendlyTime(topic.publishTime)}</span>&nbsp;&nbsp;&nbsp;&nbsp;
			 </div>
			 <a class="c_a">${topic.replyNum }</a>
      	     </li>
     	</c:forEach>
      </ul>
 <%@include file="/pager.jsp"%>