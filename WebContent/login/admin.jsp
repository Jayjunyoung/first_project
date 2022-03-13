<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>오늘의 폰</title>
<link href="layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="wrap">
  <div class="page_header">
    <div id="top_logo"><a href="/termproject1/main/phonemarket.html"><img src="images/logo.png" width="177" height="80" alt="beautifullife"></a></div>
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
  <div class="main">
   <div class="abselect">
    <div id="ad_se1"><a href = "/termproject1/admin/uploadForm.html">
    <img src="images/select1.PNG" width="300" height="250" alt="beautifullife"/></a></div>
    <div id="ad_se2"><a href="/termproject1/admin/usermanage.jsp">
    <img src="images/select2.PNG" width="300" height="250" alt="beautifullife"/></a></div>
    <div id="ad_se3">
    <a href = "/termproject1/admin/salemanage.jsp">
    <img src="images/select3.PNG" width="300" height="250" alt="beautifullife"/></a></div>
    <div id="ad_se4"><a href = "/termproject1/admin/searchPhone.jsp">
    <img src="images/select4.PNG" width="300" height="250" alt="beautifullife"/></a></div>
  </div>
  </div>
  <div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/>
</div>
</body>
</html>