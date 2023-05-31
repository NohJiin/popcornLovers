<%--
  Created by IntelliJ IDEA.
  User: 정민기
  Date: 2023-05-27
  Time: 오전 5:11
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/css4jmk.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>

    <!-- jquery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>

<%--    <script>--%>
<%--        $.ajax({--%>
<%--            url: "${pageContext.request.contextPath}/alarm/navbar/",--%>
<%--            type: "GET",--%>
<%--            success: function (data) {--%>
<%--                $('#navbar-container').html(data);--%>
<%--            },--%>
<%--            error: function (e) {--%>
<%--                console.log("error while getting navbar")--%>
<%--                console.log(e);--%>
<%--            }--%>
<%--        });--%>
<%--    </script>--%>
</head>

<body>
<%--<div id="navbar-container">--%>
<%--    error while loading navbar--%>
<%--</div>--%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<br>
db정보를불러오는데실패햇데요..ㅠㅠ
<br>
에러 메시지 :<br>
${eMessage}

</body>
</html>
