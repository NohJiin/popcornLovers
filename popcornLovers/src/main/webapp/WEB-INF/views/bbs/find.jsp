<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="root" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	$('.num').click(function() {
		//alert($(this).text())
		$.ajax({
			url : "category_paging", //views/bbsList2.jsp가 결과!
			data : {
				page : $(this).text(),
				bbs_cate_num : 4
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

//로그인 안 되어 있을 경우 글작성 불가
	$(function() {
			$('.bt_wrap a').click(function(event) {
				if (${(Scope=member_id) == null}){ 
				event.preventDefault();
				alert('로그인 후 글작성이 가능합니다.');
				}
			})
		}) 
</script>
<style>
td {
	background: white;
	height: 30px;
}

#paging_result {
	 padding-bottom: 10px;
	 background: #f7f7f7;
	 border-radius: 45px 45px 45px 45px;
}

 
</style>
 <link rel="stylesheet" href="../resources/css/bbscss.css?k">
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp" %>
	
    <div id="paging_result">
    	<div class="board_wrap">
			<div class="board_title">
				<strong>${info2[0].bbs_cate_name}</strong>
				<p>${info2[0].bbs_cate_info}</p>
			</div>
			<div class="board_list_cnt">
				<p>전체 : <span class="board_list_cnt_highlight">${count2}</span>개</p>
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
					<c:forEach items="${list2}" var="one">
						<div class="bottom">
							<div class="num">${one.bbs_row_no}</div>
							<div class="title"><a href="detail_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${one.bbs_title}</a></div>
							<div class="writer">${one.member_id}</div>
							<div class="date">${one.formattedBbs_date}</div>
							<div class="count">${one.bbs_hit}</div>
						</div>
					</c:forEach>
				</div>
				<div class="bt_wrap" style="height: 40px;">
					<a href="${root}/bbs/write/${info2[0].bbs_cate_num}" class="on" style="background-color: orange; border: none;  float: right;">글쓰기</a>
					</div>
				<div class="board_page">
					<a href="#" class="bt first"><<</a> 
					<a href="#" class="bt prev"><</a>
					<%
					int pages = (int)request.getAttribute("pages2");
					for (int p = 1; p <= pages; p++) {
					%>
					<a href="#" class="num"><%= p%></a>
					<%
						}
					%>
					<a href="#" class="bt next">></a>
					<a href="#" class="bt last">>></a>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html></html>