<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('.num').click(function() {
			//alert($(this).text())
			$.ajax({
				url : "bbs_all_List", //views/bbs_all_List.jsp가 결과!
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('.board_list').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		})
		
			$.ajax({
				url : "comment_select", //views/bbs_all_List.jsp가 결과!
				data : {
					bbs_no : ${list2[0].bbs_no}
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('.comment_select').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
	})
			$(function() {
			 $('.comment_insert_btn').click(function() {
				 var comment = $('#comment_input').val();
				$.ajax({
					url : "comment_insert", //views/bbs_all_List.jsp가 결과!
					data : {
						content : comment,
						bbs_no : ${list2[0].bbs_no}
					},
					success : function(result) { //결과가 담겨진 table부분코드
						$('.comment_select').html(result)
						$('#comment_input').val('');
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

.comment_box {
    margin-top: 20px;
    width: 100%;
}

.comment_box strong {
    font-size: 1.4rem;
    padding-left: 10px;
}

.comment_content {
    padding: 10px 10px 5px 10px;
    width: 980px;
}

.comment_input_box {
    height: 50px;
    width: 970px;
    padding-left: 5px;
    margin-bottom: 10px;
}

.comment_insert_btn {
    display: inline-block;
    width: 50px;
    height: 30px;
    border: 2px solid #e2e2e2;
    background-color: white;
    border-radius: 5px;
    font-size: 0.8rem;
}

.comment_insert_btn:hover {
    background-color: #e2e2e2;
}

.comment_list_box {
    margin-top: 10px;
    width: 100%;
}

.comment_list_cont {
    padding: 10px 10px 5px 10px;
    width: 980px;
}

.comment_list_content{
    padding-top: 10px;
    padding-bottom: 15px;
    background-color: #F5F5F5;
    border-radius: 15px;
    padding-left: 10px;
}

.comment_list{
    width: 90%;
}

.comment_list_info{
    display: flex;
    justify-content: space-between;
}

.comment_list_first_line {
    display: flex;
    width: 100%;
}

.comment_list_first_line_item2{
    margin-left: auto;
}
.comment_list_date {
    font-size: 0.9rem;
    color: gray;
    margin-left: 20px;
}

.comment_list_update_a {
    color: #FE4A8D;
    font-size: 0.9rem;
    margin-left: 5px;
}

.comment_list_delete_a {
    color: #FE4A8D;
    font-size: 0.9rem;
}

.reply_btn {
    float: right;
    background-color: #ddd;
    border: none;
    width: 70px;
    height: 20px;
    vertical-align: middle;
    border-radius: 5px;
}

.reply_list_box {
    margin-top: 10px;
    width: 100%;
}

.reply_list_cont {
    padding: 10px 10px 5px 10px;
    width: 980px;
}

.reply_list_content{
    padding-top: 10px;
    padding-bottom: 15px;
    background-color: #F5F5F5;
    border-radius: 15px;
    padding-left: 10px;
}

.reply_list{
    width: 90%;
    margin-left: 70px;
}

.reply_list_info{
    display: flex;
    padding: 0 3px 0 3px;
}
.reply_list_first_line {
    display: flex;
    width: 100%;
}

.reply_list_date {
    font-size: 0.9rem;
    margin-left: 20px;
    color: gray;
}

.reply_list_update_a {
    color: #FE4A8D;
    font-size: 0.9rem;
    margin-left: 5px;
    margin-right: 5px;
}

.reply_list_delete_a {
    color: #FE4A8D;
    font-size: 0.9rem;
}

</style>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/css2.css">
</head>
<body>
	<div class="header">
		<div class="header_content">
			<div class="nav">
				<div class="logo">
					<a href><img src="resources/image/logo5.png" alt="로고 이미지"></a>
				</div>
				<nav>
					<ul class="header_menu">
						<!--
				                -->
						<li class="li_menu"><a href="링크주소"><span
								class="main_menu">영화정보</span></a> <!--
					-->
							<div class="menu_sub">
								<ul>
									<li><a href="링크주소"><span>영화 목록</span></a></li>
								</ul>
							</div></li>
						<!--
					-->
						<li class="li_menu"><a href="post.jsp"><span
								class="main_menu">커뮤니티</span></a> <!--
					-->
							<div class="menu_sub">
								<ul>
									<li><a href="notice?bbs_cate_num=1&page=1"><span>공지사항</span></a></li>
									<!--
							-->
									<li><a href="free?bbs_cate_num=2&page=1"><span>자유게시판</span></a></li>
									<!--
							-->
									<li><a href="movietalk?bbs_cate_num=3&page=1"><span>영화수다</span></a></li>
									<!--
							-->
									<li><a href="find?bbs_cate_num=4&page=1"><span>찾아주세요</span></a></li>
									<!--
							-->
									<li><a href="bungae?bbs_cate_num=5&page=1"><span>번개</span></a></li>
								</ul>
							</div></li>
						<!--
					-->
						<li class="li_menu"><a href="링크주소"><span
								class="main_menu">랭킹</span></a> <!--
					-->
							<div class="menu_sub">
								<ul>
									<li><a href="링크주소"><span>유저랭킹</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>영화랭킹</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>배우랭킹</span></a></li>
									<!--
							-->
								</ul>
							</div></li>
						<!--
					-->
						<li class="li_menu"><a href="링크주소"><span
								class="main_menu">영화관 찾기</span></a> <!--
					-->
							<div class="menu_sub">
								<ul>
									<li><a href="movie_news_list"><span>자유게시판</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>자유게시판</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>자유게시판</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>자유게시판</span></a></li>
								</ul>
							</div></li>
						<!--
					-->
						<li class="li_menu"><a href="링크주소"><span
								class="main_menu">캘린더</span></a> <!--
					-->
							<div class="menu_sub">
								<ul>
									<li><a href="링크주소"><span>나의 영화일지</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>나의 일지 관리</span></a></li>
									<!--
							-->
									<li><a href="링크주소"><span>개봉 예정작 정보</span></a></li>
								</ul>
							</div></li>
					</ul>
				</nav>
				<div class="search-box">
					<form class="d-flex" role="search">
						<img class="search-btn"
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
							alt="검색"> <input type="text" class="search-txt" alt="검색"
							name="" placeholder="검색어를 입력하세요.">
					</form>
				</div>
				<div class="login">
					<ul>
						<li><span>로그인</span></li>
						<!--
						-->
						<li><span>회원가입</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">${list2[0].bbs_title}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${list2[0].bbs_no}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${list2[0].user_id}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${list2[0].bbs_date}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${list2[0].bbs_hit}</dd>
					</dl>
				</div>
				<div class="cont">${list2[0].bbs_content}</div>
			</div>

			<div class="comment_select">
			</div>
			<div class="reply_select">
			</div>
			<div class="comment_box">
                <strong>댓글</strong>
                <div class="comment_content">
                       <input type="text" id="comment_input" class="comment_input_box" placeholder="내용을 입력하세요.">
                       <span class="input_group_btn">
                            <button class="comment_insert_btn">등록</button>
                       </span>
                </div>
            </div>

			<div class="bt_wrap">
				<a href="list.html" class="on">목록</a> <a href="edit.html">수정</a>
			</div>
		</div>
	</div>
</html>
</body>
</html>