<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>

<h3>회원정보 수정 화면</h3>

<form action="update" method="get">
아이디: <input name = "member_id" value ="${member_id}" style="background-color:#ededed"  readonly ><br>
비밀번호: <input name = "member_pw" value ="1234"><br>
이름:  <input name = "member_name" value ="${member_name}" style="background-color:#ededed" readonly><br>
닉네임: <input name = "member_knickname" value ="${member_knickname}" style="background-color:#ededed" readonly><br>
전화번호: <input name = "member_tel" value ="${member_tel}"><br>
이메일: <input name = "member_email" value ="${member_email}" readonly><br>
<br>
<button type ="submit">회원정보 수정하기</button>
</form>


</body>
</html>