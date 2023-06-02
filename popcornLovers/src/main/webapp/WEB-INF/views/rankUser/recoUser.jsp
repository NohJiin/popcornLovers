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

.reco-space {
    border-spacing: 20px;
}

.profileImg {
	border-radius: 70%;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
<!-- 유저이름, 좋아요 수, 리뷰 수 -->
<h3>😊 오늘의 추천 유저 😊</h3>
<table class="reco-space" style="font-size: 12px;">
	<c:forEach items="${list}" var="vo">
		<tr>
			<td rowspan="3"><a href="../mypage/mypageOne?member_id=${vo.member_id}"><img class="profileImg" alt="유저 이미지" src="../resources/profile_img/${vo.member_img}" width="100px" height="100px"></a></td>
			<td>Lv.${vo.member_level} ㆍ <a href="../mypage/mypageOne?member_id=${vo.member_id}">${vo.member_name}</a></td>
		</tr>
		<tr>
			<td><img alt="좋아요" src="../resources/n_img/heart.png" width="13px" height="10px"> ${vo.member_fav} ㆍ <img alt="좋아요" src="../resources/n_img/eye.png" width="13px" height="10px"> ${vo.member_view}</td>
		</tr>
		<tr>
			<td>💌 ${vo.member_email}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>