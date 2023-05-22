<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 화면</title>
<script src="https://kit.fontawesome.com/a86e134bc2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function(){

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
 <% if(session.getAttribute("member_id") == null ) { %>
 로그인 하세요
<%} else { %>
<% }%>
<h3> 마이페이지 화면입니다.</h3>
 <br>
 <% if(session.getAttribute("member_id") == null ) { %>
 로그인 하세요
<%} else { %>
<b>${member_knickname}</b>님
<i class="fa-sharp fa-solid fa-heart" style="color: #ff3d3d;"></i>
<i class="fa-sharp fa-regular fa-heart" style="color: #ff3d3d;"></i>
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
 <%} %>
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
		<button style="background: lime; color: red; width: 50px;" class="bbspages"><%= p %></button>
<%		
	}
%>

<div id="mybbsResult">
 <table>
   <tr>
      <td>번호</td>
      <td>아이디</td>
      <td>제목</td>
      <td>시간</td>
   </tr>
   <c:forEach items="${bbsAllList}" var="my"> 
   <tr>
      <td>${my.bbs_id}</td> 
      <td>${my.member_id}</td> 
      <td>${my.bbs_title}</td>
      <td>${my.bbs_create}</td>     
   </tr>
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
		<button style="background: lime; color: red; width: 50px;" class="reviewpages"><%= p2 %></button>
<%		
	}
%>
<div id="myreviewResult">
 <table>
   <tr>
      <td>영화제목</td>
      <td>내용</td>
      <td>아이디</td>
   </tr>
   <c:forEach items="${reviewAllList}" var="my"> 
   <tr>
      <td>${my.movieTitle}</td> 
      <td>${my.reviewContent}</td>
      <td>${my.member_id}</td>     
   </tr>
   </c:forEach>
</table>
</div>


</body>
</html>