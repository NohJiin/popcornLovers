<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>팝콘 먹는 사람들</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>

</head>
<body>
	<div class="header">
		<div class="header_content">
			<div class="nav">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/Main.jsp"><img src="${pageContext.request.contextPath}/resources/img/logo5.png" alt="로고 이미지"></a>
				        </div>
                            <nav>
				                <ul class="header_menu"><!--
				                --><li class="li_menu"><a href="${pageContext.request.contextPath}/movie/movie"><span class="main_menu">영화정보</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath}/movie/movie"><span>영화 목록</span></a></li>
                        </ul>
					</div>
					</li><!--
					--><li class="li_menu"><a href="${pageContext.request.contextPath}/bbs/post"><span class="main_menu">커뮤니티</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath}/bbs/notice?bbs_cate_num=1&page=1"><span>명당자리</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/bbs/free?bbs_cate_num=2&page=1"><span>자유수다</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/bbs/movietalk?bbs_cate_num=3&page=1"><span>영화수다</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/bbs/find?bbs_cate_num=4&page=1"><span>찾아주세요</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/bbs/bungae?bbs_cate_num=5&page=1"><span>번개모임</span></a></li>
						</ul>
						</div>
                    </li><!--
					--><li class="li_menu"><a href="${pageContext.request.contextPath}/rank/rankUserMain.jsp"><span class="main_menu">랭킹</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath}/rank/rankUserMain.jsp"><span>유저랭킹</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/rank/rankMovieMain.jsp"><span>영화랭킹</span></a></li><!--
							--><%-- <li><a href="${pageContext.request.contextPath}/rank/rankActorMain.jsp"><span>배우랭킹</span></a></li> --%><!--
							--></ul>
						</div>
					</li><!--
					--><li class="li_menu"><a href="${pageContext.request.contextPath}/alarm/"><span class="main_menu">영화관찾기</span></a><!--
					--><div class="menu_sub">
						<ul>
                            <li><a href="${pageContext.request.contextPath}/alarm/movie/"><span>영화 찾기</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/alarm/theater/"><span>극장 찾기</span></a></li><!--
							--><li><a href="${pageContext.request.contextPath}/alarm/alarm/"><span>알림</span></a></li>
                        </ul>
						</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">캘린더</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>나의 영화일지</span></a></li><!--
							--><li><a href="링크주소"><span>나의 일지 관리</span></a></li><!--
							--><li><a href="링크주소"><span>개봉 예정작 정보</span></a></li>
                        </ul>
						</div>
					</li>
				</ul>
                </nav>
               <div class="search-box">
					<form class="d-flex" action="bbs/search" role="search" method="get">
					   <input name="page" value='1' type="hidden">
	                   <img class="search-btn" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색">
	                   
	                   <c:if test="${empty searchContent}">
	                   		<input type="text" class="search-txt" alt="검색" name="searchContent" placeholder="검색어를 입력하세요.">
	                   		</c:if>
	                   <c:if test="${!empty searchContent}">
	                   		<input type="text" class="search-txt" alt="검색" name="searchContent" value="${searchContent}">
	                   </c:if>
					</form>
				</div>
				<div class="login">
					<ul>
					 <% if(session.getAttribute("member_id") == null ) { %>
						<li><a href="${pageContext.request.contextPath}/member/login.jsp"><span>로그인</span></a></li><!--
						--><li><a href="${pageContext.request.contextPath}/member/join.jsp"><span>회원가입</span></a></li>
						<%} else { %>
						<li><a href="${pageContext.request.contextPath}/mypage/mypage?page=1"><span>${member_knickname}님</span></a></li><!--
						--><li><a href="${pageContext.request.contextPath}/member/logout"><span>로그아웃</span></a></li>
						 <%} %>
					</ul>
				</div>
			</div>
		</div>
    </div>

</body>
</html>