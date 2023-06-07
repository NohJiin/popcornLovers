<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<div id="myreviewResult">
					<div class="review_mainbox clearfix">
					<c:forEach items="${reviewAllList}" var="my">
							<div class="review_box">
								<p class="r_title">${my.movieTitle}</p>
								<div>
									<p class="r_content">${my.reviewContent}</p>
								</div>
								<p class="r_knick">${my.member_knickname}</p>
							</div><!-- review_box -->
						</c:forEach>
					</div><!-- review_mainbox -->
				</div><!-- myreviewResult -->