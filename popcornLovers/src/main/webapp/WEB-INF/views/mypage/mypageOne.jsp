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
      <%
	int pages3 = (int)request.getAttribute("jjimPages");
	for(int p3 = 1; p3 <= pages3; p3++){
%>
		<button class="jjimpages"><%= p3 %></button>
<%		
	}
%> 

<div id="myjjimResult">
 <table>
   <c:forEach items="${jjimAllList}" var="my"> 
 <%--   <tr>
      <td>${my.movieTitle}</td> 
      <td><img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180"></td>
      <td>${my.movieGrade}</td>     
   </tr> --%>
   
   <tr>
		<td><img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180"></td>
	</tr>
	<tr>
		<td>${my.movieTitle}</td>
	</tr>
	<tr>
		<td> ⭐${my.movieGrade}</td>
	</tr>
   </c:forEach>
</table>
</div>
 </div>
    
    
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