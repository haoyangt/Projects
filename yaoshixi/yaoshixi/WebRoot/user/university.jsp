<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/basePath.jsp" %>
<%@ include file="/jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%= basePath%>">
<link href="res/css/style.css" rel="stylesheet" type="text/css" />
<link href="res/css/base_style.css" rel="stylesheet" type="text/css" />
<link href="res/css/skeleton.css" rel="stylesheet" type="text/css" />
<link href="res/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.conceal{
		display: none;
	}
</style>
</head>

<body>
   <div class="uni">
   	<ul style="float:left;width:100%">
     	<li style="width:18%;"><input type="button" id="Guangzhou" value="广州" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Shenzhen" value="深圳" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Shantou" value="汕头" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Zhanjiang" value="湛江" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Chaozhou" value="潮州" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Maoming" value="茂名" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Shaoguan" value="韶关" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Meizhou" value="梅州" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Huizhou" value="惠州" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Dongwuang" value="东莞" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Jiangmen" value="江门" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Foushang" value="佛山" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Qqing" value="肇庆" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Zhuhai" value="珠海" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Heyuan" value="河源" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Shangwei" value="汕尾" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Zhongshan" value="中山" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Yangjiang" value="阳江" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Qingyuan" value="清远" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Jieyan" value="揭阳" class="gzsz"/></li>
   		<li style="width:18%;"><input type="button" id="Luoding" value="罗定" class="gzsz"/></li>
   		</ul>
   		<ul style="float:left;width:100%">
		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>深圳大学</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>深圳职业技术学院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>深圳信息职业技术学院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>南方科技大学</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>香港中文大学深圳学院</a></li>	
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>北京大学深圳研究生院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>清华大学深圳研究生院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>哈尔滨工业大学深圳研究生院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>深圳大学研究生院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中国人民大学深圳研究院</a></li>	
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>中国科学院深圳县级计数研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>中山大学深圳研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>天津大学深圳研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中国地质大学深圳研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>深圳华中科技大学研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中南大学深圳研究院</a></li>	
   		<li class="szSchool" style="width:47%;display: none;"><a href='javascript:void(0);'>北京交通大学深圳研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>南京大学深圳研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>西南交通大学深圳研究院</a></li>
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>南开大学深圳研究院</a></li>	
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>武汉大学深圳研究院</a></li>	
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>山东大学深圳研究院</a></li>	
   		<li class="szSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>浙江大学深圳研究院</a></li>	
   		
   		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中山大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>暨南大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华南理工大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华南农业大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州医科大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州中医药大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东药学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华南师范大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州体育学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州美术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>星海音乐学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东技术师范学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东财经大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东白云学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州民航职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东轻工职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州金桥管理干部学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东交通职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东水利电力职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州航海学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东警官学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>南华工商学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华联学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>仲恺农业工程学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东金融学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东工业大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东外语外贸大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州民航职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州番禺职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东培正学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>南方医科大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东农工商职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东新安职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东科学技术职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州康大职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东行政职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东体育职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东食品药品职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华南理工大学广州汽车学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州大学华软软件学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中山大学南方学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东外语外贸大学南国商学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东商学院华商学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华南农业大学珠江学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东技术师范学院天河学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州市公安管理干部学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东建设职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东女子职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东机电职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东省国防工业职工大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东岭南职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东邮电职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东工贸职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东青年管理干部学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东司法警官职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东外语艺术职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东工业大学华立学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州大学松田学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>华南师范大学增城学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东文艺职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州体育职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州工程技术职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州工商职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州涉外经济职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州南洋理工职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州科技职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中山大学新华学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州现代信息工程职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东理工职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州华南商贸职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州华立科技职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州城市职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州市广播电视大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东工程职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州铁路职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东科贸职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州航海高等专科学校</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东新华教育学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州科技贸易职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州珠江职业技术学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州松田职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州华夏职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东第二师范学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>武警广州指挥学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东青年职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州城建职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州医学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东社会科学大学</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州东华职业学院</a></li>
		<li class="gzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广州华商职业学院</a></li>
		
		<li class="stSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>汕头大学</a></li>
		<li class="stSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>汕头职业技术学院</a></li>
		<li class="stSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>汕头市业余大学</a></li>
		
		<li class="zjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东医学院</a></li>
		<li class="zjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东海洋大学</a></li>
		<li class="zjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>湛江师范学院</a></li>
		<li class="zjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东海洋大学寸金学院</a></li>
		<li class="zjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>湛江教育学院</a></li>
		<li class="zjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>湛江现代科技职业学院</a></li>
		
		<li class="czSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>韩山师范学院</a></li>
		
		<li class="mmSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东石油化工学院</a></li>
		<li class="mmSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>茂名职业技术学院</a></li>
		
		<li class="sgSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>韶关学院</a></li>
		<li class="sgSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东松山职业技术学院</a></li>
		<li class="sgSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>韶关市职工大学</a></li>
		
		<li class="mzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>嘉应学院</a></li>
		
		<li class="hzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>惠州学院</a></li>
		<li class="hzSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>惠州经济职业技术学院</a></li>
		
		<li class="dwSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>东莞理工学院</a></li>
		<li class="dwSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>东莞南博职业技术学院</a></li>
		<li class="dwSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>东莞职业技术学院</a></li>
		<li class="dwSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东亚视演艺职业学院</a></li>
		<li class="dwSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>东莞理工学院城市学院</a></li>
		
		<li class="jmSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>五邑大学</a></li>
		<li class="jmSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>江门职业技术学院</a></li>
		
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>佛山科学技术学院</a></li>
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东纺织职业技术学院</a></li>
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东环境保护工程职业学院</a></li>
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>南海东软信息技术职业学院</a></li>
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>佛山职业技术学院</a></li>
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东江门艺华旅游职业学院</a></li>
		<li class="fsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>顺德职业技术学院</a></li>
		
		<li class="qqSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>肇庆学院</a></li>
		<li class="qqSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>肇庆医学高等专科学校</a></li>
		<li class="qqSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>肇庆工商职业技术学院</a></li>
		<li class="qqSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>肇庆科技职业技术学院</a></li>
		
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>广东科学技术职业学院</a></li>
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>珠海城市职业技术学院</a></li>
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>珠海艺术职业学院</a></li>
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>北京师范大学－香港浸会大学联合国际学院</a></li>
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>北京师范大学珠海分校</a></li>
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>吉林大学珠海学院</a></li>
		<li class="zhSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>北京理工大学珠海学院</a></li>
		
		<li class="hySchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>河源职业技术学院</a></li>
		
		<li class="swSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>汕尾职业技术学院</a></li>
		
		<li class="zsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中山火炬职业技术学院</a></li>
		<li class="zsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>中山职业技术学院</a></li>
		<li class="zsSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>电子科技大学中山学院</a></li>
		
		<li class="yjSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>阳江职业技术学院</a></li>
		
		<li class="qySchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>清远职业技术学院</a></li>
		
		<li class="jySchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>揭阳职业技术学院</a></li>
		<li class="jySchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>潮汕职业技术学院</a></li>
		
		<li class="ldSchool" style="width:47%;display: none;"><a  href='javascript:void(0);'>罗定职业技术学院</a></li>
		
		
   	</ul>
   
   </div>
