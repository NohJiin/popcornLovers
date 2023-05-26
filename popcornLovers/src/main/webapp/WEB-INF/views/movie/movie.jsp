<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    white-space: normal;  /* 영화 정보 텍스트가 넘어갈 경우 줄바꿈되도록 설정 */
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

    		        let movieDiv = $("<div class='boxoffice' id=" + movie.movieCd + "></div>"); // 박스오피스 순위를 감싸는 div 생성
    		        movieDiv.css("display", "inline-block"); // 가로로 배열되도록 설정
    		        
    		        movieDiv.append("<img src='" + poster + "'><br>" + movie.rank + ". " + movie.movieNm + "<br>" + "누적 관객: " 
    		            + movie.audiAcc + "명 " + "<br>" + "개봉연도: " + movie.openDt + "<br>" + "<br>");
    		        
    		        $("#boxoffice").append(movieDiv);
    		    }
    		});
    	});
    
    // 영화 제목 클릭시 다른 페이지로 이동하고 movieCd 전달
    $(document).on("click", ".boxoffice", function(){
        let movieCd = $(this).attr("id");
        let contextPath = "${pageContext.request.contextPath}";
        window.open(contextPath + "/movie/movieDetails?movieCd=" + movieCd, "_self");
    });
});
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../header.jsp" %>

  <div id="boxoffice" style="overflow: hidden; white-space: nowrap; position: relative;">
    <h2>박스 오피스 순위</h2>
     <div class="slider"></div>
  </div>

<div id="recommend">
    <h2>팝콘 추천 순위</h2>
</div>

</body>

</html>