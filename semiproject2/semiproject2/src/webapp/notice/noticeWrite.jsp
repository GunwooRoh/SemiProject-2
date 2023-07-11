<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/top.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="/css/noticeWriteCss.css" />  -->
<title>공지사항 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type = "text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 10px;
}

.box {
	width: 1000px;
	margin: 60px auto;
}

.mb-3{
	   margin-top: 1rem;
}
strong {
	font-size: 2rem;
}

.form-select {
	margin-top: 30px;
	margin-bottom: 20px;
}

.mb-4 {
	text-align: center;
}

.mb-5{
	float:right;
}
#btn1{
	 width: 91px;
    height: 35px;
    border: 2px solid #4857A5;
    border-radius: 6px;
    background: #4857A5;
    margin-bottom:10px;
    text-align: center;
    color: white;
    font-size: 15px;
    font-weight: bold;
}
#btn2{
	 width: 91px;
    height: 35px;
    border: 2px solid #4857A5;
    border-radius: 6px;
    background: #4857A5;
    margin-bottom:10px;
    margin-left:7px;
    color: white;
    font-size: 15px;
    font-weight: bold;
}



#foot{
	clear:both;
}
</style>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src = "../tool/naver-smarteditor2-ca95d21/demo/js/service/HuskyEZCreator.js" charset = "utf-8"></script>
	<div class="box">
		<form name="frm" method="post" action="noticeWrite_ok.jsp" enctype = "multipart/form-data" >
			<strong>공지사항</strong> 
			
			<!--  <select class="form-select" aria-label="Default select example" name="selectOption">
			  <option selected>말머리 선택</option>
			  <option value="1">호텔관련</option>
			  <option value="2">예약관련</option>
			  <option value="3">기타</option>
			</select>
			-->
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">제목</label>
				<!-- 관리자번호 FK이므로 hidden 필드에 넣어서 보내주기 -->
				<input type="text" class="form-control"
					id="exampleFormControlInput1" name="annTitle" placeholder="제목을 입력해주세요.">
			</div>
			
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" name="annContent"
					rows="30" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="mb-4">
				<label for="exampleFormControlTextarea1" class="form-label">첨부파일 :</label>
				<input type="file" id = "upfile" name = "upfile"/>
			</div>
			<div class="mb-5">
				<input type="submit" id="btn1" value = "등록" onclick=submitContents()>
				<input type="reset"  id="btn2" value = "취소" onclick="noticeList.jsp">
			</div>
		</form>
	</div>
</body>
<%@ include file = "../form/bottom.jsp" %>
<script type = text/javascript" src = "../js/jquery-3.7.0.min.js"></script>
<script type = "text/javascript">
	var oEditors = [];
	
	//Editor Setting
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef: oEditors,
		elPlaceHolder: "exampleFormControlTextarea1", //아이디
		sSkinURI: "../tool/naver-smarteditor2-ca95d21/demo/SmartEditor2Skin.html",
		fCreator : "createSEditor2",	
	/*	htParams : {	//툴바 사용 여부
			bUseToolbar : true	//입력창 크기 조절바 사용 여부
			//bUseVerticalResizer : true;	//모드 탭(Editor) 사용 여부
			bUseModeChanger : true	//전송버튼 클릭
		}*/
		
	});
	
	function submitContents(){
		//에디터의 내용  textarea에 적용
		oEditors.getById["exampleFormControlTextarea1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	}
	
	$(function(){
		$('#exampleFormControlInput1').focus();
		
		$('#btn1').click(function(){
			if($('#exampleFormControlInput1').val().length<1){
				alert("제목을 입력하세요.");
				$('#exampleFormControlInput1').focus();
				return false;
			}else if($('#exampleFormControlTextarea1').val()===''){
				alert("내용을 입력하세요.");
				$('#exampleFormControlTextarea1').focus();
				return false;
			}	
			
		})
		
		$('.mb-5').hover(function(){
			$(this).css({
				'background':'white'
				'color':'#4857A5'
			})
		},function(){
			$(this).css({
				'background':'#4857A5'
				'color':'white'
			});
		}
		
	
</script>