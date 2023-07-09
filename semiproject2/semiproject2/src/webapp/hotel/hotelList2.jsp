<%@page import="java.util.ArrayList"%>
<%@page import="com.hotel.model.hotelService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.hotel.model.hotelVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/Layout/top.jsp" %>

<link rel="stylesheet" href="../css/hotel.css">
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
	});
</script>
<script src="../js/script.js"></script>

<style type="text/css">


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

<jsp:useBean id="hotelService" class="com.hotel.model.hotelService"></jsp:useBean>
<jsp:useBean id="hotelVo" class="com.hotel.model.hotelVO"></jsp:useBean>
<jsp:useBean id="facilities" class="com.facilities.model.facilitiesDAO"></jsp:useBean>
<jsp:useBean id="facilitiesVo" class="com.facilities.model.facilitiesVO"></jsp:useBean>
<%
	//1. 요청파라미터 인코딩
	request.setCharacterEncoding("utf-8");

	String keyword=request.getParameter("searchKeyword");
	String condition=request.getParameter("searchCondition");
	
	//2. db작업
	List<hotelVO> list = null;
	hotelVO vo = new hotelVO();
	try{
		
		list = hotelService.selectAll(keyword, condition);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	if(keyword==null) keyword="";
	
	//3. 
	
	/* 페이징 처리 */
	int currentPage=1;// 현재페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	//아코디언
	List<String> accorList=new ArrayList<>();
	accorList.add("One");
	accorList.add("Two");
	accorList.add("Three");
	String accordion="";
	
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
<!-- 	<div class="search_input_box">
		<div class="search_input rooms_box">
			<div>
				<a href="#">
					<div>위치</div> <input type="text" placeholder="어디로 여행가세요?">
				</a>
			</div>
			<div class="search_input__start_date">
				<a href="#">
					<div>체크인</div> <input type="datetime" placeholder="날짜 추가"
					readonly="">
				</a>
			</div>
			<div class="search_input__end_date">
				<a href="#">
					<div>체크아웃</div> <input type="datetime" placeholder="날짜 추가"
					readonly="">
				</a>
			</div>
			<div>
				<a href="#">
					<div>인원</div> <input type="number" placeholder="게스트 추가">
				</a>
			</div>
			<div>
				<button class="search_button" style="text-align: center;">
					<img src="./images/magnifyingGlass.svg" class="magnifying_glass">
				</button>
			</div>
		</div>
		<div class="search_input experience_box display_none">
			<div style="width: 52%">
				<a href="#">
					<div style="margin: 0 39px">위치</div> <input type="text"
					placeholder="어디로 여행가세요?" style="width: 80.5%">
				</a>
			</div>
			<div class="search_input__full_date" style="width: 52%">
				<a href="#">
					<div style="margin: 0 39px">날짜</div> <input type="datetime"
					placeholder="원하는 날짜를 입력하세요." style="width: 80.5%" readonly="">
				</a>
			</div>
			<div>
				<button class="search_button" style="text-align: center;">
					<img src="./images/magnifyingGlass.svg" class="magnifying_glass">
				</button>
			</div>
		</div>
		<div class="calender_box font14">
			<div
				class="width50per border-radius32 text_center calender_box__inside_box">
			</div>
			<div
				class="width50per white_background border-radius32 text_center calender_box__inside_box">
				<button class="calender_box--left_button">
					<img src="./images/leftCalenderButton.svg" alt=""
						style="width: 10px;">
				</button>
				<button class="calender_box--right_button">
					<img src="./images/rightCalenderButton.svg" alt=""
						style="width: 10px;">
				</button>
				<table class="calender_box__table">
					<tbody>
						<tr class="font16">
							<th class="calender_box__inside_box--month" colspan="7">2023년
								7월</th>
						</tr>
						<tr class="font12 font_gray">
							<td>일</td>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
						</tr>
						<tr class="calender_box__table__tr">
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date">1</td>
						</tr>
						<tr class="calender_box__table__tr">
							<td class="calender_box__table__past_date">2</td>
							<td class="calender_box__table__past_date">3</td>
							<td class="calender_box__table__past_date">4</td>
							<td class="calender_box__table__past_date">5</td>
							<td class="calender_box__table__past_date">6</td>
							<td class="calender_box__table__past_date">7</td>
							<td class="">8</td>
						</tr>
						<tr class="calender_box__table__tr">
							<td class="">9</td>
							<td class="">10</td>
							<td class="">11</td>
							<td class="">12</td>
							<td class="">13</td>
							<td class="">14</td>
							<td class="">15</td>
						</tr>
						<tr class="calender_box__table__tr">
							<td class="">16</td>
							<td class="">17</td>
							<td class="">18</td>
							<td class="">19</td>
							<td class="">20</td>
							<td class="">21</td>
							<td class="">22</td>
						</tr>
						<tr class="calender_box__table__tr">
							<td class="">23</td>
							<td class="">24</td>
							<td class="">25</td>
							<td class="">26</td>
							<td class="">27</td>
							<td class="">28</td>
							<td class="">29</td>
						</tr>
						<tr class="calender_box__table__tr">
							<td class="">30</td>
							<td class="">31</td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
							<td class="calender_box__table__past_date"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div> -->
 <!-- 에어비앤비 캘린더 end -->
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
<!-- 		<div class="search_input__start_date">
			<a href="#">
				<div>체크인</div> <input type="datetime" placeholder="날짜 추가"
				readonly="">
			</a>
		</div> -->
	     <div class="flight-search-date-end">
	     <label style="margin-right: 60px;">체크 아웃</label>
	    <input type="date" name="checkout">
	    </div>
	<!-- 	<div class="search_input__end_date">
			<a href="#">
				<div>체크아웃</div> <input type="datetime" placeholder="날짜 추가"
				readonly="">
			</a>
		</div> -->
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
			hotelVO hotelvo = list.get(curPos++);
			accordion = accorList.get(i);
			num--; %>
		
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="panelsStayOpen-heading<%=accordion %>">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse<%=accordion %>" aria-expanded="true" aria-controls="panelsStayOpen-collapse<%=accordion %>">
	       	<input type="image" src="<%=request.getContextPath() %>/images/<%=hotelvo.getImage() %>" alt="호텔이미지" style="width:600px; height: 300px">
	      </button>
	    </h2>
	    <div id="panelsStayOpen-collapse<%=accordion %>" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-heading<%=accordion %>">
	      <div class="accordion-body">
	        <strong><%=hotelVo.getHotelName() %></strong><br>
	        <img alt="Breakfast" src="../images/breakfast.png" class="icon">조식<br>
	        <img alt="conStore" src="../images/conStore.png" class="icon">편의점<br>
	        <img alt="laundryRoom" src="../images/laundryRoom.png" class="icon">세탁실<br>
	        <img alt="pool" src="../images/pool.png" class="icon">수영장<br>
	        <img alt="parking" src="../images/parking.png" class="icon">주차장<br>
	        <img alt="valetparking" src="../images/valetparking.png" class="icon">발렛파킹<br>
	        <img alt="loungeBar" src="../images/loungeBar.png" class="icon">라운지바<br>
	        <img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능 여부<br><br>
	        <strong>1박 최저가</strong>&nbsp;<span style="color: gray">78,800￦</span>
	        <button type="button" class="btn btn-outline-primary" style="float: right;" onclick="#">여기,갈래!</button>
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
<div class="divPage">
	<!-- 페이지 번호
	이전 블럭으로 이동 -->
	<%if(firstPage>1) {%>
		<a href="hotelList2.jsp?currentPage=<%=firstPage-1%>">
			<img src="<%=request.getContextPath()%>/images/firstPage.png">
		</a>
	<%} %>
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=firstPage; i<=lastPage; i++) {
		if(i>totalPage) break;%>
		<%if(currentPage!=i){%>
		<a href="hotelList2.jsp?currentPage=<%=i%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>">[<%=i %>]</a>
		<%}else{%>
		<span style="color:#4857a5; font-size:14px; font-weight:bold">[<%=i %>]</span>
		<%} %>
	
	<%}//for %>
	
	<!-- 다음 블록으로 이동 -->
	<%if(lastPage<totalPage){ %>
		<a href="hotelList2.jsp?currentPage=<%=lastPage+1%>">
			<img src="<%=request.getContextPath()%>/images/lastPage.png">
		</a>
	<%} %>	
	<!-- 페이지번호 끝 -->
</div>
</main>
<%@include file="/Layout/bottom.jsp" %>