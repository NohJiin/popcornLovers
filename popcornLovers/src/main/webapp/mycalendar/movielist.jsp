<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
th, tr, td {
	border: 5px solid #fbff8c;
	width: 100px;
	height: 60px;
	text-align: center;
	font-size: 30px;
}
.movieid {
	width : 400px;
	height : 70px;
}
.movietitle {
	width : 1000px;
	height : 70px;
}
.headbutton {
	width : 100px;
	height : 30px;
	font-size : 20px;
}
.head {
	height : 80px;
	text-align: center;
	font-size : 50px;
}
</style>
</head>
<body>
	<%@ include file="../WEB-INF/views/header.jsp"%>
	<div>
		<table>
			<tr class="head">
				<td colspan="2">영화 목록 조회 <button type="button" class="headbutton" onclick="location='mycalendarcrud.jsp'">등록하기</button></td>
			</tr>
			<tr>
				<th class="movieid">영화 아이디</th>
				<th class="movietitle">영화 제목</th>
			</tr>
			<c:forEach items="${list2}" var="vo">
				<tr>
					<td>${vo.movieId}</td>
					<td>${vo.movieTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>