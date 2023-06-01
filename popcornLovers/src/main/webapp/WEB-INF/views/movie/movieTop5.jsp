<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style type="text/css">
table {
    /* margin-left:auto;  */
    margin-right:auto;
   	horizontal : 70px;
}

td {
 	padding-left: 37px; /* 좌측 여백을 37px로 설정 */
    padding-right: 37px; /* 우측 여백을 37px로 설정 */  
}

tr {
	height: 5px;
	font-size : 13px;
}

</style>
</head>
<body>
<table>
	<tr>
		
		<td>
		 <a href="movieDetails2?movieId=${top1.movieId}">
		<img alt="영화 Top1 이미지" src="../resources/n_img/${top1.movieImg}" width="185" height="220">
		</td>
		<td>
		 <a href="movieDetails2?movieId=${top2.movieId}">
		<img alt="영화 Top2 이미지" src="../resources/n_img/${top2.movieImg}" width="185" height="220">
		</td>
		<td>
		 <a href="movieDetails2?movieId=${top3.movieId}">
		<img alt="영화 Top3 이미지" src="../resources/n_img/${top3.movieImg}" width="185" height="220">
		</td>
		<td>
		 <a href="movieDetails2?movieId=${top4.movieId}">
		<img alt="영화 Top4 이미지" src="../resources/n_img/${top4.movieImg}" width="185" height="220">
		</td>
		<td>
		 <a href="movieDetails2?movieId=${top5.movieId}">
		<img alt="영화 Top5 이미지" src="../resources/n_img/${top5.movieImg}" width="185" height="220">
		</td>
		<td>
		
	</tr>
	<tr>
		<td>${top1.movieTitle}</td>
		<td>${top2.movieTitle}</td>
		<td>${top3.movieTitle}</td>
		<td>${top4.movieTitle}</td>
		<td>${top5.movieTitle}</td>
	</tr>
	<tr>
		<td> ⭐${top1.movieGrade}</td>
		<td> ⭐${top2.movieGrade}</td>
		<td> ⭐${top3.movieGrade}</td>
		<td> ⭐${top4.movieGrade}</td>
		<td> ⭐${top5.movieGrade}</td>
	</tr>
	
	<tr>
		<td>${top1.movieOpen}</td>
		<td>${top2.movieOpen}</td>
		<td>${top3.movieOpen}</td>
		<td>${top4.movieOpen}</td>
		<td>${top5.movieOpen}</td>
	</tr>
	
	<tr> 
		<td>${top1.movieGenre}</td>
		<td>${top2.movieGenre}</td>
		<td>${top3.movieGenre}</td>
		<td>${top4.movieGenre}</td>
		<td>${top5.movieGenre}</td>
	</tr>
</table>
</body>
</html>