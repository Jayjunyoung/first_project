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
  <div class = "main">
         <div class="catalog">
         <div class="box">
        <%
           String userId = (String)session.getAttribute("LOGINID");    
           int pid = Integer.parseInt(request.getParameter("pid"));
           int amount = Integer.parseInt(request.getParameter("amount"));
           int price = 0;
           int totalprice = 0;
           Connection conn = ConnectionProvider.getConnection();
           List<Phone> phones = null;
           try {
              SaleDao sdao = new SaleDao();
              PhoneDao pdao = new PhoneDao();
              price = pdao.selectById(conn, pid).getPrice();
              totalprice = price * amount;
              Sale sale = new Sale(userId, pid, amount, totalprice, new java.util.Date());
              sdao.insert(conn, sale); //구매 끝
              pdao.intPcount(conn, pid, amount);
           } catch(SQLException e){
           }
           finally {
             JdbcUtil.close(conn);
          }
           
        %>
         <br><br><br><br><br><br>
         <h1>구매가 완료되었습니다.</h1>  <br><br>
         
         <h2>결제하시겠습니까? <input type="button" value="결제" onclick="pay(<%=totalprice%>)"> </h2><br>
         
         <script type="text/javascript">
         function pay(totalprice) {
              var input = confirm('결제하시겠습니까?');
              if (input) {
                 window.open("pay.jsp?totalPrice="+totalprice,"결제");
              }
           }
         </script>
           
          </div>
          </div>
        </div>
       </div>
    </div>


</body>
</html>
