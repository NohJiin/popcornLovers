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

/* tr {
	height: 15px;
} */

.movie-space{
	padding: 1px 0;
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
		<td rowspan="2"><br><img alt="2등" src="../resources/n_img/silvercrown.png" width="50" height="35"><br><a href="../movie/movieDetails2?movieId=${top2.movieId}"><img alt="영화 Top2 이미지" src="../resources/n_img/${top2.movieImg}" width="180" height="230"></a></td>
		<td><img alt="1등" src="../resources/n_img/goldcrown.png" width="70" height="45"></td>
		<td rowspan="2"><br><img alt="3등" src="../resources/n_img/dongcrown.png" width="50" height="35"><br><a href="../movie/movieDetails2?movieId=${top3.movieId}"><img alt="영화 Top3 이미지" src="../resources/n_img/${top3.movieImg}" width="180" height="230"></a></td>
	</tr>
	<tr>
		<td><a href="../movie/movieDetails2?movieId=${top1.movieId}"><img alt="영화 Top1 이미지" src="../resources/n_img/${top1.movieImg}" width="220" height="270"></a></td>
	</tr>
	<tr>
		<td><a href="../movie/movieDetails2?movieId=${top2.movieId}">${top2.movieTitle}</a></td>
		<td><a href="../movie/movieDetails2?movieId=${top1.movieId}">${top1.movieTitle}</a></td>
		<td><a href="../movie/movieDetails2?movieId=${top2.movieId}">${top3.movieTitle}</a></td>
	</tr>
	<tr>
		<td class="movie-space" colspan="3"></td>
	</tr>
	<tr>
		<td>⭐ ${top2.movieGrade}</td>
		<td>⭐ ${top1.movieGrade}</td>
		<td>⭐ ${top3.movieGrade}</td>
	</tr>
	<tr>
		<td class="movie-space" colspan="3"></td>
	</tr>
	<tr> <!-- 일단은 배우 좋아요 / 조회수로 해놓기 -->
		<td><img alt="좋아요" src="../resources/n_img/heart.png" width="15px" height="15px"> ${top2.movieLike} ㆍ ‍<img alt="리뷰수" src="../resources/n_img/reviews.png" width="20px" height="17px"> ${top2.movieReviews}</td>
		<td><img alt="좋아요" src="../resources/n_img/heart.png" width="15px" height="15px"> ${top1.movieLike} ㆍ ‍<img alt="리뷰수" src="../resources/n_img/reviews.png" width="20px" height="17px"> ${top1.movieReviews}</td>
		<td><img alt="좋아요" src="../resources/n_img/heart.png" width="15px" height="15px"> ${top3.movieLike} ㆍ ‍<img alt="리뷰수" src="../resources/n_img/reviews.png" width="20px" height="17px"> ${top3.movieReviews}</td>
	</tr>
</table>
</body>
</html>