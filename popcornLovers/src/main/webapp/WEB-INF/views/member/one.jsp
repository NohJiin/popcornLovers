<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${bag.member_id}님의 My Page</h3>
<table border="1">
	<tr>
		<td colspan="4" height="180px"><img alt="사용자 프로필 이미지" src="resources/n_img/${bag.member_img}"> </td>
	</tr>
	<tr>
		<td>ID</td>
		<td>${bag.member_id}</td>
		<td>이름</td>
		<td>${bag.member_name}</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${bag.member_knickname}</td>
		<td>활동 등급</td>
		<td>${bag.member_level}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${bag.member_email}</td>
		<td>전화번호</td>
		<td>${bag.member_tel}</td>
	</tr>
	<tr>
		<td>좋아요</td>
		<td>${bag.member_fav}</td>
		<td>조회수</td>
		<td>${bag.member_view}</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${bag.member_age}</td>
		<td>성별</td>
		<td>${bag.member_gender}</td>
	</tr>
</table>
</body>
</html>