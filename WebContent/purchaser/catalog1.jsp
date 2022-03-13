<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>오늘의 폰</title>
<link href="layout1.css" rel="stylesheet" type="text/css">

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
  <div class = "main_catalog">
            <div class="orderBy">보기 기준 선택
              <form name="form2" method="post" action="">
                <select name="aaa" size="1" id="aaa">
                  <option value="pdate">신상품</option>
                  <option value="pcount">선호도</option>
                </select>
                <input type="submit" value="카탈로그보기">
                <label for="aaa"></label>
              </form>
            </div>               
        <%
           Connection conn = ConnectionProvider.getConnection();
           List<Phone> phones = null;
           String orderby = request.getParameter("aaa");
           try {
              PhoneDao dao = new PhoneDao();
              if (orderby == null)
                 phones = dao.selectList(conn);
              else if (orderby.equals("pdate"))
                 phones = dao.listByPdate(conn);
              else
                 phones = dao.listByPcount(conn);   
           } catch(SQLException e){}
           if (phones != null) {
        %>
          
            <c:forEach var = "phone" items = "<%= phones %>"> <%-- 리스트이므로 for문으로 받아들임 --%>
             <div class="phone">
              <div class="pimage"><img src = "/termproject1/uploadImages/${phone.pimage}" width = "160" height = "240"></div>
              <div class="button">
                 <form name = "frm">
                   <input type = "hidden" name ="pid" value = "${phone.pid}">
        		   ${phone.mname} <br>
                   <input type="button" name="detail" id="detail" value="상세보기" onclick = "detailView(form)">
                   <input type="button" name="purchase" id="purchase" value="바로구매" onclick = "purchase1(form)">
                   <label for="amount"></label>      
                <br>          수량
                <select name="amount" id="amount"> <%-- 목록메뉴선택이용 --%>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                </select>
                <input type="button" name="cart" id="cart" value="카트담기" onclick = "putcart(form)">
                </form>
              </div>
            </div>
           </c:forEach>
            <% } %>
<script>
function purchase1(frm){ <%-- 열린게시판 11/16실습자료 --%>
   var amount = frm.amount.value.trim();
   var id = frm.pid.value.trim();
   window.open("purchase.jsp?pid="+id+"&amount="+amount,"","");
}
function putcart(frm){
   var amount = frm.amount.value.trim();
   var id = frm.pid.value.trim(); 
   window.open("putCart.jsp?pid="+id+"&amount="+amount,"","width=1000, height=400");
}
function detailView(frm){
   var amount = frm.amount.value.trim();
   var id = frm.pid.value.trim(); 
   window.open("detail.jsp?pid="+id,"","width=250, height=300");
}
</script>
</div>
</div>
<div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/></div>
</div>

</body>
</html>
