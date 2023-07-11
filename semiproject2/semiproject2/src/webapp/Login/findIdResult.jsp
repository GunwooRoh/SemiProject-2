<%@page import="java.util.function.Function"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<%
	 request.setCharacterEncoding("UTF-8");
	 String name = request.getParameter("name");
	 String tel = request.getParameter("tel");
	     
	 MemberDAO dao = new MemberDAO();
	 String member = dao.findId(name, tel); //아이디를 디비에서 가져옴..실패시 널
 
%>
</head>
<body>

  <form name="idsearch" method="post">
      <%
       if (member != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=member%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="로그인" onClick = 'login()'/>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onClick="signup()"/>
       	</div>
       </div>
       
  <%}%> 
 <script>
	  function signup() {
	    window.location.href = "../signup/signup.jsp";
	  }
</script>
 
      </form>
</body>
</html>