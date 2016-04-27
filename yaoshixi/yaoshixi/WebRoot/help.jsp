<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<title>帮助-要实习-专注于实习生招聘的互联网平台</title>
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="res/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="res/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#indexSy").removeClass("licurrent");
	$("#forum").removeClass("licurrent");
	$("#Resume").removeClass("licurrent");
	$("#release").removeClass("licurrent");
	$("#manage").removeClass("licurrent");
	$("#companys").removeClass("licurrent");
	$("#bangzhu").addClass("licurrent");
});
function showYonghu(data){
	if(data=='user'){
		document.getElementById("companyYonghu").style.display="none";
		document.getElementById("userYonghu").style.display="block";
	}
	if(data=='company'){
		document.getElementById("userYonghu").style.display="none";
		document.getElementById("companyYonghu").style.display="block";
	}
}
function showsds(dss){
	var s = document.getElementById('zclcshuom');
	var sd = document.getElementById('cjwent');
	if(s.style.display == 'none' && dss == 'zclcshuom'){
		document.getElementById("zclcshuom").style.display="block";
	}else if(dss == 'zclcshuom'){
		document.getElementById("zclcshuom").style.display="none";
	}
	if(sd.style.display == 'none' && dss == 'cjwent'){
		document.getElementById("cjwent").style.display="block";
	}else if(dss == 'cjwent'){
		document.getElementById("cjwent").style.display="none";
	}	
}
</script>
</head>

