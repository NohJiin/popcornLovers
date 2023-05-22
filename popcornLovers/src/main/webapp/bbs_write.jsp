<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.0/classic/translations/ko.js"></script>
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

jQuery library
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

Popper JS
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

Latest compiled JavaScript
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/create.css">
</head>
<body>

</head>


<body>

	<div id="header">
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
    
    
	
<div class="main_content">
<div>
<div class="main">
	<h3 class="font-1">글 작성하기</h3>
	<hr style="color: #424242;">
	
	<div class="category_select">
	<select id="category" name="subject" style="width: 40%">
	  <option value="게시판을 선택해주세요." diabled selected hidden>게시판을 선택해 주세요.</option>
	  <option value="카테고리1">카테고리1</option>
	  <option value="카테고리2">카테고리2</option>
	  <option value="카테고리3">카테고리3</option>
	  <option value="카테고리4">카테고리4</option>
	</select>
	</div>

	<div class="input_title">
	<div>
	<form action="submit-form">
        <input placeholder="제목을 입력해 주세요." style="width: 100%;">
    </form>
    </div>
    </div>
    
        <br>
    <h3 class="font-1">본문 내용</h3>
    <form action="submit-form">
        <textarea name="editor" id="editor" placeholder="내용을 입력해 주세요"></textarea>
        <br>
        <button type="submit" class="btn btn-outline-dark">제출</button>
    </form>
  </div>
    <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ), {
                language: 'ko'
            } )
            .then( editor => {
                console.log( editor );
            } )
            .catch( error => {
                console.error( error );
            } );
    </script>
    </div>
    </div>
</body>
</html>