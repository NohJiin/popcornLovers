<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="content.css">
</head>
<body>

		<c:forEach items="${list}" var="one">
						<div>
							<a href="${one.news_url}"><div class="news_cont"></a>
							<span><a href='${one.news_id}'></a></span>
							<img src="${one.news_img}" alt="이미지"/>
							<span>${one.news_headline}</span>
							<span>${one.news_content}</span>
							<span>${one.news_company}</span>
							<span>${one.news_date}</span>
							</div>
						</div>
		</c:forEach>	
</body>
</html>