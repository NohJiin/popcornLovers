<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <table style="font-size: 12px;">
        <c:forEach items="${list}" var="vo">
            <tr>
                <td>${vo.memberId}</td>
                <td>${vo.reviewContent}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>