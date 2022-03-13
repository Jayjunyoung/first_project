<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*,java.text.*" %>    
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
  <div class="main">
          <div class="catalog">
          <%
               request.setCharacterEncoding("utf-8");
               String userId = request.getParameter("userId");
               String cardCompany = request.getParameter("cardCompany");
               String cardNumber = request.getParameter("cardNumber");
               String validDate = request.getParameter("validDate");
               SimpleDateFormat sdf = new SimpleDateFormat("MM/yyyy"); 
               java.util.Date vd = sdf.parse(validDate);
               int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
               java.util.Date payDate = new java.util.Date();
               Payment pmt = 
                     new Payment(userId, cardCompany, cardNumber, vd, totalPrice, payDate);
               Connection conn = ConnectionProvider.getConnection();
               try {
                  PaymentDao dao = new PaymentDao();
                  dao.insert(conn, pmt);
               }catch(SQLException e){}
               
            %>
            

            
            <h1><em>지불이 완료되었습니다. 감사합니다.</em></h1>
            </div>
          </div>
        
	<div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/></div>
</div>
</body>
</html>