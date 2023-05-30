<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="rank">
	<colgroup>
		<col width="5%">
		<col width="10%">
		<col width="5%">
		<col width="5%">
		<col width="5%">			<!-- <col width="2%"> -->
	</colgroup>
	<tr>
		<td>순위</td>
		<td>배우 이름</td>
		<td>영화 수</td>	<!-- 영화에 참여한 수 -->
		<td><img alt="조회수 눈 이미지" src="../resources/n_img/eye.png" width="10px" height="10px"></td>
		<td><img alt="좋아요 하트 이미지" src="../resources/n_img/pink.png" width="10px" height="10px"></td>
		<!-- <td>버튼</td> -->	<!-- 버튼 항목도 테이블의 컬럼으로 저장 -->
	</tr>
	<c:forEach items="${list}" var="bag">
		<tr>
			<td>${bag.rank_no}</td>
			<td>${bag.actorName}</td>
			<td>영화 수</td>
			<td>${bag.actorHits}</td>
			<td>${bag.actorLike}</td>
			<!-- <td> <button style="background-color: transparent; border: none;"><img alt="좋아요 버튼" src="../resources/n_img/blackEmpty.png" width="20px" height="20px"></button> </td> -->
		</tr>
	</c:forEach>
</table>