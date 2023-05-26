<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			// alert($(this).text())
			$.ajax({
				url : "../rankMovie/movieRankList", //views/movieRankList.jsp가 결과!
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('실패')
				}
			}) //ajax
		})
	})
</script>
<style type="text/css">
table.rank {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
}
table.rank th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #efefef;
}
table.rank td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: gray;
}
</style>
</head>
<body>
<div id="d1">
	<table class="rank">
		<colgroup>
			<col width="5%">
			<col width="10%">
			<col width="5%">
			<col width="5%">
			<col width="5%">
			<col width="5%">
			<col width="2%">
		</colgroup>
		<tr>
			<td>Rank</td>
			<td>Movie Title</td>
			<td>Genre</td>
			<td>Reviews</td>
			<td><img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="10px" height="10px"></td>
			<td><img alt="좋아요 하트 이미지" src="../resources/n_img/pink.png" width="10px" height="10px"></td>
			<td>버튼</td>
		</tr>
		<c:forEach items="${list}" var="bag">
			<tr>
				<td>${bag.rank_no}</td>
				<td>${bag.movieTitle}</td>
				<td>${bag.movieGenre}</td>
				<td>${bag.movieReviews}</td>
				<td>${bag.movieHits}</td>
				<td>${bag.movieLike}</td>
				<td> <button style="background-color: transparent; border: none;"><img alt="좋아요 버튼" src="../resources/n_img/blackEmpty.png" width="20px" height="20px"></button> </td>
			</tr>
		</c:forEach>
	</table>
</div>
<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<button style="background: lime; color: red; width: 50px;" class="pages"><%= p %></button>
<%		
	}
%>
</body>
</html>