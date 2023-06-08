<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
 <script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
      <script>
      /* 썸네일 이미지  */
        function thumbIMG(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('thumbnail').src = e.target.result; //파일 선택시 썸네일 이미지 보여주기
                };
                reader.readAsDataURL(input.files[0]);
            }else {
                document.getElementById('thumbnail').src = 'resources/profile_img/thumb.png'; // 기본 이미지 파일 경로로 변경
            }
        }
    </script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- 프로필 이미지 수정 -->
<div class="join-page">
 <div class="form">
  <form action="profileUp" id="form" method="post" enctype="multipart/form-data">
     <h2 class="join_maintxt">프로필 이미지</h2>
         <input type="file" name="file" onchange="thumbIMG(this);" width="210px" height="auto"><br>
        <img id="thumbnail" src="#" alt="Thumbnail" width="210px" height="auto">
        <br>
        <button type="submit" class="btn btn-secondary">등록하기</button>
    </form>
	</div><!-- form -->
</div>

<!-- 회원 정보 수정 -->
<div class="join-page update">
  <div class="form update">
    <form class="login-form" action="update" method="get">
    <h2 class="join_maintxt">회원 정보 수정</h2>
    <p class="login_txt_id">아이디</p>  <div id="id_result" >
</div>
      <input id="id" type="text"  value ="${bag.member_id}"  name= "member_id"  style="background-color:#dedede; color:#a8a8a8"  readonly/>
    
     <p class="login_txt"> 패스워드</p>
      <input id="pw"  value ="${bag.member_pw}" placeholder="password" name="member_pw" maxlength="20"/>
      
      <p class="login_txt"> 이름</p>
      <input id="name"   value ="${bag.member_name}" name="member_name"   style="background-color:#dedede; color:#a8a8a8"  readonly/>
      
          <p class="login_txt"> 닉네임</p>
      <input id="knickname"   value ="${bag.member_knickname}" name="member_knickname" maxlength="10"/>
   

                <p class="login_txt"> 나이</p>
      <input id="age"  value ="${bag.member_age}" name="member_age"   style="background-color:#dedede; color:#a8a8a8"  readonly/>
      
      
                    <p class="login_txt"> 전화번호</p>
      <input id="tel"   value ="${bag.member_tel}"  name="member_tel"/>
      
        <p class="login_txt"> 이메일</p>
      <input id="email"  value ="${bag.member_email}" name="member_email" type="email"  style="background-color:#dedede; color:#a8a8a8"  readonly/>
      
      <button id="mem_join" type ="submit">수정하기</button>
    </form>
  </div>
</div>



</body>
</html>