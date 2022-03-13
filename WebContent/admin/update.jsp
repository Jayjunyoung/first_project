<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
  
<%
    
    String uploadPath="C:\\termproject1\\uploadImages";
    //out.println("절대경로 : " + uploadPath +"<br/>");     
    int maxSize =2000 *2000 *10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한   
   
    int pid = 0;
    int pcode = 0;
    String maker ="";
    String mname ="";
    String company ="";
    String capacity ="";
    int price = 0;
    String pimage ="";      
    MultipartRequest multi =null;
     
    try{
       
        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());      
        
        pid = Integer.parseInt(multi.getParameter("pid"));
        pcode = Integer.parseInt(multi.getParameter("pcode"));
        maker = multi.getParameter("CheckboxGroup2");
        mname = multi.getParameter("mname");
        //pname = request.getParameter("pname");
        company = multi.getParameter("CheckboxGroup1");
        price = Integer.parseInt(multi.getParameter("price")); 
        capacity = multi.getParameter("capacity");
        pimage = multi.getFilesystemName("pimage");
        Connection conn = ConnectionProvider.getConnection(); //데이터베이스 입력부분
        PhoneDao dao = new PhoneDao();
        Phone phone = new Phone(pid, pcode, maker, mname, company, capacity, price, new java.util.Date(), pimage); 
        dao.update(conn, phone);
    } catch(Exception e){}
%>               
                 
                    <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                      <tr>
                        <th><label for="pcodefield">* 제품번호</label></th>
                        <td><%= pcode %></td>
                      </tr>
                      <tr>
                        <th><label for="modelfield">* 모델명</label></th>
                        <td><%= mname %></td>
                      </tr>
                      <tr>
                        <th><label for="companyfield">* 통신사</label></th>
                        <td><%= company %></td>
                      </tr>
                      <tr>
                        <th><label for="capacityfield">* 용량</label></th>
                        <td><%= capacity %></td>
                      </tr>
                      <tr>
                        <th><label for="pricefield">* 가격</label></th>
                        <td><%= price %></td>
                      </tr>

                      <tr>
                        <th><label for="filefield">* 파일첨부</label></th>
                        <td><%= pimage %></td>
                      </tr>
                    </table>
                    </table>
                  	<br><br>상품정보가 수정되었습니다. <br><br> <a href = "listPhone.jsp">리스트 보기</a>
                </div>
         </div>
    </div>



</body>
</html>
