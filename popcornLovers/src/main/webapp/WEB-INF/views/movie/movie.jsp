<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<style>
.boxoffice {
     background-color: #FFF39C;
    width: 300px;
    padding: 20px 20px;
    margin: 20px 10px; /* Reduce the horizontal margin */
    border-radius: 30px;
    border-style: none;
    display: inline-block;
    width: 230px;
     font-size: 15px; /* 폰트 크기 조정 */
     white-space: normal; /* 영화 정보가 넘어갈 경우 줄바꿈되도록 설정 */
}
#boxoffice {
    white-space: nowrap; /* 영화 순위가 한 줄에 나란히 표시되도록 합니다 */
}

.recommend {
    background-color: #FFF39C;
    width: 300px;
    padding: 20px 20px;
    margin: 20px 110px;
    border-radius: 30px;
    border-style: none;
   
    display: inline-block;
    width: 230px;
    align-items: center;
    text-align: center;
    font-size: 15px; /* 폰트 크기 조정 */
    white-space: normal; /* 영화 정보가 넘어갈 경우 줄바꿈되도록 설정 */
}
	
</style>
<meta charset="UTF-8">
<title>영화 보기</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
    let today = new Date();
    today.setDate(today.getDate() - 1);
    let str = today.getFullYear() + "-"
        + ("0" + (today.getMonth() + 1)).slice(-2) + "-"
        + ("0" + today.getDate()).slice(-2);
    $("#date").val(str);

    let d_str = str.replace(/-/g,"");

    let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+d_str;

    $.getJSON(url, function(data) {
    	  let movieList = data.boxOfficeResult.dailyBoxOfficeList;
    	  // 영화 순위로 데이터 정렬
    	  movieList.sort(function(a, b) {
    	    return parseInt(a.rank) - parseInt(b.rank);
    	  });
    	  movieList = movieList.slice(0, 5); // 상위 5개만 표시

    	  let posterRequests = [];
    	  for (let i in movieList) {
    	    let movieNm = encodeURIComponent(movieList[i].movieNm);
    	    let openDt = movieList[i].openDt.replaceAll("-", "");
    	    let postersUrl = 'https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&title=' + movieNm + '&releaseDts=' + openDt + '&ServiceKey=KV1CZ288PZ05JB1CRNFW';
		 	//let postersUrl = 'https://cors-anywhere.herokuapp.com/http://file.koreafilm.or.kr/thm/02/00/01/46/tn_DPK004440.JPG'
    	    let posterRequest = $.getJSON(postersUrl);
    	    posterRequests.push(posterRequest);
    	  }

    	  // 모든 AJAX 요청이 완료된 후에 데이터 추가
    	  $.when.apply($, posterRequests).done(function() {
    	    for (let i = 0; i < arguments.length; i++) {
    	      let posterData = arguments[i][0].Data[0].Result[0];
    	      let posters = posterData.posters;
    	      let movie = movieList[i];
    	      
    	      let poster = posters[0]; // 포스터 배열에서 첫 번째 이미지만 가져옴

    	      $("#boxoffice").append("<div class='boxoffice' id=" + movie.movieCd + "><img src='" + poster + "'><br>" + movie.rank + ". " + movie.movieNm + "<br>" + "누적 관객: " 
    	    		  + movie.audiAcc + "명 "+"<br>" + "개봉연도: "+ movie.openDt + "<br>" + "<br>" +"</div>");
    	    }
    	  });
    	});
    
    // 영화 제목 클릭시 다른 페이지로 이동하고 movieCd 전달
    $(document).on("click", ".boxoffice", function(){
        let movieCd = $(this).attr("id");
        let contextPath = "${pageContext.request.contextPath}";
        window.open(contextPath + "/movie-detail?movieCd=" + movieCd, "_self");
    });
});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
</head>
<body>
<body>
<div class="header">
		<div class="header_content">
			<div class="nav">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/Main.jsp"><img src="${pageContext.request.contextPath}/resources/img/logo5.png" alt="로고 이미지"></a>
				        </div>
                            <nav>
				                <ul class="header_menu"><!--
				                --><li class="li_menu"><a href="링크주소"><span class="main_menu">영화정보</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>영화 목록</span></a></li>
                        </ul>
					</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">커뮤니티</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="링크주소"><span>공지사항</span></a></li><!--
							--><li><a href="링크주소"><span>자유게시판</span></a></li><!--
							--><li><a href="링크주소"><span>영화수다</span></a></li><!--
							--><li><a href="링크주소"><span>찾아주세요</span></a></li><!--
							--><li><a href="링크주소"><span>번개</span></a></li>
						</ul>
						</div>
                    </li><!--
					--><li class="li_menu"><a href="rankUserMain.jsp"><span class="main_menu">랭킹</span></a><!--
					--><div class="menu_sub">
						<ul>
							<li><a href="rankUserMain.jsp"><span>유저랭킹</span></a></li> <!--
							--><li><a href="rankMovieMain.jsp"><span>영화랭킹</span></a></li><!--
							--><li><a href="rankActorMain.jsp"><span>배우랭킹</span></a></li><!--
							--></ul>
						</div>
					</li><!--
					--><li class="li_menu"><a href="링크주소"><span class="main_menu">영화관 찾기</span></a><!--
					--><div class="menu_sub">
						<ul>
                            <li><a href="링크주소"><span>영화 찾기</span></a></li><!--
							--><li><a href="링크주소"><span>극장 찾기</span></a></li><!--
							--><li><a href="링크주소"><span>알림</span></a></li>
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
					<form class="d-flex" role="search">
                    <img class="search-btn" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                    <input type="text" class="search-txt" alt="검색" name=""placeholder="검색어를 입력하세요.">
					</form>
				</div>
				<div class="login">
					<ul>
						<li><span>로그인</span></li><!--
						--><li><span>회원가입</span></li>
					</ul>
				</div>
			</div>
		</div>
    </div>

</body>
<div id="boxoffice">
    <h2>박스 오피스 순위</h2>
</div>
<div id="recommend">
    <h2>팝콘 추천 순위</h2>
</div>
</body>
</html>