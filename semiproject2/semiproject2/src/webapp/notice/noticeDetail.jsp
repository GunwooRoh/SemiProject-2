<%@page import="com.notice.model.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.notice.model.NoticeVO"%>
<%@page import="com.notice.model.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../form/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#detail{
		 width: 1000px;
    	margin: 60px auto;
	}

	.firstDiv {
    margin-top: 11px;
    margin-bottom: 7px;
	}

	.sp1{
		font-weight: bold;
	}
	
	.firstDiv {
    padding: 3px;
    border-bottom: 1px solid #c9c1c1;
}

	.content {
    margin-top: 5px;
    width: 1000px;
    height: 400px;
    border: 1px solid #4857A5;
    border-radius: 4px;
    padding: 10px;
    background: #ebecf5;
}

.last {
    text-align: right;
    margin-top: 10px;
    margin-bottom: 0;
}

.last>a {
    color: #4857A5;
    text-decoration: none;
}
</style>
</head>
<body>
<%
	//1
	String annNo = request.getParameter("annNo");
	if(annNo == null || annNo.isEmpty()){%>
		<script type = "text/javascript">
			alert("잘못된 URL입니다.");
			location.href = "noticeList.jsp";
		</script>
		
	<% return; 
	}
	
	//2
	NoticeService noticeSer = new NoticeService();
	NoticeVO vo = null;
	try{
		vo = noticeSer.selectByNo(Integer.parseInt(annNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content = vo.getAnnContent();
	if(content!=null){
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String fileName = vo.getFileName();
	if(fileName==null) fileName="";
%>
<div id = "detail">
	<h2>공지사항 상세보기</h2>
	<input type = "hidden" name = "annNo" value = "<%=vo.getAnnNo() %>"/>
	<div class = "firstDiv">
		<span class = "sp1">제목 | </span><span><%=vo.getAnnTitle() %></span>
	</div> 
	<div class = "firstDiv">
		<span class = "sp1">작성자 | </span><span>관리자</span>
	</div> 
	<div class = "firstDiv">
		<span class = "sp1">등록일 | </span><span><%=vo.getRegdate()	%></span>
	</div>
	<div class = "firstDiv">
		<span class = "sp1">조회수 | </span><span><%=vo.getReadCount() %></span>
	</div>
	<div class = "firstDiv">
		<span class = "sp1">첨부파일 | </span>
		<%if(vo.getFileName()!=null && !vo.getFileName().isEmpty()){ %>
			<span>
				<a href = "downCount.jsp?annNo=<%=annNo %>&fileName=<%= fileName%>">
					<%=Utility.getFileInfo(vo.getOriginFileName(),vo.getFileSize()) %> 
				</a>
				다운 : <%=vo.getDownCount() %>
			</span>
		<%} %>
	</div>
	<div>
		<span class = "sp1">내용</span><br>
		<div class= "content">
			<p><%=content %></p>
		</div>
	</div>
	<div class = "last">
		<a href = "noticeEdit.jsp?annNo=<%=annNo %>">[수정]</a>
		<a href = "noticeDelete_ok.jsp?annNo=<%=annNo %>">[삭제]</a>
		<a href = "noticeList.jsp">[목록]</a>
	</div>
</div>
</body>
<%@ include file="../form/bottom.jsp"%>
