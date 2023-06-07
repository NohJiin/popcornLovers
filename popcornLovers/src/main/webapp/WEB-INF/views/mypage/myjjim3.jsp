<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="slide-wrapper">
  <c:forEach items="${jjimAllList}" var="my">
    <div class="movie_jjimbox">
      <div class="movie_jjim">
        <img alt="movie 이미지" src="../resources/n_img/${my.movieImg}" width="150" height="180">
        <div class="jjim_txt">${my.movieTitle}</div>
        <div class="jjim_txt">⭐${my.movieGrade}</div>
      </div>
    </div>
  </c:forEach>
</div>