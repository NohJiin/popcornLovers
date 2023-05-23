<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<style>
.boxoffice {
    background-color: beige;
    width: 300px;
    padding: 20px 20px;
    margin: 20px 110px;
    border-radius: 30px;
    border-style: solid;
    border-width: 2px;
    display: inline-block;
    width: 230px;
    align-items: center;
    text-align: center;
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
    	    //let postersUrl = 'https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&title=' + movieNm + '&releaseDts=' + openDt + '&ServiceKey=KV1CZ288PZ05JB1CRNFW';
		 	let postersUrl = 'http://file.koreafilm.or.kr/thm/02/00/01/46/tn_DPK004440.JPG'
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

    	      $("#boxoffice").append("<div class='boxoffice' id=" + movie.movieCd + "><img src='" + poster + "'><br>" + movie.rank + ". " + movie.movieNm + "<br>" + "누적 관객: " + movie.audiAcc + "명</div>");
    	    }
    	  });
    	});

    // 영화 제목 클릭시 다른 페이지로 이동하고 movieCd 전달
    $(document).on("click", ".boxoffice", function(){
        let movieCd = $(this).attr("id");
        window.open("movie-details.jsp?movieCd=" + movieCd, "_self");
    });
});
</script>
</head>
<body>

<div id="boxoffice">
    <h2>박스 오피스 순위</h2>
</div>
</body>
</html>