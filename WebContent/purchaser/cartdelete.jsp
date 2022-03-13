<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 폰</title>
</head>
<body>
<%
	int count = (int)session.getAttribute("pcount");
	for (int i =1; i <= count; i++){
		session.removeAttribute("p"+ i);
	}
	session.removeAttribute("pcount");
%>
카트 정보가 삭제되었습니다.
</body>
</html>