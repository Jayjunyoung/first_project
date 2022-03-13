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
        <%
           int pid = Integer.parseInt(request.getParameter("pid"));
            Connection conn = ConnectionProvider.getConnection();
            Phone phone = null;
            try {
               PhoneDao dao = new PhoneDao();
               phone = dao.selectById(conn, pid);
            } catch(SQLException e) {}
            if (phone != null) { //null이 아니여야되는걸 설정
        %>
        <c:set var = "p" value= "<%= phone %>"></c:set>
                <div class="tablestyle">
                  <form action="update.jsp" method="post" enctype="multipart/form-data" name="form1">
                    <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                      <tr>
                        <th><label for="idfield">* 아이디</label></th>
                        <td>
                      <input name="pid" type="text" value="${p.pid}" size="70"></td>
                      </tr>
                      <tr>
                        <th><label for="pcodefield">* 제품번호</label></th>
                        <td>
                        <input name="pcode" type="text" value="${p.pcode}"></td>
                      </tr>
                      <tr>
                        <th>* 제조사</th>
                        <td><p>
                          <label>
                            <input type="radio" name="CheckboxGroup2" value="애플" id="CheckboxGroup1_0">
                            애플</label>
                          <label>
                            <input type="radio" name="CheckboxGroup2" value="삼성" id="CheckboxGroup1_2">
                          삼성</label>
                          <br>
                        </p></td>
                      </tr>
                      <tr>
                        <th><label for="modelfield">* 모델명</label></th>
                        <td>
                        <input name="mname" type="text" value="${p.mname}" size="70"></td>
                      </tr>
                       <tr>
                        <th>* 통신사</th>
                        <td><p>
                          <label>
                            <input type="radio" name="CheckboxGroup1" value="SKT" id="CheckboxGroup1_0">
                            SKT</label>
                          <label>
                            <input type="radio" name="CheckboxGroup1" value="KT" id="CheckboxGroup1_1">
                          KT</label>
                          <label>
                            <input type="radio" name="CheckboxGroup1" value="LG" id="CheckboxGroup1_2">
                          LG</label>
                          <br>
                        </p></td>
                      </tr>
                      <tr>
                        <th><label for="capacityfield">* 용량</label></th>
                        <td>
                        <input name="capacity" type="text" value="${p.capacity}"></td>
                      </tr>
                      <tr>
                        <th><label for="pricefield">* 가격</label></th>
                        <td>
                        <input name="price" type="text" value="${p.price}"></td>
                      </tr>
                      <tr>
                        <th><label for="imagefield">* 제품이미지</label></th>
                        <td><input type="file" name="pimage" value="${p.pimage}"></td>
                        
                      </tr>
                      <tr>
                        <td height="30" colspan="2" align="center" class="btnstyle"><input type="submit" name="ok" id="ok" value="확인">
                        <input type="reset" name="cancel" id="cancel" value="취소"></td>
                      </tr>
                    </table>
                  </form>
                  <a href = "searchPhone.jsp">리스트 보기</a>
                </div>
              <% } %>
         </div>
    </div>


</body>
</html>
