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
<h3>🎬 오늘의 추천 영화 🎬</h3>
<table style="font-size: 12px;">
	<c:forEach items="${list}" var="vo">
		<tr>
			<td rowspan="3"><a href="../movie/movieDetails2?movieId=${vo.movieId}"><img alt="영화 이미지" src="../resources/n_img/${vo.movieImg}" width="120px" height="140px"></a></td>
			<td><a href="../movie/movieDetails2?movieId=${vo.movieId}">${vo.movieTitle}</a> / ${vo.movieOpen}</td>
		</tr>
		<tr>
			<td>⭐ ${vo.movieGrade} / ${vo.movieGenre}</td>
		</tr>
		<tr>
			<td>👁 ${vo.movieHits} / ❤ ${vo.movieLike}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>