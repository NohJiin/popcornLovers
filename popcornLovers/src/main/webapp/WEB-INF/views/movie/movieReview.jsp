<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
table {
    /* margin-left:auto;  */
    margin-right:auto;
   	horizontal : 70px;
}

td {
 	padding-left: 37px; /* 좌측 여백을 37px로 설정 */
    padding-right: 37px; /* 우측 여백을 37px로 설정 */  
}

tr {
	height: 5px;
	font-size : 13px;
}

</style>
</head>
<body>
<table>
	<tr>
		<td>${top1.movieTitle}</td>
		<td>${top2.movieTitle}</td>
		<td>${top3.movieTitle}</td>
	
	</tr>
	
	<tr>
		<td>${top1.movieOpen}</td>
		<td>${top2.movieOpen}</td>
		<td>${top3.movieOpen}</td>
	
	</tr>
	
	<tr> 
		<td>${top1.movieGenre}</td>
		<td>${top2.movieGenre}</td>
		<td>${top3.movieGenre}</td>
	</tr>
</table>
</body>
</html>