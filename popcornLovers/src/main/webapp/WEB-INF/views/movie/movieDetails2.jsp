<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="com.java4.popcorn.movieInfo.MovieInfoDAO" %>
<%@ page import="com.java4.popcorn.movieInfo.MovieInfoVO" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style>
	textarea {
	width: 40%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #FFF39C;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
		}
</style>
<style>
	.review {
	background-color: #FFF39C;
	flex: 0 0 8.5%;
	padding: 15px;
	margin: 5px;
	border-radius: 30px;
	border-style: none;
	font-size: 15px;
	white-space: normal;
	text-align: center;
}
</style>
<style>
.rate {
  display: inline-block;
  direction: rtl;
}

.rate input[type="radio"] {
  display: none;
}

.rate label {
  color: #ddd;
  float: right;
  font-size: 40px;
}

.rate label:before {
  content: '\2605';
  margin-left: 5px;
}

.rate input[type="radio"]:checked ~ label {
  color: #f73c32;
}
</style>
<script>
	$.ajax({
    url: "movieReview",
    success: function(x) {
        $("#review").append(x);
    },
    error: function() {
        alert("오류발생");
    }
	});
</script>

</head>
<body>
<%@ include file="../header.jsp" %>

<h1>${bag.movieTitle}</h1>
<div id="movieDetails">
  <img alt="영화 이미지" src="../resources/n_img/${bag.movieImg}" width="270" height="320">
  <div class="rate">
    <input type="radio" id="rating5" name="rating" value="5">
    <label for="rating5" title="5점"></label>
    <input type="radio" id="rating4" name="rating" value="4">
    <label for="rating4" title="4점"></label>
    <input type="radio" id="rating3" name="rating" value="3">
    <label for="rating3" title="3점"></label>
    <input type="radio" id="rating2" name="rating" value="2">
    <label for="rating2" title="2점"></label>
    <input type="radio" id="rating1" name="rating" value="1">
    <label for="rating1" title="1점"></label>
  </div>
  <hr style="border: solid 3px #FFF39C ">
  <p>감독: ${bag.movieDirector}</p>
  <p>주연 배우: ${bag.movieActor}</p>
  <p>개봉일: ${bag.movieOpen}</p>
  <p>장르: ${bag.movieGenre}</p>
  <p>줄거리: ${bag.movieStory}</p>
  <hr style="border: solid 3px #FFF39C ">
</div>
<div id="review"></div>
<textarea style="font-size: 13px">영화 리뷰 작성하기 (최대 500자)</textarea><br>
<button>등록</button>

</body>
</html>