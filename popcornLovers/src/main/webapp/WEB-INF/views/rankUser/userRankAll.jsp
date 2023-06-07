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
			url : "../rankUser/userRankList", //views/userRankList.jsp가 결과!
			data : {
				page : $(this).text()
				/* id : $(this).attr('id') */
			},
			success : function(result) { //결과가 담겨진 table부분코드
				/* id에 해당하는 버튼의 색으 노란색으로 변경 하도록~ */
				$('#d1').html(result)
			},
			error : function() {
				alert('실패')
			}
		}) //ajax
	})
	
	let like = "../resources/n_img/likeHeart.png"
	let dislike = "../resources/n_img/dislikeHeart.png"
	$(document).on("click", ".btn", function() {
		const idText = $(this).attr('id')
		// const btnId = document.getElementById($(this).attr('id')).innnerHTML = "<img class='btnImg' alt='좋아요 버튼 이미지' src='../resources/n_img/dislikeHeart.png' width='20px' height='20px'>"
		let html = document.getElementById($(this).attr('id')).innnerHTML
		document.getElementById($(this).attr('id')).innnerHTML = "<img class='btnImg' alt='좋아요 버튼 이미지' src='../resources/n_img/likeHeart.png' width='20px' height='20px'>"
		// inText = btnId.innerText
		// btnId.innerHTML = "<img class='btnImg' alt='좋아요 버튼 이미지' src='../resources/n_img/dislikeHeart.png' width='20px' height='20px'>"
		// imgSrc = document.getElementById($(this).attr('id')).value
		alert("id : " + idText + " innerText 값 : " + html)
	
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

.pBtn {
	dispaly : inlin-block;
	text-align: center;
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
			<!-- <col width="2%"> -->
		</colgroup>
		<tr>
			<td>순위</td>
			<td>닉네임</td>
			<td>레벨</td>
			<td><img alt="게시글수" src="../resources/n_img/bbsCount.png" width="25px" height="20px"></td>	<!-- <img alt="게시글작성" src="../resources/n_img/pen.png" width="20px" height="17px"> -->
			<td><img alt="리뷰수" src="../resources/n_img/reviewCount.png" width="35px" height="22px"></td>	<!-- <img alt="리뷰작성수" src="../resources/n_img/eye.png" width="20px" height="20px"> -->
			<td><img alt="스코어" src="../resources/n_img/score.png" width="50px" height="20px"></td>
		</tr>
		<c:forEach items="${list}" var="bag">
			<tr>
				<td>${bag.rank_no}</td>
				<td><a href="../mypage/mypageOne?member_id=${bag.member_id}&page=1">${bag.member_knickname}</a></td>
				<td><img alt="등급 이미지" src="../resources/level_img/${bag.member_level}.png" width="28px" height="28spx"></td>
				<td>${bag.bbs_count}</td>
				<td>${bag.review_count}</td>
				<td>${bag.memberPopularity}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="pBtn">
	<%
		int pages = (int)request.getAttribute("pages");
		for(int p = 1; p <= pages; p++){
	%>
		<button style="background: #FFF4A6; color: black; width: 25px;" class="pages" id="<%= p %>"><%= p %></button>
	<%		
		}
	%>
</div>
</body>
</html>