<%@page import="com.semi2.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file="../inc/loginCheck.jsp" %>
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEdit_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memService" class="com.semi2.member.model.MemberService" 
scope="session"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");

   String userid=(String)session.getAttribute("userid");
   String pwd=request.getParameter("pwd");
   String zipcode=request.getParameter("zipcode");
   String address=request.getParameter("address");
   String addressDetail=request.getParameter("addressDetail");
   String hp1=request.getParameter("hp1");
   String hp2=request.getParameter("hp2");
   String hp3=request.getParameter("hp3");
   String email1=request.getParameter("email1");
   String email2=request.getParameter("email2");
   String email3=request.getParameter("email3");
   
   String hp="";
   String email="";
   
   if(hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()){
	  hp=hp1+"-"+hp2+"-"+hp3;
   }
   
   if(email1!=null && !email1.isEmpty()){
      if(email2.equals("etc")){
         if(email3!=null && !email3.isEmpty()){
            email=email1+"@"+email3;
         }
      }else{
         email=email1+"@"+email2;
      }
   }
   
   MemberVO memVo = new MemberVO();
   memVo.setUserid(userid);
   memVo.setZipcode(zipcode);
   memVo.setAddress(address);
   memVo.setAddressDetail(addressDetail);
   memVo.setEmail(email);
   memVo.setHp(hp);
   
   String msg="수정 실패",url="memberEdit.jsp";
   try{
	   int result=memService.checkLogin(userid, pwd);
	   
	   if(result==MemberService.LOGIN_OK){
	      int cnt=memService.updateMember(memVo);
	      
	      if(cnt>0){
	         msg="회원정보가 수정되었습니다.";
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