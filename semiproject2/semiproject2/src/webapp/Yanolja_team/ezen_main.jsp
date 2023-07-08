<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Global R.E.S.T Platform</title>
  <!-- 리셋 css -->
  <link rel="stylesheet" href="./common/minireset.min.css">
  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
  <!-- og -->
  <meta property="og:site_name" content="Yanolja">
  <meta property="og:title" content="Global R.E.S.T. Platform">
  <meta property="og:description" content="야놀자는 누구나 마음 편히 놀 수 있게 여가의 패러다임을 전환합니다">
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
    	<
      <h1>
      
        <a href="./index.html"><img src="./img/logo.svg" alt="야놀자_로고" /></a>
      </h1>
      <ul id="gnb">
        <li><a href="./About/ya_About.html">About</a></li>
        <li>
          <a href="./whatWeDo/whatWeDo.html">what we do</a>
          <ul class="subMenu">
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
          <a href="#">Careers <img src="./img/arrow_outlink.svg" alt="메뉴_화살표" /></a>
        </li>
        <li id="menuLang">
          <a href="#" id="langKr">KOR</a><a href="#" id="langEng">ENG</a>
        </li>
      </ul>
    </header>
  </div>

  <!-- <div class="btn-scroll-holder"></div> -->

  <div id="bgContainer">
    <!-- bgContainer : 모든 콘텐츠 담은 컨테이너 -->
    <div id="bgBox">
      <!-- bgBox : background 이미지만 적용된 div. -->
    </div>
    <div class="bgMask">
      <!-- bgMask : 원에서 커지는 마스크 용도. 필수 -->
      <div class="clipImg"></div>
      <!-- clipImg : 마스크 내부 background로 이미지 적용 -->
      <!-- fullScreen -->
      <section class="fullScreen">
        <video loop autoplay muted src="./img/index.mp4"></video>
        <div class="fullScreenText">
          <div class="emtpy"></div>
          <div class="txt">
            <p><span class="del">누구나</span></p>
            <p><span class="del1">마음 편히</span></p>
            <p><span class="del2">쉴 수 있게</span></p>
          </div>
        </div>
      </section>
    </div>

    <!-- fullScreen -->
    <section class="fullScreen">
      <video loop autoplay muted src="./img/index.mp4"></video>
      <div class="fullScreenText">
        <div class="emtpy"></div>
        <div class="txt">
          <p><span class="del">누구나</span></p>
          <p><span class="del1">마음 편히</span></p>
          <p><span class="del2">놀 수 있게</span></p>
        </div>
      </div>
    </section>

    <!-- ------ sec1 ------ -->
    <section class="sec1">
      <div class="container">
        <div class="sec1Txt txtBox">
          <em>Platform business</em>
          <h1 class="title">
            <p><span class="del">당신의</span></p>
            <p><span class="del1">모든 여행</span></p>
          </h1>
          <div class="sTxtWrapper">
            <p class="sTxt">
              이젠, 갈래?<em>만 있으면<br>
                누구나 언제 어디서든<br>
                여행을 즐길 수 있습니다.</em>
            </p>
          </div>
          <div class="hovBox">
            <span>
              <img src="./img/ind_arrow-whLong.svg" alt="흰긴화살표">
            </span>
            <a href="./whatWeDo.html">Platform business</a>
            <img src="./img/ind_arrow-long.svg" alt="긴화살표" class="gone">
          </div>
        </div>
        <!-- /sec1_txt -->

        <div class="logoVidoeWrapper">
          <video loop autoplay muted src="./img/index_platform.mp4"></video>
          <div class="whLogo">
            <img src="./img/index_logo_ya_white.svg" alt="white_logo">
          </div>
        </div>
      </div> <!-- /container -->
    </section>
    <!-- ------ sec2 ------ -->
    <section class="sec2">
      <div class="container">
        <div class="sec2Txt txtBox">
          <em>Hospitality solution</em>
          <h1 class="title">
            <p><span class="del">편리하게 즐기는</span></p>
            <p><span class="del1">여행 기술</span></p>
          </h1>
          <div class="sTxtWrapper">
            <p class="sTxt">
              <em>클라우드 기반 호텔 자동화 솔루션</em><br>
              Y FLUX<em>를 통해 체크인부터 체크아웃까지<br>
                마음 편히 즐길 수 있는 똑똑한 여행 기술을 고민합니다.</em>
            </p>
          </div>
          <div class="hovBox">
            <span>
              <img src="./img/ind_arrow-whLong.svg" alt="긴화살표">
            </span>
            <a href="./whatWeDo.html">Hospitality solution</a>
            <img src="./img/ind_arrow-whLong.svg" alt="긴화살표" class="gone">
          </div>
        </div> <!-- sec2_txt -->
      </div> <!-- container -->
    </section>
    <!-- ------ sec3 ------ -->
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
                <em>호텔부터 문화·주거 공간까지<br>
                  공간에 대한 모든 서비스를 제공합니다.</em>
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