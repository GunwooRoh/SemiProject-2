<%@page import="java.sql.SQLException"%>
<%@page import="com.notice.model.NoticeService"%>
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
	//1.
	String annNo = request.getParameter("annNo");
	if(annNo == null || annNo.isEmpty()){%>
		<script type = "text/javascript">
			alert("잘못된 URL입니다.");
			location.href = "noticeList.jsp";
		</script>
	<%}
	
	try{
		//2.
		NoticeService noticeSer = new NoticeService();
		
		int cnt = noticeSer.updateViewCount(Integer.parseInt(annNo));
		
		//3.
		if(cnt>0){
			response.sendRedirect("noticeDetail.jsp?annNo="+ annNo);
		}else{%>
			<script type="text/javascript">
				alert("조회수 증가 실패!");
				history.back();
			</script>
		<% }
		
	}catch(SQLException e){
		e.printStackTrace();
	}


%>

</body>
</html>