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
  <div class="main_banner">
    <div id="main_ban"><img src="images/광고배너.gif" width="1280" height="200" alt="beautifullife"/></div>
  </div>
  <div class="main">
    <a href = "/termproject1/purchaser/catalog.jsp?pcode=2">
    <div class="main_a">
      <div id="main_a_ban"><img src="images/galaxy1.PNG" width="305" height="330" alt="beautifullife"/>
      <div id="main_a_ban_text">갤럭시 Z폴드3</div>
      </div>
      <div id="main_a_ban2"><img src="images/galaxy2.PNG" width="305" height="330" alt="beautifullife"/>
      <div id="main_a_ban_text">갤럭시 Z플립3</div>
      </div>
      <div id="main_a_ban3"><img src="images/galaxy3.PNG" width="305" height="330" alt="beautifullife"/>
      <div id="main_a_ban_text">갤럭시 노트20</div>
      </div>
      <div id="main_a_ban4"><img src="images/galaxy4.PNG" width="305" height="330" alt="beautifullife"/>
      <div id="main_a_ban_text">갤럭시Z플립 2세대</div>
      </div>
      </div>
     </a>
     < <a href = "/termproject1/purchaser/catalog.jsp?pcode=1">
       <div class="main_b">
       <div id="main_b_ban"><img src="images/iphone1.PNG" width="305" height="376" alt="beautifullife"/>
       <div id="main_a_ban_text">아이폰12 mini</div>
       </div>
       <div id="main_b_banner2"><img src="images/iphone2.PNG" width="305" height="376" alt="beautifullife"/>
       <div id="main_a_ban_text">아이폰13 mini</div>
       </div>
       <div id="main_b_banner2"><img src="images/iphone3.PNG" width="305" height="376" alt="beautifullife"/>
       <div id="main_a_ban_text">아이폰13</div>
       </div>
       <div id="main_b_banner2"><img src="images/iphone4.PNG" width="305" height="376" alt="beautifullife"/>
       <div id="main_a_ban_text">아이폰12</div>
       </div>
    </div>
    </a>
  </div>
  <div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/></div>
</div>
</body>
</html>