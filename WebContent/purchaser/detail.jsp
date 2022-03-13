<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 폰</title>
</head>
<body>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
    Phone phone = null;
    Connection conn = ConnectionProvider.getConnection();
    try{
    	PhoneDao dao = new PhoneDao();
    	phone = dao.selectById(conn, pid);
    }catch(SQLException e){}
    if (phone != null) {
%>
<c:set var = "p" value = "<%= phone %>"/>
<img src = "/termproject1/uploadImages/${p.pimage}" width = "250" height = "300"><br><br>
 <br>
제조사 : ${p.maker} <br>
모델명 : ${p.mname} <br>
회사 : ${p.company} <br>
용량 : ${p.capacity} <br>
가격 : ${p.price} <br>
<% } %>
</body>
</html>