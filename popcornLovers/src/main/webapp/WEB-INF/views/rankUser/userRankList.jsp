<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="rank">
	<tr>
		<td>Rank</td>
		<td>User Name</td>
		<td>User Level</td>
		<td>Reviews</td>
		<td><img alt="조회수 눈 이미지" src="resources/n_img/eye.png" width="10px" height="10px"></td>
		<td><img alt="좋아요 하트 이미지" src="resources/n_img/pink.png" width="10px" height="10px"></td>
		<td>버튼</td>
	</tr>
	<c:forEach items="${list}" var="bag">
		<tr>
			<td>${bag.rank_no}</td>
			<td><a href="lsh/one?member_id=${bag.member_id}">${bag.member_knickname}</a></td>
			<td><img alt="등급 이미지" src="resources/n_img/${bag.member_img}" width="20px" height="20px"> ${bag.member_level}</td>
			<td>리뷰 수</td>
			<td>${bag.member_view}</td>
			<td>${bag.member_fav}</td>
			<td><button class="btn" id="${bag.member_id}" style="background-color: transparent; border: none;" value="${bag.member_id}">
					<img class="btnImg" alt="좋아요 버튼 이미지" src="resources/n_img/dislikeHeart.png" width="20px" height="20px">
				</button>
			</td>
		</tr>
	</c:forEach>
</table>