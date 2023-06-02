<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
업데이트 된 항목
<table class="rank">
	<colgroup>
		<col width="5%">
		<col width="10%">
		<col width="5%">
		<col width="5%">
		<col width="5%">
		<col width="5%">
		<col width="5%">
	</colgroup>
	<tr>
		<td>순위</td>
		<td>제목</td>
		<td>별점</td>
		<td>장르</td>
		<td>리뷰 수</td>
		<td><img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="10px" height="10px"></td>
		<td><img alt="좋아요 하트 이미지" src="../resources/n_img/pink.png" width="10px" height="10px"></td>
	</tr>
	<c:forEach items="${list}" var="bag">
		<tr>
			<td>${bag.rank_no}</td>
			<td>${bag.movieTitle}</td>
			<td>⭐ ${bag.movieGrade}</td>
			<td>${bag.movieGenre}</td>
			<td>${bag.movieReviews}</td>
			<td>${bag.movieHits}</td>
			<td>${bag.movieLike}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>