<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 필요한 태그 라이브러리 및 선언 등을 추가하세요 -->

<%@ page import="com.java4.popcorn.movieInfo.MovieInfoDAO" %>
<%@ page import="com.java4.popcorn.movieInfo.MovieInfoVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<!-- 필요한 스타일 시트 등을 추가하세요 -->
</head>
<body>
<%@ include file="../header.jsp" %>

<h1>${bag.movieTitle}</h1>
<div>
<img alt="영화 Top1 이미지" src="../resources/n_img/${bag.movieImg}" width="280" height="300">

<hr style="border: solid 3px #FFF39C ">
<p>감독: ${bag.movieDirector}</p>
<p>주연 배우: ${bag.movieActor}</p>
<p>개봉일: ${bag.movieOpen}</p>
<p>장르: ${bag.movieGenre}</p>
<p>줄거리: ${bag.movieStory}</p>
  <!-- 필요한 영화 정보를 출력하세요 -->
</div>
</body>
</html>