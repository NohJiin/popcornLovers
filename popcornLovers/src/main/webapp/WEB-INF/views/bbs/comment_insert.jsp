<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list2}" var="one">

<div class="comment_list_box">
                <div class="comment_list_cont">
                    <div class="comment_list" style="border-bottom:1px solid darkgray;">
                        <div class="comment_list_info">
                        <div class="comment_list_first_line">
                        <div class="comment_list_first_line_item1">
                        <span>${one.b_comment_writer_id}</span>
                        <a class="comment_list_date">${one.formattedB_comment_create}</a>
                        <% String sessionId = (String) session.getAttribute("member_id");
                        String commentWriterId = (String) request.getAttribute("list.b_comment_writer_id");
                        if (sessionId != null && sessionId.equals(commentWriterId)) { %>
                        <a class="comment_list_update_a">수정</a>
                        <a class="comment_list_delete_a">삭제</a> <%} %>
                        </div>
                        </div>
                        <div class="comment_list_first_line_item2">
                        <button class="reply_btn">답글보기</button>
                        </div>
                        </div>
                        <div class="comment_list_content"> <p>${one.b_comment_content}</p>
                        </div>
                    </div>
                </div>
            </div>
</c:forEach>