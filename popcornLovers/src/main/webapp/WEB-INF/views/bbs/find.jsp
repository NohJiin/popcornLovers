<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	$('.num').click(function() {
		//alert($(this).text())
		$.ajax({
			url : "category_paging", //views/bbsList2.jsp가 결과!
			data : {
				page : $(this).text(),
				bbs_cate_num : 4
			},
			success : function(result) { //결과가 담겨진 table부분코드
				$('.board_list').html(result)
			},
			error : function() {
				alert('실패.@@@')
			}
		}) //ajax
	})
})
</script>
<style>
td {
	background: white;
	height: 30px;
}

#paging_result {
	 padding-bottom: 10px;
	 background: #f7f7f7;
	 border-radius: 45px 45px 45px 45px;
}

 
</style>
<link rel="stylesheet" href="resources/css/style.css">
 <link rel="stylesheet" href="resources/css/css.css">
</head>
<body>
	<div class="header">
		<div class="header_content">
			<div class="nav">
				<div class="logo">
					<a href="post.jsp"><img src="resources/image/logo5.png" alt="로고 이미지"></a>
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
					--><li class="li_menu"><a href="post.jsp"><span class="main_menu">커뮤니티</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="notice?bbs_cate_num=1&page=1"><span>공지사항</span></a></li><!--
							--><li><a href="free?bbs_cate_num=2&page=1"><span>자유게시판</span></a></li><!--
							--><li><a href="movietalk?bbs_cate_num=3&page=1"><span>영화수다</span></a></li><!--
							--><li><a href="find?bbs_cate_num=4&page=1"><span>찾아주세요</span></a></li><!--
							--><li><a href="bungae?bbs_cate_num=5&page=1"><span>번개</span></a></li>
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
    <div id="paging_result">
    	<div class="board_wrap">
			<div class="board_title">
				<strong>${info2[0].bbs_cate_name}</strong>
				<p>${info2[0].bbs_cate_info}</p>
			</div>
			<div class="board_list_cnt">
				<p>전체 : <span class="board_list_cnt_highlight">${count2}</span>개</p>
			<div>
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<c:forEach items="${list2}" var="one">
						<div>
							<div class="num">${one.bbs_row_no}</div>
							<div class="title"><a href="detail_cate_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${one.bbs_title}</a></div>
							<div class="writer">${one.user_id}</div>
							<div class="date">${one.bbs_date}</div>
							<div class="count">${one.bbs_hit}</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="board_page">
					<a href="#" class="bt first"><<</a> 
					<a href="#" class="bt prev"><</a>
					<%
					int pages = (int)request.getAttribute("pages2");
					for (int p = 1; p <= pages; p++) {
					%>
					<a href="#" class="num"><%= p%></a>
					<%
						}
					%>
					<a href="#" class="bt next">></a>
					<a href="#" class="bt last">>></a>
				</div>
				<div class="bt_wrap">
					<a href="write.html" class="on">등록</a>
					<!--<a href="#">수정</a>-->
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html></html>