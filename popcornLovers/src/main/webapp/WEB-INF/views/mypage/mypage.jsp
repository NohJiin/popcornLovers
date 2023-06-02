<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 화면</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<script src="https://kit.fontawesome.com/a86e134bc2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<style type="text/css">

/* button{border:none; background:white;} */
.profile2{width:120px; height:120px; border-radius:100%; background:yellow;  border-width: 3px;  border-style: solid;}
.jjim{width:50px; height: 50px; background-image:url('../resources/n_img/likeHeart.png'); background-size : 100%;}
.jjimout{width:50px; height: 50px;  background-image:url('../resources/n_img/dislikeHeart.png'); background-size : 100%;}

</style>
<script type="text/javascript">
$(function(){

	 /* 찜한 영화 목록 버튼*/ 
	$('.jjimpages').click(function() {
		$.ajax({
			url : "../mypage/myjjim2" , //views/mybbsAll.jsp가 결과!
			data : {
				page : $(this).text()
			},
			success : function(result) { //결과가 담겨진 table부분코드
				$('#myjjimResult').html(result)
			},
			error : function() {
				alert('실패')
			}
		}) //ajax
	})//bbspages
	
	 /* 작성한 게시글 목록 버튼*/ 
	$('.bbspages').click(function() {
		$.ajax({
			url : "../mypage/mybbs2" , //views/mybbsAll.jsp가 결과!
			data : {
				page : $(this).text()
			},
			success : function(result) { //결과가 담겨진 table부분코드
				$('#mybbsResult').html(result)
			},
			error : function() {
				alert('실패')
			}
		}) //ajax
	})//bbspages
	
	/* 작성한 리뷰 목록 버튼 */
	$('.reviewpages').click(function() {
		$.ajax({
			url : "../mypage/myreview2" , //views/mybbsAll.jsp가 결과!
			data : {
				page : $(this).text()
			},
			success : function(result2) { //결과가 담겨진 table부분코드
				$('#myreviewResult').html(result2)
			},
			error : function() {
				alert('실패')
			}
		}) //ajax
	})//reviewpages
	
	
	$(function() {
		  var slideWrapper = $('.slide-wrapper');
		  var slides = $('.movie_jjimbox');
		  var slideCount = slides.length;
		  var currentIndex = 0;
		  var slideWidth = slides.outerWidth(true);
		  var slidesPerPage = 4;
		  var totalPages = Math.ceil(slideCount / slidesPerPage);

		  // 슬라이드 컨테이너의 너비 설정
		  slideWrapper.css('width', slideWidth * slideCount);

		  function showSlides() {
		    var startPosition = currentIndex * slidesPerPage;
		    var endPosition = startPosition + slidesPerPage;

		    slides.hide(); // 모든 슬라이드 숨기기
		    slides.slice(startPosition, endPosition).show(); // 현재 페이지의 슬라이드만 보이기
		  }

		  // 초기 슬라이드 표시
		  showSlides();

		  // 네비게이션 클릭 시
		  $('.nav-item').click(function() {
		    var targetIndex = $(this).index();
		    currentIndex = targetIndex;
		    showSlides();
		    toggleButtons();
		  });

		  // 이전 버튼 클릭 시
		  $('.prev-button').click(function() {
		    if (currentIndex > 0) {
		      currentIndex--;
		      showSlides();
		      toggleButtons();
		    }
		  });

		  // 다음 버튼 클릭 시
		  $('.next-button').click(function() {
		    if (currentIndex < totalPages - 1) {
		      currentIndex++;
		      showSlides();
		      toggleButtons();
		    }
		  });
		  
		  // 이전, 다음 버튼 숨김/표시 설정
		  function toggleButtons() {
		    $('.prev-button').toggle(currentIndex > 0);
		    $('.next-button').toggle(currentIndex < totalPages - 1);
		  }
		  
		  toggleButtons();

		  // 페이지 변경 시 네비게이션 및 버튼 숨김/표시 설정
		  $('.prev-button, .next-button').click(function() {
		    $('.nav-item').removeClass('active');
		    $('.nav-item').eq(currentIndex).addClass('active');
		  });
		});
})//$
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>


