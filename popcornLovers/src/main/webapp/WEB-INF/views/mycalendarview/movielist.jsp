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
<table>
	<tr>
		<th>영화 제목</th>
		<th>영화 ID</th>
	</tr>
	<c:forEach items="${list2}" var="vo">
		<tr>
			<td>${vo.movieTItle}</td>
			<td>${vo.movieId}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>