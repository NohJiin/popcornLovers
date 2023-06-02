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

	    if (!regex.test(memberId)) {
	        alert("아이디는 영문과 숫자로만 입력해주세요.");
	        return false;
	    }

	    // 아이디 중복 체크 등 추가 검증 로직
	    if ($('#id_result').text() === '중복된 아이디 입니다.') {
	        alert("중복된 아이디 입니다. 다른 아이디를 입력해주세요.");
	        return false;
	    }
	})//#mem_join

})//$


</script>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<h3>회원가입 화면</h3>
<form action="join" method="get">
아이디: <input name = "member_id" id ="id"  maxlength="20">
<div id="id_result">
</div>
<br>
비밀번호: <input name = "member_pw" id="pw" value ="1234" type="password"><br>
이름:  <input name = "member_name" id="name" value ="김사과"><br>
닉네임: <input name = "member_knickname" id="knickname" value ="애플" ><br>
성별: 남<input type="radio" name = "member_gender" value ="남자" checked>
		  여<input type="radio" name = "member_gender" value ="여자" ><br>
나이: <input name = "member_age" id="age" value ="20" ><br>
전화번호: <input name = "member_tel" id ="tel" value ="01012341234" ><br>
이메일: <input name = "member_email"  id="email" type="email" placeholder="example@gmail.com"><br>

<br>
<button type ="submit" id="mem_join" >회원가입</button>
</form>



</body>
</html>
