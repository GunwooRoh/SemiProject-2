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
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
%>
	<script type="text/javascript">
   		alert('<%=msg%>'); 
   		/* 값 alert('성공'); 이랑 같기 때문에 " 꼭 필요 */
   		location.href="<%=url%>";
   	</script>
</body>
</html>