<div class="resume">
  <div class="base">
    <div class="profile">
      <div class="photo"><img src="../resources/profile_img/${memberVO.member_img}" width="210px" height="210px"/></div>  
      <div class="info">
        <p class="name">${member_knickname}</p>

        <small class="job">#${member_id}</small>
                <i class="fa-sharp fa-solid fa-medal" style="color: #916a55;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #a1a1a1;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #f0c424;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #0ad8db;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #ec46a7;"></i>
         <a href="../member/update.jsp">
 <button type="button">회원정보 수정</button>
 </a>
  <a href="../member/remove.jsp">
 <button type="button">탈퇴하기</button>
 </a>
      </div>
    </div>
    <div class="about">
     <!--  <h3>About me</h3> -->
    </div>
     <b>리뷰 작성 수  : </b>${reviewCount}<br>
 <b>게시글 작성 수 : </b>${bbsCount}<br>

   <img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="20px" height="20px">${bag.member_view} 
<img alt="좋아요 하트 이미지" src="../resources/n_img/pink.png" width="20px" height="20px"> ${bag.member_fav}
   
  </div>
  <div class="func">
    <div class="skills-prog">
      <h3><i class="fa-solid fa-heart"></i>찜 목록</h3>
 <%--      <%
	int pages3 = (int)request.getAttribute("jjimPages");
	for(int p3 = 1; p3 <= pages3; p3++){
%>
		<button class="jjimpages"><%= p3 %></button>
<%		
	}
%>  --%>

<div id="myjjimResult">

<%-- <div class="slider-container">
  <div class="slider">
    <c:forEach items="${jjimAllList}" var="my"> 
      <div class="slide">
        <img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180">
        <div class="movie-info">
          <p>${my.movieTitle}</p>
          <p>⭐${my.movieGrade}</p>
        </div>
      </div>
    </c:forEach>
  </div>
  <div class="prev-button">이전</div>
  <div class="next-button">다음</div>
</div> --%>

<div class="slide-wrapper">
  <c:forEach items="${jjimAllList}" var="my">
    <div class="movie_jjimbox">
      <div class="movie_jjim">
        <img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180">
        <div class="jjim_txt">${my.movieTitle}</div>
        <div class="jjim_txt">⭐${my.movieGrade}</div>
      </div>
    </div>
  </c:forEach>
</div>

<button class="prev-button">이전</button>
<button class="next-button">다음</button>
 
 <%--   <c:forEach items="${jjimAllList}" var="my"> 
<div class="movie_jjimbox">
	<div class="movie_jjim">
		<img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180">
		<div class="jjim_txt">${my.movieTitle}</div>
		<div class="jjim_txt">⭐${my.movieGrade}</div>
	</div>
</div>   
   </c:forEach> --%>

</div>
 </div>
    <%--    <tr>
		<td><img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180"></td>
	</tr> --%>
<%-- 	<tr>
		<td>${my.movieTitle}</td>
	</tr>
	<tr>
		<td> ⭐${my.movieGrade}</td>
	</tr> --%>
    
    <div class="skills-prog">
      <h3><i class="fa-solid fa-comment-dots"></i>작성한 리뷰</h3>
      <%
	int pages2 = (int)request.getAttribute("reviewPages");
	for(int p2 = 1; p2 <= pages2; p2++){
%>
		<button class="reviewpages"><%= p2 %></button>
<%		
	}
%> 

<div id="myreviewResult">
 <table>
   <tr>
      <td>영화제목</td>
      <td>내용</td>
      <td>작성자</td>
   </tr>
   <c:forEach items="${reviewAllList}" var="my"> 
   <tr>
      <td>${my.movieTitle}</td> 
      <td>${my.reviewContent}</td>
      <td>${my.member_knickname}</td>     
   </tr>
   </c:forEach>
</table>
</div>
 </div>
      <div class="skills-prog">
      <h3><i class="fa-solid fa-list"></i>작성한 게시글</h3>

      <%
	int pages = (int)request.getAttribute("bbsPages");
	for(int p = 1; p <= pages; p++){
%>
		<button class="bbspages"><%= p %></button>
<%		
	}
%>
<div id="mybbsResult">
 <table class="table table-hover">
 <thead>
   <tr>
      <th>번호</th>
      <th>제목</th>
      <th>시간</th>
      <th>작성자</th>
   </tr>
   </thead>
   <c:forEach items="${bbsAllList}" var="my"> 
      <tbody>
   <tr>
      <td>${my.bbs_id}</td> 
      <td><a href="../bbs/detail_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${my.bbs_title}</a></td>
      <td>${my.bbs_date}</td>     
      <td>${my.member_knickname}</td> 
   </tr>
   </tbody>
   </c:forEach>
</table>
</div>
 </div>
  
    </div>
 
    </div>

</body>
</html>