<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<c:forEach items="${list}" var="one">
						<div>
							<div class="num">${one.bbs_no}</div>
							<div class="title"><a href="#">${one.bbs_title}</a></div>
							<div class="writer">${one.user_id}</div>
							<div class="date">${one.bbs_date}</div>
							<div class="count">${one.bbs_hit}</div>
						</div>
					</c:forEach>