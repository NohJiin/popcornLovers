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
영화 추천 목록
<table style="font-size: 10px;">
	<c:forEach items="${list}" var="vo" begin="0" end="2">
		<tr>
			<td rowspan="3"><img alt="영화 이미지" src="../resources/n_img/${vo.movieImg}" width="100px" height="120px"> </td>
			<td>${vo.movieTitle} / ${vo.movieOpen}</td>
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