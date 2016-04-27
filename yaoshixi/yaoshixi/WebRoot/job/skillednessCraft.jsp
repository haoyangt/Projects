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
     	<li style="width:18.4%;"><input type="button" id="cadcam" value="CAD/CAM" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Miscellaneous" value="Miscellaneous" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="AS400" value="AS/400" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Warehousing" value="Data Warehousing" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Database" value="Database Systems" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Commerce" value="E-Commerce/Internet" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="ERP" value="ERP" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Executive" value="Executive Level" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Hardware" value="Hardware" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Desk" value="Help Desk" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Legacy" value="Legacy Systems" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Networking" value="Networking" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Media" value="New Media" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Project" value="Project Management" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Qualitsy" value="Qualitsy Assurance" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Recruitsing" value="Technical Recruitsing" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Sales" value="Tech Sales/Marketing" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Technical" value="Technical Writser" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Unix" value="Unix" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="develop" value="Windows develop" class="zyjn"/></li>
   		<li style="width:18.4%;"><input type="button" id="Office" value="Office Applications" class="zyjn"/></li>
   		</ul>
   		<ul style="float:left;width:100%">
		<li class="cadcam" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>CADAM</a></li>
   		<li class="cadcam" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>AUTOCAD</a></li>
   		<li class="cadcam" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CATIA</a></li>
   		
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Capacitsy </a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Change</a></li>	
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>Configuration</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>Contingency</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Defect</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Planning</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Management</a></li>	
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>Planning</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>Disaster</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>ISO</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Methodology</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Metrics</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Microsoft Project</a></li>	
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a href='javascript:void(0);'>PMI</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Procurement</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Risk Management</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Scope Management</a></li>	
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SDLC</a></li>	
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SEI/CMM</a></li>	
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Business Analyst</a></li>
   		<li class="Project" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Project Manager</a></li>		
   		
   		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Corel Draw</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>HTML</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PowerPoint</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Publisher</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>RoboHelp</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visio</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Word</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WordPerfect</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>XML</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Acrobat</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ForeHelp</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Premier 2000</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>FrameMaker</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Online Help</a></li>
		<li class="Technical" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Paint Shop Pro</a></li>
		
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CL</a></li>
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>COBOL</a></li>
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ILE</a></li>
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>RPG</a></li>
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>RPG400</a></li>
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>RPGIII/IV</a></li>
		<li class="AS400" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Synon</a></li>
		
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>BAAN</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Great Plains</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>JD Edwards</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lawson</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Oracle</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PeopleSoft</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SAP</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ACL</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Autre Stat</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Multi Term</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Navision</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Siebel</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Spss</a></li>
		<li class="ERP" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Swift</a></li>
		
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ADABAS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Assembler</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CA</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CICS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>COBOL</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DB2</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DEC/VAX</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>FOCUS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>GEAC</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>IDMS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>IMS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MicroFocus</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MQSeries</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MVS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Natural</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OS/2</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OS/390</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PL/2</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>REXX</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SAS</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Tape Operator</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Teradata</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VM</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VSAM</a></li>
		<li class="Legacy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TSO</a></li>
		
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Accounting</a></li>
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Administrative Support</a></li>
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Analyst</a></li>
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Business Developer</a></li>
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Customer Service</a></li>
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Human Resources</a></li>
		<li class="Miscellaneous" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Traditsional Engineer</a></li>
		
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Change Management</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Defect Management</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Metrics</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PVCS</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>QA/Tester</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Qualitsy Control</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SEI/CMM</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Source Safe/Visual Sources</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SQA</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Test Scripts</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Version Control</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WinRunner</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Xrunner</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>XDE Tester</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WebLOAD</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WebFT</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WAS</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VisualTest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TrackRecord</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TestTrack Pro</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TestParter</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TestManager</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TestDirector</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TestBed</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SilkTest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SilkRadar</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SilkPlan Pro</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SilkPerformer</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Robot</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Rational Test RealTi</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Rational Quantify</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Rational Purify</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Rational PureCoverag</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>QuickTest Profession</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>QARun</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>QALoad</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>QADirector</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PVCS Tracker</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Optimizeits Suitse</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OpenSTA</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mantis</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Logiscope</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>LoadRunner</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Junits</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Jtest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>E-Test suitse</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DevPartner Studio</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CodeTest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ClearQuest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cantata</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>C++test</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Bugzilla</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Astra QuickTest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Astra LoadTest</a></li>
		<li class="Qualitsy" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ACT</a></li>
		
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>AIX</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>C/C++</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CORBA</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Embedded</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>HP-UX</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Java</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Linux</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OpenView</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Perl</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Scripts</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Sun Solaris</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TCL/TK</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Tivoli</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Tuxedo</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>*BSD</a></li>
		<li class="Unix" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Kernels</a></li>
		
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CASE</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Data Analyst</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Data Architsect</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Data Marts</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Data Mining</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Data Modeling</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ERwin</a></li>
		<li class="Warehousing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SAS</a></li>
		
		<li class="Executive" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Business Development</a></li>
		<li class="Executive" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Financial Services</a></li>
		<li class="Executive" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Marketing/Sales</a></li>
		<li class="Executive" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Senior Executive</a></li>
		<li class="Executive" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Technology</a></li>
		
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ADSL</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ATM</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Banyan</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Bay</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>cc:Mail</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cisco</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CNE</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Engineer</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Firewall</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Frame Relay</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Hubs/ Routers</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ISDN</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>LAN/ WAN</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lotus</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mail</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MCP</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MCSE</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Motorola</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>NetWare</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PBX</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>RF</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Securitsy</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SMS</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SNA</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Sniffer</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Sonet</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Telecom</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Windows NT/2000</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>TCP/IP</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VPN</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>X.25</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Windows XP</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Advance Link</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Appletalk</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Asynch</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Banyan Vines</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Bay Networks</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Bridges</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CC mail</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CDMA</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cisco Routers</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Ethernet</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>GSM</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>HP Open View</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ISAM</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>LanManager</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>LanServer</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lantastic</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lap Link</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lease Lines</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Load Balancing</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Exchange</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Multinet</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MVX</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Netbios</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>NetMaster</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Network Cards</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Optical Fibre</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PABX</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Pathworks</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Reflection</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Relay Gold</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Routers</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WAN</a></li>
		<li class="Networking" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>X400</a></li>
		
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Account Executive</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Manager</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Recruitser</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Business-to-Business Market</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Consultants</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Contigency Search</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Direct Sourcing</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Outsourcing</a></li>
		<li class="Recruitsing" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Retained Search</a></li>
		
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Access</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ActiveX</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>C/C++</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>COM/DCOM</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>COOL:Gen</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CORBA</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Crystal Reports</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Delphi</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Developer/Designer 2000</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DNA</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Forte</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Fox Pro</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>GUI</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Java</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MCSD</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MFC/ATL</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OLAP</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OO</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PowerBuilder</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Pro*C</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Smalltalk</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual Basic</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual C++</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Win32</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual FoxPro</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>.NET</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>C#</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Ant</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>BizTalk</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>eMbedded Visual C++</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Fortran</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>FoxBASE+</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MapInfo</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mobile</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Rational ClearCase</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>StarTeam</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Transact-SQL</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>UML</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual InterDev</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual SourceSafe</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WIN CVS</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WIRELESS</a></li>
		<li class="develop" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VISUAL STUDIO</a></li>
		
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Access</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Capacitsy Planning</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Database Administrator</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DB2</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>FoWindows XPro</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Informix</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Oracle</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Progress</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SQL</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SQL Server</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Sybase</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Jasmine</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CMMS</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Interbase</a></li>
		<li class="Database" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SAPDB</a></li>
		
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cable Modem</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Chipware</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Circuits Design</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Drivers</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Embedded Systems</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Firmware</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Hardware</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>IEEE</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Operating System Designers</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Digitsal Product</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mobile Network</a></li>
		<li class="Hardware" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mobile Phone</a></li>
		
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Adobe Photoshop</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Corel Draw</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Director</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Flash</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Games</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Graphics</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Illustrator</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Image/Imaging</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mac</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Multimedia</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PageMaker</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PowerPoint</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Quark</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Shockwave</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Vizact 2000</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Dreamweaver</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Fireworks/Frontpage</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>3dStudio</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>3dStudio MAX</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>After Effects</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Alias studio</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Authorware</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cakewalk</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Director</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Freehand</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>FrontPage</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>GoLive</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>HomeSitse</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lightwave</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Maya</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Microsoft Photo Edits</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Publisher</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>NetObjects Fusion</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Photoshop</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Protel</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Quark Express</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Shockware</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Softimage</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Strata</a></li>
		<li class="Media" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Streamline</a></li>
		
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Account Executive</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Marketing Representative</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Sales Representative</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Strategist</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Business Demographics</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Call Point</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cloning customers</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Coding</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DatabaseMarketing</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lifetime value LTV</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Sales Cycle</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SFA Tools</a></li>
		<li class="Sales" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>SIC Code</a></li>
		
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OutLook Express</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>OutLook</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Netscape Communicator</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS OneNote</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Internet Explorer</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Powerpoint</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Project</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lotus 123</a></li>
		<li class="Office" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Excel</a></li>
		
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>.NET</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ActiveX</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ASP</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>ASP.NET</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>BroadVision</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>C#</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CGI</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Cold Fusion</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PHP</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CSS</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DHTML</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>DreamWeaver</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>E-Commerce</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>E-Commerce Platforms</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>EDI</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>EJB</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Electronic Payment</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>HTML</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>IIS</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>J2EE</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Java</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>JavaScript</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>JSP</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PERL</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Securitsy</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VB.NET</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VBScript</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual J++</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>VRML</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Web Servers</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Web Master/Developer</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WebLogic</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>WebSphere</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>XML/XSLT</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Broad Vision</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MOM</a></li>
		<li class="Commerce" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Visual Basic</a></li>
		
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>AS/400</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>CICS</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Unix</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Windows 95</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Windows 98</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Windows NT/2000</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Windows XP</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Hardware</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Lotus Notes</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Mac</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Office</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Network</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>Novell</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>PC/Desktop</a></li>
		<li class="Desk" style="width:23.4%;display: none;font-size:12px;"><a  href='javascript:void(0);'>MS Exchange</a></li>
		
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
    	    	dialog.get("artBoxForSkillMastery").data.skillMastery = $(this).html();
    	    	dialog.get("artBoxForSkillMastery").close();
    	    });  
    	}); 
		$("#cadcam").click(function(){
			condition("cadcam");
		});
		$("#Project").click(function(){
			condition("Project");
		});
		$("#Technical").click(function(){
			condition("Technical");
		});
		$("#AS400").click(function(){
			condition("AS400");
		});
		$("#ERP").click(function(){
			condition("ERP");
		});
		$("#Legacy").click(function(){
			condition("Legacy");
		});
		$("#Miscellaneous").click(function(){
			condition("Miscellaneous");
		});
		$("#Networking").click(function(){
			condition("Networking");
		});
		$("#Qualitsy").click(function(){
			condition("Qualitsy");
		});
		$("#Unix").click(function(){
			condition("Unix");
		});
		$("#Warehousing").click(function(){
			condition("Warehousing");
		});
		$("#Executive").click(function(){
			condition("Executive");
		});
		$("#Recruitsing").click(function(){
			condition("Recruitsing");
		});
		$("#develop").click(function(){
			condition("develop");
		});
		$("#Database").click(function(){
			condition("Database");
		});
		$("#Hardware").click(function(){
			condition("Hardware");
		});
		$("#Media").click(function(){
			condition("Media");
		});
		$("#Sales").click(function(){
			condition("Sales");
		});
		$("#Office").click(function(){
			condition("Office");
		});
		$("#Commerce").click(function(){
			condition("Commerce");
		});
		$("#Desk").click(function(){
			condition("Desk");
		});
		function condition(dd){
			$(".cadcam").hide();
			$(".Project").hide();
			$(".Technical").hide();
			$(".AS400").hide();
			$(".ERP").hide();
			$(".Legacy").hide();
			$(".Miscellaneous").hide();
			$(".Networking").hide();
			$(".Qualitsy").hide();
			$(".Unix").hide();
			$(".Warehousing").hide();
			$(".Executive").hide();
			$(".Recruitsing").hide();
			$(".develop").hide();
			$(".Database").hide();
			$(".Hardware").hide();
			$(".Media").hide();
			$(".Sales").hide();
			$(".Office").hide();
			$(".Commerce").hide();
			$(".Desk").hide();
			
			$("."+dd+"").show();
		}
	});
</script>
</html>