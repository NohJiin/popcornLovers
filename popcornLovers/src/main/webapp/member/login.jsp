<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
<%@ include file="../WEB-INF/views/header.jsp" %>
<form action="login" method="get">
<h3>로그인</h3>
아이디: <input name= "member_id" value="apple"><br>
비밀번호: <input name="member_pw" type="password" value="apple" ><br>
<button type ="submit">로그인</button>
<a href="join.jsp"><button type ="button">회원가입</button></a>
</form>
</body>
</html>