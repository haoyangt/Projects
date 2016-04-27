<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>
     <c:forEach items="${school }" var="school">              
     			<option>${school.university }</option>
     </c:forEach>		
