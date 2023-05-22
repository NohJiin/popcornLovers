<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <table>
   <tr>
      <td>번호</td>
      <td>아이디</td>
      <td>제목</td>
      <td>시간</td>
   </tr>
   <c:forEach items="${bbsAllList}" var="my">
   <tr>
      <td>${my.bbs_id}</td> 
      <td>${my.member_id}</td> 
      <td>${my.bbs_title}</td>
      <td>${my.bbs_create}</td>     
   </tr>
   </c:forEach>
</table>