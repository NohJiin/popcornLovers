<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(function() {
		$('.reply_plus').click(function() {
			alert($(this).text())
		$.ajax({
				url : "reply_select", //views/bbs_all_List.jsp가 결과!
				data : {
					b_comment_id : ${one.b_comment_id}
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('.reply_select').html(result)
				}/* ,
				error : function() {
					alert('실패.@@@')
				} */
			}) //ajax
		})
	})
			/* $(function() {
			 $('.comment_insert_btn').click(function() {
				 var comment = $('#comment_input').val();
				$.ajax({
					url : "comment_insert", //views/bbs_all_List.jsp가 결과!
					data : {
						content : comment,
						bbs_no : ${list2[0].bbs_no}
					},
					success : function(result) { //결과가 담겨진 table부분코드
						$('.comment_select').html(result)
						$('#comment_input').val('');
					},
					error : function() {
						alert('실패.@@@')
					}
				}) //ajax
			})
		}) */
</script>

<c:forEach items="${list}" var="one">
	<div class="comment_list_box">
		<div class="comment_list_cont">
			<div class="comment_list" style="border-bottom: 1px solid darkgray;">
				<div class="comment_list_info">
					<div class="comment_list_first_line">
						<div class="comment_list_first_line_item1">
							<span>${one.b_comment_writer_id}</span> <a
								class="comment_list_date">${one.b_comment_create}</a>
							 <c:if test="${session.getAttribute('id').equals(one.b_comment_writer_id)}">
                                <a class="comment_list_update_a">수정</a>
                                <a class="comment_list_delete_a">삭제</a>
                            </c:if>
						</div>
					</div>
					<div class="comment_list_first_line_item2">
						<button class="reply_btn">답글보기</button>
					</div>
				</div>
				<div class="comment_list_content">
					<p>${one.b_comment_content}</p>
				</div>
			</div>
		</div>
	</div>

	<div class="reply_select">
		<!--  <div class="reply_list_box">
                <div class="reply_list_cont">
                    <div class="reply_list" style="border-bottom:1px solid darkgray;">
                        <div class="reply_list_info"><p>글쓴이</p>
                        <div class="reply_list_first_line">
                        <a class="reply_list_date">2023-05-22 01:53:02</a>
                        <a class="reply_list_update_a">수정</a>
                        <a class="reply_list_delete_a">삭제</a> </div>
                        </div>
                        <div class="reply_list_content"> <p>피글렛 바보</p>
                        </div>
                    </div>
                </div>
            </div> -->
	</div>

</c:forEach>
