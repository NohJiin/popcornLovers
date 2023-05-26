<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴페이지</title>
</head>
<body>
<%@ include file="../WEB-INF/views/header.jsp" %>
<form action="remove" method="get">
 		아이디: ${member_id} <br>
 		비밀번호:<input type="password" name = "member_pw" value ="1234">
 	<br>
 			<button type="submit">취소</button> <button type="submit">회원탈퇴</button> 	
</form>
</body>
</html>