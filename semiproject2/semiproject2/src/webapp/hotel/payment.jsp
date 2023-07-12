<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<script type="text/javascript" src="../jquery/jquery-1.11.3.min.js"></script>
<title>reservation</title>
<script type="text/javascript">

</script>

<script type = "text/css">
</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">

    
    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h2>예약정보</h2>
      <p class="lead">이젠,갈래 예약을 진행합니다</p>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">요금내역</span>
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">디럭스룸</h6>
            </div>
            <span class="text-muted">100000원</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">총 명</h6>
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">3박</h6>
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>Total (\)</span>
            <strong>300000\</strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Promo code">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </form>
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원 정보</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="Name" class="form-label">이름</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">아이디</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" placeholder="Username" required>
              <div class="invalid-feedback">
                  아이디를 입력해주세요.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted"></span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                이메일을 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="tel" class="form-label">전화번호</label>
              <input type="text" class="form-control" id="tel" placeholder="010-1234-5678" required>
              <div class="invalid-feedback">
                전화번호를 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
              <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
            </div>

            <div class="col-md-5">
              <label for="country" class="form-label">국가명</label>
              <select class="form-select" id="country" required>
                <option value="">선택해주세요</option>
                <option>대한민국</option>
              </select>
              <div class="invalid-feedback">
                올바른 국가명을 기입해주세요.
              </div>
            </div>

            <div class="col-md-4">
              <label for="state" class="form-label">시, 도</label>
              <select class="form-select" id="state" required>
                <option value="">선택해주세요</option>
                <option>서울특별시</option>
                <option>경기도</option>
                <option>대전광역시</option>
                <option>대구광역시</option>
                <option>부산특별시</option>
              </select>
              <div class="invalid-feedback">
                올바른 시, 도를 기입해주세요.
              </div>
            </div>

            <div class="col-md-3">
              <label for="zip" class="form-label">우편번호</label>
              <input type="text" class="form-control" id="zip" placeholder="" required>
              <div class="invalid-feedback">
               올바른 우편번호를 기입해주세요.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">정보 제공에 동의합니까?</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">다음에도 이 정보를 사용합니다.</label>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">결제수단</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">신용카드</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">토스</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">카카오페이</label>
            </div>
          </div>

          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">소유주 이름</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required>
              <small class="text-muted">카드 소유주의 이름을 기입해주세요.</small>
              <div class="invalid-feedback">
                올바른 카드 소유주의 이름을 기입해주세요.
              </div>
            </div>

            <div class="col-md-6">
              <label for="cc-number" class="form-label">카드번호</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required>
              <div class="invalid-feedback">
               올바른 카드번호를 기입해주세요
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">유효기간</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                올바른 카드 유효기간을 기입해주세요.
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
              <div class="invalid-feedback">
                올바른 CVV 코드를 기입해주세요.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">결제완료</button>
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
