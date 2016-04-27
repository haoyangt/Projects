<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jstl.jsp" %>
<c:forEach items="${page.results }" var="users" varStatus="s">
<%-- <<<<<<< .mine
	<li data-icon="false"  class="ui-li-static ui-body-inherit">
		<div class="ui-radio">
	      	<label id="content_rptOptions_labelOptionTitle_${s.index }" for="option_2778${s.index }" title="${users.userName}" class="ui-btn ui-corner-all ui-btn-inherit ui-btn-icon-left ui-checkbox-off ui-first-child">
======= --%>
	<li data-icon="false"  class="ui-li-static ui-body-inherit" style="margin-bottom:5px;border-bottom:1px solid #ddd;">
	      	<label id="content_rptOptions_labelOptionTitle_${s.index }" for="option_2778${s.index }" title="${users.userName}" >
		   		<div>
		        	<span class="OptionTitle" style="text-align: left;width: 100%;font-size: 16px" >${users.userName}</span><br>
			        <div id="content_rptOptions_pnlOptionImage_${s.index }" class="OptionImageWrapper" style="text-align: left;width: 100%;font-size: 13px">
			        	${users.synopsis}
					</div>
		        </div>
		     <c:if test="${id !='' && id !=null && id != 0 }">
		        <div id="content_rptOptions_pnlStat_${s.index }" class="Stat" >
		        	<c:if test="${users.voteNum == 100 }">
    					<span class="Bar" stat="25" style="width: 160px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
    				<c:if test="${users.voteNum < 100 && users.voteNum >=80}">
    					<span class="Bar" stat="25" style="width: 128px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
    				<c:if test="${users.voteNum < 80 && users.voteNum >=60}">
    					<span class="Bar" stat="25" style="width: 96px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
    				<c:if test="${users.voteNum < 60 && users.voteNum >=40}">
    					<span class="Bar" stat="25" style="width: 64px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
    				<c:if test="${users.voteNum < 40 && users.voteNum >=20}">
    					<span class="Bar" stat="25" style="width: 32px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
    				<c:if test="${users.voteNum < 20 && users.voteNum >=5}">
    					<span class="Bar" stat="25" style="width: 12px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
    				<c:if test="${users.voteNum < 5}">
    					<span class="Bar" stat="25" style="width: 2px;">
       						<i class="Color_1"></i>
				    	</span>
    				</c:if>
				    <span id="content_rptOptions_lbPercentage_1" class="Percentage">(${users.voteNum}%)</span>

				</div>
			</c:if>	
	       	</label> 
	       	<c:if test="${id == 0 }">
	       		<input id="option_2778${s.index }" type="radio" name="VoteOption" value="${users.id}"/>
				<a id="content_${s.index }" title="${users.userName}" class="DescriptionLink" style="z-index: 2" > 
			   		<input type="hidden" id="userId" value="${users.id}"/>
		    		<input type="hidden" id="userName" value="${users.userName}"/>
       			</a> 
	       	</c:if>
    </li>
</c:forEach>
<script src="res/js/require.js"></script>
<script type="text/javascript">
require.config({
	paths: {
		jquery: 'res/jquery/jquery-1.10.2',
		artLab: 'res/artDialog/artLab'
	}
});
require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
	top.dialog = art;
	var msg = '${msg}';
	if(msg != null && msg != ''){
		$("#content_lbVoteDisabledNotify").text(msg);
		alert(msg);
		document.getElementById("popupDialog").style.display="none";
		document.getElementById("lbtnVote").style.display="none";
	}
	$("a#content_0").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_1").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_2").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_3").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_4").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_5").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_6").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_7").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_8").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_9").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_10").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_11").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_12").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_13").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_14").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_15").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_16").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_17").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_18").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_19").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_20").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	$("a#content_21").each(function () { 
		var a_diliver = $(this);
		a_diliver.click(function(){  
	    	var userId = a_diliver.children("input[id='userId']").val();
	    	var userName = a_diliver.children("input[id='userName']").val();
	    	createArtBox(userName+"的设计详情", "friendById/"+userId);
	    });  
	}); 
	function createArtBox(title, url, data) {
		var artBox = art({
			id: 'artBoxForResume',
			title: title,
			data: data,
			url: url,
			quickClose: true,
			width: 286
		});
		return artBox.show();
	}
});	
</script>