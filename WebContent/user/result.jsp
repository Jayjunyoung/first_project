<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
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
        <li></li>
        <li><a href="/termproject1/login/loginForm.jsp">로그인</a> </li>
      </ul>
    </div>
  </div>
  <%	request.setCharacterEncoding("utf-8"); %>
 <%
 	String userId="";
 	String password="";
 	String name="";
 	String email="";
 	String address="";
 	String birthday="";
 	Connection conn = ConnectionProvider.getConnection();
 	try {
 		userId = request.getParameter("userId");
 		password = request.getParameter("password");
 		name = request.getParameter("name");
 		email = request.getParameter("email");
 		address = request.getParameter("address");
 		birthday = request.getParameter("birthday");
 		User user = new User(userId, password, name, email, address, birthday);
 		UserDao dao = new UserDao();
 		dao.insert(conn, user);
 	}catch (SQLException e){}
 %>      
	<div class="main">
		<div class="box">
			
			<div class="tablestyle">
                    <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                      <tr>
                        <th><label for="idfield">*  아이디</label></th>
                        <td>${param.userId}</td>
                      </tr>
                      <tr>
                        <th><label for="pwfield">* 비밀번호</label></th>
                        <td>${param.password}</td>
                      </tr>
                       <tr>
                        <th><label for="namefield">* 이름</label></th>
                        <td>${param.name}</td>
                      </tr>
                      <tr>
                        <th><label for="emailfield">* 이메일</label></th>
                        <td>${param.email}</td>
                      </tr>
                       <tr>
                        <th><label for="address">* 주소</label></th>
                        <td>${param.address}</td>
                      </tr>
                       <tr>
                        <th><label for="birthday">* 생년월일</label></th>
                        <td>${param.birthday}</td>
                      </tr>          
                    </table>
                    <h1>회원가입이 완료되었습니다.</h1>			
		</div>






    	</div> 
 	<div class="footer"><img src="images/footer.jpg" width="1280" height="200" alt="beautifullife"/></div>
</div>
</body>
</html>