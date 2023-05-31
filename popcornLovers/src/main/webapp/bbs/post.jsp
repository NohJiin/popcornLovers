<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	$.ajax({
		url : "bbs_All", //views/bbsList2.jsp가 결과!
		data : {
			page : 1
		},
		success : function(result) { //결과가 담겨진 table부분코드
			$('#paging_result').html(result)
		},
		error : function() {
			alert('실패.@@@')
		}
	}) //ajax
})
</script>
<style>
td {
	background: white;
	height: 30px;
}

#paging_result {
	 padding- bottom: 10px;
	 background: #f7f7f7;
	 border-radius: 45px 45px 45px 45px;
}

body {
  margin: auto !important;
}

</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
	<div id="paging_result">
	</div>
</body>
</html>