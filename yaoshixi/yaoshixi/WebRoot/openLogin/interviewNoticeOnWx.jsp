<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%= basePath%>">
<title>要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/weixin.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script src="res/jquery/jquery-1.10.2.js" type="text/javascript"></script>
<!-- <script type="text/javascript">
$(document).ready(function(){
		$("#jobInfo").hide();
	  $("#showJobInfo").click(function(){
	  	$("#jobInfo").show();
	  });
	});
</script> -->
</head>

<body>
	<div class="weixin_body">
	<div class="main_j">
	  <div class="bt">面试通知</div>
	  <div class="neir">
    	<p>你好：</p>
    	<p><span>${companyName}</span>邀请你面试：<span>${jobName}</span></p>
    	<p>面试时间：<span>${interviewTime }</span></p>
    	<p>面试地点：<span>${place}</span></p>
    	<p>联系人：<span>${contactPerson }</span></p>
    	<p>联系电话：<span>${contactPhone }</span></p>
    	<p>面试内容：</p>
    	<div>${content}</div>
    	<!-- <p><input type="button" id="showJobInfo" value="点击查看职位信息"/></p> -->
    	<fieldset class="fieldst">
    	  <legend>职位信息</legend>
    	 <div id="jobInfo">
    		<div class="bs">${jobName }</div>
				<p>
					<label>所属公司：</label>${companyName }
				</p>
				<p>
					<label>工作地点：</label>${city } ${area}
				</p>
				<p>
					<label>月薪范围：</label>${payment }
				</p>

				<p>
					<label>最低学历：</label>
					<c:if test="${educationalReq == 1 }">不限</c:if>
					<c:if test="${educationalReq == 2 }">高中</c:if>
					<c:if test="${educationalReq == 3 }">大专</c:if>
					<c:if test="${educationalReq == 4 }">本科</c:if>
					<c:if test="${educationalReq == 5 }">硕士</c:if>
					<c:if test="${educationalReq == 6 }">博士</c:if>
				</p>
				<p>
					<label>发布时间：</label>
					<fmt:formatDate value="${publishTime }" pattern="MM"></fmt:formatDate>
					月
					<fmt:formatDate value="${publishTime }" pattern="dd"></fmt:formatDate>
					日
				</p>
				<p>
					<label>职位诱惑：</label>${temptation }
				</p>
				<p>
					<label>职位描述：</label>
				</p>
				<p>${jobDesc }</p>
            <br/>
				<p>
					<label>任职要求：</label>
				</p>
				<p>${jobRequest }</p>
			
    	    </div>
    		</fieldset>
    		<br/>
    	<p>衷心祝愿您可以在要实习网找到满意的工作!</p>
    	<p>要实习官网：<a href="http://www.yaoshixi.com">http://www.yaoshixi.com</a></p>
     </div>
    </div>
    </div>
 
</body>
</html>
