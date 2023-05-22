<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>


<c:forEach items="${list}" var="one">
	  <div class="reply_list_box">
                <div class="reply_list_cont">
                    <div class="reply_list" style="border-bottom:1px solid darkgray;">
                        <div class="reply_list_info"><p>${one.b_reply_writer_id}</p>
                        <div class="reply_list_first_line">
                        <a class="reply_list_date">${one.b_reply_create}</a>
                        <a class="reply_list_update_a">수정</a>
                        <a class="reply_list_delete_a">삭제</a> </div>
                        </div>
                        <div class="reply_list_content"> <p>${one.b_reply_content}</p>
                        </div>
                    </div>
                </div>
            </div>
</c:forEach>
