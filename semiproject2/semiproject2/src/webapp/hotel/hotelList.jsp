<%@page import="com.facilities.model.facilitiesVO"%>
<%@page import="com.hotel.model.hotelVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/Layout/top.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/hotelcss.css">
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	$(function() {

		$(".passengers-select-text").click(
				function() {

					if (!$(".passengers-select-option").hasClass("hide")) {
						$(".fa-angle-down").toggleClass("hide")
						$(".fa-angle-up").toggleClass("hide");
						var sum = 0;
						$(".passengers-select-option input").each(
								function(index, elem) {
									sum += parseInt($(elem).val());
									$(".passengers-select-nmb").text(sum);
								});
					}

					$(".passengers-select-options-container").toggleClass(
							"hide");

				});
		
		
		  // 체크인 날짜 변경 시 이벤트 핸들러
		  $("#checkIn").on("change", function() {
		    var checkInDate = new Date($(this).val());
		    var checkOutDate = new Date($("#checkOut").val());

		    // 체크인 날짜가 체크아웃 날짜보다 미래인 경우
		    if (checkInDate > checkOutDate) {
		      // 체크인 날짜와 체크아웃 날짜를 바꿈
		      $("#checkIn").val($("#checkOut").val());
		      $("#checkOut").val($(this).val());
		    }
		  });

		  // 체크아웃 날짜 변경 시 이벤트 핸들러
		  $("#checkOut").on("change", function() {
		    var checkInDate = new Date($("#checkIn").val());
		    var checkOutDate = new Date($(this).val());

		    // 체크아웃 날짜가 체크인 날짜보다 과거인 경우
		    if (checkOutDate < checkInDate) {
		      // 체크인 날짜와 체크아웃 날짜를 바꿈
		      $("#checkIn").val($(this).val());
		      $("#checkOut").val($("#checkIn").val());
		    }
		  });

		
	});
</script>
<script src="../js/script.js"></script>

<style type="text/css">

	#divPage{
		margin: 0 auto;
		text-align: center;
		font-size: 25px;
		
	}
	#accordionPanelsStayOpenExample {
		margin-left: 200px;
		margin-right: 500px
	}
	
	#nav1 {
		margin-top: 50px;
		padding: 10px;
		background-color: #4857a5;
	}
		
	#accordionPanelsStayOpenExample {
		width: 700px;
		margin-bottom: 100px;
		margin: 0 auto;
	}
	
	.icon {
		width: 20px;
		height: 20px;
	}
	
	.search-icon {
		position: relative;
		float: right;
		width: 75px;
		height: 75px;
		top: -62px;
		right: -10px;
	}
	
	#search {
		margin-top: 50px;
		background-color: white;
	}
	
	.search-container {
		width: 700px;
		display: block;
		margin: 0 auto;
		background-color: white;
	}
	
	input#search-bar {
		margin: 0 auto;
		width: 100%;
		height: 45px;
		padding: 0 20px;
		font-size: 1rem;
		border: 1px solid #D0CFCE;
		outline: none; &: focus { border : 1px solid #008ABF;
		transition: 0.35s ease;
		color: #008ABF; &:: -webkit-input-placeholder { transition : opacity
		0.45s ease;
		opacity: 0;
	}
	
	&
	::-moz-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	
	&
	:-ms-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	}


}
</style>

<jsp:useBean id="service" class="com.hotel.model.hotelService" scope="session"></jsp:useBean>
<jsp:useBean id="facilService" class="com.facilities.model.facilitiesService" scope="session"></jsp:useBean>
<%
	//1. post방식 요청파라미터 인코딩
	request.setCharacterEncoding("utf-8");

	String keyword=request.getParameter("keyword");
	String checkIn=request.getParameter("checkIn");
	String checkOut=request.getParameter("checkOut");
	String people=request.getParameter("people");

	//2. db작업
	List<hotelVO> list = null;
	try{
		
		list = service.selectAll(keyword);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	System.out.println("list="+list.size());
	
	//null 처리
	if(keyword==null) keyword="";
	if(checkIn==null) checkIn="";
	if(checkOut==null) checkOut="";
	if(people==null) people="";
	
	//3. 
	
	/* 페이징 처리 */
	int currentPage=1;// 현재페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	if(keyword==null) keyword=""; //keyword없으면 null처리
	
	//아코디언
	List<String> accorList=new ArrayList<>();
	accorList.add("One");
	accorList.add("Two");
	accorList.add("Three");
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size(); //토탈 레코드갯수 리스트사이즈
	int pageSize=3; //한 페이지에 보여줄 레코드 수
	int blockSize=10;//한 블럭에 보여줄 페이지 수
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize); //총 페이지 수
	
	//[2] 현재 페이지를 이용해서 계산하는 변수
	int firstPage = currentPage-((currentPage-1)%blockSize); //1,11,21,31.. 블럭의시작 
	int lastPage = firstPage+(blockSize-1);//10,20,30.. 블럭의 마지막 페이지
	
	//페이지당 ArrayList에서의 시작 index =) 0,3,6,9,12...
	int curPos = (currentPage-1)*pageSize;
	
	//페이지당 글 리스트 시작 번호
	int num= totalRecord-curPos;
