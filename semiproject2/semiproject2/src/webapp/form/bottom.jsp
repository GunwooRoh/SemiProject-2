<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#foot {
	background-color: #4857A5;
	color: white;
	padding: 0;
	margin: 0;
	outline: none;
	padding: 0;
	margin-top: 40px;
	font-size: 14px;
	font-style: italic;
	box-sizing: border-box;
	border: none;
	width:1576px;
}

.row {
	padding: 1em 1em;
	display: flex;
	flex-wrap:nowrap;
	flex-direction: row;
	justify-content: space-around;
}

.row>.col{
	display: grid;
	justify-content: space-around;
    justify-items: start;
}

.col>h5{
	text-decoration: underline;
}
#div4>img {
	width: 30px;
}

.copyright {
    text-align: center;
    padding: 15px;
}

.h5, h5 {
    font-size: 1.2em;
    font-weight: bold;
}

.row a{
	text-decoration:none;
	color : white;
}

.row a:hover{
	text-decoration:underline;
}
</style>

<footer id="foot">
	<div class="row">
		<div class="col" id="div1">
			<h5>이젠, 갈래?</h5>
			<a href="#">회사소개</a><br> 
			<a href="#">사업자 정보 확인</a><br>
		</div>
		<div class="col" id="div2">
			<h5>정책 사항</h5>
			<a href="../footer/cookiePolicy.jsp">쿠키정책</a><br> 
			<a href="../footer/infomationCheck.jsp">개인정보처리방침</a><br> 
			<a href="../footer/term_of_Service.jsp">서비스 약관</a><br>
		</div>
		<div class="col" id="div3">
			<h5>도움말</h5>
			<a href="#">개인정보 설정</a><br> 
			<a href="#">로그인</a><br>
		</div>
		<div class="col" id="div4">
			<h5>contact us</h5>
			<img src="../images/facebook.png"> 
			<img src="../images/instagram.png"> 
			<img src="../images/youtube.png">
		</div>
	</div><br>
	<div class="copyright">
		<p>
			전국 호텔을 편리하게 비교하고 예약하세요 <br>Ltd 2002 – 2023 (admin@ezen.com) </br>
			Copyright &copy; 2023 <a href="#" class="green">이젠,갈래?</a> All Rights
			Reserved.
		</p>
	</div>
</footer>
</html>