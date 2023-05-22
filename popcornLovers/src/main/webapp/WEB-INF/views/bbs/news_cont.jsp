<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/content.css">
</head>
<body>
	<c:forEach items="${list}" var="one">
		<div class="news_cont">
			<a href="${one.news_url}"><img src="${one.news_img}" alt="이미지" /></a>
			<strong class="news_cont_title"><a href="${one.news_url}">${one.news_headline}</a></strong>
			<div class="news_cont_sub_info">
				<span>${one.news_date}</span>
				<span>${one.news_company}</span>
			</div>
			</div>
	</c:forEach>
</div>
</body>
</html>