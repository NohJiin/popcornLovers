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

.profileImg {
	border-radius: 70%;
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
		<td rowspan="2"><br><img alt="2등" src="../resources/n_img/silvercrown.png" width="50" height="35"><br><a href="../mypage/mypageOne?member_id=${top2.member_id}"><img class="profileImg" alt="멤버 Top2 이미지" src="../resources/profile_img/${top2.member_img}" width="170" height="170"></a></td>
		<td><img alt="1등" src="../resources/n_img/goldcrown.png" width="70" height="45"></td>
		<td rowspan="2"><br><img alt="3등" src="../resources/n_img/dongcrown.png" width="50" height="35"><br><a href="../mypage/mypageOne?member_id=${top3.member_id}"><img class="profileImg" alt="멤버 Top3 이미지" src="../resources/profile_img/${top3.member_img}" width="170" height="170"></a></td>
	</tr>
	<tr>
		<td><a href="../mypage/mypageOne?member_id=${top1.member_id}"><img class="profileImg" alt="멤버 Top1 이미지" src="../resources/profile_img/${top1.member_img}" width="200" height="200"></a></td>
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
		<td><img alt="게시글수" src="../resources/n_img/bbsCount.png" width="15px" height="15px"> ${top2.bbs_count} ㆍ <img alt="리뷰수" src="../resources/n_img/reviewCount.png" width="20px" height="17px">‍ ${top2.review_count}</td>
		<td><img alt="게시글수" src="../resources/n_img/bbsCount.png" width="15px" height="15px"> ${top1.bbs_count} ㆍ ‍<img alt="리뷰수" src="../resources/n_img/reviewCount.png" width="20px" height="17px"> ${top1.review_count}</td>
		<td><img alt="게시글수" src="../resources/n_img/bbsCount.png" width="15px" height="15px"> ${top3.bbs_count} ㆍ ‍<img alt="리뷰수" src="../resources/n_img/reviewCount.png" width="20px" height="17px"> ${top3.review_count}</td>
	</tr>
</table>
</body>
</html>