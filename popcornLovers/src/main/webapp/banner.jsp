<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		     <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		     <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
		  </div>
		  <div class="carousel-inner banner">
		    <div class="carousel-item active">
		      <img src="./resources/image/banner1.png" class="d-block w-100" alt="영화포스터1" height="300px">
		    </div>
		    <div class="carousel-item">
		      <img src="./resources/image/banner2.jpg" class="d-block w-100" alt="영화포스터2"  height="300px">
		    </div>
		    <div class="carousel-item">
		      <img src="./resources/image/banner3.jpg" class="d-block w-100" alt="영화포스터3"  height="300px">
		    </div>
		    <div class="carousel-item">
		      <img src="./resources/image/banner4.jpg" class="d-block w-100" alt="영화포스터4" height="300px">
		    </div>
		    <div class="carousel-item">
		      <img src="./resources/image/banner5.png" class="d-block w-100" alt="영화포스터5"  height="300px" style="object-fit: cover;" >
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
</body>
</html>