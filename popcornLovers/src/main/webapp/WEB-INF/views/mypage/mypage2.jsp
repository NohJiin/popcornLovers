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
	$('.gradepages').click(function() {
			$.ajax({
				url : "../mypage/mygrade", //views/mygrade.jsp가 결과!
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
		}) //gradepages

		/* 작성한 게시글 목록 버튼*/
		$('.bbspages').click(function() {
			$.ajax({
				url : "../mypage/mybbs2", //views/mybbs2.jsp가 결과!
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
				url : "../mypage/myreview2", //views/myreview2.jsp가 결과!
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#myreviewResult').html(result)
				},
				error : function() {
					alert('실패')
				}
			}) //ajax
		})//jjimpages

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
				<div class="info_box clearfix">
					<p class="name">${member_knickname}</p>
					<div class="level_icon"><img alt="등급 이미지" src="../resources/level_img/${bag.member_level}.png" width="25px" height="25px"></div>
				</div>
					<small class="job">#${member_id}</small>
								<hr>
								<div class="user_btn clearfix">
									<a href="../member/update.jsp">
										<button type="button" class="mypage_btn">회원정보 수정</button>
									</a>
									 <a href="../member/remove.jsp">
										<button type="button" class="mypage_btn mypage_remove">탈퇴하기</button>
									</a>
								</div>
				</div>
			</div>
	
			<div class="about"></div>
			<b>리뷰 작성 수 : </b>${reviewCount}<br> <b>게시글 작성 수 : </b>${bbsCount}<br>

			<img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="20px" height="20px">${bag.member_view}
				<img alt="좋아요 하트 이미지" src="../resources/n_img/heart.png" width="20px" height="20px"> ${bag.member_fav}
		</div>


<!-- 회원 활동 목록 -->
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
									<a href="../movie/movieDetails2?movieId=${my.movieId}"> <img
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
						<button class="jjimpages pageBtn"><%=p3%></button>
						<%
							}
						%>
					</div><!-- page_btn -->
				</div><!-- skills-prog -->
			


			<!--별점 평가 목록 부분  -->
			<div class="skills-prog">
				<h3>
					<i class="fa-solid fa-star"></i>평가 목록
				</h3>

					<div id="mygradeResult">
						<c:forEach items="${gradeAllList}" var="my">
							<div class="movie_gradebox">
								<div class="movie_grade">
									<a href="../movie/movieDetails2?movieId=${my.movieId}"> <img
										alt="movie 이미지" src="../resources/n_img/${my.movieImg}"
										width="150" height="180">
									</a>
									<div class="grade_txt">${my.movieTitle}</div>
									<div class="grade_txt">나의 평점⭐: ${my.grade}</div>
								</div><!-- movie_jjim -->
							</div><!-- movie_jjimbox -->
						</c:forEach>
					</div><!-- myjjimResult -->
					<div class="page_btn">
						<%
							int pages4 = (int) request.getAttribute("jjimPages");
						for (int p4 = 1; p4 <= pages4; p4++) {
						%>
						<button class="gradepages pageBtn"><%=p4%></button>
						<%
							}
						%>
					</div><!-- page_btn -->
				</div><!-- skills-prog -->



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