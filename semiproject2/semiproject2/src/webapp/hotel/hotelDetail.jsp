<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/Layout/top.jsp" %>
<link rel="stylesheet" href="../css/hotel.css">
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript"></script>
<script src="../js/script.js">

</script>

<style type="text/css">

img {
  height: 150px;
  width: 150px;
}

.slideshow-container {
  width: 100%;
  overflow: hidden;
}

.slide {
  float: left;
  width: 100%;
  transition: transform 0.5s ease;
}

.slide img {
  width: 100%;
}

</style>

<script>
const slides = document.querySelectorAll('.slide');
let currentSlide = 0;

function showSlide() {
  slides.forEach((slide, index) => {
    if (index === currentSlide) {
      slide.style.transform = 'translateX(0)';
    } else {
      slide.style.transform = 'translateX(-100%)';
    }
  });
}

function nextSlide() {
  currentSlide++;
  if (currentSlide === slides.length) {
    currentSlide = 0;
  }
  showSlide();
}

setInterval(nextSlide, 3000);
</script>

<jsp:useBean id="hotelService" class="com.hotel.model.hotelService" scope="session"></jsp:useBean>
<jsp:useBean id="hotelVO" class="com.hotel.model.hotelVO" scope="page"></jsp:useBean>
<jsp:setProperty property="hotelNo" name="hotelVO" />

<%
    int hotelNo = hotelVO.getHotelNo();
    hotelVO = hotelService.selectByhotelNo(hotelNo);
%>

<div class="hotel_detail">
    <div>
		<div class="slideshow-container">
			<div class="slide">
				<img src="image1.jpg" alt="Image 1">
			</div>
			<div class="slide">
				<img src="image2.jpg" alt="Image 2">
			</div>
			<div class="slide">
				<img src="image3.jpg" alt="Image 3">
			</div>
		</div>
		<h2>호텔 상세 정보</h2>
        
        <p>호텔 이름: <%= hotelVO.getHotelName() %></p>
        <p>주소: <%= hotelVO.getAddress() %></p>
        <p>등급: <%= hotelVO.getHotelGrade() %></p>
        <p>상세정보: <%= hotelVO.getHotelDetail() %></p>
        
        
        
        
        
        
        <p>주소: <%= hotelVO.getAddress() %></p>
        
    </div>
</div>


<%@include file="/Layout/bottom.jsp" %>