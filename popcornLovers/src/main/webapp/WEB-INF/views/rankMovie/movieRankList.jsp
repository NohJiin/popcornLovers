<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="rank">
	<tr>
		<td>Rank</td>
		<td>Movie Title</td>
		<td>Reviews</td>
		<td><img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="10px" height="10px"></td>
		<td><img alt="좋아요 하트 이미지" src="../resources/n_img/pink.png" width="10px" height="10px"></td>
		<td>버튼</td>
	</tr>
	<c:forEach items="${list}" var="bag">
		<tr>
			<td>${bag.rank_no}</td>
			<td>${bag.movieTitle}</td>
			<td>${bag.movieReviews}</td>
			<td>${bag.movieHits}</td>
			<td>${bag.movieLike}</td>
			<td> <button style="background-color: transparent; border: none;"><img alt="좋아요 버튼" src="../resources/n_img/blackEmpty.png" width="20px" height="20px"></button> </td>
		</tr>
	</c:forEach>
</table>