<body  class="body_cs">
		
		<!-- 顶部 LOGO、登录部分  -->
		<%@include file="/header.jsp" %>
 <div id="main">
	   
	   	<!-- 左边导航 -->
		<%@include file="/banner.jsp" %>
	   
	    <div class="container">
        <div class="contact_s">
        	<h1>帮助</h1>
        	<br/>
        	<input type="button" class="btn_style1" onclick="showYonghu('user')" value="学生用户">
        	<input type="button" class="btn_style1" onclick="showYonghu('company')" value="企业用户">
        	<div style="height: 20px;"></div>
        	<div id="userYonghu" class="intro" style="display: none;">
	        	<div class="intro_title" style="background-color: #336699;">学生用户</div>
	        	<p onclick="showsds('zclcshuom')" ><font class="btn_style1">注册流程及使用说明：</font></p>
	        	<div id="zclcshuom" style="display: none;">
	        	<p>1.注册</p>
				<p>  1）进入学生注册页面http://www.yaoshixi.com/user/regist.jsp</p>
   				<p>  2）也可以直接用QQ号或微博帐号直接登录，密码为您的QQ密码或微博帐号密码</p>
   				<p>2.填写简历信息，您必须填写完基本信息和教育背景后才能投递简历哦。所以为了获得更多的面试机会，建议您认真填写社团实践、实习经历等。</p>
   				</div>
   				<p onclick="showsds('cjwent')" ><font class="btn_style1">常见问题：</font></p>
   				<div id="cjwent" style="display: none;">
   				<p>Q1：忘记了用户名，要怎样找回？</p>
   				<p>1）请您点击下面的链接找回帐号信息？</p>
   				<p>http://www.yaoshixi.com/user/upadtePass.jsp</p>
   				<p>2)如果您使用密码找回3天后仍未收到账号信息，可致电0577-82732254或者写信给我们：cs@szfore.com，要求查询密码，您需提供：中文名字，生日，注册时填写的电子邮件地址、联系电话。</p>
   				<p>Q2：如何修改/更换用户名？</p>
   				<p>用户名就是账户名，就是您注册时填写的邮箱地址的全称，不能变更。如果要修改用户名，请您重新注册。</p>
   				<p>Q3：如何修改邮箱地址？</p>
   				<p>您接收HR方来信的邮箱地址默认是您注册时使用的用户名的全称，您可在首页点击“我的简历”- “基本信息”处修改邮箱地址。（小提示：此修改不会改变您的登录用户名）</p>
   				<p>Q4：刚注册时发过来的邮件中的“简历修改”是什么意思？</p>
   				<p>这是本站为感谢学生用户对要实习™的支持而做出的一个回馈行动。您可以获得一次世界500强人力资源专员免费协助修改简历的机会，对您的简历进行润色和优化。</p>
   				<p>Q5：新注册用户时，发现邮箱已经被注册怎么办？</p>
   				<p>1）或许您之前注册过要实习而您忘记了，可以点击“忘记密码”方式寻回；</p>
   				<p>2）请您用其它有效邮箱注册要实习帐户。</p>
   				<p>Q6：“简历信息错误”报错会不会对个人简历中已有的内容产生影响？</p>
   				<p>请您放心，您简历中的信息并不会因此流失，刷新一下网页，稍后再查阅即可。</p>
   				<p>Q7： 系统提示“简历无法投递”，怎么办？</p>
   				<p>请查看您的简历是否填写完整，您必须填写完基本信息和教育背景后才能投递简历哦。为了获得更多的面试机会，建议您认真填写社团实践、实习经历等。</p>
   				<p>Q8：“向我推荐”是指什么？</p>
   				<p>在您完善您的简历之后，若您点击首页“向我推荐”，网站就会根据您的简历信息和求知职意向，自动向您推荐符合您的招聘职位。</p>
   				<p>Q9：如何才能提高简历被招聘方浏览的次数？</p>
   				<p>1) 请您查看简历是否处于“公开”状态；</p>
   				<p>2) 请您将简历填写详细，以增加被招聘方搜索到的机率。</p>
   				<p>Q10: 怎么样增加每日投递量？</p>
   				<p>您可以邀请好友来注册要实习，从而提升自己的每日投递量哦，邀请好友注册网址为：http://www.yaoshixi.com/user/quantityFull.jsp</p>
   				<p>Q11：是否可以直接联系招聘方？</p>
   				<p>1) 有联系方式</p>
   				<p>如果招聘方在您投递职位的联系方式里留有电话号码，请您在适当的时机与招聘方联系。</p>
   				<p>2) 没有联系方式</p>
   				<p>许多招聘方不希望把联系电话或其他的联系方式公布在网上，请您点击职位页面下方的“投个简历”按钮投递您的简历。</p>
   				<p>Q12：为什么前些天我看到的职位今天在要实习网上看不到了？</p>
   				<p>原因有两个：</p>
   				<p>1）此职位已经招到人了，并且通知要实习网将该职位下线；</p>
   				<p>2）招聘公司和要实习网的合同到期了。如果您要查询这方面职位信息，请发邮件给我们 ,我们的客服人员会帮助您查询并及时将得到的信息反馈给您。</p>
   				<p>3）要实习为了每条职位信息制定了10天的有效期，10后该职位会自动下线，如果企业仍需招聘该职位，需要重新发布哦。</p>
   				<p>Q13：我的简历中“公开”是指？</p>
   				<p>在“我的简历”中的“公开”是指求职者授权给要实习网，同意公开个人简历，让各个企业的HR查看简历信息，主动邀请给予实习机会。（提示：只允许企业HR观看，实习生用户是不能查看别人简历的！）</p>
   				<p>如果您的问题仍无法解决</p>
   				<p>1）请将您的问题以邮件的形式反馈给我们，我们的客服人员会跟您联系。我们的客服邮箱是cs@yaoshixi.com</p>
   				<p>2）请致电我们的服务热线 0755-82732254 </p>
   				</div>
        	</div>
        	<div id="companyYonghu" class="intro" style="display: none;">
        		<div class="intro_title" style="background-color: #336699;">企业用户</div>
	        	<div class="qt_ss">
	        	<p>要实习网已开通免费注册、免费自主发布招聘信息功能，想要在本站发布招聘信息的企业请参照以下步骤：</p> 
	            <p>1.进入企业注册页面http://www.yaoshixi.com/user/regist.jsp；</p>  
			    <p>2.填写公司名称、注册邮箱、密码、联系人、地址等账户基本信息，确认提交后就可以进入企业HR账户，此时账户处于未审核状态，不能发布招聘信息和查看本站学生用户简历。</p>
			    <p>（小提示：1.为了更快通过审核状态，请企业用户认证填写企业信息哦。2.如果您发现要实习长时间仍未审核通过，请您联系cs@szfore.com或致电服务热线0577-82732254）；</p>
			    <p>3.经本站审核通过后，即可为贵公司开通发布招聘信息等企业权限功能，公司自主发布的招聘信息将在网站首页中的“职位发布”板块中显示。</p>
			    <p>4.通过审核的企业请将企业的营业执照上传至本站，进行企业认证，审核周期为三个工作日。</p>
			    <p>5.企业认证通过后，将提高企业用户的真实性，使招聘过程更真实可信。</p>
			    <p>6.您还可以通过邀请实习生，查看要实习中选择公开的实习生简历哦。</p>
	        	</div>
        	</div>
        	<div class="intro">
        		<div class="intro_title" style="background-color: #336699;">联系方式</div>
	        	<div class="qt_ss">
	        	<p>如在使用过程中遇到问题，请致电：0755-82732254或写信给：cs@yaoshixi.com我们会尽快为您解决。</p> 
	        	</div>
        	</div>
        </div>
    </div>
	    
	  <%--   <!-- 二维码扫一扫 -->
	    <%@include file="/scanner.jsp" %> --%>
	    
	  <%@include file="/footer.jsp" %>
 	<div style="clear:both"></div>
	 </div>
</body>
<script src="res/js/require.js"></script>
</html>