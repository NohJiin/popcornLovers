<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<% if(session.getAttribute("member_id")==null){ %>
<h5>로그인 화면입니다.</h5>
<form action="login" method="get">

<table>

<tr>

<td>
	id : 
</td>

<td>
	 <input name="member_id" value="apple">
</td>
</tr>

<tr>

<td>
	pw : 
</td>

<td>
	<input name="member_pw" value="apple">
</td>
</tr>
</table>
	<button type="submit" class="btn btn-primary">로그인</button>
</form>
<%} else { %>
<hr color="red">
${member_id}님이 로그인 중입니다. <br> <%//아까 로그인 해놔서 세션 잡혀있기 때문에 이렇게 뜰거임. //세션 끊는 방법 로그아웃하거나, 브라우저 닫거나 %>

<a href="bbs/main"><button style="background: pink;">뉴스사이트로</button></a>
<%} %>
</body>
</html>