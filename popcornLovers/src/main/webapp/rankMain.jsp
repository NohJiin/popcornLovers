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
		url: "rankUser/userRankAll",
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
		url: "rankMovie/recoMovie",
		success: function(x) {
			$("#recoList").append(x)
		},
		error: function() {
			alert("오류발생")
		}
	})
	// 시작과 동시에 User Top3 불러오기
	$.ajax({
		url: "rankUser/userTop3",
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
<div class="header">
		<div class="header_content">
			<div class="nav">
				<div class="logo">
					<a href="링크주소"><img src="resources/img/logo5.png" alt="로고 이미지"></a>
				        </div>
                            <nav>
				                <ul class="header_menu"><!--
				                --><li class="li_menu"><a href="링크주소"><span class="main_menu">영화정보</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>영화 목록</span></a></li>
                        </ul>
					</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">커뮤니티</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>공지사항</span></a></li><!--
							--><li><a href="링크주소"><span>자유게시판</span></a></li><!--
							--><li><a href="링크주소"><span>영화수다</span></a></li><!--
							--><li><a href="링크주소"><span>찾아주세요</span></a></li><!--
							--><li><a href="링크주소"><span>번개</span></a></li>
						</ul>
						</div>
                    </li><!--
					--><li class="li_menu"><a href="rankMain.jsp"><span class="main_menu">랭킹</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="rankUserMain.jsp"><span>유저랭킹</span></a></li> <!--
							--><li><a href="rankMovieMain.jsp"><span>영화랭킹</span></a></li><!--
							--><li><a href="rankActorMain.jsp"><span>배우랭킹</span></a></li><!--
							--></ul>
						</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">영화관 찾기</span></a><!--
					--><div class="menu_sub">
						<ul>
                            <li><a href="링크주소"><span>영화 찾기</span></a></li><!--
							--><li><a href="링크주소"><span>극장 찾기</span></a></li><!--
							--><li><a href="링크주소"><span>알림</span></a></li>
                        </ul>
						</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">캘린더</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>나의 영화일지</span></a></li><!--
							--><li><a href="링크주소"><span>나의 일지 관리</span></a></li><!--
							--><li><a href="링크주소"><span>개봉 예정작 정보</span></a></li>
                        </ul>
						</div>
					</li>
				</ul>
                </nav>
                <div class="search-box">
					<form class="d-flex" role="search">
                    <img class="search-btn" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                    <input type="text" class="search-txt" alt="검색" name=""placeholder="검색어를 입력하세요.">
					</form>
				</div>
				<div class="login">
					<ul>
						<li><span>로그인</span></li><!--
						--><li><span>회원가입</span></li>
					</ul>
				</div>
			</div>
		</div>
    </div>
<!-- <div id="menu" class="menu_sub">
	<ul>
		<li><button class="category" id="user"><span>유저</span></button></li>
		<li><button class="category" id="movie"><span>영화</span></button></li>
		<li><button class="category" id="actor"><span>배우</span></button></li>
	</ul>
</div>
<hr>  -->
<div id="main">
	<div id="rank">					<!--  style="background: yellow;" -->
		Rank
		<div id="top3">Top3</div>	<!--  style="background: violet;" -->
		
		<div id="rankList">			<!--  style="background: pink;" -->
			랭킹이 들어갈 곳
		</div>
	</div>
	<div id="recoList">				<!--  style="background: orange;" -->
		추천 항목이 들어갈 곳
	</div>
</div>
</body>
</html>