<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>팝콘 먹는 사람들</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="main">

</div>

<script type="text/javascript">
$(function() {
			$.ajax({
				url : "bbs/main", //views/bbs_all_List.jsp가 결과!
				success : function(main) { //결과가 담겨진 table부분코드
					$('.main').html(main)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		})
</script>


</body>
</html>