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
    margin-left:auto; 
    margin-right:auto;
    /* border-spacing: 20px; */
}

th, td {
  text-align: center;
}

.user-space {
	padding: 5px 0;
}
</style>
</head>
<body>
<table>
	<colgroup>
		<col width="0.5%">
		<col width="0.5%">
		<col width="0.5%">
	</colgroup>
	<tr>
		<td><img alt="2등" src="../resources/n_img/silvercrown.png" width="50" height="35"></td>
		<td><img alt="1등" src="../resources/n_img/goldcrown.png" width="70" height="45"></td>
		<td><img alt="3등" src="../resources/n_img/dongcrown.png" width="50" height="35"></td>
	</tr>
	<tr>
		<td><a href="../mypage/mypageOne?member_id=${top2.member_id}"><img alt="멤버 Top2 이미지" src="../resources/profile_img/${top2.member_img}" width="170" height="170"></a></td>
		<td><a href="../mypage/mypageOne?member_id=${top1.member_id}"><img alt="멤버 Top1 이미지" src="../resources/profile_img/${top1.member_img}" width="200" height="200"></a></td>
		<td><a href="../mypage/mypageOne?member_id=${top3.member_id}"><img alt="멤버 Top3 이미지" src="../resources/profile_img/${top3.member_img}" width="170" height="170"></a></td>
	</tr>
	<tr>
		<td>LV. ${top2.member_level} ㆍ <a href="../mypage/mypageOne?member_id=${top2.member_id}">${top2.member_knickname}</a></td>
		<td>LV. ${top1.member_level} ㆍ <a href="../mypage/mypageOne?member_id=${top1.member_id}">${top1.member_knickname}</a></td>
		<td>LV. ${top3.member_level} ㆍ <a href="../mypage/mypageOne?member_id=${top3.member_id}">${top3.member_knickname}</a></td>
	</tr>
	<tr>
		<td class="user-space" colspan="3"> </td>
	</tr>
	<tr>
		<td><img alt="좋아요" src="../resources/n_img/heart.png" width="15px" height="15px"> ${top2.member_fav} ㆍ <img alt="리뷰작성" src="../resources/n_img/pen.png" width="20px" height="17px">‍ ${top2.member_view}</td>
		<td><img alt="좋아요" src="../resources/n_img/heart.png" width="15px" height="15px"> ${top1.member_fav} ㆍ ‍<img alt="리뷰작성" src="../resources/n_img/pen.png" width="20px" height="17px"> ${top1.member_view}</td>
		<td><img alt="좋아요" src="../resources/n_img/heart.png" width="15px" height="15px"> ${top3.member_fav} ㆍ ‍<img alt="리뷰작성" src="../resources/n_img/pen.png" width="20px" height="17px"> ${top3.member_view}</td>
	</tr>
</table>
</body>
</html>