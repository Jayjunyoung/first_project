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
  
<div class="rightcon">
                <div class="tablestyle">
<%
   Connection conn = ConnectionProvider.getConnection();
   List<Phone> phones = null;
   request.setCharacterEncoding("utf-8");
   String target = request.getParameter("target");
   String keyword = request.getParameter("keyword");
   try {
      PhoneDao dao = new PhoneDao();
      if (target == null || target.length()==0)
         phones = dao.selectList(conn);
      else 
         phones = dao.selectLike(conn, target, keyword);
   }    catch (SQLException e){}
   if (phones != null) {
%>                
                     <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                 <tr>
                    <th>pid</th><th>maker</th><th>mname</th><th>company</th><th>capacity</th><th>price</th><th>pdate</th><th>pimage</th>
                    <th>수정</th><th>삭제</th>
                 </tr>
             <c:forEach var="phone" items="<%= phones %>">
                <tr>
                    <td>${phone.pid}</td><td>${phone.maker}</td><td>${phone.mname}</td><td>${phone.company}</td>
                    <td>${phone.capacity}</td><td>${phone.price}</td><td>${phone.pdate}</td>
                    <td><img src="/termproject1/uploadImages/${phone.pimage}" width="40" height="50"></td>
                    <td><input type="button" value="수정" onclick="location.href='updateForm.jsp?pid=${phone.pid}'"></td>
                    <td><input type="button" value="삭제" onclick="location.href='delete.jsp?pid=${phone.pid}'"></td>
                </tr>
             </c:forEach>  
             <tr><td colspan="5">
                <form action="" method="post">
                   <select name="target">
                      <option value="pid">제품아이디</option>
                      <option value="mname">제품명</option>
                      <option value="maker">제조사</option>
                   </select>
                   <input type="text" name="keyword">
                   <input type="submit" value="검색">
                </form>
             <td></tr>       
                    </table>
                </div>
         </div>
    </div>

<% } %>
</body>
</html>
