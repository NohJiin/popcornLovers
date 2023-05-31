<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<style type="text/css">
#main{
	width : 100%;
	height : 100%;
	margin : 0px auto;	/* 가운데 정렬 */
}

.category{
	/* dispaly : inlin-block; */
}

#menu {
	width : 100%;
	height : 40px;
	float: left;
	margin-bottom: 5px;
	text-align: center;
	background: #fff5a6;
}

#menu button{
	background-color: transparent;
	border: none;
}

#rank {
	width : 70%;
	height : 100%;
	float: left;
}

#rankList {
	width : 100%;
	height : 100%;
	float: left;
}

#recoList {
	width : 29%;
	height : 100%;
	float: left;
	margin-left: 5px;
}
</style>
<script type="text/javascript">
$(function() {
	// 시작과 동시에 UseRank가 띄워짐
	$("#rankList").empty()
	$("#top3").empty()
	$.ajax({
		url: "../rankMovie/movieRankAll",
		data: {
			page : 1
		},
		success: function(x) {
			$("#rankList").append(x)
		},
		error: function() {
			alert("오류발생")
		}
	})
	// 시작과 동시에 User추천 항목 띄워줌
	$.ajax({
		url: "../rankMovie/recoMovie",
		success: function(x) {
			$("#recoList").append(x)
		},
		error: function() {
			alert("오류발생")
		}
	})
	// 시작과 동시에 User Top3 불러오기
	$.ajax({
		url: "../rankMovie/movieTop3",
		success: function(x) {
			$("#top3").append(x)
		},
		error: function() {
			alert("오류발생")
		}
	})	// ajax

})	// $func
</script>
<style type="text/css">
button {
	font-size: 15px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="../WEB-INF/views/header.jsp" %>

<div id="main">
	<div id="rank">					<!--  style="background: yellow;" -->
		<!-- Movie Rank -->
		<div id="top3"><!-- Top3 --></div>	<!--  style="background: violet;" -->
		
		<div id="rankList">			<!--  style="background: pink;" -->
			<!-- 랭킹이 들어갈 곳 -->
		</div>
	</div>
	<div id="recoList">				<!--  style="background: orange;" -->
		<!-- 추천 항목이 들어갈 곳 -->
	</div>
</div>
<a href="../rankMovie/movieIdTest"><button id="test" style="background: lime;">movieId Test</button></a>
</body>
</html>