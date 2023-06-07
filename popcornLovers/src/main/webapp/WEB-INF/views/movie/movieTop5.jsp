<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java4.popcorn.movieInfo.MovieInfoVO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style type="text/css">
table {
    /* margin-left:auto;  */
    margin-right:auto;
   	horizontal: 70px;
}

td {
    padding-left: 37px; /* 좌측 여백을 37px로 설정 */
    padding-right: 37px; /* 우측 여백을 37px로 설정 */  
}

tr {
    height: 5px;
    font-size: 13px;
}
</style>
</head>
<body>
<table>
    <tr>
        <c:forEach var="movie" items="${topMovies}">
            <td>
                <a href="movieDetails2?movieId=${movie.movieId}">
                    <img alt="영화 이미지" src="${pageContext.request.contextPath}/resources/n_img/${movie.movieImg}" width="185" height="220">
                </a>
            </td>
        </c:forEach>
    </tr>
    <tr>
        <c:forEach var="movie" items="${topMovies}">
            <td>${movie.movieTitle}</td>
        </c:forEach>
    </tr>
    <tr>
        <c:forEach var="movie" items="${topMovies}">
            <td>⭐${movie.movieGrade}</td>
        </c:forEach>
    </tr>
    <tr>
        <c:forEach var="movie" items="${topMovies}">
            <td>${movie.movieOpen}</td>
        </c:forEach>
    </tr>
    <tr>
        <c:forEach var="movie" items="${topMovies}">
            <td>${movie.movieGenre}</td>
        </c:forEach>
    </tr>
</table>
</body>
</html>