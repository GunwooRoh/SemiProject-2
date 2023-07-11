<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file = "../mainpage/mainTop.jsp" %> --%>
<jsp:useBean id="memberVO" class="com.member.model.MemberVO" scope="session"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
 <script type="text/javascript">
	
		function login() {
		  var id = document.getElementById("id").value;
		  var pwd = document.getElementById("pwd").value;

		  if (id.equals("admin") && pwd.equals("admin123")){
		    alert("관리자로 로그인되었습니다.");
		  } else {
		    alert("아이디 또는 비밀번호가 잘못되었습니다.");
		  }
		}
	
	  	//아이디 정규식
		$(function() {
			$("#submit").click(function() {
				
				if ($('#id').val().length < 1) {
					alert("아이디를 입력하세요");
					$('#id').focus();	
					return false;
				}
				
				if ($('#pwd').val().length < 1) {
					alert("비밀번호를 입력하세요");
					$('#pwd').focus();
					return false;
				}
				
			});
		});
			
			
</script>

<style>
* {
	margin: 0 auto;
	padding: 0;
	align-content: center;
}

#leftText { /*아이디, 비밀번호 글씨 부분*/
	width: 150px;
	height: 40px;
	display: flex; /*div를 float를 사용했기 때문에 정렬을 위해서 flex로 설정*/
	justify-content: left; /*horizontal left */
	align-items: center; /*상하 정렬*/
	font-size: 15px; /*글씨 사이즈*/
	font-weight: bold;
	/*border: 1px solid black;*/
	/*margin-top: 10px;*/
}

#inputText { /*텍스트 입력 부분*/
	width: 180px;
	height: 40px;
	/*border: 1px solid black;*/
	display: flex;
	font-size: 20px;
	justify-content: left;
	vertical-align: middle;
}

#securityText { /*보안접속 부분*/
	align-items: center;
	font-size: 12px;
	margin-top: 15px;
}

#main { /*기본 바탕 부분 div*/
	width: 700px;
	height: 100px;
	/*border: 1px solid red;*/
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 80px;
}

#mainLogo { /*로그인 타이틀*/
	height: 200px;
	/*border: 1px solid red;*/
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}

#main2Left { /*로그인 div를 넣을 div*/
	width: 500px;
	/*border: 1px solid red;*/
	vertical-align: middle;
	align-content: center;
}

#main2Right { /*로그인 버튼을 넣을 div*/
	/*border: 1px solid red;*/
	display: flex;
}

#loginTitle {
	margin-top: 30px;
	text-shadow: 3px 1px 2px #666eb8;
	color: #4E266D; /* login 색깔*/
	font-size: 50px;
	font-weight: bold;
    display: block;
    margin: 0 auto;
    text-align: center;
}

#submit { /*로그인 버튼*/
	width: 80px;
	height: 80px;
	text-align: center;
	background-color: #4E266D;
	color: white;
	border: 1px solid #4e266d;
	margin-left: 60px;
	font-size: small;
	font-weight: bold;
}

input#button {
	border-radius: 1rem;
	font-weight: 700;
	box-shadow: inset 0 0 0 1px #5D6DBE;
	margin-bottom: 40px;
}


#submit:hover { /*로그인 버튼 오버*/
	background-color: white;
	color: #4E266D;
	cursor: pointer;
}

#bottomBtn { /*하단 버튼 3개*/
	margin-right: 10px;
	width: 140px;
	height: 30px;
	background-color: white;
	color: #4E266D;
	border: 1px solid #4e266d;
}

#bottomBtn:hover { /*하단 버튼 오버*/
	width: 140px;
	height: 30px;
	background-color: #4E266D;
	color: white;
	border: 1px solid #4e266d;
	cursor: pointer;
}

#mainLine {
	width: 700px;
	height: 40px;
	border-bottom: 1px solid #4e266d;
}
</style>



<selection id="login">
<article class="simpleForm_login">
	<form name="frmLogin" method="post" action="login_ok.jsp">
		<fieldset>
		<div id="wrap_login">
			<div id="mainLogo">
				<legend id="loginTitle">Login</legend>
			</div>
			<div id="main2Left">
				<!-- 로그인 입력 부분-->
				<div style="float: left" id="leftText">
					<label for="id">아이디</label>
				</div>
				<div style="float: left;" id="inputText">
					<input type="text" name="id" id="id">
				</div>
				<div style="clear: both; float: left; height: 5px;"></div>
				<div style="clear: both; float: left;" id="leftText">
					<span>비밀번호</span>
				</div>
				<div style="float: left;" id="inputText">
					<input type="text" name="pwd" id="pwd">
				</div>
				<div style="clear: both; float: left;" id="leftText"></div>
				<div style="float: left;" id="securityText">
					<input type="checkbox" name="chkSave" id="chkSave"> 아이디 저장
				</div>
				<div id="main2Right">
					<input type="submit" id="submit" value="회원 로그인" />
				</div>
			</div>
			<div id="mainLine" style="clear: both;"></div>
			<div id="main">
				<a href="#" onclick="window.open('../Login/find_id.jsp','tistory','width=200, height=100, center')"><input id="bottomBtn" type="button" value="아이디 찾기"/></a>
				<a href="#" onclick="window.open('../Login/find_pwd.jsp','tistory','width=200, height=100')"><input id="bottomBtn" type="button" value="비밀번호 찾기" /></a> 
				<a href="../signup/signup.jsp"><input id="bottomBtn" type="button" value="회원가입" /></a>
			</div>
		</div>
		</fieldset>
	</form>
</article>
</selection>
<%@ include file = "../form/bottom.jsp" %>