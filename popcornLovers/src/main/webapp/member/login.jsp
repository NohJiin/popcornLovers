<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
<%@ include file="../WEB-INF/views/header.jsp" %>
<!-- <form action="login" method="get">
<h3>로그인</h3>
아이디: <input name= "member_id" value="apple"><br>
비밀번호: <input name="member_pw" type="password" value="12345" ><br>
<button type ="submit">로그인</button>
<a href="join.jsp"><button type ="button">회원가입</button></a>
</form> -->

<div class="login-page">
  <div class="form">
    <form class="login-form" action="login" method="get">
    <p class="login_txt">아이디</p>
      <input type="text" placeholder="username"  name= "member_id" />
     <p class="login_txt"> 패스워드</p>
      <input type="password" placeholder="password" name="member_pw"/>
      <button>로그인</button>
      <p class="message">아직 회원이 아니신가요? <a href="join.jsp">회원가입하기</a></p>
    </form>
  </div>
</div>

</body>
</html>