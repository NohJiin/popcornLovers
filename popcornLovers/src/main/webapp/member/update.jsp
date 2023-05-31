<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
<h3>회원정보 수정 화면</h3>

  <form action="profileUp" id="form" method="post" enctype="multipart/form-data">
        프로필 이미지 수정
         <input type="file" name="file" onchange="thumbIMG(this);" width="210px" height="auto"><br>
        <img id="thumbnail" src="#" alt="Thumbnail" width="210px" height="auto">
        <br>
        <button type="submit" class="btn btn-secondary">프로필 이미지 수정</button>
    </form>
<hr>

<form action="update" method="get">
아이디: <input name = "member_id" value ="${bag.member_id}" style="background-color:#ededed"  readonly ><br>
비밀번호: <input name = "member_pw" value ="${bag.member_pw}"><br>
이름:  <input name = "member_name" value ="${bag.member_name}" style="background-color:#ededed" readonly><br>
닉네임: <input name = "member_knickname" value ="${bag.member_knickname}" style="background-color:#ededed" readonly><br>
전화번호: <input name = "member_tel" value ="${bag.member_tel}"><br>
이메일: <input name = "member_email" value ="${bag.member_email}"><br>
<br>
<button type ="submit">회원정보 수정하기</button>
</form>


</body>
</html>