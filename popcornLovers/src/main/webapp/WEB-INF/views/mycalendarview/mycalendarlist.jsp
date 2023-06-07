<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mycalendarlist" class="mycalendarlist">
		<table>
			<tr>
				<td colspan="2">일정 목록</td>
			</tr>
			<tr>
				<th width="100px">연도</th>
				<th width="70px">월</th>
				<th width="70px">일</th>
				<th width="350px">영화제목</th>
			</tr>
			<c:forEach items="${list1}" var="vo">
				<tr>
					<td>${vo.year}년</td>
					<td>${vo.month}월</td>
					<td>${vo.day}일</td>
					<td>${vo.movieTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>