%>


<nav id="nav1">
	<form name="frmSearch" method="post" action='hotelList.jsp'>
		<div class="search_input rooms_box">
			<div>
				<a href="#">
					<label style="margin-right: 145px;">어디,갈래?</label><br>
					<input type="text" name="keyword" placeholder="어디로 여행가세요?" value="<%=keyword %>">
				</a>
			</div>
			
			<div class="flight-search-date-start">
			<label style="margin-right: 70px;">체크 인</label>
		   	 <input type="date" name="checkIn" id="checkIn" value="<%=checkIn %>">
		    </div>
			
		     <div class="flight-search-date-end">
		     <label style="margin-right: 60px;">체크 아웃</label>
		    <input type="date" name="checkOut" id="checkOut" value="<%=checkOut %>">
		    </div>
	
			<div>
				<a href="#">
					<label>인원</label><br> 
					<input type="number" name="people" placeholder="게스트 추가" value="<%=people %>">
				</a>
			</div>
			<div>
				<button class="search_button" style="text-align: center;">
					<img src="../images/search.png" class="magnifying_glass">
				</button>
			</div>
		</div> 
		<!-- serach input room -->
	</form>
</nav>
<main id="main">
<div class="accordion" id="accordionPanelsStayOpenExample">
	<%if(list==null || list.isEmpty()) {%>
		<script type="text/javascript">
			alert("해당정보에 대한 호텔이 없습니다.");
			location.href="<%=request.getContextPath()%>/hotel/hotelList2.jsp";
		</script>
	<%}else{%>
		<!-- 호텔 아코디온 내용 반복문 시작 -->
		<%
		//3번씩만 반복
		for(int i=0; i<pageSize; i++){
			if(num<1) break;
			hotelVO vo = list.get(curPos++);
			facilitiesVO facilities =facilService.selectByhotelNo(vo.getHotelNo());
			num--; %>
		
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="panelsStayOpen-heading<%=accorList.get(i) %>">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse<%=accorList.get(i) %>" aria-expanded="true" aria-controls="panelsStayOpen-collapse<%=accorList.get(i) %>">
	       	<input type="image" src="<%=request.getContextPath() %>/images/<%=vo.getImage() %>" alt="호텔이미지" style="width:600px; height: 300px">
	      </button>
	    </h2>
	    <div id="panelsStayOpen-collapse<%=accorList.get(i) %>" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-heading<%=accorList.get(i) %>">
	      <div class="accordion-body">
	        <strong><%=vo.getHotelName() %></strong><br>
	    <%if(facilities.getConv_store()==1){%>
		<span><img alt="conStore" src="../images/conStore.png" class="icon">편의점</span><br>
		<%} %>
		<%if(facilities.getLaundry_room() == 1){%>
		<span><img alt="laundryRoom" src="../images/laundryRoom.png" class="icon">세탁실</span><br>
		<%} %>
		<%if(facilities.getParking() == 1){%>
		<span><img alt="parking" src="../images/parking.png" class="icon">주차장</span><br>
		<%} %>
		<%if(facilities.getValet_parking() == 1){%>
		<span><img alt="valetparking" src="../images/valetparking.png" class="icon">발렛파킹</span><br>
		<%} %>
		<%if(facilities.getBreakfast() == 1){%>
		<span><img alt="Breakfast" src="../images/breakfast.png" class="icon">조식</span><br>
		<%} %>
		<%if(facilities.getPool() == 1){%>
		<span><img alt="pool" src="../images/pool.png" class="icon">수영장</span><br>
		<%} %>
		<%if(facilities.getLounge_bar() == 1){%>
		<span><img alt="loungeBar" src="../images/loungeBar.png" class="icon">라운지바</span><br>
		<%} %>
		<%if(facilities.getAccompany_pet() == 1){%>
		<span><img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능 여부</span><br><br>
		<%} %>
		
		<%System.out.print("편의점여부"+facilities.getAccompany_pet()); %>
	        <strong>1박 최저가</strong>&nbsp;<span style="color: gray">78,800￦</span>
	        <button type="button" class="btn btn-outline-primary" style="float: right;" 
	        onclick="location.href='hotelDetail.jsp?hotelNo=<%=vo.getHotelNo()%>&keyword=<%=keyword %>&checkIn=<%=checkIn%>&checkOut=<%=checkOut%>'">여기,갈래!</button>
	        <button type="button" class="btn btn-outline-warning" style="float: right;" onclick="#">리뷰,볼래!</button><br><br>
	      </div>
	    </div>
	  </div>
	  

	  
		<%}//for %>
	<%}//if%>
  
