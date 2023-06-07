<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<td><img alt="등급 이미지" src="../resources/level_img/${bag.member_level}.png" width="28px" height="28px"></td>
			<td>${bag.bbs_count}</td>
			<td>${bag.review_count}</td>
			<td>${bag.memberPopularity}</td>
			<!-- <td><button class="btn" id="${bag.member_id}" style="background-color: transparent; border: none;" value="${bag.member_id}">
					<img class="btnImg" alt="좋아요 버튼 이미지" src="../resources/n_img/dislikeHeart.png" width="20px" height="20px">
				</button>
			</td> -->
		</tr>
	</c:forEach>
</table>