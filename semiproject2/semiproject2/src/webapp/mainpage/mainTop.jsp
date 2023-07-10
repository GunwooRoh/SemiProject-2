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
  <div class="topBtn">
    <span>
      <img src="./img/ind_arrow-down.svg" alt="아래 화살표" id="downArrow">
      <a href="#" id="upArrow">
        <img src="./img/index_arrow-up.svg" alt="위 화살표">
      </a>
    </span>
  </div>

  <header>
      <h1>
      
        <a href="./index.html"><img src="./img/logo.png" alt="이젠,갈래?_로고" id="logoimg"/></a>
      </h1>
      <ul id="gnb">
        <li>
     <ul class="subMenu">
          <a href="./whatWeDo/whatWeDo.html">what we do</a>
            <li><a href="./whatWeDo/whatWeDo.html">Platform business</a></li>
            <li><a href="#">Hospitality solution</a></li>
            <li><a href="#">Space business</a></li>
            <li><a href="#">Partnership</a></li>
          </ul>
        </li>
        <li><a href="#">Tech story</a></li>
        <li>
          <a href="#">Newsroom <img src="./img/arrow_outlink.svg" alt="메뉴_화살표" /></a>
        </li>
        <li>
          <a href="#">IR</a>
          <ul class="subMenu">
           <li><a href="#">공시</a></li>
          </ul>
        </li>
        <li>
          <a href="./ESG/ESG.html">ESG</a>
          <ul class="subMenu">
            <li><a href="./ESG/ESG.html">ESG vision</a></li>
            <li><a href="#">ESG commitments</a></li>
            <li><a href="#">ESG news</a></li>
          </ul>
        </li>
        <li>
          <a href="#">Adminonly <img src="./img/arrow_outlink.svg" alt="메뉴_화살표" /></a>
        </li> 
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
