<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/header.jsp"%>
<style type="text/css">
.mainCookie{
	text-align: center;
}

h1 {
	margin-top: 20px;
}

.cookie1 {
	width: 70%;
	border: 2px solid #a6b1bc;
	margin: 0 auto;
	border-radius : 20px;
	background: #e9f0fd;
}

.cookie1>p{
	margin : 20px 30px;
}

.information {
	width: 70%;
	border: 2px solid #a6b1bc;
	margin: 0 auto;
	border-radius : 20px;
	background: #e9f0fd;
}

.cookie2>h3{
	text-align: left;
	margin-left: 15%;
	margin-top : 30px;
	margin-bottom:20px;
	font-weight: bold;
}
.cookieMethod {
	width: 70%;
	border: 2px solid #a6b1bc;
	margin: 0 auto;
	border-radius : 20px;
	background: #e9f0fd;
}
.information>p{
	margin : 20px 30px;
}
.cookie1>img{
	width: 350px;
}

.cookie3>h3{
	text-align: left;
	margin-left: 15%;
	margin-top : 30px;
	margin-bottom:20px;
	font-weight: bold;
}

.cookieMethod>p{
	margin : 20px 30px;
}
</style>
<link rel="stylesheet" href="../css/css.css">
<title>개인정보처리방침</title>

<body>
	<div class="mainCookie">
		<div class="cookie_title">
			<h1>개인정보처리방침</h1>
			<p>2022년 11월 22일 화요일</p>
		</div>


		<div class="cookie1">
			<img src = "../images/info_1.png">
			<h3><strong>투명한 정보 공개와 정책 시행</strong></h3>
			<p>
				고객 정보의 수집, 이용 및 공유는 본 처리방침에 규정된 방식으로만 이루어집니다.
			</p>
			<img src = "../images/info_2.png">
			<h3><strong>고객 정보의 보안 유지</strong></h3>
			<p>
				고객이 제공한 개인 데이터의 기밀 유지 및 보안에 최선을 다합니다.
			</p>
			<img src = "../images/info_3.png">
			<h3><strong>개인정보 설정은 고객의 자유</strong></h3>
			<p>
				언제든 프로필 및 알림 수신 설정을 업데이트하실 수 있습니다.
			</p>
		</div>
		<div class="cookie2">
			<h3>정책 정보</h3>
			<div class="information">
				<p>
					서비스 약관 및 쿠키 정책과 함께 개인정보처리방침에서는 당사의 모든 웹사이트, 
					모바일 앱 및 기타 서비스에서 고객의 정보를 수집하고 처리하는 방법을 설명합니다. 
					당사는 수시로 본 처리방침을 검토하여 최신 내용을 유지합니다. 내용이 변경되는 경우에는 
					여기에 최신 버전을 게시합니다. 내용의 상당 부분이 변경되는 경우, 고객이 <strong>이젠, 갈래?</strong> 
					서비스에 접속할 때나 별도의 연락을 통해 알려드립니다.
				</p>
			</div>
		</div>
		<div class="cookie2">
			<h3>고객의 개인 데이터를 이용하는 목적 및 방법</h3>
			<div class="information">
				<p>
					당사는 고객이 동의한 경우, 고객이 요청한 서비스를 제공하는 데 정보가 필요한 경우, 
					법적 권한이나 의무를 행사하거나 준수하는 데 정보가 필요한 경우 또는 본 처리방침에서 
					규정한 일반적인 비즈니스상의 목적에 한해서만 고객의 정보를 이용합니다.
				</p>
			</div>
		</div>
		
		<div class="cookie3">
			<h3>고객의 개인 데이터를 저장하는 기간</h3>
			<div class="cookieMethod">
				<p>
					데이터는 필요한 기간만큼 또는 법적인 이유로 요구되는 기간 동안만 보관합니다. 
					그 이후에는 삭제하거나 익명화하여 개인을 식별할 수 없게 합니다. 사용 목적에 따라 
					데이터를 다르게 처리하지만, 언제든 개인 데이터를 삭제해달라고 요청할 수 있습니다.
				</p>
			</div>
		</div>
		<div class="cookie3">
			<h3>자세한 정보</h3>
			<div class="cookieMethod">
				<p>
					본 정책에 관해 질문이 있거나 <strong>이젠, 갈래?</strong> 웹사이트에서 사용되는 고객 개인 데이터에 관한 자세한 내용을 확인하려면 
					당사로 문의해 주시기 바랍니다.
				</p>
			</div>
		</div>
	</div>
	
	<%@include file="../form/bottom.jsp"%>