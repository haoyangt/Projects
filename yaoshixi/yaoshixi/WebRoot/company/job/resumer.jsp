<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jstl.jsp" %>

<c:if test="${empty page.results }">
	你暂时还未收到简历。
</c:if>
<c:if test="${not empty page.results }">
	<c:forEach items="${page.results }" var="resumer">
		<div class="zw_one">
			<div class="fbzw_l">
	        	<div class="fbzw_name">
	            	<a href="resumerDetail/${resumer.id }" class="hover_g f18">${resumer.userName }的简历</a>[${empty resumer.city ? '不限' : resumer.city} ${resumer.area}]
	            </div>
	        	<div class="xq_l">
	            	<span>${resumer.userName }/
	            	<c:if test="${resumer.gender==0 }">男</c:if>
	            	<c:if test="${resumer.gender==1 }">女</c:if>/
	            	<c:if test="${resumer.education==1 }">不限 </c:if>
	           		<c:if test="${resumer.education==2 }">高中 </c:if>
               	 	<c:if test="${resumer.education==3 }">专科 </c:if>
               	 	<c:if test="${resumer.education==4 }">本科 </c:if>
               	 	<c:if test="${resumer.education==5 }">硕士</c:if>
               	 	<c:if test="${resumer.education==6 }">博士</c:if>/
               	 	${resumer.city} 
	            	</span>
	            	<span>${resumer.enterUniversityYear }入学</span>
	            	<span>
	            		 
	            	</span>
	            	<span>
	            		<fmt:formatDate value="${resumer.publishTime }" pattern="yyyy-MM-dd" type="date"/>
	            	</span>
	            </div>
	        </div>
	       </div>
	</c:forEach>
	
	<!-- 分页  -->
	<%@ include file="/pager.jsp"%>
	
</c:if>

<div style="clear:both"></div>

<script type="text/javascript">
	function clickDeleteresumer(a)
	{
		$.ajax({
			url: $(a).attr("href"),
			type: "post",
			dataType: "html",
			success: function(html){
				$("#companyresumerListDiv").html(html);
			}
		});
		return false;
	}
</script>