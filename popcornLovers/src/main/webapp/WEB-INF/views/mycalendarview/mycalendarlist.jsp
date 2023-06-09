<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.head, list {
	font-size: 30px;
	text-align: center;
	border: 1px solid #444444;
}

tr,th,td {
	font-size: 30px;
	text-align: center;
	border: 1px solid #fff9ab;
}

.return {
	width: 200px;
	height: 60px;
	font-size: 30px;
	background-color: #fff9ab;
	border: none;
}

.title {
	font-size: 50px;
	text-align: center;
	border: 1px solid #444444;
}

.mycalendarlist {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 700px; /* 화면의 세로 중앙에 배치하기 위해 필요한 높이값을 조정합니다. */
  }

</style>
</head>
<body>
	<div class="mycalendarlist">
		<table>
			<tr class="title">
				<td colspan="4">일정 목록</td>
			</tr>
			<tr class="head">
				<th width="200px">연도</th>
				<th width="100px">월</th>
				<th width="100px">일</th>
				<th width="600px">영화제목</th>
			</tr>
			<c:forEach items="${list1}" var="vo">
				<tr class="list">
					<td>${vo.year}년</td>
					<td>${vo.month}월</td>
					<td>${vo.day}일</td>
					<td>${vo.movieTitle}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><button class="return" type="button"
						onclick="location='mycalendarmain.jsp'">돌아가기</button></td>
			</tr>
		</table>
	</div>
</body>
</html>