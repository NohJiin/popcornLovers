<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	display: flex;
    justify-content: center;
    align-items: center;
    height: 700px;
}

td {
	width: 500px;
	height: 100px;
	font-size: 30px;
	border: none;
	padding: 10px;
}

button {
	width: 500px;
	height: 100px;
	border: none;
	background-color: #fff9ab;
	border-radius: 20px;
}
</style>
</head>
<body>
<div>
	<table>
		<tr>
			<td>로그인이 필요한 작업입니다!</td>
		</tr>
		<tr>
			<td><button class="loginbutton" type="button" onclick="location='../member/login.jsp'">로그인 하러가기</button></td>
		</tr>
		<tr>
			<td><button class="loginbutton" type="button" onclick="location='../member/join.jsp'">회원가입 하러가기</button></td>			
		</tr>
	</table>
</div>
</body>
</html>