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
		<td><img alt="배우 Top1 이미지" src="resources/n_img/profil.png" width="150" height="150"></td>
		<td><img alt="배우 Top2 이미지" src="resources/n_img/profil.png" width="150" height="150"></td>
		<td><img alt="배우 Top3 이미지" src="resources/n_img/profil.png" width="150" height="150"></td>
	</tr>
	<tr>
		<td>${top1.actorName}</td>
		<td>${top2.actorName}</td>
		<td>${top3.actorName}</td>
	</tr>
	<tr> <!-- 일단은 배우 좋아요 / 조회수로 해놓기 -->
		<td>❤ ${top1.actorLike} ㆍ 👁‍🗨 ${top1.actorHits}</td>
		<td>❤ ${top2.actorLike} ㆍ 👁‍🗨 ${top2.actorHits}</td>
		<td>❤ ${top3.actorLike} ㆍ 👁‍🗨 ${top3.actorHits}</td>
	</tr>
</table>
</body>
</html>