<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 화면</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<script src="https://kit.fontawesome.com/a86e134bc2.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {

		/* 찜한 영화 목록 버튼*/
		$('.jjimpages').click(function() {
			$.ajax({
				url : "../mypage/myjjim2", //views/myjjim2.jsp가 결과!
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
		})//jjimpages

		/* 별점 매긴 페이지 목록 버튼 */
		$('.jjimpages').click(function() {
			$.ajax({
				url : "../mypage/mygrade", //views/mybbsAll.jsp가 결과!
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#mygradeResult').html(result)
				},
				error : function() {
					alert('실패')
				}
			}) //ajax
		})//pages

		/* 작성한 게시글 목록 버튼*/
		$('.bbspages').click(function() {
			$.ajax({
				url : "../mypage/mybbs2", //views/mybbsAll.jsp가 결과!
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
				url : "../mypage/myreview2", //views/mybbsAll.jsp가 결과!
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
		})//jjimpages

		/* $(function() {
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
			}); */
	})//$
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>


	<div class="resume">
		<div class="base">
			<div class="profile">
				<div class="photo">
					<img src="../resources/profile_img/${memberVO.member_img}"
						width="210px" height="210px" />
				</div>
				<div class="info">
					<p class="name">${member_knickname}</p>

					<small class="job">#${member_id}</small> <i
						class="fa-sharp fa-solid fa-medal" style="color: #916a55;"></i> <i
						class="fa-sharp fa-solid fa-medal" style="color: #a1a1a1;"></i> <i
						class="fa-sharp fa-solid fa-medal" style="color: #f0c424;"></i> <i
						class="fa-sharp fa-solid fa-medal" style="color: #0ad8db;"></i> <i
						class="fa-sharp fa-solid fa-medal" style="color: #ec46a7;"></i> 
								<hr>
						<a
						href="../member/update.jsp">
						
						<button type="button" class="mypage_btn">회원정보 수정</button>
					</a> <a href="../member/remove.jsp">
						<button type="button" class="mypage_btn mypage_remove">탈퇴하기</button>
					</a>
				</div>
			</div>
	
			<div class="about"></div>
			<b>리뷰 작성 수 : </b>${reviewCount}<br> <b>게시글 작성 수 : </b>${bbsCount}<br>

			<img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="20px"
				height="20px">${bag.member_view} <img alt="좋아요 하트 이미지"
				src="../resources/n_img/heart.png" width="20px" height="20px">
			${bag.member_fav}

		</div>



		<div class="func">
<!-- 찜 목록 부분 -->
			<div class="skills-prog">
				<h3>
					<i class="fa-solid fa-heart"></i>찜 목록
				</h3>

					<div id="myjjimResult">
						<c:forEach items="${jjimAllList}" var="my">
							<div class="movie_jjimbox">
								<div class="movie_jjim">
									<a href="../movie/movieDetails2?movieId=${my.movieId} }"> <img
										alt="movie 이미지" src="../resources/n_img/${my.movieImg}"
										width="150" height="180">
									</a>
									<div class="jjim_txt">${my.movieTitle}</div>
								</div><!-- movie_jjim -->
							</div><!-- movie_jjimbox -->
						</c:forEach>
					</div><!-- myjjimResult -->
					<div class="page_btn">
						<%
							int pages3 = (int) request.getAttribute("jjimPages");
						for (int p3 = 1; p3 <= pages3; p3++) {
						%>
						<button class="jjimpages pageBtn pageBtn"><%=p3%></button>
						<%
							}
						%>
					</div><!-- page_btn -->
				</div><!-- skills-prog -->
			


			<!--평가 목록 부분  -->
			<div class="skills-prog">
				<h3>
					<i class="fa-solid fa-star"></i>평가 목록
				</h3>
				<%--      <%
	int pages3 = (int)request.getAttribute("jjimPages");
	for(int p3 = 1; p3 <= pages3; p3++){
%>
		<button class="jjimpages"><%= p3 %></button>
<%		
	}
%>  --%>

				<div id="mygradeResult">

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
						<c:forEach items="${gradeAllList}" var="my">
							<div class="movie_jjimbox">
								<div class="movie_jjim">
									<img alt="movie 이미지" src="../resources/n_img/${my.movieImg}"
										width="150" height="180">
									<div class="jjim_txt">${my.movieTitle}</div>
									<div class="jjim_txt">나의 평점⭐: ${my.grade}</div>
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
			<!--평가 목록 부분  -->


		<!-- 작성한 리뷰 목록 -->
			<div class="skills-prog">

				<h3>
					<i class="fa-solid fa-comment-dots"></i>작성한 리뷰
				</h3>

				<div id="myreviewResult">
					<div class="review_mainbox clearfix">
					<c:forEach items="${reviewAllList}" var="my">
							<div class="review_box">
								<p class="r_title">${my.movieTitle}</p>
								<div>
									<p class="r_content">${my.reviewContent}</p>
								</div>
								<p class="r_knick">${my.member_knickname}</p>
							</div><!-- review_box -->
						</c:forEach>
					</div><!-- review_mainbox -->
				</div><!-- myreviewResult -->
					<div class="page_btn">
						<%
						int pages2 = (int) request.getAttribute("reviewPages");
						for (int p2 = 1; p2 <= pages2; p2++) {
						%>
								<button class="reviewpages pageBtn"><%=p2%></button>
						<%
								}
						%>
					</div><!-- page_btn -->
				
			</div><!-- skills-prog -->


		<!-- 작성한 게시글 목록 -->
			<div class="skills-prog">
				<h3>
					<i class="fa-solid fa-list"></i>작성한 게시글
				</h3>
			
				
				
				<div id="mybbsResult">
					<table class="table_box">
					<tbody>
							<tr class="table_main">
								<td class="t_no">번호</td>
								<td class="t_title">제목</td>
								<td class="t_time">시간</td>
								<td class="t_write">작성자</td>
							</tr><!-- table_main -->
					</tbody>	
					
						<c:forEach items="${bbsAllList}" var="my">
							<tbody>
								<tr>
									<td class="t_no">${my.bbs_id}</td>
									<td class="t_title"><a
										href="../bbs/detail_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${my.bbs_title}</a></td>
									<td class="t_titme">${my.bbs_date}</td>
									<td class="t_write">${my.member_knickname}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div><!-- mybbsResult -->
					<div class="page_btn">
					<%
						int pages = (int) request.getAttribute("bbsPages");
					for (int p = 1; p <= pages; p++) {
					%>
					<button class="bbspages pageBtn"><%=p%></button>
					<%
						}
					%>
				</div><!-- page_btn -->
			</div>

		</div>

	</div>

</body>
</html>