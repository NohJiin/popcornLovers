<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <table class="table table-hover">
 <thead>
   <tr>
      <th>번호</th>
      <th>제목</th>
      <th>시간</th>
      <th>작성자</th>
   </tr>
   </thead>
   <c:forEach items="${bbsAllList}" var="my"> 
      <tbody>
   <tr>
      <td>${my.bbs_id}</td> 
      <td><a href="../bbs/detail_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${my.bbs_title}</a></td>
      <td>${my.bbs_date}</td>     
      <td>${my.member_knickname}</td> 
   </tr>
   </tbody>
   </c:forEach>
</table>