<!--   <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true" aria-controls="panelsStayOpen-collapseTwo">
       	<input type="image" src="../images/hotel3.jpg" alt="호텔이미지" style="width:600px; height: 300px">
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
        <strong>롯데시티호텔 제주</strong><br>
        <img alt="Breakfast" src="../images/breakfast.png" class="icon">조식<br>
        <img alt="conStore" src="../images/conStore.png" class="icon">편의점<br>
        <img alt="laundryRoom" src="../images/laundryRoom.png" class="icon">세탁실<br>
        <img alt="pool" src="../images/pool.png" class="icon">수영장<br>
        <img alt="parking" src="../images/parking.png" class="icon">주차장<br>
        <img alt="valetparking" src="../images/valetparking.png" class="icon">발렛파킹<br>
        <img alt="loungeBar" src="../images/loungeBar.png" class="icon">라운지바<br>
        <img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능 여부<br>
        <strong>1박 최저가</strong>&nbsp;<span style="color: gray">78,800￦</span>
        <button type="button" class="btn btn-outline-primary" style="float: right;">여기,갈래!</button>
        <button type="button" class="btn btn-outline-warning" style="float: right;">리뷰,볼래!</button><br><br>
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="true" aria-controls="panelsStayOpen-collapseThree">
       	<input type="image" src="../images/hotel3.jpg" alt="호텔이미지" style="width:600px; height: 300px">
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingThree">
      <div class="accordion-body">
        <strong>롯데시티호텔 제주</strong><br>
        <img alt="Breakfast" src="../images/breakfast.png" class="icon">조식<br>
        <img alt="conStore" src="../images/conStore.png" class="icon">편의점<br>
        <img alt="laundryRoom" src="../images/laundryRoom.png" class="icon">세탁실<br>
        <img alt="pool" src="../images/pool.png" class="icon">수영장<br>
        <img alt="parking" src="../images/parking.png" class="icon">주차장<br>
        <img alt="valetparking" src="../images/valetparking.png" class="icon">발렛파킹<br>
        <img alt="loungeBar" src="../images/loungeBar.png" class="icon">라운지바<br>
        <img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능 여부<br><br>
        <h6>여기가격불러오기</h6>
        <strong>1박 최저가</strong>&nbsp;<span style="color: gray">78,800￦</span>
        <button type="button" class="btn btn-outline-primary" style="float: right;">여기,갈래!</button>
        <button type="button" class="btn btn-outline-warning" style="float: right;">리뷰,볼래!</button><br><br>
      </div>
    </div>
  </div> -->

  
</div>

<div id="divPage">
	<!-- 페이지 번호
	이전 블럭으로 이동 -->
	<%if(firstPage>1) {%>
		<a href="hotelList.jsp?currentPage=<%=firstPage-1%>">
			<img src="<%=request.getContextPath()%>/images/firstPage.png">
		</a>
	<%} %>
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=firstPage; i<=lastPage; i++) {
		if(i>totalPage) break;%>
		<%if(currentPage!=i){%>
		<a href="hotelList.jsp?currentPage=<%=i%>&keyword=<%=keyword%>&checkin=">[<%=i %>]</a>
		<%}else{%>
		<span style="color:#4857a5; font-size:25px; font-weight:bold">[<%=i %>]</span>
		<%} %>
	
	<%}//for %>
	
	<!-- 다음 블록으로 이동 -->
	<%if(lastPage<totalPage){ %>
		<a href="hotelList.jsp?currentPage=<%=lastPage+1%>">
			<img src="<%=request.getContextPath()%>/images/lastPage.png">
		</a>
	<%} %>	
	<!-- 페이지번호 끝 -->
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file="/Layout/bottom.jsp" %>