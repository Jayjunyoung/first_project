<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>오늘의 폰</title>
<link href="layout.css" rel="stylesheet" type="text/css">

</head>

<body>
<div class="wrap">
  <div class="page_header">
    <div id="top_logo"><a href="/termproject1/main/phonemarket.html">
    <img src="images/logo.png" width="177" height="80" alt="beautifullife"/></a></div>
 <div id="top_banner">
    </div>
    <div id="top_banner">
     <ul>
        <li><a href="/termproject1/purchaser/catalog1.jsp?pcode=1 or pcode=2">상품목록</a></li>
      <li>
        </li>
         <li>
        </li>
        <li><a href="/termproject1/purchaser/catalog.jsp?pcode=2">갤럭시</a></li>
       <li>
        </li>
         <li>
        </li>
        <li><a href="/termproject1/purchaser/catalog.jsp?pcode=1">아이폰</a></li>
       <li>
        </li>
      </ul>
    </div>
    <div id="top_banner">
      <ul>
        <li>ID:<%= session.getAttribute("LOGINID") %><br/></li>
        <li><a href="/termproject1/login/loginForm.jsp">로그아웃</a> </li>
      </ul>
    </div>
  </div>
  
<%
   Connection conn = ConnectionProvider.getConnection();
   List<User> users = null;
   try {
      UserDao dao = new UserDao();
      users = dao.selectList(conn);
   } catch(SQLException e) {}
   if (users != null) {
%>
                       <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                 <tr>
                    <th>userId</th><th>password</th><th>name</th><th>email</th><th>address</th>
                    <th>birthday</th>
                 </tr>
                    <c:forEach var="user" items="<%= users %>">
                       <tr>
                          <td>${user.userId}</td><td>${user.password}</td><td>${user.name}</td>
                          <td>${user.email}</td><td>${user.address}</td><td>${user.birthday}</td>
                       </tr>
                    </c:forEach>
                       </table>
                       <br><br> <a href = "/termproject1/login/admin.jsp">관리자 홈페이지</a>
                       </div>
                   

<% } %>
</body>
</html>
