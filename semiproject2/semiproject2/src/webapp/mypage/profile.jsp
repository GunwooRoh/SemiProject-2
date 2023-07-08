<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


<style>

	div#wrap_profile {
	    padding: 2rem;
	    margin: 0 auto;
	}

	div#bt {
	    padding: inherit;
	    display: flex;
	    justify-content: center;
        margin-top: 80px;
	}
	
	 button.btn.btn-primary {
    	width: 200px;
	}
	 
	svg.bi.bi-airplane-fill {
   	 	margin: 5px;
	}
	
	svg.bi.bi-calendar-check {
    	margin: 5px;
	}
	
	svg.bi.bi-person-circle {
  	  margin: 5px;
	}
	
	.col-md-4 {
    	width: 150px;
	}
	
	
	form.row.g-3 {
	    width: 1000px;
	    margin-left: 300px;
	}
	
	input#inputCity {
		width: 685px;
	}

</style>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">

</script>

<selection id="profile">
	<!-- 상단 띠 이미지 영역-->
	<!-- <div id="topImg" class="top_Img">
		<img alt="로고 이미지" src="../image/logo.png" />
	</div> -->

	<div id="wrap_profile">

		<!-- 라인 이미지 영역-->
		<div id="topLine" class="top_Line"
			style="background:url(<%=request.getContextPath()%>/images/line6.jpg)  repeat-x;font-size:7px">
			&nbsp;</div>

		<!-- infor -->
		<div id="infor">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-airplane-fill" viewBox="0 0 16 16">
							  <path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Z"/>
							</svg>
							여행객 정보
							입력</button>
					</h2>
					
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
						<body>
		<!-- 상단 띠 이미지 영역-->
	
		<!-- infor -->
		<div id="register">
			<form class="row g-3">
				<div class="col-md-6">
					<label for="inputEmail4" class="form-label">아이디</label> <input
						type="email" class="form-control" id="inputEmail4">
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">비밀번호</label> <input
						type="password" class="form-control" id="inputPassword4">
				</div>
				<div class="col-12">
					<label for="inputAddress" class="form-label">이름</label> <input
						type="text" class="form-control" id="inputAddress"
						placeholder="홍길동">
				</div>
				<div class="col-md-6">
					<label for="inputEmail4" class="form-label">주민번호</label> <input
						type="email" class="form-control" id="inputEmail4">
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">기입 </label> 
					<input type="password" class="form-control" id="inputPassword4">
				</div>
				<div class="col-12">
					<label for="inputAddress2" class="form-label">이메일</label> <input
						type="text" class="form-control" id="inputAddress2"
						placeholder="abc@ezengo.com">
				</div>
				<div class="col-md-4">
					<label for="inputState" class="form-label">국가번호</label> <select
						id="inputState" class="form-select">
						<option>+82</option>
						<option>+00</option>
						<option>+00</option>
						<option>+00</option>
					</select>
				</div>
				<div class="col-md-4">
					<label for="inputState" class="form-label">전화번호</label> <select
						id="inputState" class="form-select">
						<option>010</option>
						<option>070</option>
						<option>031</option>
						<option>011</option>
					</select>
				</div>
				<div class="col-md-6">
					<label for="inputCity" class="form-label"> ' - ' 제외 입력하세요</label> 
					<input type="text" class="form-control" id="inputCity">
				</div>
				
				<div class="col-13 d-flex justify-content-center">
				  <button type="submit" class="btn btn-primary">회원정보수정</button>
				</div>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
							  <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
							  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
							</svg>
							내 예약</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<strong>This is the second item's accordion body.</strong> It is
							hidden by default, until the collapse plugin adds the appropriate
							classes that we use to style each element. These classes control
							the overall appearance, as well as the showing and hiding via CSS
							transitions. You can modify any of this with custom CSS or
							overriding our default variables. It's also worth noting that
							just about any HTML can go within the
							<code>.accordion-body</code>
							, though the transition does limit overflow.
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
							내 계정</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<strong>This is the third item's accordion body.</strong> It is
							hidden by default, until the collapse plugin adds the appropriate
							classes that we use to style each element. These classes control
							the overall appearance, as well as the showing and hiding via CSS
							transitions. You can modify any of this with custom CSS or
							overriding our default variables. It's also worth noting that
							just about any HTML can go within the
							<code>.accordion-body</code>
							, though the transition does limit overflow.
						</div>
					</div>
				</div>
			</div>

		</div>
	 <div id="bt" > 
		<button type="button" class="btn btn-primary" disabled>로그아웃</button>
	 </div>
	
	</div><!-- wrap -->
	
</selection>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
