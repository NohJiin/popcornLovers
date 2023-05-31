<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="bbsCateNum" value="${bbsCateNum}" />
<c:set var="cate0" value="notice"/>
<c:set var="cate1" value="notice"/>
<c:set var="cate2" value="free"/>
<c:set var="cate3" value="movietalk"/>
<c:set var="cate4" value="find"/>
<c:set var="cate5" value="bungae"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<head>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
</head>

<style>

.nav {
	flex-wrap: nowrap;
}

.row.justify-content-center {
	margin-top: 40px;
}

.search-btn {
	width: 25px;
	height: 25px;
}
  
</style>
<body>
    
  <%@ include file="/WEB-INF/views/header.jsp" %>
    
	<div class="row justify-content-center">
        <div class="col-lg-12 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            글쓰기
          </h2>
        </div>
        <div class="col-lg-12 col-md-10 col-sm-12">
          <form id="form-register" method="POST" enctype="multipart/form-data" action="">
	        <div class="mb-3">
				<select id="category" name="bbs_cate_num" style="width: 40%; height: 30px;">
					  <option value="0" disabled selected hidden>게시판을 선택해 주세요.</option>
					  <option value="2">자유게시판</option>
					  <option value="3">영화수다</option>
					  <option value="4">찾아주세요</option>
					  <option value="5">번개모임</option>
				</select>
			</div>
			<c:choose>
					  <c:when test="${bbsCateNum == 1}">
					    <c:set var="category" value="${cate1}" />
					  </c:when>
					  <c:when test="${bbsCateNum == 2}">
					    <c:set var="category" value="${cate2}" />
					  </c:when>
					  <c:when test="${bbsCateNum == 3}">
					    <c:set var="category" value="${cate3}" />
					  </c:when>
					  <c:when test="${bbsCateNum == 4}">
					    <c:set var="category" value="${cate4}" />
					  </c:when>
					  <c:when test="${bbsCateNum == 5}">
					    <c:set var="category" value="${cate5}" />
					  </c:when>
					  <c:otherwise>
					    <c:set var="category" value="default" />
					  </c:otherwise>
			</c:choose>
			<input type="hidden" name="cur_cate_name" value="${category}">
			<input type="hidden" name="cur_cate_num" value="${bbsCateNum}">
            <input type="hidden" name="pgno" value="1">
		    <input type="hidden" name="key" value="">
		    <input type="hidden" name="word" value="">
            <div class="mb-3">
              <label for="subject" class="form-label">제목 : </label>
              <input
                type="text"
                class="form-control"
                id="subject"
                name="bbs_title"
                placeholder="제목..."
              />
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">내용 : </label>
              <textarea class="form-control" id="content" name="bbs_content" rows="7"></textarea>
            </div>
            <div class="form-group" align="left">
							<label for="upfile">파일:</label>
							<input type="file" class="form-control border" name="upfile" multiple="multiple">
						</div>
            <div class="col-auto text-center mt-3">
              <button type="button" id="btn-register" class="btn btn-warning mb-3">
                글작성
              </button>
              <button type="button" id="btn-list" class="btn btn-light mb-3">
                목록
              </button>
            </div>
          </form>
        </div>
      </div>
    <form id="form-param" method="get" action="">
      <input type="hidden" id="pgno" name="pgno" value="${pgno}">
      <input type="hidden" id="key" name="key" value="${key}">
      <input type="hidden" id="word" name="word" value="${word}">
    </form>
    <script>
      document.querySelector("#btn-register").addEventListener("click", function () {
        if (!document.querySelector("#subject").value) {
          alert("제목 입력!!");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-register");
          form.setAttribute("action", "${root}/bbs/write");
          form.submit();
        }
      });
      
      document.querySelector("#btn-list").addEventListener("click", function () {
    	var category;
    	if(${bbsCateNum} == 0){
    		category ="post.jsp";
    	}
    	else if(${bbsCateNum} == 1) {
    		category = "notice?bbs_cate_num=${bbsCateNum}&page=1";
    	} else if(${bbsCateNum} == 2){
    		category = "free?bbs_cate_num=${bbsCateNum}&page=1";
    	} else if(${bbsCateNum} == 3){
    		category = "movietalk?bbs_cate_num=${bbsCateNum}&page=1";
    	} else if(${bbsCateNum} == 4){
    		category = "find?bbs_cate_num=${bbsCateNum}&page=1";
    	} else if(${bbsCateNum} == 5){
    		category = "bungae?bbs_cate_num=${bbsCateNum}&page=1";
    	} 
    	if(confirm("취소를 하시면 작성한 글은 삭제됩니다.\n취소하시겠습니까?")) {
    		location.href = "${root}/bbs/" + category;
   	    }
      });
    </script>
</body>
</html>
