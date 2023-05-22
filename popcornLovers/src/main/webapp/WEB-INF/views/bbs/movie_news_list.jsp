<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
  <link rel="stylesheet" href="resources/css/style.css">


</head>
<body>
	<div class="header">
		<div class="header_content">
			<div class="nav">
				<div class="logo">
					<a href><img src="resources/image/logo5.png" alt="로고 이미지"></a>
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
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">랭킹</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>유저랭킹</span></a></li><!--
							--><li><a href="링크주소"><span>영화랭킹</span></a></li><!--
							--><li><a href="링크주소"><span>배우랭킹</span></a></li><!--
							--></ul>
						</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">영화관 찾기</span></a><!--
					--><div class="menu_sub">
						<ul>
                            <li><a href="movie_news_list"><span>자유게시판</span></a></li><!--
							--><li><a href="링크주소"><span>자유게시판</span></a></li><!--
							--><li><a href="링크주소"><span>자유게시판</span></a></li><!--
							--><li><a href="링크주소"><span>자유게시판</span></a></li>
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
                   <img class="search-btn" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색">
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
    
  <table class="table">
    <thead class="thead-light">

	
	<tr>
		<th class="top">번호</th>
		<th class="top">제목</th>
		<th class="top">작성자</th>
		<th class="top">작성일</th>
		<th class="top">좋아요</th>
	
	</tr>
	 </thead>
	  <tbody>
<c:forEach items="${list}" var="bag">
	
	<tr>
		<th class="down">${bag.talk_no}</th>
				<th class="down"><a href="movie_news_list?bag.talk_no=${bag.talk_no}">${bag.talk_title}</a>
				</th>
				<th class="down">${bag.user_id}</th>
				<th class="down">${bag.talk_date}</th>
				<th class="down">${bag.talk_like}</th>
	
	</tr>
</c:forEach>
   </tbody>
</table>
 <button type="submit" class="btn btn-outline-dark">글쓰기</button>
</body>
</html>

