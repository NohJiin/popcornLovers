<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
   <tr>
      <td>영화제목</td>
      <td>내용</td>
      <td>작성자</td>
   </tr>
   <c:forEach items="${reviewAllList}" var="my"> 
   <tr>
      <td>${my.movieTitle}</td> 
      <td>${my.reviewContent}</td>
      <td>${my.member_knickname}</td>     
   </tr>
   </c:forEach>
</table>