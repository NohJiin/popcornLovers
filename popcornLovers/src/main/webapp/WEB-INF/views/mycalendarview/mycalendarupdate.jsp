<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정등록</title>

</head>
<body>
	<form action="insert" method="get">
		<h3>일정 추가 하기</h3>
		연도 : <input id="year" name="year" value=""><br>
		월 : <input id="month" name="month" value=""><br>
		일 : <input id="day" name="day" value=""><br>
		영화 : <input id="movieId" name="movieId" value=""><br>
		<button id="insert">등록하기</button>
	</form>
</body>
</html>