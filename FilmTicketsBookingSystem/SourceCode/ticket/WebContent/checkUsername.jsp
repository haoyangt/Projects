<%@page import="java.sql.ResultSet"%>
<%@page import="com.hy.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String username=request.getParameter("username").toString();
	DBHelper db=new DBHelper();
ResultSet rs=db.execQuery("select * from user where username=?", new Object[]{username});
if(rs.next()){
	out.print("<img src=image/error.png>");
}else{
	out.print("<img src=image/success.png>");
}
%>