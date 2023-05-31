<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>팝콘 먹는 사람들</title>

<link rel="stylesheet" href="../resources/css/news.css?d">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

	
	<div class="news_page">
	<div class="news_page_title">
	<p>일일 영화 뉴스</p>
	</div>
	<c:forEach items="${list}" var="list">
	 <div class="pop_news_cont">
		<div class="pop_news_cont_left">
		<a href="${list.news_url}"><img src="${list.news_img}" alt="이미지"/></a>
		</div>
		<div class="pop_news_cont_right">
		<strong  class="pop_news_cont_title"><a href="${list.news_url}">${list.news_headline}</a></strong>
		<div class="pop_news_cont_content">${list.news_content}</div>
		<div class="pop_news_cont_sub_info">
		<span>${list.news_date}</span>
		<span>${list.news_company}</span>
		</div>
		</div>
		</div>
		</c:forEach>
	</div>	
</body>
</html>