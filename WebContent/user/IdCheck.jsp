<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 폰</title>
</head>
<body>

<body>
<h2>아이디중복체크</h2>
<%
String userId = request.getParameter("userId");
Connection conn = ConnectionProvider.getConnection();
UserDao dao = new UserDao();
User user = dao.selectById(conn, userId);

if (user == null){
	out.print("사용가능한 아이디입니다");
	%>
	 <input type="button" value="아이디 사용하기" onclick="result();">
	<%
	
}else if(user != null){
	out.print("중복된 아이디입니다");
}

%>
<fieldset>
	<form action="IdCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="userId" value="<%=userId%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

 <script type="text/javascript">
    function result(){
    	opener.document.fr.userId.value = document.wfr.userId.value;
    	
    	opener.document.fr.id.readOnly=true;
    	
    	window.close();
    }
 
 </script>

</body>
</body>
</html>