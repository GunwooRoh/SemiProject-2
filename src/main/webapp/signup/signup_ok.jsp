<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memService" class="com.member.model.MemberService" 
	scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.member.model.MemberVO" scope="page"></jsp:useBean>

<%
	//1	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String age = request.getParameter("age");
	String card = request.getParameter("card");
	
	memVo.setId(id);
	memVo.setPwd(pwd);
	memVo.setName(name);
	memVo.setEmail(email);
	memVo.setAge(age);
	memVo.setTel(tel);
	memVo.setCard(card);

	//2
	String msg="회원가입 실패!", url="signup.jsp";
	try{
		int cnt = memService.insertMember(memVo);

		//3
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="../mypage/profile.jsp";
	System.out.println("집 갈래~~~~~~");
		}
	}catch(SQLException e){
      	e.printStackTrace();
   	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
%>
<jsp:forward page="message.jsp"></jsp:forward>
</body>
</html>