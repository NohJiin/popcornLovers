<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<style>
#main{
	width : 100%;
	height : 100%;
	margin : 0px auto;	/* 가운데 정렬 */
	margin-top: 10px;
}

.slider-container {
	width: 100%;
	overflow: hidden;
}

.slider {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slide {
	display: flex;
}

.boxoffice {
	background-color: #FFF39C;
	flex: 0 0 8.5%;
	padding: 15px;
	margin: 5px;
	border-radius: 30px;
	border-style: none;
	font-size: 15px;
	white-space: normal;
	text-align: center;
}

.recommend {
	background-color: #FFF39C;
	width: 300px;
	padding: 70px 70px;
	margin: 20px 110px;
	display: inline-block;
	width: 230px;
	align-items: center;
	text-align: center;
	font-size: 15px;
	white-space: normal;
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
        movieList = movieList.slice(0, 10); // 상위 10개만 표시

        let posterRequests = [];
        for (let i in movieList) {
            let movieNm = encodeURIComponent(movieList[i].movieNm);
            let openDt = movieList[i].openDt.replaceAll("-", "");
            let postersUrl = 'https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&title=' + movieNm + '&releaseDts=' + openDt + '&ServiceKey=KV1CZ288PZ05JB1CRNFW';
            console.log("Poster URL for movie", movieList[i].movieNm + ":", postersUrl);
            let posterRequest = $.getJSON(postersUrl);
            posterRequests.push(posterRequest);
        }
        

        // 모든 AJAX 요청이 완료된 후에 데이터 추가
        $.when.apply($, posterRequests).done(function() {
  		let slider = $(".slider");
  		let movieDivs = []; // 영화 정보를 담을 배열

  		for (let i = 0; i < arguments.length; i++) {
   		let posterData = arguments[i][0].Data[0].Result[0];
    	let posters = posterData.posters;
    	let movie = movieList[i];

    	let posterUrls = posters.split("|"); // 포스터 URL들을 구분자(|)를 기준으로 나눕니다.
    	let posterUrl = posterUrls[0]; // 첫 번째 포스터 URL을 선택합니다.

    	let movieDiv = $("<div class='boxoffice' id=" + movie.movieCd + "></div>");
    	movieDiv.append(movie.rank + "<br>" + "<img src='" + posterUrl + "'><br>" + "<br>" + movie.movieNm + "<br>" + "누적 관객: "
        + movie.audiAcc + "명 " + "<br>" + "개봉연도: " + movie.openDt + "<br>" + "<br>");

    	movieDivs.push(movieDiv);
  		}

            let sliderContainer = $(".slider-container");
            let slideCount = Math.ceil(movieDivs.length / 5); //슬라이드 개수 (5개씩 나누어 계산)
            let currentIndex = 0; // 현재 슬라이드 인덱스

            for (let i = 0; i < slideCount; i++) {
                let slideDiv = $("<div class='slide'></div>"); // 슬라이드를 담을 div 요소 생성

                // 각 슬라이드에 5개의 영화 정보 추가
                for (let j = 0; j < 5; j++) {
    			let movieIndex = (i * 5) + j;
   				if (movieIndex < movieDivs.length) {
       			let cloneMovieDiv = movieDivs[movieIndex].clone(); // 영화 정보를 복제하여 새로운 요소로 추가
        		slideDiv.append(cloneMovieDiv);
   				 }
			}

                slider.append(slideDiv.children()); // 슬라이더에 슬라이드 내용 추가
            }

            let sliderWidth = sliderContainer.width() * slideCount; // 슬라이더 전체 너비
            slider.css("width", sliderWidth + "px"); // 슬라이더의 너비 설정

            // 슬라이드 이동 함수
            function moveSlide(index) {
                let slidePosition = -sliderContainer.width() * index;
                slider.css("transform", "translateX(" + slidePosition + "px)");
            }

            // 자동 슬라이드 실행 함수
            function startSlide() {
                setInterval(function() {
                    currentIndex = (currentIndex + 1) % slideCount;
                    moveSlide(currentIndex);
                }, 5000); // 5초마다 슬라이드 이동
            }

            startSlide();
        });
    });

    $(document).on("click", ".boxoffice", function(){
        let movieCd = $(this).attr("id");
        let movieNm = $(this).data("name");
        let movieOpenDt = $(this).data("openDt");
        let contextPath = "${pageContext.request.contextPath}";
        let url = contextPath + "/movie/movieDetails?movieCd=" + movieCd + "&movieNm=" + encodeURIComponent(movieNm) + "&movieOpenDt=" + movieOpenDt;
        window.open(url, "_self");
    });

    //인기영화 표시
    $.ajax({
        url: "movieTop5",
        success: function(x) {
            $("#recommend").append(x);
        },
        error: function() {
            alert("오류발생");
        }
    });
});
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../header.jsp"%>

<div id="main">
	<div id="boxoffice">
	    <h2>박스 오피스 순위</h2>
	    <div class="slider-container">
	        <div class="slider"></div>
	    </div>
	</div>
	
	<div id="recommend">
	    <h2>팝콘 인기 영화</h2>
	</div>
</div>
</body>
</html>