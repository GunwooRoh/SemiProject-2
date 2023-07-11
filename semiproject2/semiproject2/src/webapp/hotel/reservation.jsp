<%@page import="com.reservation.model.ViewRoomDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.reservation.model.ViewRoomVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@include file="/Layout/top.jsp" %>

<%@page import="oracle.net.aso.f"%>
<%@ page import="com.review.model.reviewVO" %>
<%@page import="java.util.List"%>
<%@page import="com.hotel.model.hotelVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.facilities.model.facilitiesVO"%>
<%@page import="com.reservation.model.ShowReservationVO"%>
<%@page import="com.reservation.model.reservationVO"%>
<%@ page import="com.reservation.model.reservationVO" %>
<%@ page import="com.reservation_detail.model.reservation_detailVO" %>
<%@ page import="com.reservation.model.reservationDAO" %>
<%@ page import="com.reservation_detail.model.reservation_detailDAO" %>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
  $(function() {
    var roomType = ""; // 방 타입 변수
    var peopleCount = 0; // 인원수 변수
    var checkInDate = ""; // 체크인 날짜 변수
    var checkOutDate = ""; // 체크아웃 날짜 변수

    $(".people-count-increase-btn").on("click", function() {
	 peopleCount++;
    // 업데이트된 사람 수를 특정 요소에 출력
   
    });

    $(".people-count-decrease-btn").on("click", function() {
     // 사람 수 감소
    	if (peopleCount > 0) {
   	 peopleCount--;
    } else {
  		 // 사람 수가 0 이하인 경우에는 0으로 유지
    	peopleCount = 0;
    	}
   }
     
    $("#people-count-display").text(peopleCount);
    
    
    // 체크인 버튼 클릭 이벤트 핸들러
    $(".check-in-btn").on("click", function() {
      checkInDate = $(this).attr("data-check-in");
    });

    // 체크아웃 버튼 클릭 이벤트 핸들러
    $(".check-out-btn").on("click", function() {
      checkOutDate = $(this).attr("data-check-out");
    });
  });
</script>

<style type="text/css">
.room-type-btn, .people-count-btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #eaeaea;
	border: none;
	border-radius: 5px;
	margin-right: 10px;
	cursor: pointer;
}
</style>

<%
  HttpSession s = request.getSession();
  int accNo = (int) s.getAttribute("accNo");
  String hotelNo = request.getParameter("hotelNo");
  String keyword = request.getParameter("keyword");
  String checkIn = request.getParameter("checkIn");
  String checkOut = request.getParameter("checkOut");
  String people = request.getParameter("people");
  String roomType = request.getParameter("roomType");
  int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));


  reservationDAO reservationDAO = new reservationDAO();
  reservation_detailDAO reservationDetailDAO = new reservation_detailDAO();

  // 예약 정보 등록
    reservationVO reservationVo = new reservationVO();
    reservationVo.setAccNo(accNo); // 예약 회원 번호 설정
    reservationVo.setHotelNo(Integer.parseInt(hotelNo)); // 호텔 번호 설정
    reservationVo.setBooked_room_count(1); // 예약한 방 개수 설정
    int reservationCnt = reservationDAO.insertReservation(reservationVo);

  if (reservationCnt > 0) {
      // 예약 정보 등록 성공

      // 예약 상세 정보 등록
      reservation_detailVO reservationDetailVo = new reservation_detailVO();
      reservationDetailVo.setReCode(reservationVo.getReCode()); // 예약 코드 설정
      reservationDetailVo.setRoom_type(roomType); // 방 타입 설정
      reservationDetailVo.setPeople_num(peopleNum); // 인원수 설정
     

      int reservation_DetailCnt = reservationDetailDAO.insertReservation_detail(reservationDetailVo);

      if (reservation_DetailCnt > 0) {
          out.println("예약이 정상적으로 처리되었습니다.");
      } else {
          out.println("예약 상세 정보 등록에 실패했습니다.");
      }
  } else {
      out.println("예약 정보 등록에 실패했습니다.");
  }
  
  
%>


<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@include file="/Layout/bottom.jsp" %>