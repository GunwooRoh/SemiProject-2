<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<meta charset="utf-8" />
<title>이젠,갈래? 회원가입</title>

<style>
button.btn.btn-primary {
    float: right;
    background-color: 5D6DBE;
    width: 130px;
}

.btn-primary { -
	-bs-btn-color: #fff; -
	-bs-btn-bg: #5D6DBE; -
	-bs-btn-border-color: #5D6DBE; -
	-bs-btn-hover-color: #fff; -
	-bs-btn-hover-bg: #5D6DBE; -
	-bs-btn-hover-border-color: #5D6DBE; -
	-bs-btn-focus-shadow-rgb: 49, 132, 253; -
	-bs-btn-active-color: #fff; -
	-bs-btn-active-bg: #5D6DBE; -
	-bs-btn-active-border-color: #5D6DBE; -
	-bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); -
	-bs-btn-disabled-color: #fff; -
	-bs-btn-disabled-bg: #5D6DBE; -
	-bs-btn-disabled-border-color: #5D6DBE;
}

form.row.g-3  {
	width: 700px;
	margin: 0 auto;
	align-content: center;
}

img {
	margin-bottom: 50px;
}

div#topImg {
    text-align: center;
}

dt {
	font-size: 20px;
	font-weight: bolder;
}

h3 {
	border-top: 1px solid #a2aec4;
	padding: 0;
	margin: 0 auto;
	font-size: 15px;
}

input.hotelbt {
	background: #5D6DBE;
	font-size: 13px;
	color: white;
	border-color: #5D6DBE;
	height: 2rem;
	padding: 0.3125rem 0.75rem;
	justify-content: center;
	align-items: center;
	flex: 1 1 100%;
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
	font-weight: 700;
	text-align: center;
	box-shadow: inset 0 0 0 1px #5D6DBE;
}


body {
	color: #6a6c6f;
	background-color: #f1f3f6;
	margin-top: 30px;
}

.container {
	max-width: 960px;
}

.panel-default>.panel-heading {
	color: #333;
	background-color: #fff;
	border-color: #e4e5e7;
	padding: 0;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.panel-default>.panel-heading a {
	display: block;
	padding: 10px 15px;
}

.panel-default>.panel-heading a:after {
	content: "";
	position: relative;
	top: 1px;
	display: inline-block;
	font-family: 'Glyphicons Halflings';
	font-style: normal;
	font-weight: 400;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	float: right;
	transition: transform .25s linear;
	-webkit-transition: -webkit-transform .25s linear;
}

.panel-default>.panel-heading a[aria-expanded="true"] {
	background-color: #eee;
}

.panel-default>.panel-heading a[aria-expanded="true"]:after {
	content: "\2212";
	-webkit-transform: rotate(180deg);
	transform: rotate(180deg);
}

.panel-default>.panel-heading a[aria-expanded="false"]:after {
	content: "\002b";
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.accordion-option {
	width: 100%;
	float: left;
	clear: both;
	margin: 15px 0;
}

.accordion-option .title {
	font-size: 20px;
	font-weight: bold;
	float: left;
	padding: 0;
	margin: 0;
}

.accordion-option .toggle-accordion {
	float: right;
	font-size: 16px;
	color: #6a6c6f;
}

.accordion-option .toggle-accordion:before {
	content: "Expand All";
}

.accordion-option .toggle-accordion.active:before {
	content: "Collapse All";
}

	img {
	    height: 30px;
	    margin-bottom: 10px;
	}
	
	.col-md-4 {
   		 width: 150px;
	}
	
	input#inputCity {
    width: 385px;
	}
	
	input#inputZip {
    width: 685px;
	}
	
</style>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#wr_submit").click(function() {
			if ($('#name').val().length < 1) {
				alert("이름을 입력하세요");
				$('#name').focus();				
				return false;
			}
			if (!validate_userid($('#userid').val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
				$('#userid').focus();
				return false;
			}
			if ($('#pwd').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return false;
			}
			if ($('#pwd').val() != $('#pwd2').val()) {
				alert("비밀번호가 일치하지 않습니다.확인하세요");
				$("#pwd2").focus();
				return false;
			}
			
			if (!validate_hp($("#hp2").val())
					|| !validate_hp($("#hp3").val())) {
				alert("전화번호는 숫자만 가능합니다");
				$("#hp2").focus();
				return false;
				//event.preventDefault();
			}
			
			if($('#chkId').val()!='Y'){
		         alert('아이디 중복확인을 해주세요.');
		         $('#btnChkId').focus();
		         return false;
		    }
	
		    $('#submit').click(function(){
	            if($('#dong').val().length<1){
	               $(this).after('동을 입력해주세요.');
	               event.preventDefault();
	            }
	        });
			
		});

</script>

<body>
		<!-- 상단 띠 이미지 영역-->
	
	<div id="wrap">
		<div id="topImg" class="top_Img">
			<img alt="로고 이미지" src="../image/logo.png" />
		</div>
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
						placeholder="1234 Main St">
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
						placeholder="Apartment, studio, or floor">
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
				
				<div class="col-12">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="gridCheck">
						<label class="form-check-label" for="gridCheck">  개인정보 수집 및 이용 동의 </label>
					</div>
				</div>
				<div class="col-13">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>

			<!-- JavaScript Bundle with Popper -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
				
 <%@ include file="../bottom.jsp"%> 