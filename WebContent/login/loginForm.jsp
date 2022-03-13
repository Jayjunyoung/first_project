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
<% session.setAttribute("LOGINID", null); %>
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
        <li><a href="/termproject1/login/loginForm.jsp">로그인</a> </li>
      </ul>
    </div>
  </div>
    <script type="text/javascript">
function check(){ 
	//아이디가 입력이 안되어있을 경우 아이디입력하라는 메세지 출력
	if(document.fr.userId.value == "" || document.fr.userId.value.length < 0){ 
		alert("아이디를 입력해주세요")
		history.back()
		document.fr.userId.focus();
		return false;
	}	
}

function winopen(){
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	if(document.fr.userId.value =="" || document.fr.userId.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.fr.userId.focus();
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.open("joinIdCheck.jsp?userId="+document.fr.userId.value,"","width=500, height=300");
	}
}
</script> 
	<div class="main">
		<div class="box">
		<form name="fr" method="post" action="login.jsp" onsubmit="return check();">
			<div id="tit">로그인하기</div>
			<input type="text" name="userId" id="idfield" placeholder="아이디" required />

			<input type="password" name="password" id="pwfield" placeholder="비밀번호" required />
			
			<input type="submit" name="sendbtn" id="sendbtn" value="로그인" />
			<div id="reg"><a href="/termproject1/user/register.html"/>회원가입</div>
			</form>
		</div>






    </div> 
  <div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/></div>
</div>
</body>
</html>