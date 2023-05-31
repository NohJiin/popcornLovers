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
						<div class="bottom">
							<div class="num">${one.bbs_row_no}</div>
							<div class="title"><a href="detail_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${one.bbs_title}</a></div>
							<div class="writer">${one.member_id}</div>
							<div class="date">${one.formattedBbs_date}</div>
							<div class="count">${one.bbs_hit}</div>
						</div>
					</c:forEach>