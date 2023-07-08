<%@page import="oracle.net.aso.f"%>
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
<jsp:useBean id="facilitiesService" class = "com.facilities.model.facilitiesService" scope = "session"></jsp:useBean>
<jsp:useBean id="facilitiesVO" class = "com.facilities.model.facilitiesVO" scope = "page"></jsp:useBean>
<jsp:setProperty property= "hotelNo" name = "facilitiesVO" />

<%
    int hotelNo = hotelVO.getHotelNo();
    hotelVO = hotelService.selectByhotelNo(hotelNo);
    
    facilitiesVO = facilitiesService.selectByhotelNo(hotelNo);
%>

<div class="hotel_detail">
    <div>
		<div class="slideshow-container">
			<div class="slide">
				<img src="image1.jpg" alt="">
			</div>
			<div class="slide">
				<img src="image2.jpg" alt="">
			</div>
			<div class="slide">
				<img src="image3.jpg" alt="">
			</div>
		</div>
		<h2>호텔 상세 정보</h2>
        
        <p>호텔 이름: <%= hotelVO.getHotelName() %></p>
        <p>주소: <%= hotelVO.getAddress() %></p>
        <p>등급: <%= hotelVO.getHotelGrade() %></p>
        <p>상세정보: <%= hotelVO.getHotelDetail() %></p>

		<h2>부대시설</h2>
		<p>
			편의점:
			<%=(facilitiesVO.getConv_store() == 1) ? "yes" : "no"%></p>
		<p>
			세탁실:
			<%=(facilitiesVO.getLaundry_room() == 1) ? "yes" : "no"%></p>
		<p>
			동반 애완동물:
			<%=(facilitiesVO.getAccompany_pet() == 1) ? "yes" : "no"%></p>
		<p>
			주차장:
			<%=(facilitiesVO.getParking() == 1) ? "yes" : "no"%></p>
		<p>
			발렛 주차:
			<%=(facilitiesVO.getValet_parking() == 1) ? "yes" : "no"%></p>
		<p>
			조식 제공:
			<%=(facilitiesVO.getBreakfast() == 1) ? "yes" : "no"%></p>
		<p>
			수영장:
			<%=(facilitiesVO.getPool() == 1) ? "yes" : "no"%></p>
		<p>
			라운지 바:
			<%=(facilitiesVO.getLounge_bar() == 1) ? "yes" : "no" %></p>


		<p>주소: <%= hotelVO.getAddress() %></p>
        
    </div>
</div>


<%@include file="/Layout/bottom.jsp" %>