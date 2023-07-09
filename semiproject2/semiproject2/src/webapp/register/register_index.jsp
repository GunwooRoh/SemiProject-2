<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!doctype html>
<html lang="ko">
  <head>
    <title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">

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

	</style>
    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="../images/signup.png" alt="" width="100" height="100">
      <h2>회원 가입</h2>
      <p class="lead"> 회원가입을 환영합니다.
     				<br>해당되는 정보값을 입력해주세요.
      </p>
    </div>


      </div>
      <div class="center-div">
        <h4 class="mb-3"></h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="id" class="form-label">아이디</label>
              <input type="text" class="form-control" id="id"  name="id" placeholder="" value="" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>


            <div class="col-12">
              <label for="pwd" class="form-label">비밀번호</label>
              <input type="text" class="form-control" id="pwd" name="pwd" >
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
            
            <div class="col-12">
              <label for="name" class="form-label">이름 </label>
              <input type="email" class="form-control" id="name" name="name" placeholder="홍길동">
              <div class="invalid-feedback">
               <div class="invalid-feedback">
                Valid first name is required.
              </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">Email </label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="col-md-5">
              <label for="age" class="form-label" name="age" id="age">나이 연령대</label>
              <select class="form-select" id="country" required>
                <option value="">Choose...</option>
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
            <input type="checkbox" class="form-check-input" id="agreejoin">
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
              <label for="cc-number" class="form-label">Credit card number</label>
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


