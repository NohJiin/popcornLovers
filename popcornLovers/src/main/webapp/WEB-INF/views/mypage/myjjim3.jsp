<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<div id="myjjimResult">
						<c:forEach items="${jjimAllList}" var="my">
							<div class="movie_jjimbox">
								<div class="movie_jjim">
									<a href="../movie/movieDetails2?movieId=${my.movieId} }"> <img
										alt="movie 이미지" src="../resources/n_img/${my.movieImg}"
										width="150" height="180">
									</a>
									<div class="jjim_txt">${my.movieTitle}</div>
								</div><!-- movie_jjim -->
							</div><!-- movie_jjimbox -->
						</c:forEach>
					</div><!-- myjjimResult -->