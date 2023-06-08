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
	padding: 20px;
}

.return {
	width: 200px;
	height: 60px;
	font-size: 30px;
	background-color: #fff9ab;
	border: none;
	text-align: center;
}

.title {
	font-size: 50px;
	text-align: center;
	border: none;
}

.movielist {
	display: flex;
    justify-content: center;
    align-items: center;
}

</style>
</head>
<body>
	<div class="movielist">
		<table>
			<tr class="title">
				<td colspan="3">영화 목록</td>
			</tr>
			<tr class="head">
				<th width="200">영화 ID</th>
				<th width="1000">영화 제목 </th>
			</tr>
			<c:forEach items="${list2}" var="vo">
				<tr>
					<td width="200">${vo.movieId}</td>
					<td  width="1000">${vo.movieTitle}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3"><button class="return" type="button"
						onclick="location='mycalendarcrud.jsp'">등록하기</button></td>
			</tr>
		</table>
	</div>
	<div>
		
	</div>
</body>
</html>