<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/top.jsp"%>

<title>공지사항 등록</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 10px;
}

.box {
	width: 1000px;
	margin: 80px auto;
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
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src = "../tool/naver-smarteditor2-ca95d21/demo/js/service/HuskyEZCreator.js" charset = "utf-8"></script>
	<div class="box">
		<form name="frm" method="post" action="noticeWrite_ok.jsp">
			<strong>공지사항</strong> <select class="form-select"
				aria-label="Default select example">
				<option selected>말머리 선택</option>
				<option value="1">호텔관련</option>
				<option value="2">예약관련</option>
				<option value="3">기타문의</option>
			</select>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">제목</label>
				<input type="text" class="form-control"
					id="exampleFormControlInput1" placeholder="제목을 입력해주세요.">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" name = "textTest"
					rows="30" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="mb-4">
				<button type="submit" id="btn1" onclick="submitContents()">전송</button> 
				<button type="reset"  id="btn2" >취소</button>
			</div>
		</form>
	</div>
<%@ include file = "../form/bottom.jsp" %>
<script type = "text/javascript">
	var oEditors = [];
	
	//Editor Setting
	nhn.husky.EZCreator.createInIFrame({ oAppRef: oEditors,
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
</script>