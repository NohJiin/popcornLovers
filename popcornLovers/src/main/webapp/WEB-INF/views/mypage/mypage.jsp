<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 화면</title>
<script src="https://kit.fontawesome.com/a86e134bc2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<style type="text/css">

button{border:none; background:white;}
.profile{width:120px; height:120px; border-radius:100%; background:yellow;  border-width: 3px;  border-style: solid;}
.jjim{width:50px; height: 50px; background-image:url('../resources/n_img/likeHeart.png'); background-size : 100%;}
.jjimout{width:50px; height: 50px;  background-image:url('../resources/n_img/dislikeHeart.png'); background-size : 100%;}

</style>
<script type="text/javascript">
$(function(){

	 
	 $('.profile_img').click(function() {
		 var popupWidth = 500;
		    var popupHeight = 300;
		    var left = (window.screen.width - popupWidth) / 2;
		    var top = (window.screen.height - popupHeight) / 2;
		    var popupOptions = 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top;

		    // 팝업 창을 열기
		    window.open('popupGO', '프로필 이미지 업로드', popupOptions);
		  });
	
	
	 $('#btntest').click(function() {
		    if ($(this).hasClass('jjim')) {
		      // jjim 클래스가 있는 경우
		      $(this).removeClass('jjim').addClass('jjimout');
		      alert("찜 취소");
		    } else {
		      // jjimout 클래스가 있는 경우
		      $(this).removeClass('jjimout').addClass('jjim');
		      alert("찜 완료");
		    }
		  });
	 
	 
	 $('#jjim1').click(function() {
		    if ($(this).hasClass('notlove')) {
		      $(this).removeClass('notlove');
		      $('#jjim1 i').removeClass('fa-regular').addClass('fa-solid');
		      alert("찜 완료");
		    } else {
		    	$(this).addClass('notlove');
		      $('#jjim1 i').removeClass('fa-solid').addClass('fa-regular');
		      alert("찜 취소");
		    }
		  });
	
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


<div class="test"></div>

<button id="btntest" class="jjim"></button>

<h3> 마이페이지 화면입니다.</h3>
 <br>
 <% if(session.getAttribute("member_id") == null ) { %>
 로그인 하세요
<%} else { %>
 <%} %>
 
 <div class="profile"></div>
 <button class="profile_img">프로필 이미지 넣기</button> <br>

 
<b>${member_knickname}</b>님
<button id="jjim1" style="border :0" class="notlove"><i class="fa-sharp fa-regular fa-heart fa-heart" style="color: #ff3d3d;"></i></button><br>



<i class="fa-sharp fa-solid fa-medal" style="color: #916a55;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #a1a1a1;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #f0c424;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #0ad8db;"></i>
<i class="fa-sharp fa-solid fa-medal" style="color: #ec46a7;"></i><br>
<img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="10px" height="10px">${bag.member_view} 
<img alt="좋아요 하트 이미지" src="../resources/n_img/pink.png" width="10px" height="10px"> ${bag.member_fav}

 <a href="../member/update.jsp">
 <button type="button">회원정보 수정</button>
 </a>
  <a href="../member/remove.jsp">
 <button type="button">탈퇴하기</button>
 </a>
 <div>
<b>영화 찜 목록</b>
 </div>

 <!-- 게시글 목록 -->
 <div>
<b>게시글 목록</b><br>
 전체 bbs 글 count : ${bbsCount}
 <hr>
 
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
      <th>작성자</th>
      <th>제목</th>
      <th>시간</th>
   </tr>
   </thead>
   <c:forEach items="${bbsAllList}" var="my"> 
      <tbody>
   <tr>
      <td>${my.bbs_id}</td> 
      <td>${my.member_knickname}</td> 
      <td>${my.bbs_title}</td>
      <td>${my.bbs_date}</td>     
   </tr>
   </tbody>
   </c:forEach>
</table>
</div>
 </div>
 
 
 <hr color="red">
 <b>리뷰 목록</b><br>
 전체 review 글 count : ${reviewCount}
 <hr>
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


</body>
</html>