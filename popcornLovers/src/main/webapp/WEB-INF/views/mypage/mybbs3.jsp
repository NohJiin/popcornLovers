<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table_box">
					<tbody>
							<tr class="table_main">
								<td class="t_no">번호</td>
								<td class="t_title">제목</td>
								<td class="t_time">시간</td>
								<td class="t_write">작성자</td>
							</tr><!-- table_main -->
					</tbody>	
					
						<c:forEach items="${bbsAllList}" var="my">
							<tbody>
								<tr>
									<td class="t_no">${my.bbs_id}</td>
									<td class="t_title"><a
										href="../bbs/detail_post?bbs_no=${one.bbs_no}&bbs_cate_num=${one.bbs_cate_num}">${my.bbs_title}</a></td>
									<td class="t_titme">${my.bbs_date}</td>
									<td class="t_write">${my.member_knickname}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>