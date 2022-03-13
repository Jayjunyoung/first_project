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
        <li></li>
        <li><a href="/termproject1/login/loginForm.jsp">로그아웃</a> </li>
      </ul>
    </div>
  </div>
        
         <div class="main">
         <div class="box">
         <div class="catalog">
         	<form action= "payment.jsp" method = "post">
         	   <h2><table>
               <tr><th>고객아이디</th><td>
               <input type = "text" name="userId" id = "cidfield" value ="<%=session.getAttribute("LOGINID")%>">
               </td></tr>
               <tr><th>카드사</th><td>
               <input type = "text" name="cardCompany" id = "cidfield" value ="VISA">
               </td></tr>
               <tr><th>카드번호</th><td>
               <input type = "text" name="cardNumber" id = "cidfield" value ="0000-1111-2222-3333">
               </td></tr>
               <tr><th>유효기간</th><td>
               <input type = "text" name="validDate" id = "cidfield" value="11/2011">
               </td></tr>
               <tr><th>지불금액</th><td>
               <input type = "text" name="totalPrice" id = "cidfield" value ="${param.totalPrice}">
               </td></tr>
               <tr><tr>
               <tr><td colspan="2"><input type="submit" value="결제하기"></td></tr>
               </table></h2>
         	</form>
          </div>
          </div>
          </div>
        <div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/></div>
</div>        


</body>
</html>
