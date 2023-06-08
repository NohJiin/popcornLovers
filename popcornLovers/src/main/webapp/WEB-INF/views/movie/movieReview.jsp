<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   <style type="text/css">
   	.r_content{height:88px; margin:10px 0; font-size:14px; line-height:22px;}
	.r_knick{float:right; font-size:14px; font-weight:600;}
	
	.review_box{width:250px; height:175px; 
	background:#e7e7e7; padding:20px 22px; 
	margin: 0 3px; border-radius:28px; 
	cursor:pointer; 
	transition: background-color 0.5s ease;
	float : left;
	
	}
	.review_box:hover{background:#fff7e3;}
	
	.clearfix{
  	content: "";
  	display: table;
  	clear: both;
	}
   </style>
    <title></title>
</head>
<body>
<div class = "clearfix">
    <c:forEach items="${list}" var="vo">
			<div class="review_box">
			<div>
			<p class="r_content">${vo.reviewContent}</p>
			</div>
			<p class="r_knick">${vo.memberId}</p>
			</div><!-- review_box -->
	</c:forEach>
</div>
</body>
</html>