<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/weixin.css" rel="stylesheet" type="text/css" />
<link href="res/validate/css/validate.css" rel="stylesheet" type="text/css">
<link href="http://www.yaoshixi.com/res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="http://www.yaoshixi.com/res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/validate/js/validate.js"></script>
<script type="text/javascript">
function closeWindow() {
	var dialog = top.dialog;
	dialog.get("artBoxForResume").close();
}
</script>
</head>
<body>
<div class="weixin_body">
	<div class="main_j">
                    <div id="jbEditDiv">
                        <div >
                            
                            <div class="login_top"><strong>面试职位:</strong>
                            	${friend.jobInterview }
                            </div>
                            <div class="login_top"><strong>设计目的:</strong>
                            	${friend.designGoal }
                            </div>
                            <div class="login_top"><strong>面试形式:</strong>
                            	${friend.interviewForm }
                            </div>
                            <div class="login_top"><strong>面试描述:</strong>
                            	${friend.descriptionInterview }
                            </div>
                            <div class="login_top"><strong>参考思路:</strong>
                            	${friend.referenceIdeas }
                            </div>
                        </div>
                    </div>
              </div>
          </div>
</body>
</html>
