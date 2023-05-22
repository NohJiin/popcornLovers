<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세정보</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
    let movieCd = "<%= request.getParameter("movieCd") %>";
    let movieInfoUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=" + movieCd;

    $.getJSON(movieInfoUrl, function(res){
        let movie = res.movieInfoResult.movieInfo;
        let actors = movie.actors;
        let director = movie.directors[0].peopleNm;
        let openDt = movie.openDt;

        let directorText = director ? "감독: " + director : "감독 정보 없음";
        let actorsText = "";
        if (actors && actors.length > 0) {
            for (let i = 0; i < Math.min(actors.length, 3); i++) {
                actorsText += actors[i].peopleNm;
                if (i < Math.min(actors.length, 3) - 1) {
                    actorsText += ", ";
                }
            }
        } else {
            actorsText = "주연 정보 없음";
        }

        let openDtText = openDt ? "개봉일: " + openDt : "개봉일 정보 없음";

        let movieDetail = "<hr>" +
            openDtText + "<br>" +
            directorText + "<br>" +
            "주연: " + actorsText + "<hr>";

        $("#movieDetail").html(movieDetail);
    });
});
</script>
</head>
<body>
<div id="movieDetail">
    <!-- 영화 정보가 여기에 동적으로 표시됨 -->
</div>
</body>
</html>