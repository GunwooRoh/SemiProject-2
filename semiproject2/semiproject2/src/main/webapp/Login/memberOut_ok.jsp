<%@page import="com.semi2.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../inc/loginCheck.jsp" %>  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memService" class="com.semi2.member.model.MemberService" scope="session"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");
   
   String userid=(String)session.getAttribute("userid");
   String pwd=request.getParameter("pwd");
   
   String msg="회원 탈퇴 실패", url="memberOut.jsp";
   try{
      int result=memService.checkLogin(userid, pwd);
         
      if(result==MemberService.LOGIN_OK){         
         int cnt=memService.withdrawMember(userid);
         
         if(cnt>0){
            msg="회원탈퇴가 완료되었습니다.";
            url="../index.jsp";
            
            //세션 초기화
            session.invalidate();
            
            //쿠키 삭제
            Cookie ck=new Cookie("ck_userid",userid);
            ck.setPath("/");
            ck.setMaxAge(0);
            response.addCookie(ck);
         }
      }else if(result==MemberService.DISAGREE_PWD){
         msg="비밀번호가 틀렸습니다.";
      }
   }catch(SQLException e){
      e.printStackTrace();
   }
   
   request.setAttribute("msg", msg);
   request.setAttribute("url", url);
   
%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>

</body>
</html>