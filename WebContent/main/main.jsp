<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의하기</title>
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
   List<Phone> phones = null;
   try {
      PhoneDao dao = new PhoneDao();
      phones = dao.selectList(conn);
   } catch(SQLException e) {}
   if (phones != null) {
%>
<div class="main">
    <div class="main_a">
      <div id="main_a_ban"><img src="images/갤럭시 노트20.png" width="305" height="370" alt="beautifullife">
      <div class="a_text">안녕</div></div>
                 <tr>
                    <th>pid</th><th>pcode</th><th>maker</th><th>mname</th><th>company</th><th>capacity</th><th>price</th><th>pdate</th><th>pimage</th>
                    <th>수정</th><th>삭제</th>
                 </tr>
                    <c:forEach var="phone" items="<%= phones %>">
                       <tr>
                          <td>${phone.pid}</td><td>${phone.pcode}</td><td>${phone.maker}</td><td>${phone.mname}</td><td>${phone.company}</td><td>${phone.capacity}</td><td>${phone.price}</td>
                          <td>${phone.pdate}</td>
    
                          ></div>
                       </tr>
                    </c:forEach>
                    </div>
                       </div>
                   
                </div>
        

<% } %>
</body>
</html>