<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 폰</title>
</head>
<body>
<%
 Integer pcount=(Integer)session.getAttribute("pcount");

if(pcount==null)
 {
  pcount = new Integer(0);
 }     
 int pid = Integer.parseInt(request.getParameter("pid"));
 int amount = Integer.parseInt(request.getParameter("amount"));
 
 if(pid != 0) {
 		Cart cart = new Cart(pid, amount); 
      	pcount = new Integer(pcount.intValue() +1);
    	session.setAttribute("p"+pcount, cart);
    	session.setAttribute("pcount", pcount);   
  }
  
%>   
<b><center> 당신이 지금까지 선택한 상품 목록입니다</center></b>
<br><br>
<hr><br><br>
<%   
   	Phone phone = null;
	Cart cart = null;
	int amount1 = 0;
	Connection conn = ConnectionProvider.getConnection();
	try{
		PhoneDao dao = new PhoneDao();
   	for(int i=1; i<= pcount.intValue(); i++) {
     	cart = (Cart)session.getAttribute("p" + i);
     	amount1 = cart.getAmount();
     	phone = dao.selectById(conn, cart.getPid());
%>
	<c:set var ="p" value="<%=phone %>"/>
	${p.pid}:${p.mname}:<%=amount1 %>: <img src = "/termproject1/uploadImages/${p.pimage}" width="50" height="70"> <br><br>
<%      	
     	
   		}
	} catch(SQLException e){
		
	} finally {
		JdbcUtil.close(conn); //productdao.java에서 셀렉트바이아이디는 conn 지워
	}
   
%>
<hr>
  
<a href= "cartdelete.jsp"> 카트 비우기 </a>
<input type="button" value="구매하기" onclick="purchase()">
<br><br>
<script> //구매 table 들어가야될것: sid,memberid,pid,amount,total 가격, pdate
function purchase() {
	var input = confirm('구매하시겠습니까?');
	if (input) {
		window.open("cartPurchase.jsp?","구매");
	}
}
</script>

</body>
</html>