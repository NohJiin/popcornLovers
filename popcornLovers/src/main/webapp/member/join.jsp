<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">

$(function(){
	 
	<!-- 아이디 확인 --> 
	$('#id').blur(function() {
	    var memberId = $('#id').val();
	    var regex = /^[a-zA-Z0-9]+$/; // 영문과 숫자로만 이루어진 정규 표현식
	

	    if (!regex.test(memberId)) {
	        $('#id_result').text('영문과 숫자로만 입력해주세요.').css('color', 'red');
	        return;
	    }

	    $.ajax({
	        url: "idCheck",
	        data: {
	            "member_id": $('#id').val()
	        },
	        success: function(data) {
	            console.log('data', data)
	            if (data === 1) { // 아이디 사용 불가능
	                $('#id_result').text('중복된 아이디 입니다.').css('color', 'red');
	            } else {
	                $('#id_result').text('사용가능한 아이디입니다.').css('color', 'blue');
	            }
	        }
	    })
	}) //#id
	
	<!-- 닉네임 확인 --> 
	$('#knickname').blur(function() {
	    var memberId = $('#knickname').val();
	    var regex2 = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]+$/;

	    if (!regex2.test(memberId)) {
	        $('#knickname_result').text('한글과 영문,숫자로만 입력해주세요.').css('color', 'red');
	        return;
	    }

	    $.ajax({
	        url: "knicknameCheck",
	        data: {
	            "member_knickname": $('#knickname').val()
	        },
	        success: function(data) {
	            console.log('data', data)
	            if (data === 1) { // 아이디 사용 불가능
	                $('#knickname_result').text('중복된 닉네임 입니다.').css('color', 'red');
	            } else {
	                $('#knickname_result').text('사용가능한 닉네임입니다.').css('color', 'blue');
	            }
	        }
	    })
	}) //#id

	<!-- 회원가입 버튼 -->
	$('#mem_join').click(function() {
	    var memberId = $('#id').val();
	    var memberpw = $('#pw').val();
	    var membername = $('#name').val();
	    var memberknickname = $('#knickname').val();
	    var memberage = $('#age').val();
	    var membertel = $('#tel').val();
	    var memberemail = $('#email').val();

	    if (memberId === "" || memberpw === "" || membername === "" || memberknickname === "" || memberage === "" || membertel === "" || memberemail === "") {
	        alert("모든 정보를 입력해주세요.");
	        
	        // 가장 상단부터 빈 공란으로 이동
	        if (memberId === "") {
	            $('#id').focus();
	        } else if (memberpw === "") {
	            $('#pw').focus();
	        } else if (membername === "") {
	            $('#name').focus();
	        } else if (memberknickname === "") {
	            $('#knickname').focus();
	        } else if (memberage === "") {
	            $('#age').focus();
	        } else if (membertel === "") {
	            $('#tel').focus();
	        } else if (memberemail === "") {
	            $('#email').focus();
	        }
	        return false;
	    }

	    var regex = /^[a-zA-Z0-9]+$/; // 영문과 숫자로만 이루어진 정규 표현식
	    var regex2 = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]+$/;
	    
	    if (!regex.test(memberId)) {
	        alert("아이디는 영문과 숫자로만 입력해주세요.");
	        return false;
	    }

	    // 아이디 중복 체크 등 추가 검증 로직
	    if ($('#id_result').text() === '중복된 아이디 입니다.') {
	        alert("중복된 아이디 입니다. 다른 아이디를 입력해주세요.");
	        return false;
	    }
	    
	    if (!regex2.test(memberKnickname)) {
	        alert("닉네임은 한글과 영문,숫자로만 입력해주세요.");
	        return false;
	    }

	    // 아이디 중복 체크 등 추가 검증 로직
	    if ($('#knickname_result').text() === '중복된 닉네임 입니다.') {
	        alert("중복된 닉네임 입니다. 다른 아이디를 입력해주세요.");
	        return false;
	    }
	})//#mem_join

})//$


</script>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="join-page">
  <div class="form">
    <form class="login-form" action="join" method="get">
    <h2 class="join_maintxt">회원가입</h2>
    <p class="login_txt_id">아이디</p>  <div id="id_result" >
</div>
      <input id="id" type="text" placeholder="username"  name= "member_id"  maxlength="20"/>
    

     <p class="login_txt"> 패스워드</p>
      <input id="pw" type="password" placeholder="password" name="member_pw" maxlength="20"/>
      
      <p class="login_txt"> 이름</p>
      <input id="name"  placeholder="name" name="member_name" maxlength="10"/>
      
          <p class="login_txt_id"> 닉네임</p><div id="knickname_result" >
</div>
      <input id="knickname"  placeholder="knickname" name="member_knickname" maxlength="10"/>
      
       <p class="login_txt_id"> 성별</p>
       <div class="age_input_con">
       남<input class="age_input" type="radio" name = "member_gender" value ="male" checked>여 <input class="age_input" type="radio" name = "member_gender" value ="female" >
       </div>

      
      
                <p class="login_txt"> 나이</p>
      <input id="age"  placeholder="age" name="member_age"/>
      
      
                    <p class="login_txt"> 전화번호</p>
      <input id="tel"  placeholder="tel" name="member_tel" maxlength="20"/>
      
        <p class="login_txt"> 이메일</p>
      <input id="email"  placeholder="example@gmail.com" name="member_email" type="email"  maxlength="50"/>
      
      <button id="mem_join">회원가입</button>
    </form>
  </div>
</div>


</body>
</html>
