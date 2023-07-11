<%@page import="oracle.net.aso.f"%>
<%@ page import="com.review.model.reviewVO" %>
<%@page import="java.util.List"%>
<%@page import="com.hotel.model.hotelVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.facilities.model.facilitiesVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/Layout/top.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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

.hotel_Detail{
	border: solid 2px black;
}

.subImage{
	width: 420px;
	height: 300px;
	left: 300px;
}

.container text-center{
	border: solid 2px black;
}

.icon {
	width: 20px;
	height: 20px;
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

<script>


</script>

<jsp:useBean id="hotelService" class="com.hotel.model.hotelService" scope="session"></jsp:useBean>
<jsp:useBean id="hotelVO" class="com.hotel.model.hotelVO" scope="page"></jsp:useBean>
<jsp:setProperty property="hotelNo" name="hotelVO" />
<jsp:useBean id="facilitiesService" class="com.facilities.model.facilitiesService" scope="session"></jsp:useBean>
<jsp:useBean id="facilitiesVO" class="com.facilities.model.facilitiesVO" scope="page"></jsp:useBean>
<jsp:setProperty property="hotelNo" name="facilitiesVO" />
<jsp:useBean id="reviewService" class="com.review.model.reviewService" scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.review.model.reviewVO" scope="page"></jsp:useBean>

<%
  String hotelNo = request.getParameter("no");
  String keyword = request.getParameter("keyword");
  String condition = request.getParameter("condition");
  hotelVO = hotelService.selectByhotelNo(Integer.parseInt(hotelNo));
  facilitiesVO = facilitiesService.selectByhotelNo(Integer.parseInt(hotelNo));
  double latitude = hotelVO.getLatitude();
  double longitude = hotelVO.getLongitude();
  List<reviewVO> reviewList = reviewService.selectByhotelNo(keyword, condition);
%>

<div class="hotel_detail">
    <div>
		<div class="container text-center">
		  <div class="row">
		    <div class="col-sm-8" >
		    	<img src="<%=request.getContextPath()%>/images/<%=hotelVO.getImage()%>" style="width: 800px; height: 300px; margin-right: 100px;">
		    </div>
		    <div class="col-sm-4">
		    	<img src="<%=request.getContextPath()%>/images/sub1_<%=hotelVO.getImage()%>" style="width: 420px; height: 300px;">
		    </div>
		  </div>
		  <div class="row">
		    <div class="col-sm">
				<img src="<%=request.getContextPath()%>/images/sub2_<%=hotelVO.getImage()%>" class="subImage">
			</div>
		    <div class="col-sm">
		    	<img src="<%=request.getContextPath()%>/images/sub3_<%=hotelVO.getImage()%>" class="subImage">
		    </div>
		    <div class="col-sm">
		    	<img src="<%=request.getContextPath()%>/images/sub4_<%=hotelVO.getImage()%>" class="subImage">
		    </div>
		  </div>
		</div>
		
		<h2>호텔 상세 정보</h2>
        
        <p>호텔 이름: <%= hotelVO.getHotelName() %></p>
        <p>주소: <%= hotelVO.getAddress() %></p>
        <p>등급: <%= hotelVO.getHotelGrade() %></p>
        <p>상세정보: <%= hotelVO.getHotelDetail() %></p>

		<h2>부대시설 정보</h2>
		
		<%if(facilitiesVO.getConv_store()==1){%>
		<span><img alt="conStore" src="../images/conStore.png" class="icon">편의점</span><br>
		<%} %>
		<%if(facilitiesVO.getLaundry_room() == 1){%>
		<span><img alt="laundryRoom" src="../images/laundryRoom.png" class="icon">세탁실</span><br>
		<%} %>
		<%if(facilitiesVO.getParking() == 1){%>
		<span><img alt="parking" src="../images/parking.png" class="icon">주차장</span><br>
		<%} %>
		<%if(facilitiesVO.getValet_parking() == 1){%>
		<span><img alt="valetparking" src="../images/valetparking.png" class="icon">발렛파킹</span><br>
		<%} %>
		<%if(facilitiesVO.getBreakfast() == 1){%>
		<span><img alt="Breakfast" src="../images/breakfast.png" class="icon">조식</span><br>
		<%} %>
		<%if(facilitiesVO.getPool() == 1){%>
		<span><img alt="pool" src="../images/pool.png" class="icon">수영장</span><br>
		<%} %>
		<%if(facilitiesVO.getLounge_bar() == 1){%>
		<span><img alt="loungeBar" src="../images/loungeBar.png" class="icon">라운지바</span><br>
		<%} %>
		<%if(facilitiesVO.getAccompany_pet() == 1){%>
		<span><img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능 여부</span><br><br>
		<%} %>
		
		<strong>호텔 상세 주소</strong>
		<p><%= hotelVO.getAddress() %></p>
        
    </div>
</div>
	<div id="map" style="width: 500px; height: 400px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77b09882911ce4058ee98aa8532ed409"></script>
		<script>
		var container = document.getElementById('map');
		var hotelLongitude = <%=hotelVO.longitude%>;
		var hotelLatitude = <%=hotelVO.latitude%>;
		
		var options = {
			center: new kakao.maps.LatLng(hotelLongitude, hotelLatitude),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		</script>
		
		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file="../Layout/bottom.jsp" %>