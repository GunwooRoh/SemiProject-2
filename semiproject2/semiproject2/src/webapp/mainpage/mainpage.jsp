<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%
		String t_id=(String)session.getAttribute("id");
		boolean t_isLogin=false;
		if(t_id!=null && !t_id.isEmpty()){  //세션에 값이 있으면 로그인된 경우
			t_isLogin=true;
		}
	%>
		
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Global H.O.T.E.L Platform</title>
  <!-- 리셋 css -->
  <link rel="stylesheet" href="./common/minireset.min.css">
  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
  <!-- og -->
  <meta property="og:site_name" content="Yanolja">
  <meta property="og:title" content="Global R.E.S.T. Platform">
  <meta property="og:description" content="이젠,갈래는 누구나 마음 편히 놀 수 있게 여가의 패러다임을 전환합니다">
  <meta property="og:url" content="https://3teamidkjs.github.io/Yanolja_team/">
  <meta property="og:image" content="common/og_logo_title.png">
  <meta property ="og:type" content="website">
  <!-- 폰트 css -->
  <link rel="stylesheet" href="./font/font.css">
  <!-- indexHeader css -->
  <link rel="stylesheet" href="./css/indexHeader.css">
  <!-- index css -->
  <link rel="stylesheet" href="./css/index.css">
  <!-- header js -->
  <script defer src="./js/indexHeader.js"></script>
  <!-- index js -->
  <script defer src="./js/index.js"></script>

</head>

<body>
  <!-- 로고 -->
  <div class="introLogo">
    <p style = "color:#4857A5"><strong>이젠, 갈래?</strong></p>
  </div>

  <!--  <div class="topBtn">   -->
  <div class="topBtn">
    <span>
      <img src="./img/ind_arrow-down.svg" alt="아래 화살표" id="downArrow">
      <a href="#" id="upArrow">
        <img src="./img/index_arrow-up.svg" alt="위 화살표">
      </a>
    </span>
  </div>

  <!-- header -->
  <!-- 메뉴 -->
  <!-- 메뉴 -->
  <!--<div class="header container clearfix">
	-->
  <header>
      <h1>
      
        <a href="./index.html"><img src="./img/logo.png" alt="이젠,갈래?_로고" id="logoimg"/></a>
      </h1>
      <ul id="gnb">
        <li>
        <li id="menubt">
          <%if(t_isLogin){ //로그인된 경우%>
          <a href="http://localhost:9090/semi2/eunjung/inc/Login/loout.jsp" id="langEng">Logout</a>
          <a href="http://localhost:9090/semi2/eunjung/inc/mypage/profile.jsp" id="langKr">Mypage</a>
          <%}else{ %>
          <a href="http://localhost:9090/semi2/eunjung/inc/Login/login.jsp" id="langEng">Login</a>
          <a href="http://localhost:9090/semi2/eunjung/inc/register/register_index.jsp" id="langKr">Sign up</a>
          <%} %>
        
        </li>
      </ul>
    </header>
  </div> 


    <!-- ------ sec1 ------ -->
    
    <section class="sec3">
      <div class="abs">
        <div class="container">
          <div class="sec3Txt txtBox">
            <em>Space business</em>
            <h1 class="title">
              <p><span class="del">여가 생활의</span></p>
              <p><span class="del1">가치를 극대화하는</span></p>
              <p><span class="del2">공간 디자인</span></p>
            </h1>
            <div class="sTxtWrapper">
              <p class="sTxt">
                <em>호텔에서 업무·문화·주거 공간까지<br>
                  공간에 대한 모든 호텔 예약 서비스를 제공합니다.</em>
              </p>
            </div>
            <div class="hovBox">
              <span>
                <img src="./img/ind_arrow-whLong.svg" alt="흰긴화살표">
              </span>
              <a href="./whatWeDo.html">Space business</a>
              <img src="./img/ind_arrow-long.svg" alt="긴화살표" class="gone">
            </div>
          </div><!-- sec3_txt -->
        </div> <!-- container -->
      </div>
      <div class="sticky">
        <div class="ulHo">
          <!-- <ul class="Slider"> -->
          <img src="./img/index_sec3_1.jpg" alt="img" class="fade-out fadeOut1">
          <img src="./img/index_sec3_2.jpg" alt="img" class="fade-out fadeOut2">
          <img src="./img/index_sec3_3.jpg" alt="img" class="fade-out fadeOut3">
          <img src="./img/index_sec3_4.jpg" alt="img" class="fade-out fadeOut4">
          <img src="./img/index_sec3_5.jpg" alt="img" class="fade-out fadeOut5">
          <!-- </ul> -->
        </div>
      </div>
    </section>
    <!-- ------ sec4 ------ -->
    <section class="sec4">
  
    </section>

<%@ include file = "../form/bottom.jsp" %>
</html> 