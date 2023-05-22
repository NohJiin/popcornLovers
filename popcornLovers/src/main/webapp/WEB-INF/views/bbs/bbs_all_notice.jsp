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
				url : "bbsList2", //views/bbsList2.jsp가 결과!
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
	})
</script>
    <link rel="stylesheet" href="resources/css/css.css">

</head>
<body>
		<div class="board_wrap">
			<div class="board_title">
				<strong>공지사항</strong>
				<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
			</div>
			<div class="board_list_cnt">
				<p>전체 : <span class="board_list_cnt_highlight">${count}</span>개</p>
			<div>
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<c:forEach items="${list}" var="one">
						<div>
							<div class="num">${one.talk_no}</div>
							<div class="title"><a href="#">${one.talk_title}</a></div>
							<div class="writer">${one.user_id}</div>
							<div class="date">${one.talk_date}</div>
							<div class="count">${one.talk_hit}</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="board_page">
					<a href="#" class="bt first"><<</a> 
					<a href="#" class="bt prev"><</a>
					<%
					int pages = (int)request.getAttribute("pages");
					for (int p = 1; p <= pages; p++) {
					%>
					<a href="#" class="num"><%= p%></a>
					<%
						}
					%>
					<a href="#" class="bt next">></a>
					<a href="#" class="bt last">>></a>
				</div>
				<div class="bt_wrap">
					<a href="write.html" class="on">등록</a>
					<!--<a href="#">수정</a>-->
				</div>
			</div>
		</div>
</body>
</html>