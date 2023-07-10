<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!doctype html>
<html lang="ko">
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">
<script type="text/javascript">
	function join(){
		
/* 		
		if(!form.id.readOnly){
			alert("아이디 중복 검사를 진행해주세요.");
			return;
		}
		
		
		//8자리 이상, 대문자, 소문자, 숫자, 특수문자 모두 포함되어 있는 지 검사
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/ */
		
		$(document).ready(function() {
			  $('#chkId').click(function() {
			    var id = $('#id').val();
			    open('checkId.jsp?id=' + id);
			  });
			});

		 /* function chkId() {
		     var id = document.getElementById("id").value;
		     window.location.href = 'checkId.jsp?id=' + id;
		 } */
	/* 	form.submit(); */

		
	});
	
</script>
  	<style>  
	    .center-div {
			 width: 1000px;
			 margin: 0 auto;
		}
		
		.form-control {
		  display: block;
		  width: 1000px;
		  }
		  
		  h2 {
		    font-weight: bold;
		  }
		  
		  .col-md-6 {
			    width: 100%;
			}
		
		input#cc-cvv {
		    width: 150px;
		}
		
		input#cc-expiration {
		    width: 200px;
		}
		
		input#cc-number {
		    width: 400px;
		}
		
		input#cc-name {
		    width: 400px;
		}

		body.bg-light {
		  transform: scale(0.8);
		}
		
		.btn-primary {
			background-color: #5D6DBE;
		}
		
		.btn-primary {
		    --bs-btn-color: #fff;
		    --bs-btn-bg: #97a0ad;
		    --bs-btn-border-color: #97a0ad;
		    --bs-btn-hover-color: #fff;
		    --bs-btn-hover-bg: #97a0ad;
		    --bs-btn-hover-border-color: #97a0ad;
		    --bs-btn-focus-shadow-rgb: 49,132,253;
		    --bs-btn-active-color: #fff;
		    --bs-btn-active-bg: #97a0ad;
		    --bs-btn-active-border-color: #97a0ad;
		    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
		    --bs-btn-disabled-color: #fff;
		    --bs-btn-disabled-bg: #97a0ad;
		    --bs-btn-disabled-border-color: #97a0ad;
		}
	</style>
    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
    
    <title>회원가입</title>
  <body class="bg-light">
  <main>
    <div class="py-5 text-center">
    <form name="frm1" method="post" action="signup_ok.jsp">
      <img class="d-block mx-auto mb-4" src="../images/signup.png" alt="" width="100" height="100">
      <h2>회원 가입</h2>
      <p class="lead"> 회원가입을 환영합니다.
     				<br>해당되는 정보값을 입력해주세요.
      </p>
    </div>


      </div>
      <div class="center-div">
        <form class="needs-validation" novalidate>
            <div class="col-sm-6">
			  <div class="form-group">
			    <label for="id" class="form-label" name="id">아이디</label>
			    <div class="input-group">
			      <input type="text" class="form-control" id="id" name="id" placeholder="" value="" required>
			      &nbsp;&nbsp;<button type="button" class="chkId" id="chkId" name="chkId" onclick="chkId" required>아이디 중복 확인</button>
			    </div>
			    <div class="invalid-feedback">유효한 아이디가 필요합니다.</div>
			  </div>
			</div>


            <div class="col-12">
              <label for="pwd" class="form-label">비밀번호</label>
              <input type="pwd" class="form-control" id="pwd" name="pwd" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
            
            <div class="col-12">
              <label for="name" class="form-label">이름 </label>
              <input type="text" class="form-control" id="name" name="name" placeholder="홍길동" required>
              <div class="invalid-feedback">
               <div class="invalid-feedback">
                Valid first name is required.
              </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">Email </label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
            </div>
            
            <div class="col-12">
              <label for="tel" class="form-label">전화번호 </label>
              <input type="tel" class="form-control" id="tel" name="tel" placeholder="010-8888-8888" required>
            </div>

            <div class="col-md-5">
              <label for="age" class="form-label" name="age" id="age">(나이)연령대</label>
              <select class="form-select" name="age" id="age" required>
				  <option value="age" required>--선택하세요--</option>
				  <option>10대</option>
				  <option>20대</option>
				  <option>30대</option>
				  <option>40대</option>
				  <option>50대</option>
				  <option>60대</option>
				  <option>70대 이상</option>
				</select>
              <div class="invalid-feedback">
                Please select a valid age.
              </div>
            </div>

          <hr class="my-4">
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="form-check-input" required>
            <label class="agreejoin" for="agreejoin">가입 시, 계정 및 서비스 이용약관 "이젠,갈래?" 개인정보처리방침에 동의합니다.</label>
          </div>
			<hr class="my-4">
			
			<div class="pay">
          <h4 class="mb-3">지불방법</h4>
          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">신용카드</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">체크카드</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">삼성페이</label>
            </div>
          </div>
		</div>
		
          <div class="row">
            <div class="col">
              <label for="cc-name" class="form-label">Name on card</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required>
              <small class="text-muted">Full name as displayed on card</small>
              <div class="invalid-feedback">
                Name on card is required
              </div>
            </div>

            <div class="col">
              <label for="cc-number" class="form-label" id="card" name="card">Credit card number</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required>
              <div class="invalid-feedback">
                Credit card number is required
              </div>
            </div>

            <div class="col">
              <label for="cc-expiration" class="form-label">Expiration</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>

            <div class="col">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
              <div class="invalid-feedback">
                Security code required
              </div>
            </div>
          </div>


          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
        </form>
      </div>
</main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2023 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  
  </body>
</html>

