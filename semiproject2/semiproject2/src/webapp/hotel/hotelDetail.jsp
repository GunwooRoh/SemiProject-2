<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@include file="/Layout/top.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    



    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<link rel="stylesheet" href="../css/hotelcss.css">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

#nav1 {
/* 	margin-top: 50px; */
	padding: 10px;
	background-color: #4857a5;
}

.icon {
	width: 20px;
	height: 20px;
}

</style>
<jsp:useBean id="hotelService" class="com.hotel.model.hotelService" scope="session"></jsp:useBean>
<jsp:useBean id="hotelVO" class="com.hotel.model.hotelVO" scope="page"></jsp:useBean>
<jsp:setProperty property="hotelNo" name="hotelVO" />
<jsp:useBean id="facilitiesService" class = "com.facilities.model.facilitiesService" scope = "session"></jsp:useBean>
<jsp:useBean id="facilitiesVO" class = "com.facilities.model.facilitiesVO" scope = "page"></jsp:useBean>
<jsp:setProperty property= "hotelNo" name = "facilitiesVO" />
<%
	
  	String hotelNo = request.getParameter("no");
    hotelVO = hotelService.selectByhotelNo(Integer.parseInt(hotelNo));
    facilitiesVO = facilitiesService.selectByhotelNo(Integer.parseInt(hotelNo));
    double latitude = hotelVO.getLatitude();
    double longitude = hotelVO.getLongitude();
%>

<nav id="nav1">
	<div class="search_input rooms_box">
		<div>
			<a href="#">
				<div>위치</div> <input type="text" placeholder="어디로 여행가세요?">
			</a>
		</div>
		
		<div class="flight-search-date-start">
		<label style="margin-right: 70px;">체크 인</label>
	   	 <input type="date" name="checkin">
	    </div>
		
	     <div class="flight-search-date-end">
	     <label style="margin-right: 60px;">체크 아웃</label>
	    <input type="date" name="checkout">
	    </div>

		<div>
			<a href="#">
				<div>인원</div> <input type="number" placeholder="게스트 추가">
			</a>
		</div>
		<div>
			<button class="search_button" style="text-align: center;">
				<img src="../images/search.png" class="magnifying_glass">
			</button>
		</div>
	</div> 
	<!-- serach input room -->
</nav>
<main class="container">
  <div class="p-4 p-md-5 mb-4 rounded" style="width:1250px; height:300px; background-image: url('<%=request.getContextPath()%>/images/<%=hotelVO.getImage()%>'); background-size:1250px 300px;">
    <div class="col-md-6 px-0">
      <h1 class="display-4 fst-italic"><%= hotelVO.getHotelName() %></h1>
      <br><br><br><br><br>
    </div>
  </div>

  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">여기 가격쓸꺼임 </strong>
          <h3 class="mb-0">여기 객실유형임 </h3>
          <div class="mb-1 text-muted">여기잔여객실뜨면베스트아님말고</div>
          <p class="card-text mb-auto">여기 침대, 무선인터넷,주방,에어컨여부</p>
          
          <a href="#" class="stretched-link" style="color: #4857a5;">예약링크이긴함</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          	<img src="<%=request.getContextPath() %>/images/sub1_<%=hotelVO.getImage()%>" style="width: 250px; height: 200px;">
        </div>
      </div>
    </div>
    
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">여기 가격쓸꺼임 </strong>
          <h3 class="mb-0">여기 객실유형임 </h3>
          <div class="mb-1 text-muted">여기잔여객실뜨면베스트아님말고</div>
          <p class="card-text mb-auto">여기 침대, 무선인터넷,주방,에어컨여부</p>
          
          <a href="#" class="stretched-link" style="color: #4857a5;">예약링크이긴함</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          	<img src="<%=request.getContextPath() %>/images/sub2_<%=hotelVO.getImage()%>" style="width: 250px; height: 200px;">
        </div>
      </div>
    </div>
        
      </div>
    </div>
  </div>

  <div class="row g-5">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 fst-italic border-bottom">
        <%=hotelVO.getHotelName() %>
      </h3>
      <h5>호텔주소 : <%=hotelVO.getAddress() %></h5>
      <hr>
      <article class="blog-post">
        <h2 class="blog-post-title mb-1">부대시설 정보</h2>
        <p class="blog-post-meta">January 1, 2021 by <a href="#">Mark</a></p>

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
		<span><img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능</span><br><br>
		<%} %>
        
        <hr>
        <table class="table">
          <thead>
            <tr>
              <th>작성자</th>
              <th>객실유형</th>
              <th>후기</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>건우</td>
              <td>A유형</td>
              <td>와 여기 좋아요</td>
            </tr>
            <tr>
              <td>정윤</td>
              <td>B유형</td>
              <td>여기 프젝하기 좋아요</td>
            </tr>
            <tr>
              <td>은정</td>
              <td>B유형</td>
              <td>와 여기좋아요 ㅎ;</td>
            </tr>
          </tbody>
        </table>
      <nav class="blog-pagination" aria-label="Pagination">
        <a class="btn btn-outline-primary rounded-pill" href="#">Older</a>
        <a class="btn btn-outline-secondary rounded-pill disabled">Newer</a>
      </nav>

    </div>

    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="fst-italic">사장님 한마디</h4>
          <p class="mb-0"><%=hotelVO.getHotelDetail() %></p>
        </div>

        <div class="p-4">
          <h4 class="fst-italic">호텔 MAP</h4>
          	<script type="text/javascript"
         		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77b09882911ce4058ee98aa8532ed409">
    		</script>
      
     			 <div id="map" style="width: 500px; height: 400px;"></div>

		      <script>
		      var container = document.getElementById('map');
		<%--       var hotelLongitude = <%= hotelVO.longitude %>;
		      var hotelLatitude = <%= hotelVO.latitude %>; --%>
		      
		      var options = {
		         center: new kakao.maps.LatLng(33.450701, 126.570667),
		         level: 3
		      };
		
		      var map = new kakao.maps.Map(container, options);
		      </script>
        </div>

      </div>
    </div>
  </div>

</main>



    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file="../Layout/bottom.jsp" %>