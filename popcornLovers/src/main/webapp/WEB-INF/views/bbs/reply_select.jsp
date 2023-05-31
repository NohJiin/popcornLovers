<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
//대댓글 작성하기
				$(function() {
				 $('.reply_insert_btn').click(function() {
					 let re_id = ${list[0].b_comment_id}
					 var comment = $("#reply_" + re_id).val();
					$.ajax({
						url : "reply_insert", //views/bbs_all_List.jsp가 결과!
						data : {
							content : comment,
							b_comment_id : ${list[0].b_comment_id},
							bbs_no : ${list[0].bbs_no}
						},
						success : function(result) { //결과가 담겨진 table부분코드
							//alert('성공');
							$('.reply_select').html(result)
							$("#reply_" + re_id).val('');
							window.location.reload();
						},
						error : function() {
							//alert('실패.@@@')
						}
					}) //ajax
				})
				})
					
				//대댓글 삭제하기
				$(function() {
				  $('.reply_list_delete_a').click(function(event) {
					    event.preventDefault();
					    var deleteUrl = $(this).attr('href'); // 삭제 요청 URL 가져오기
				    if (confirm("정말 삭제 하시겠습니까?")) {
				      $.ajax({
				        url: deleteUrl,
				        success: function(result) {
				            if (result === "success") {
				              //alert("댓글이 삭제되었습니다.");
				              // 이전 페이지로 리다이렉트
				              window.location.reload();
				            } else {
				              //alert("댓글 삭제에 실패했습니다.");
				            }
				          },
				          error: function() {
				            //alert('실패.@@@');
				          }
				        });
				      }
				    });
				  });
					
					

</script>

<c:if test="${list[0].b_reply_content == null}">
 <div class="reply_box" style="border-top: 1px solid #999; padding-top: 10px;">
                <div class="replyt_writer_profile" style="padding-left: 10px; display: flex;">
                    <img src="../resources/img/bbs/${list4[0].member_img}" style="width: 50px; height: 50px;">
                    <span style="align-self: flex-end;">${list4[0].member_knickname}</span>
                </div>
                <div class="reply_content">
                       <input type="text" class="reply_input_box" id="reply_${list[0].b_comment_id}" placeholder="대댓글을 남겨주세요.">
                       <span class="input_group_btn">
                            <button class="reply_insert_btn" value="${list[0].b_comment_id}">${list[0].b_comment_id}등록</button>
                       </span>
                </div>
            </div>
</c:if>

<c:if test="${list[0].b_reply_content ne null}">
<c:forEach items="${list}" var="one2">
	  <div class="reply_list_box">
                <div class="reply_list_cont">
                    <div class="reply_list">
                        <div class="reply_list_info">
                        <img src="../resources/img/bbs/${one2.member_img}"
                        style="width: 50px; height: 50px;">
                        <div class="reply_list_first_line">
                        <div class="reply_list_first_line_item1" style="align-items: bottom;">
                        <span>${one2.member_knickname}</span>
                        <a class="reply_list_date">${one2.formattedB_reply_create}</a>
                        <c:if test="${(Scope=member_id) == one2.b_reply_writer_id && one2.b_reply_delete == null}">
                        <a class="reply_list_delete_a" href="reply_delete?b_reply_id=${one2.b_reply_id}">삭제</a>
                        </c:if>
                        </div>
                        </div>
                        </div>
                        <input class="reply_hidden" type="hidden" value="${one2.b_comment_id}">
                        <div class="reply_list_content">
                        <c:if test="${one2.b_reply_delete ne null}"><p>삭제된 댓글입니다.</p></c:if>
                        <c:if test="${one2.b_reply_delete == null}"><p>${one2.b_reply_content}</p></c:if>
                        </div>
                    </div>
                </div>
            </div>
  
     
</c:forEach>

            <div class="reply_box" style="border-top: 1px solid #999; padding-top: 10px;">
                <div class="replyt_writer_profile" style="padding-left: 10px; display: flex;">
                    <img src="../resources/img/bbs/${list4[0].member_img}" style="width: 50px; height: 50px;">
                    <span style="align-self: flex-end;">${list4[0].member_knickname}</span>
                </div>
                <div class="reply_content">
                       <input type="text" class="reply_input_box" id="reply_${list[0].b_comment_id}" placeholder="대댓글을 남겨주세요.">
                       <span class="input_group_btn">
                            <button class="reply_insert_btn" value="${list[0].b_comment_id}">등록</button>
                       </span>
                </div>
            </div>
</c:if>

