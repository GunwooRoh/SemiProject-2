<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	  rel="stylesheet"
	  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	  crossorigin="anonymous">
	  
<link href = "https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel = "stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../font/font.css">
<!-- <link rel="stylesheet" href="../css/top.css"/> -->
		
<title>let's go EZEN</title>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript"></script>

	<style>
	header {
		margin: 0 auto;
		padding: 0;
		align-content: center;
		background-color: #4c599d;
		font-family: 'Nanum Gothic', sans-serif;
	    height: 130px;
		
	}
	
	div#wrap_top {
    padding: 2rem;
    /* height: 145px; */
        background-color: white;
 }
 
	
	input.bt1_top {
		background: white;
		font-size: 13px;
		border-color: #5D6DBE;
		height: 2rem;
		padding: 0.3125rem 0.75rem;
		align-items: center;
		flex: 1 1 100%;
		border-radius: 1rem;
		font-weight: 700;
		text-align: center;
		box-shadow: inset 0 0 0 1px #5D6DBE;
		float: right;
		margin-top: 20px;
	    margin-right: 10px;
	}
	
	input.bt2_top {
		background: white;
		font-size: 13px;
		border-color: #5D6DBE;
		height: 2rem;
		padding: 0.3125rem 0.75rem;
		align-items: center;
		flex: 1 1 100%;
		border-radius: 1rem;
		font-weight: 700;
		text-align: center;
		box-shadow: inset 0 0 0 1px #5D6DBE;
		float: right;
		margin-top: 20px;
	}
	
	.topbt_top {
		margin-top: 65px;
		    float: right;
	}
	
	.logoimg_top {
	    vertical-align: middle;
	    height: 70px;
	    margin-bottom: 10px;
	    margin-left: 30px;
	    margin-top: 30px;
	}
	
	#menu a {
    text-decoration: none;
    color: white;
   font-family: 'Nanum Gothic', sans-serif;
}

	#nav_join{
		position:relative;
		float:right;
		top:45px;
		margin-right:18px;
		font-size : 1.2rem;
	}
	
	#nav_join>span{
		color : white;
	}
	
	#nav {
    position: relative;
    float: right;
    margin-right: 70px;
    font-size: 1.5rem;
    font-family: inherit;
    top: 45px;
}

#topImg img{
	float:left;
}
	</style>


<body>
<header>
	<!-- Top page -->	
		<div id="topImg" class="top_Img">
			 <a href="https://www.skyscanner.co.kr/">
			 	<img alt="로고 이미지" src="../images/logoWhite.png" class="logoimg_top" />
			 </a>
				<!-- <a href="https://www.skyscanner.co.kr/hotels">
					<input type="button" value="🏛️EZEN MAIN" class="bt1_top"/></a> 
			 	<a href="https://www.skyscanner.co.kr/profile">
			 		<input type="button" value="Login" class="bt2_top">
		 		</a>-->
		 		<div id = "menu">
			 		<div id = "nav_join">
			 			<a href = "#">마이페이지</a>
			 			<span> | </span> 
			 			<a href = "#">Logout</a>
			 		</div>
			 		<div id = "nav">
			 			<a href = "../notice/noticeList.jsp">공지사항</a>
			 		</div>
			 		<div id = "nav">
			 			<a href = "#">호텔검색</a>
			 		</div>
		 		</div>
		</div>
		
</header>



