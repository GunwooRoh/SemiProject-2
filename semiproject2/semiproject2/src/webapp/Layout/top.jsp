<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"></script>

	<style>
	head {
	header {
		margin: 0 auto;
		padding: 0;
		align-content: center;
		background-color: #4c599d;
	}
	
	div#wrap {
	div#wrap_top {
    padding: 2rem;
    background-color: #5D6DBE;
    height: 180px;
    margin: 0 auto;
	}
	
	/* div#wrap {
		padding: 2rem;
		background-color: #5D6DBE;
		height: 200px;
		margin: 0 auto;
	} */
	
	div#toplogo {
		margin: 0 auto;
		align-content: center;
		background-color: #5D6DBE;
		color: white;
		padding: 0;
		font-size: 20px;
		font-weight: bolder;
	}
    /* height: 145px; */
        background-color: white;
 }
 
	
	
	input.bt1 {
		background: lightgray;
	input.bt1_top {
		background: white;
		font-size: 13px;
		border-color: #5D6DBE;
		height: 2rem;
@@ -58,11 +41,13 @@
		font-weight: 700;
		text-align: center;
		box-shadow: inset 0 0 0 1px #5D6DBE;
		float: left;
		float: right;
		margin-top: 20px;
	    margin-right: 10px;
	}
	
	input.bt2 {
		background: lightgray;
	input.bt2_top {
		background: white;
		font-size: 13px;
		border-color: #5D6DBE;
		height: 2rem;
@@ -74,40 +59,34 @@
		text-align: center;
		box-shadow: inset 0 0 0 1px #5D6DBE;
		float: right;
		margin-top: 20px;
	}
	
	.topbt {
		margin-top: 100px;
	}
	
	span {
		font-shadow: inset 0 0 0 1px #5D6DBE;
	.topbt_top {
		margin-top: 65px;
		    float: right;
	}
	
	img {
	.logoimg_top {
	    vertical-align: middle;
	    height: 30px;
	    height: 70px;
	    margin-bottom: 10px;
	    margin-left: 30px;
	    margin-top: 10px;
	}
	
	</style>


<body>
<header>
	<!-- Top page -->	
		<div id="topImg" class="top_Img">
			<img alt="로고 이미지" src="../image/logo.png" />
			 <a href="https://www.skyscanner.co.kr/"><img alt="로고 이미지" src="../image/logoWhite.png" class="logoimg_top" /></a>
				<a href="https://www.skyscanner.co.kr/hotels"><input type="button" value="🏛️EZEN MAIN" class="bt1_top"/></a> 
			 	<a href="https://www.skyscanner.co.kr/profile"><input type="button" value="Login" class="bt2_top"></a>
		</div>

<head>
	<div id="wrap" class="wrap">
		<div class="topbt">
					<br> <input type="button" value="🏛️EZEN MAIN" class="bt1" href="https://www.naver.com"> 
						 <input type="button" value="Login" class="bt2">
		</div>
	</div>
</head>
</header>