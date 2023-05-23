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
    border-spacing: 20px;
}

th, td {
  text-align: center;
}
</style>
</head>
<body>
<table>
	<tr>
		<td><img alt="멤버 Top1 이미지" src="../resources/n_img/profil.png" width="150" height="150"></td>
		<td><img alt="멤버 Top2 이미지" src="../resources/n_img/profil.png" width="150" height="150"></td>
		<td><img alt="멤버 Top3 이미지" src="../resources/n_img/profil.png" width="150" height="150"></td>
	</tr>
	<tr>
		<td>LV. ${top1.member_level} ㆍ ${top1.member_knickname}</td>
		<td>LV. ${top2.member_level} ㆍ ${top2.member_knickname}</td>
		<td>LV. ${top3.member_level} ㆍ ${top3.member_knickname}</td>
	</tr>
	<tr>
		<td>❤ ${top1.member_fav} ㆍ 👁‍🗨 ${top1.member_view}</td>
		<td>❤ ${top2.member_fav} ㆍ 👁‍🗨 ${top2.member_view}</td>
		<td>❤ ${top3.member_fav} ㆍ 👁‍🗨 ${top3.member_view}</td>
	</tr>
</table>
</body>
</html>