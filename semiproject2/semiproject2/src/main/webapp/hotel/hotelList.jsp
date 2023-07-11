<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>


<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Album example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/album/">

    

    

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
		search{
		  padding-top: 75px;
		}
		
		.search-container{
		  width: 490px;
		  display: block;
		  margin: 0 auto;
		}
		
		input#search-bar{
		  margin: 0 auto;
		  width: 100%;
		  height: 45px;
		  padding: 0 20px;
		  font-size: 1rem;
		  border: 1px solid #D0CFCE;
		  outline: none;
		  &:focus{
		    border: 1px solid #008ABF;
		    transition: 0.35s ease;
		    color: #008ABF;
		    &::-webkit-input-placeholder{
		      transition: opacity 0.45s ease; 
		  	  opacity: 0;
		     }
		    &::-moz-placeholder {
		      transition: opacity 0.45s ease; 
		  	  opacity: 0;
		     }
		    &:-ms-placeholder {
		     transition: opacity 0.45s ease; 
		  	 opacity: 0;
		     }    
		   }
		 }
		
		.search-icon{
		  position: relative;
		  float: right;
		  width: 75px;
		  height: 75px;
		  top: -62px;
		  right: -10px;
		}
		
		#py5{
			background-color: white;
		}
		      
    </style>

    
  </head>
<main>
	<section class="py-5 text-center container" id="py5">
	<div id="search">
		<form class="search-container">
			<input type="text" id="search-bar"
				placeholder="어디,갈래?"> <a href="#"><img
				class="search-icon"
				src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
		</form>
	</div>
	</section>
	<div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
      
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="../images/lottecityjeju.jpg" class="card-img-top" alt="호텔 이미지">
            <div class="card-body">
              <h5 class="card-title" value="" style="color: black">롯데시티호텔 제주</h5>
              <p class="card-text" style="color: black">5성급 호텔&nbsp;&nbsp;&nbsp;￦78,000원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">여기 갈래!</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">리뷰</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
			
      </div>
    </div>
  </div>

</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      
<!-- 그리드닫기 -->


<%@include file="../inc/bottom.jsp"%>