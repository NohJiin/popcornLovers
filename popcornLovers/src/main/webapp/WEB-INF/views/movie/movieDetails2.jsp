<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="com.java4.popcorn.movieInfo.MovieInfoDAO" %>
<%@ page import="com.java4.popcorn.movieInfo.MovieInfoVO" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>영화 상세 정보</title>
<script src="https://kit.fontawesome.com/a86e134bc2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<style>
	textarea {
	  width: 40%;
        height: 150px; /* 텍스트 에어리어의 높이 설정 */
        padding: 10px;
        box-sizing: border-box;
        border: solid 2px #FFF39C;
        border-radius: 5px;
        font-size: 16px;
        resize: none;
        /* margin-bottom: 10px; */ /* 불필요한 마진 제거 */
		}
</style>
<style>
	.review {
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
</style>
<style>
.rate {
  display: inline-block;
  direction: rtl;
   vertical-align: middle;
}

.rate input[type="radio"] {
  display: none;
}

.rate label {
  color: #ddd;
  float: right;
  font-size: 40px;
}

.rate label:before {
  content: '\2605';
  margin-left: 5px;
}

.rate input[type="radio"]:checked ~ label {
  color: #FFF39C;
  text-shadow: 0 0 5px black;
}
.jjim_heart{font-size:30px;}

#jjim{background:none;}

.btnOrange.btnPush {
 vertical-align: middle;
  width: 60px;
  padding: 0;
  margin: 10px 15px 10px 0;
  font-weight: 600;
  text-align: center;
  line-height: 30px;
  color: black;
  border-radius: 5px;
  transition: all 0.2s ;
}
.btnOrange {
  background: #FFF39C;
}

.btnOrange.btnPush {
  box-shadow: 0px 5px 0px 0px #A66615;
}

.btnPush:hover {
  margin-top: 5px;
  margin-bottom: 5px;
}

.btnOrange.btnPush:hover {
  box-shadow: 0px 0px 0px 0px #A66615;
}
</style>

<!--영화 찜 -->
<script type="text/javascript">
$(function() {
	console.log("${bag.movieId}")
	  var movieId = '${scope=bag.movieId}';
	  // 초기에 DB에서 찜 상태를 읽어와서 설정
	  $.ajax({
	    url: '../mypage/jjimCheck',
	    data: {
	      movieId: movieId
	    },
	    success: function(result) {
	      if (result === 1) {//db에 찜한 상태가 있다면 love를 class에 넣어준다
	        $('#jjim').removeClass('notlove').addClass('love');
	        $('#jjim i').removeClass('fa-regular').addClass('fa-solid');
	      } else {//db에 찜한 상태가 없다면 notlove를 class에 넣어준다
	        $('#jjim').removeClass('love').addClass('notlove');
	        $('#jjim i').removeClass('fa-solid').addClass('fa-regular');
	      }
	    }
	  });

	  $('#jjim').click(function() {
	    if (${(Scope=member_id) ne null}) {
	      if ($('#jjim').hasClass('notlove')) { // 찜 추가(빈 하트 클릭)
	        $.ajax({
	          url: '../mypage/addmoviejjim',
	          data: {
	            movieId: movieId,
	            member_id: '${scope=member_id}'
	          },
	          success: function(result) {
	            $('#jjim').removeClass('notlove').addClass('love');
	            $('#jjim i').removeClass('fa-regular').addClass('fa-solid');
	            alert("찜 완료");
	          }
	        });
	      } else { // 찜 삭제(꽉 찬 하트 클릭)
	        $.ajax({
	          url: '../mypage/removemoviejjim',
	          data: {
	            movieId: movieId,
	            member_id: '${scope=member_id}'
	          },
	          success: function(result) {
	            $('#jjim').removeClass('love').addClass('notlove');
	            $('#jjim i').removeClass('fa-solid').addClass('fa-regular');
	            alert("찜 삭제");
	          }
	        });
	      }
	    } else {
	      alert('로그인 후 찜하기를 사용할 수 있습니다.');
	    }
	  });
	})
</script>

<!-- 영화 평가  -->
<script type="text/javascript">
$(function() {
	  // 평가 버튼 클릭 이벤트 처리
	  $('#grade').click(function() {
	    var rating = $('input[name="rating"]:checked').val(); // 선택한 평점 값
	    var memberId = '${scope=member_id}'; // 로그인한 회원의 ID
	    var movieId = '${scope=bag.movieId}'; // 현재 영화의 ID

	    // 로그인 확인
	    if (memberId) {
	      // 평가 정보 전송
	      $.ajax({
	        url: '../movieInfo/submitRating',
	        method: 'POST',
	        data: {
	          rating: rating,
	          memberId: memberId,
	          movieId: movieId
	        },
	        success: function(response) {
	          // 평가 성공 시 처리
	          alert('평가가 등록되었습니다.');
	          location.reload(); // 페이지 새로고침
	        },
	        error: function() {
	          // 평가 실패 시 처리
	          alert('이미 등록한 영화 평가입니다.');
	        }
	      });
	    } else {
	      // 로그인되어 있지 않을 경우 처리
	      alert('평가를 등록하려면 로그인이 필요합니다.');
	    }
	  });
	});
</script>

<script type="text/javascript">
$(function() {
  $('#reviewIn').click(function() {
    var memberId = '${scope=member_id}'; // 로그인한 회원의 ID
    var movieId = '${scope=bag.movieId}'; // 현재 영화의 ID
    console.log("movieId");
    var review = $('#review').val(); // 작성한 리뷰 내용

    // 로그인 확인
    if (memberId) {
      // 리뷰 정보 전송
      $.ajax({
        url: '../movieReview/submitReview',
        method: 'GET',
        data: {
          memberId: memberId,
          movieId: movieId,
          review: review
        },
        success: function(response) {
          alert('리뷰가 등록되었습니다.');
          location.reload(); // 페이지 새로고침
        },
        error: function() {
          alert('이미 작성한 리뷰가 있습니다.');
        }
      });
    } else {
      alert('리뷰를 등록하려면 로그인이 필요합니다.');
    }
  });
});
</script>


<script>

var movieId = '${scope=bag.movieId}';
    $.ajax({
        url: "movieReview", 
        data: {
        	movieId: movieId
             },
        success: function(x) {
        	console.log(x);
        	console.log($("#reviewList"));
            $("#reviewList").append(x);
        },
        error: function() {
            alert("오류 발생");
        }
    });
</script>

</head>
<body>
<%@ include file="../header.jsp" %>

<h1>${bag.movieTitle}</h1>
<div id="movieDetails">
  <img alt="영화 이미지" src="${pageContext.request.contextPath}/resources/n_img/${bag.movieImg}" width="270" height="320">
  <div class="rate">
    <input type="radio" id="rating5" name="rating" value="5">
    <label for="rating5" title="5점"></label>
    <input type="radio" id="rating4" name="rating" value="4">
    <label for="rating4" title="4점"></label>
    <input type="radio" id="rating3" name="rating" value="3">
    <label for="rating3" title="3점"></label>
    <input type="radio" id="rating2" name="rating" value="2">
    <label for="rating2" title="2점"></label>
    <input type="radio" id="rating1" name="rating" value="1">
    <label for="rating1" title="1점"></label>
  </div>
  <button id = "grade" title="Button push orange" class="button btnPush btnOrange">평가</button>
  <button id='jjim' style='border :0; cursor:pointer'><i class='fa-sharp fa-regular fa-heart fa-heart jjim_heart' style='color: #ff3d3d;'></i></button>
  <hr style="border: solid 3px #FFF39C ">
  
  <p>감독: ${bag.movieDirector}</p>
  <p>주연 배우: ${bag.movieActor}</p>
  <p>개봉일: ${bag.movieOpen}</p>
  <p>장르: ${bag.movieGenre}</p>
  <p>줄거리: ${bag.movieStory}</p>
 
  <hr style="border: solid 3px #FFF39C ">
</div>

<div id="reviewList"></div>
<hr style="border: solid 3px #FFF39C ">
<div style="display: flex; align-items: flex-end;">
    <textarea id="review" style="font-size: 13px" placeholder="최대 500글자 입력 가능"></textarea>
    <button id="reviewIn" title="Button push orange" class="button btnPush btnOrange">등록</button>
</div>

</body>
</html>