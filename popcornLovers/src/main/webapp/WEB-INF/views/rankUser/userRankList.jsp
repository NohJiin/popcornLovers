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
		<td><img alt="리뷰작성" src="../resources/n_img/pen.png" width="20px" height="17px"></td>
		<td><img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="20px" height="20px"></td>
		<td><img alt="좋아요 하트 이미지" src="../resources/n_img/heart.png" width="20px" height="20px"></td>
		<!-- <td>버튼</td> -->
	</tr>
	<c:forEach items="${list}" var="bag">
		<tr>
			<td>${bag.rank_no}</td>
			<td><a href="../mypage/mypageOne?member_id=${bag.member_id}&page=1">${bag.member_knickname}</a></td>
			<td><img alt="등급 이미지" src="../resources/profile_img/${bag.member_img}" width="20px" height="20px"> ${bag.member_level}</td>
			<td>리뷰 수</td>
			<td>${bag.member_view}</td>
			<td>${bag.member_fav}</td>
			<!-- <td><button class="btn" id="${bag.member_id}" style="background-color: transparent; border: none;" value="${bag.member_id}">
					<img class="btnImg" alt="좋아요 버튼 이미지" src="../resources/n_img/dislikeHeart.png" width="20px" height="20px">
				</button>
			</td> -->
		</tr>
	</c:forEach>
</table>