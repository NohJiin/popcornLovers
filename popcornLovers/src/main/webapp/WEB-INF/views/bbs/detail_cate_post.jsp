<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="bbsCateNum" value="${info2[0].bbs_cate_num}" />
<c:set var="cate0" value="bbs_All" />
<c:set var="cate1" value="notice" />
<c:set var="cate2" value="free" />
<c:set var="cate3" value="movietalk" />
<c:set var="cate4" value="find" />
<c:set var="cate5" value="bungae" />
<html>
<head>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('.num').click(function() {
			//alert($(this).text())
			$.ajax({
				url : "bbs_all_List", //views/bbs_all_List.jsp가 결과!
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('.board_list').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //ajax
		})
		
			//대댓글 구현
					$(function() {
					$('.reply_btn').click(function() {
						//대댓글 리스트를 가지고 와서 아래에 넣어줌.
						if (${(Scope=member_id) ne null}) {
						let re_id = $(this).attr("value");
						//alert('test>> ' + $(this).attr("value"))
						$.ajax({
					        url: "reply_select",
					        data: {
					            b_comment_id: $(this).attr("value")
					        },
					        success : function(data){
					        //alert("#re_" + re_id)	
							$("#re_" + re_id).html(data);
					        },
					        error: function() {
								alert('실패.@@@')
					        }
					    });
						}
						else {
						alert('로그인을 하셔야 볼 수 있습니다')	
						}
					})
					})
					
			//댓글 작성하기
			$(function() {
			 $('.comment_insert_btn').click(function() {
				 var comment = $('.comment_input_box').val();
				$.ajax({
					url : "comment_insert", //views/bbs_all_List.jsp가 결과!
					data : {
						content : comment,
						bbs_no : ${list2[0].bbs_no}
					},
					success : function(result) { //결과가 담겨진 table부분코드
						$('.comment_select').html(result)
						$('#comment_input').val('');
						window.location.reload();
					},
					error : function() {
						alert('실패.@@@')
					}
				}) //ajax
			})
		})
	
	
		
			//게시물 삭제하기
			$(function() {
			  $('.bbs_delete_btn').click(function() {
			    if (confirm("정말 삭제 하시겠습니까?")) {
			      var bbs_no = ${list2[0].bbs_no}; // 삭제할 게시물 번호
			      $.ajax({
			        url: "bbs_delete",
			        data: {
			          bbs_no: bbs_no
			        },
			        success: function(result) {
			            if (result === "success") {
			              alert("게시물이 삭제되었습니다.");
			              // 이전 페이지로 리다이렉트
			              window.location.href = document.referrer;
			              setTimeout(function() {
			                window.location.reload();
			              }, 200);
			            } else {
			              alert("게시물 삭제에 실패했습니다.");
			            }
			          },
			          error: function() {
			            alert('실패.@@@');
			          }
			        });
			      }
			    });
			  });
	
			//댓글 삭제하기
			$(function() {
			  $('.comment_list_delete_a').click(function(event) {
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
			
			
			
			//찬하트 클릭시 수행
			$(function() {
						  $('#bbsfullheart').on('click', function() {
						    var $this = $(this);
						    $.ajax({
						      url: "bbs_like_check_cancel",
						      data: {
						    	  bbs_no: ${list2[0].bbs_no},
						          member_id: '${scope=member_id}'
						        //like_check : 0
						      },
						      success: function(result) {
						        if (result === "success") {
						          //alert("좋아요를 취소했습니다..");
						           //사진을 바꿔주는 코드
						           $this.attr('src', '../resources/img/bbs/bbsemptyheart.png');
						          location.reload();
						        } else {
						          alert("좋아요 취소를 실패했습니다.");
						        }
							   }
							});
						  });
			 })
			
						// 빈하트 클릭시 수행
						$(function() {
						  $('#bbsemptyheart').on('click', function() {
							if (${(Scope=member_id) ne null}) {
						    var $this = $(this);
						    $.ajax({
						      url: "bbs_like_check",
						      data: {
						    	  bbs_no: ${list2[0].bbs_no},
						          member_id: '${scope=member_id}'
						        //like_check : 0
						      },
						      success: function(result) {
						        if (result === "success") {
						         // alert("좋아요를 눌렀습니다.");
						          // 사진을 바꿔주는 코드
						          $this.attr('src', '../resources/img/bbs/bbsfullheart.png');
						          location.reload();
						        }
							      else {
							          alert("좋아요 누르기를 실패했습니다.");
							        };
						      },
						    })
							} else {
								alert('로그인을 하고 좋아요를 누르실 수 있습니다.')
							}
						   })
						   })
			
						// 로그인 안 한 상태에서 댓글 작성 클릭시 수행
							$(function () {
							  $('.comment_input_box').on('click', function() {
								  if (${(Scope=member_id) == null}) {
									  alert('로그인을 해주세요.')
									  $('.comment_content').hide();
								  }
							   })
							   })
</script>
<style>
td {
	background: white;
	height: 30px;
}

#paging_result {
	padding-bottom: 10px;
	background: #f7f7f7;
	border-radius: 45px 45px 45px 45px;
}
</style>

<link rel="stylesheet" href="../resources/css/bbscss2.css?s">
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>


	<div class="board_wrap">
		<div class="board_title">
			<strong>${info2[0].bbs_cate_name}</strong>
			<p>${info2[0].bbs_cate_info}</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">${list2[0].bbs_title}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${list2[0].bbs_row_no}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${list2[0].member_id}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${list2[0].bbs_date}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${list2[0].bbs_hit}</dd>
					</dl>
				</div>
				<%-- <div class="cont">${list2[0].bbs_content}</div> --%>
				<div class="cont">
					<pre style="white-space: pre-wrap;">${list2[0].bbs_content}</pre>
					<c:if test="${!empty list2[0].fileInfos}">
						<div class="mt-3">
							<ul>
								<c:forEach var="file" items="${list2[0].fileInfos}">
									<img src="${file.save_folder}/${file.save_file}"
										alt="${file.original_file}">
								</c:forEach>
							</ul>
						</div>
					</c:if>
				</div>
			</div>


			<div class="comment_headline">
				<c:choose>
					<c:when test="${yesno ==0}">
						<img id="bbsemptyheart" src="../resources/img/bbs/bbsemptyheart.png">
					</c:when>
					<c:when test="${yesno ==1}">
						<img id="bbsfullheart" src="../resources/img/bbs/bbsfullheart.png">
					</c:when>
				</c:choose>
				<p>좋아요</p>
				<span>${list2[0].bbs_like}개</span> <img
					src="../resources/img/bbs/comment.png">
				<p>댓글</p>
				<span>${count}개</span>
			</div>
			
			<c:if test="${list5[0].b_comment_empty ne null}"><strong class="none_comment">${list5[0].b_comment_empty}</strong></c:if>
	<c:if test="${list5[0].b_comment_empty == null}">
    <c:forEach items="${list5}" var="one">
    
        <div class="comment_list_box">
            <div class="comment_list_cont">
                <div class="comment_list">
                    <div class="comment_list_info">
                        <img src="../resources/img/bbs/${one.member_img}" style="width: 50px; height: 50px;">
                        <div class="comment_list_first_line">
                            <div class="comment_list_first_line_item1">
                                <span>${one.member_knickname}</span>
                                <a class="comment_list_date">${one.formattedB_comment_create}</a>
                                <c:if test="${(Scope=member_id) == one.b_comment_writer_id && one.b_comment_delete == null}">
                                    <a class="comment_list_delete_a" href="comment_delete?b_comment_id=${one.b_comment_id}">삭제</a>
                                </c:if>
                            </div>
                            <div class="comment_list_first_line_item2">
                                <input type="hidden" value="${one.b_comment_id}" id="comment_id">
                                <button class="reply_btn" value="${one.b_comment_id}">답글보기</button>
                            </div>
                        </div>
                    </div>
                    <div class="comment_list_content">
                        <c:if test="${one.b_comment_delete ne null}"><p>삭제된 댓글입니다.</p></c:if>
                        <c:if test="${one.b_comment_delete == null}"><p>${one.b_comment_content}</p></c:if>
                    </div>
                </div>
            </div>
        </div>

        <div class="reply_select" id="re_${one.b_comment_id}" >
         
        </div>

    </c:forEach>
</c:if>

<hr style="margin-top: 20px; border-bottom: 1px solid #999;">
			<div class="comment_box">
			<div class="comment_writer_profile">
			<c:if test="${(Scope=member_id) == null}">
			<span>로그인이 필요합니다.</span>
			</c:if>
			<c:if test="${(Scope=member_id) ne null}">
			<img src="../resources/img/bbs/${list3[0].member_img}">
				<span>${list3[0].member_knickname}</span>
				</c:if>
				</div>
				<div class="comment_content">
					<input type="text" class="comment_input_box"
						placeholder="댓글을 남겨주세요."> <span class="input_group_btn">
						<button class="comment_insert_btn">등록</button>
					</span>
				</div>
			</div>

			<div class="bt_wrap">
				<a href="post.jsp"><button class="bbs_list_btn">목록</button></a>
				<c:if test="${(Scope=member_id) == list2[0].member_id && (Scope=member_id) ne null}">
					<a href="modify/${list2[0].bbs_no}"><button class="bbs_update_btn">수정</button></a>
					<button class="bbs_delete_btn">삭제</button>				
				 </c:if>
			</div>
		</div>
	</div>
</html>
</body>
</html>