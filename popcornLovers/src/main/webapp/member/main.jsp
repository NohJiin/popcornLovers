<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 메인</title>
</head>
<body>

로그인 됐음!!!! ${member_id } 아이디로 로그인
<h3>임의 메인</h3>

<!-- mypage로 이동 -->
<a href="../mypage/mypage?page=1">
	<button>mypage</button>
</a>

<!-- mypage로 이동 -->
<a href="../mypage/mypage?page=1">
	<button>logout</button>
</a>
</body>
</html>