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

tr {
	height: 15px;
}
</style>
</head>
<body>
<table>
	<tr>
		<td><a href="../movie/movieDetails2?movieId=${top1.movieId}"><img alt="영화 Top1 이미지" src="../resources/n_img/${top1.movieImg}" width="150" height="200"></a></td>
		<td><a href="../movie/movieDetails2?movieId=${top2.movieId}"><img alt="영화 Top2 이미지" src="../resources/n_img/${top2.movieImg}" width="150" height="200"></a></td>
		<td><a href="../movie/movieDetails2?movieId=${top3.movieId}"><img alt="영화 Top3 이미지" src="../resources/n_img/${top3.movieImg}" width="150" height="200"></a></td>
	</tr>
	<tr>
		<td><a href="../movie/movieDetails2?movieId=${top1.movieId}">${top1.movieTitle}</a></td>
		<td><a href="../movie/movieDetails2?movieId=${top2.movieId}">${top2.movieTitle}</a></td>
		<td><a href="../movie/movieDetails2?movieId=${top2.movieId}">${top3.movieTitle}</a></td>
	</tr>
	<tr>
		<td>⭐ ${top1.movieGrade}</td>
		<td>⭐ ${top2.movieGrade}</td>
		<td>⭐ ${top3.movieGrade}</td>
	</tr>
	<tr> <!-- 일단은 배우 좋아요 / 조회수로 해놓기 -->
		<td>❤ ${top1.movieLike} ㆍ ✏ ${top1.movieReviews}</td>
		<td>❤ ${top2.movieLike} ㆍ ✏ ${top2.movieReviews}</td>
		<td>❤ ${top3.movieLike} ㆍ ✏ ${top3.movieReviews}</td>
	</tr>
</table>
</body>
</html>