</body>
<script src="res/js/require.js"></script>
<script type="text/javascript">
	require.config({
		paths: {
			jquery: 'res/jquery/jquery-1.10.2',
			artLab: 'res/artDialog/artLab'
		}
	});
	require(["jquery", "artLab", "res/artDialog/dialog-iframe"], function($, artLab, art){
		
		$('a').each(function () { 
    	    $(this).click(function(){  
    	    	var dialog = top.dialog;
    	    	dialog.get("artBoxForUniversity").data.university = $(this).html();
    	    	dialog.get("artBoxForUniversity").close();
    	    });  
    	}); 
		$("#Shenzhen").click(function(){
			condition("szSchool");
		});
		$("#Guangzhou").click(function(){
			condition("gzSchool");
		});
		$("#Shantou").click(function(){
			condition("stSchool");
		});
		$("#Zhanjiang").click(function(){
			condition("zjSchool");
		});
		$("#Chaozhou").click(function(){
			condition("czSchool");
		});
		$("#Maoming").click(function(){
			condition("mmSchool");
		});
		$("#Shaoguan").click(function(){
			condition("sgSchool");
		});
		$("#Meizhou").click(function(){
			condition("mzSchool");
		});
		$("#Huizhou").click(function(){
			condition("hzSchool");
		});
		$("#Dongwuang").click(function(){
			condition("dwSchool");
		});
		$("#Jiangmen").click(function(){
			condition("jmSchool");
		});
		$("#Foushang").click(function(){
			condition("fsSchool");
		});
		$("#Qqing").click(function(){
			condition("qqSchool");
		});
		$("#Zhuhai").click(function(){
			condition("zhSchool");
		});
		$("#Heyuan").click(function(){
			condition("hySchool");
		});
		$("#Shangwei").click(function(){
			condition("swSchool");
		});
		$("#Zhongshan").click(function(){
			condition("zsSchool");
		});
		$("#Yangjiang").click(function(){
			condition("yjSchool");
		});
		$("#Qingyuan").click(function(){
			condition("qySchool");
		});
		$("#Jieyan").click(function(){
			condition("jySchool");
		});
		$("#Luoding").click(function(){
			condition("ldSchool");
		});
		function condition(dd){
			$(".szSchool").hide();
			$(".gzSchool").hide();
			$(".stSchool").hide();
			$(".zjSchool").hide();
			$(".czSchool").hide();
			$(".mmSchool").hide();
			$(".sgSchool").hide();
			$(".mzSchool").hide();
			$(".hzSchool").hide();
			$(".dwSchool").hide();
			$(".jmSchool").hide();
			$(".fsSchool").hide();
			$(".qqSchool").hide();
			$(".zhSchool").hide();
			$(".hySchool").hide();
			$(".swSchool").hide();
			$(".zsSchool").hide();
			$(".yjSchool").hide();
			$(".qySchool").hide();
			$(".jySchool").hide();
			$(".ldSchool").hide();
			$("."+dd+"").show();
		}
	});
</script>
</html>