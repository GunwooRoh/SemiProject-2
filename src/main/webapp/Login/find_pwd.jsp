<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<head>
<script type="text/javascript">

	function pwd_search() { 
	 	var frm = document.pwdfindscreen;
	
	 	if (frm.id.value.length < 1) {
		  alert("id를 입력해주세요");
		  return;
		 }
	 	 
	 	/* if (frm.tel.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 } */
	 	
		 frm.method = "post";
		 frm.action = "findpwdResult.jsp"; //넘어간화면
		 frm.submit();  
		 }
	
</script>
</head>
<style>
input.btn-phone {
    width: 200px;
}

input.btn-id {
    margin-left: 18px;
    width: 200px;
}

    
</style>

<body>

<form name="pwdfindscreen" method = "POST">
			<div class = "search-title">
				<h3>아이디 및 카드번호 본인확인</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>id</label>
				<input type="text" name="id" class = "btn-id" placeholder = "등록한 id">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text" onKeyup = "addHypen(this);" name="tel" class = "btn-phone" placeholder = "등록된 카드번호를 '-'없이 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="pwd_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>

</body>
</html>
