<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	height: 10px;
}
</style>
</head>
<body>
<!-- 유저이름, 좋아요 수, 리뷰 수 -->
<h3>😊 오늘의 추천 유저 😊</h3>
<table style="font-size: 12px;">
	<c:forEach items="${list}" var="vo">
		<tr>
			<td rowspan="3"><a href="../mypage/mypageOne?member_id=${vo.member_id}"><img alt="유저 이미지" src="../resources/profile_img/${vo.member_img}" width="50px" height="80px"></a></td>
			<td><a href="../mypage/mypageOne?member_id=${vo.member_id}">${vo.member_name}</a> / Lv.${vo.member_level}</td>
		</tr>
		<tr>
			<td>❤ ${vo.member_fav}</td>
		</tr>
		<tr>
			<td>✏ ${vo.member_view}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>