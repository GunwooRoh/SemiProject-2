<%@page import="com.semi2.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memberService" class="com.semi2.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");
	
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String chkSave = request.getParameter("chkSave");
	
	//2
	String msg="로그인 처리 실패", url="login.jsp";
	try{
		int result=memberService.checkLogin(userid, pwd);
		
		//3
		if(result==MemberService.LOGIN_OK){
			//[1] 세션에 로그인 정보 저장
			session.setAttribute("userid", userid);
			
			//[2] 저장 체크시 쿠키에 저장 - 아이디 저장하기가 체크된 경우 on, null on을 넣을 경우 nullpointex~ 오류
			if(chkSave != null){ //체크한 경우
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/"); //path 지정
				ck.setMaxAge(1000*24*60*60); //1000일, 유효기간 설정
				response.addCookie(ck);
			}else{ //체크하지 않은 경우 null, 기존 쿠키 제거
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			msg=userid+"님 로그인 되었습니다.";
			url="../index.jsp";
		}else if(result==MemberService.DISAGREE_PWD){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_ID){
			msg="아이디가 존재하지 않습니다.";
		}		
		
	}catch(SQLException e){
		e.printStackTrace();
	}	
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>
<!-- forward: request 공유  -->
</body>
</html>





