<%@page import="java.sql.SQLException"%>
<%@page import="com.notice.model.NoticeService"%>
<%@page import="com.review.model.reviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String annNo = request.getParameter("annNo");
	
	if(annNo==null || annNo.isEmpty()){%>
	<script type="text/javascript">
	   alert("잘못된 url입니다.");
	   location.href = "list.jsp";
	</script>
<%}
	String fileName = request.getParameter("fileName");
	
	NoticeService noticeSer = new NoticeService();
	
	try{
		int cnt = noticeSer.deleteNotice(Integer.parseInt(annNo));
		
		if(cnt>0){%>
        <script type="text/javascript">
           alert('삭제 성공!');
           location.href='noticeList.jsp';
        </script>
     <%}else{ %>
        <script type="text/javascript">
           alert('삭제 실패...');
           history.back();
        </script>
  
     <%}
  }catch(SQLException e){
     e.printStackTrace();
  }%>
</body>
</html>