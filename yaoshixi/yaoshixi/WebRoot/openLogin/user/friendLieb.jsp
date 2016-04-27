<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>

	 <c:forEach items="${page.results }" var="friend" varStatus="idxStatus"> 
		<table>
			<tr>
				<td><input type="radio">
					<a id="ts" class="hover_b">${friend.jobInterview }
						<input type="hidden" id="friendId" value="${friend.id }"/>
					</a>
				</td>
			</tr>
		</table>
	</c:forEach>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", 'res/artDialog/dialog-iframe'], function($, artLab, art){
		top.dialog = art;
		$("a#ts").each(function () { 
    	    $(this).click(function(){  
    	    	var id = $(this).children("input[id='friendId']").val();
    	    	var artBox = art({
    				id: 'artBoxForResume',
    				title: "查看详情",
    				url: "friendById/"+id,
    				quickClose: false,
    				width: 600
    			});
    			artBox.show();
    	    });  
    	}); 
	});
</script>	