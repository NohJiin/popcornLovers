<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
/* 		$('#removeBtn').click(function(){
			var password_input = $('#pw').val(); //input에 입력된 비밀번호 가져오기
			
			//비밀번호를 ajax를 통해 서버로 전송 후 탈퇴 요청
			$.ajax({
				url : "remove", //views밑
				data :{
					member_pw : password_input
					//result : $('#result').val()
				},
				success:function(){
					if(result == "1" ){
						alert("탈퇴 되었습니다.");
					} else {
						alert("잘못된 비밀번호 입니다. 다시 입력해주세요.");
						return false;
					}
				},
				error:function(){
					alert("오류@@@"); //해당 오류는 ajax success 실패 오류가 아닌 url 오류
				}
			});
		}); */
		
		$('#removeBtnFail').click(function(){
			window.history.back(); //이전 페이지로 이동
		});
		
	});
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
				<button id="removeBtn" type="submit" class="remove_btn">회원 탈퇴</button>
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