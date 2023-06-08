<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.listhead{
	padding-top: 50px;
	padding-bottom: 50px;
}

.listhead table {
    margin-left:auto; 
    margin-right:auto;
    
}

.listhead tr, .listhead td {
	border: none;
	border-collapse: collapse;
	padding: 10px;
	font-size: 20px;
	height: 40px;
	background-color: #fdffbf;
}


.title {
	width: 500px;
	height: 200px;
	text-align: center;
	font-size: 40px;
}

.space {
	width: 200px;
	height: 200px;
	text-align: center;
}

.listhead button {
	width: 180px;
	height: 40px;
	font-size: 20px;
	border: 2px solid #white;
	background-color: #fdffbf;
}



</style>
</head>
<body>
	<%@ include file="../WEB-INF/views/header.jsp"%>
	<div class="listhead">
		<form action="movielist" method="post">
		<table>
			<tr class="head">
				<td class="title">영화 ID와 영화 제목을 조회합니다.</td>
				<td class="space"><button name ="joinlist" type="submit" id="joinlist" class="joinlist">조회하기</button></td>
			</tr>
			
		</table>
		</form>
	</div>
	 <div id="slideShow">
		<iframe src="${pageContext.request.contextPath}/banner.jsp" frameborder="0" width="100%"  height="300px" scrolling=auto name=banner ></iframe>
	</div>
	
</body>
</html>