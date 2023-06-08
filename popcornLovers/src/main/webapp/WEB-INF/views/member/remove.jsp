<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝콘 먹는 사람들</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://kit.fontawesome.com/a86e134bc2.js"
	crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="login-page">
  <div class="form">
  <i class="fa-sharp fa-solid fa-circle-check" ></i>
      <h2 class="join_maintxt">회원 탈퇴 완료</h2>
	<p class="p_update">탈퇴 완료 되었습니다. </p>
      <a href="${pageContext.request.contextPath}/Main.jsp"><button id="login" class="logingo">메인 페이지로</button></a>
  </div>
</div>
</body>
</html>