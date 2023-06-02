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
	margin-top: 10px;
}

.category{
	dispaly : inlin-block;
}

#menu {
	width : 100%;
	height : 20%;
	float: left;
	margin-bottom: 5px;
	text-align: center;
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

.reco-border {
	border-radius: 30px;
	border-color: black;
	border: solid 1px;
}

img.imgLike {
	background: url("../resources/n_img/likeHeart.png") no-repeat;
  	width: 20px;
  	height: 20px;
}

img.imgDislike {
	background: url("../resources/n_img/dislikeHeart.png") no-repeat;
  	width: 50px;
  	height: 50px;
}
</style>
<script type="text/javascript">
$(function() {
	// 시작과 동시에 UseRank가 띄워짐
	$("#rankList").empty()
	$("#top3").empty()
	$.ajax({
		url: "../rankUser/userRankAll",
		data: {
			page : 1
		},
		success: function(x) {
			$("#rankList").append(x)
		},
		error: function() {
			alert("랭킹 불러오기 오류발생")
		}
	})
	// 시작과 동시에 User추천 항목 띄워줌
	$.ajax({
		url: "../rankUser/recoUser",
		success: function(x) {
			$("#recoList").append(x)
		},
		error: function() {
			alert("추천 리스트 오류발생")
		}
	})
	// 시작과 동시에 User Top3 불러오기
	$.ajax({
		url: "../rankUser/userTop3",
		success: function(x) {
			$("#top3").append(x)
		},
		error: function() {
			alert("top3 오류발생")
		}
	})	// ajax
	
/* 	// let status = false;
	let like = "resources/n_img/likeHeart.png"
	let dislike = "resources/n_img/dislikeHeart.png"
	$(document).on("click", ".btn", function(){
		value = $(this).attr('value')
		idvalue = $(this).attr('id')
		// var imgSrc = jQuery('.btnImg').attr("src");
		alert("성공>> " + value + "<br>" + "btn의 id>> " + idvalue)
		
		
		if (imgSrc == dislike) {
			jQuery('.btnImg').attr("src", "resources/n_img/likeHeart.png");
		} else if (imgSrc == like) {
			jQuery('.btnImg').attr("src", "resources/n_img/dislikeHeart.png");
		}
		//DB에 UPDATE(+)
		//FALSEytui  ikuyg                        
		
		
		//DB에 UPDATE(-)
		//TRUE
		
		
	}) */
	
/* 	$(document).on("click", ".btn", function(){
		value = $(this).attr('value')
		idvalue = $(this).attr('id')
		alert("클릭됨")
		
	}) */
	
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

<div id="main" style="margin-top: 30px;">
	<div id="rank">					<!--  style="background: yellow;" -->
		<!-- User Rank -->
		<div id="top3" style="width: 80%; margin: auto;"><!-- Top3 --></div>	<!--  style="background: violet;" -->
		
		<div id="rankList" style="margin-top: 15px;">			<!--  style="background: pink;" -->
			<!-- 랭킹이 들어갈 곳 -->
		</div>
	</div>
	<div id="recoList" class="reco-border" style="background: #FFF4A6; width : 23%; margin-left: 4%;">				<!--  style="background: orange;" -->
		<!-- 추천 항목이 들어갈 곳 -->
	</div>
</div>
</body>
</html>