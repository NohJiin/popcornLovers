<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	</script>
	
	<style>
	.reply_btn:hover {
		cursor: pointer;
	}
	
	
	</style>
	<c:if test="${list2[0].b_comment_empty ne null}"><strong class="none_comment">${list2[0].b_comment_empty}</strong></c:if>
	<c:if test="${list2[0].b_comment_empty == null}">
    <c:forEach items="${list2}" var="one">
    
        <div class="comment_list_box">
            <div class="comment_list_cont">
                <div class="comment_list">
                    <div class="comment_list_info">
                        <img src="../resources/img/bbs/${one.member_img}" style="width: 50px; height: 50px;">
                        <div class="comment_list_first_line">
                            <div class="comment_list_first_line_item1">
                                <span>${one.member_knickname}</span>
                                <a class="comment_list_date">${one.formattedB_comment_create}</a>
                                <c:if test="${(Scope=member_id) == one.b_comment_writer_id}">
                                    <a class="comment_list_update_a">수정</a>
                                    <a class="comment_list_delete_a">삭제</a>
                                </c:if>
                            </div>
                            <div class="comment_list_first_line_item2">
                                <input type="hidden" value="${one.b_comment_id}" id="comment_id">
                                <button class="reply_btn" value="${one.b_comment_id}">답글보기</button>
                            </div>
                        </div>
                    </div>
                    <div class="comment_list_content">
                        <p>${one.b_comment_content}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="reply_select" id="re_${one.b_comment_id}" >
         
        </div>

    </c:forEach>
</c:if>

