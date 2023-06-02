<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h3 {
	text-align: center;
}

.reco-space {
    border-spacing: 20px;
}
</style>
</head>
<body>
<h3>🎬 오늘의 추천 영화 🎬</h3>
<table class="reco-space" style="font-size: 12px;">
	<colgroup>
			<col width="0.5%">
			<col width="10%">
	</colgroup>
	<c:forEach items="${list}" var="vo">
		<tr>
			<td rowspan="4"><a href="../movie/movieDetails2?movieId=${vo.movieId}"><img alt="영화 이미지" src="../resources/n_img/${vo.movieImg}" width="120px" height="140px"></a></td>
			<td><a href="../movie/movieDetails2?movieId=${vo.movieId}">${vo.movieTitle}</a></td>
		</tr>
		<tr>
			<td>${vo.movieOpen}</</td>
		</tr>
		<tr>
			<td>⭐ ${vo.movieGrade} / ${vo.movieGenre}</td>
		</tr>
		<tr>
			<td><img alt="좋아요" src="../resources/n_img/heart.png" width="13px" height="10px"> ${vo.movieLike} ㆍ <img alt="조회수" src="../resources/n_img/eye.png" width="15px" height="12px"> ${vo.movieHits}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>