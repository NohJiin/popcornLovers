<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" href="../resources/css/bbscontent.css?d">
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>

	
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

body {
  margin: auto !important;
}

.posts_sub_contents_box a{
	text-decoration: none;
	color: black;
}

.top_post_first_line a{
	text-decoration: none;
	color: gray;
}

.top_post_plus a:hover {
    cursor: pointer;
    color: black;
    font-weight: 800;
}

</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="slideShow"> 
		<iframe src="../banner.jsp" frameborder="0" width="100%"  height="300px" scrolling=auto name=banner ></iframe>
	</div>
	
	 <div class="main_content">
            
            <div class="post_first">
            <div class="top_post">
				<div class="posts_contents">
					<div class="posts_sub_contents">
					<div class="top_post_first_line"><span style="text-align: left;">인기 좋아요 게시글</span><span style="text-align: right;"></span></div>
					<hr style="margin-top: 10px; margin-bottom: 15px; width: 93%;">
					<div class="posts_sub_contents_box" style="padding-left: 10px; margin-right: 19px;">
					<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/first.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${likes[0].bbs_no}">${likes[0].bbs_title}</a></span></div>
					<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/second.png" style="width: 40px; height: 40px;"><span style="text-align: left;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis"><a href="detail_post?bbs_no=${likes[1].bbs_no}">${likes[1].bbs_title}</a></span></div>
					<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/third.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${likes[2].bbs_no}">${likes[2].bbs_title}</a></span></div>
					<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/forth.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${likes[3].bbs_no}">${likes[3].bbs_title}</a></span></div>
					<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/fifth.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${likes[4].bbs_no}">${likes[4].bbs_title}</a></span></div>
					</div>
					</div>
				</div>
            </div>
            <div class="top_review_post">
				<div class="posts_contents">
					<div class="posts_sub_contents">
						<div class="top_post_first_line"><span style="text-align: left;">인기 조회수 게시글</span><span style="text-align: right;"></span></div>
						<hr style="margin-top: 10px; margin-bottom: 15px; width: 93%;">
						<div class="posts_sub_contents_box" style="padding-left: 10px; margin-right: 19px;">
						<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/first.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${hits[0].bbs_no}">${hits[0].bbs_title}</a></span></div>
						<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/second.png" style="width: 40px; height: 40px;"><span style="text-align: left;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis"><a href="detail_post?bbs_no=${hits[1].bbs_no}">${hits[1].bbs_title}</a></span></div>
						<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/third.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${hits[2].bbs_no}">${hits[2].bbs_title}</a></span></div>
						<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/forth.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${hits[3].bbs_no}">${hits[3].bbs_title}</a></span></div>
						<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/fifth.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${hits[4].bbs_no}">${hits[4].bbs_title}</a></span></div>
						</div>
						</div>
                </div>
            </div>
            </div>

            <div class="post_second">
            <div class="all_post">
				<div class="posts_contents">
					<div class="posts_sub_contents">
					<div class="top_post_first_line"><span style="text-align: left;">최신 리뷰</span><span style="text-align: right;"></span></div>
						<hr style="margin-top: 10px; margin-bottom: 22px; width: 93%;">
						<div class="posts_sub_contents_box" style="padding-left: 15px; margin-right: 19px;">
						<div style="display: flex; align-items: center; margin-bottom: 10px;"><img src="../resources/img/bbs/review.png" style="width: 30px; height: 30px; margin-right: 5px;"><span><a href="#">' 된 김선호, 영화계 시선 쏠리는</a></span></div>
						<div style="display: flex; align-items: center; margin-bottom: 10px;"><img src="../resources/img/bbs/review.png" style="width: 30px; height: 30px; margin-right: 5px;"><span style="text-align: left;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis"><a href="#">[시네마Y] 박훈정의 '귀공자' 된 김선호, 영화계 시선 쏠리는 쏠리는</a></span></div>
						<div style="display: flex; align-items: center; margin-bottom: 10px;"><img src="../resources/img/bbs/review.png" style="width: 30px; height: 30px; margin-right: 5px;"><span><a href="#">[시네마Y] 박훈정의 '귀공자' 된 김선호, 영화계 시선 쏠리는</a></span></div>
						<div style="display: flex; align-items: center; margin-bottom: 10px;"><img src="../resources/img/bbs/review.png" style="width: 30px; height: 30px; margin-right: 5px;"><span><a href="#">[시네마Y] 박훈정의 '귀공자' 된 김선호, 영화계 시선 쏠리는</a></span></div>
						<div style="display: flex; align-items: center; margin-bottom: 10px;"><img src="../resources/img/bbs/review.png" style="width: 30px; height: 30px; margin-right: 5px;"><span><a href="#">[시네마Y] 박훈정의 '귀공자' 된 김선호, 영화계 시선 쏠리는</a></span></div>
						</div>
						</div>
                </div>
            </div>
            <div class="latest_post">
				<div class="posts_contents">
					<div class="posts_sub_contents">
						<div class="top_post_first_line"><span style="text-align: left;">최신 게시글</span><span class="top_post_plus" style="text-align: right;"><a href="post.jsp">+</a></span></div>
							<hr style="margin-top: 10px; margin-bottom: 16px; width: 93%;">
							<div class="posts_sub_contents_box" style="padding-left: 10px; margin-right: 19px;">
							<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/new.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${newest_bbs[0].bbs_no}">${newest_bbs[0].bbs_title}</a></span></div>
							<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/new.png" style="width: 40px; height: 40px;"><span style="text-align: left; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis;"><a href="detail_post?bbs_no=${newest_bbs[1].bbs_no}"">${newest_bbs[1].bbs_title}</a></span></div>
							<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/new.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${newest_bbs[2].bbs_no}"">${newest_bbs[2].bbs_title}</a></span></div>
							<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/new.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${newest_bbs[3].bbs_no}"">${newest_bbs[3].bbs_title}</a></span></div>
							<div style="display: flex; align-items: center;"><img src="../resources/img/bbs/new.png" style="width: 40px; height: 40px;"><span><a href="detail_post?bbs_no=${newest_bbs[4].bbs_no}"">${newest_bbs[4].bbs_title}</a></span></div>
							</div>
							</div>
                </div>
            </div>
            </div>
            
			<div class="news_list">
                <div class="news_contents">
					<div class="news_contents_title_more">
                    <p class="news_contents_title">일일 영화 소식/뉴스</p>
					<a class="news_contents_more" href ="getNewsAllList">+ 더보기</a>
					</div>
					<div class="news_cont_box">
					<div class="news_cont">
							<a href="${news[0].news_url}"><img src="${news[0].news_img}" alt="이미지"/></a>
							<strong class="news_cont_title"><a href="${news[0].news_url}">${news[0].news_headline}</a></strong>
							<div class="news_cont_sub_info">
							<span>${news[0].news_date}</span>
							<span>${news[0].news_company}</span>
							</div>
					</div>
					<div class="news_cont">
						<a href="${news[1].news_url}"><img src="${news[1].news_img}" alt="이미지"/></a>
						<strong  class="news_cont_title"><a href="${news[1].news_url}">${news[1].news_headline}</a></strong>
						<div class="news_cont_sub_info">
						<span>${news[1].news_date}</span>
						<span>${news[1].news_company}</span>
						</div>
					</div>
					<div class="news_cont">
						<a href="${news[2].news_url}"><img src="${news[2].news_img}" alt="이미지"/></a>
						<strong  class="news_cont_title"><a href="${news[2].news_url}">${news[2].news_headline}</a></strong>
						<div class="news_cont_sub_info">
						<span>${news[2].news_date}</span>
						<span>${news[2].news_company}</span>
						</div>
					</div>
					</div>
                </div>
            </div>
       </div>
	
</body>
</html>