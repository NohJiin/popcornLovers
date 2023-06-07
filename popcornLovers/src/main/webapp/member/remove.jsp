<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<%@ include file="../WEB-INF/views/header.jsp"%>

	<div class="login-page">
		<div class="form removeForm">
			<form class="remove-form" action="remove" method="get">
				<h2 class="join_maintxt">회원 탈퇴</h2>
				<p class="login_txt">아이디</p>
				<input id="id" type="text" value=" ${member_id}" name="member_id" maxlength="20" readonly/>
				<p class="login_txt">패스워드</p>
				<input id="pw" type="password" placeholder="password"  name="member_pw" maxlength="25" />
				<button id="removeBtn" type="submit" class="remove_btrn">회원 탈퇴</button>
			</form>
			<button id="removeBtnFail" type="submit" class="remove_btn2">취소</button>
		</div>
	</div>

<%-- 	<form action="remove" method="get">
		아이디: ${member_id} <br> 비밀번호:<input type="password"
			name="member_pw" value="${bag.member_pw}"> <br>
		<button type="submit">취소</button>
		<button type="submit">회원탈퇴</button>
	</form> --%>
</body>
</html>