<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
  <tr>
      <td>영화제목</td>
      <td>내용</td>
      <td>작성자</td>
   </tr>
   <c:forEach items="${jjimAllList}" var="my"> 
   <tr>
      <td>${my.movieTitle}</td> 
      <td>${my.movieImg}</td>
      <td>${my.movieGrade}</td>     
   </tr>
   </c:forEach>
</table>