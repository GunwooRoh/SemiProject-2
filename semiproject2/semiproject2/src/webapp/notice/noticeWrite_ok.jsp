<%@page import="com.notice.model.Utility"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.notice.model.NoticeVO"%>
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
<jsp:useBean id="NoticeSer" class="com.notice.model.NoticeService" scope="page"></jsp:useBean>
<jsp:useBean id="NoticeVo" class="com.notice.model.NoticeVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVo"/>

<%

	//noticeWrite.jsp에서 [등록] 버튼을 누르면 POST 방식으로 이동
	//한글 인코딩 필요
	//파일 업로드 
	String upPath = "/upload";

	
	//업로드할 폴더의 절대 경로 구하기
	String saveDir = config.getServletContext().getRealPath(upPath);
	saveDir = application.getRealPath(upPath);
	
	if (saveDir == null) {
	    saveDir = upPath;
	}
	saveDir = "C:\\Users\\Desktop\\eclipse-workspace\\semiJY\\src\\main\\webapp\\upload";
	System.out.println("test saveDir="+saveDir);
	
	
	int maxSize = 2*1024*1024;
	String encoding="utf-8";
	
	try{
		DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, df);
		System.out.println("파일 업로드 완료!!");
		
		String fileName = multi.getFilesystemName("upfile");
		long fileSize = 0;
		String originFileName = "";
		
		if(fileName!=null){	//파일명 첨부된 경우
			File myFile = multi.getFile("upfile");
			fileSize = myFile.length();
			
			originFileName = multi.getOriginalFileName("upfile");
		}
	
		//1. 요청 파라미터 입력
		int adminNo = 1;
		String annTitle = multi.getParameter("annTitle");
		
		String annContent = multi.getParameter("annContent");
		
		//2. DB작업
		NoticeService noticeSer = new NoticeService();
		NoticeVO vo = new NoticeVO();
		vo.setAnnTitle(annTitle);
		vo.setAdminNo(adminNo);
		vo.setAnnContent(annContent);
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setOriginFileName(originFileName);
		
		int cnt = noticeSer.insertNotice(vo);
		
		//3. 결과 처리
		if(cnt>0){%>
			<script type="text/javascript">
	    		alert('글쓰기 처리되었습니다.');
	    		location.href="noticeList.jsp";
	    	</script>
		<%}else{%>
			<script type="text/javascript">
	    		alert('글쓰기 실패!');
	    		history.back();
	    	</script>
		<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){
		e.printStackTrace();
		
		String str = "<script>";
    	str += "alert('2M 이상의 파일은 업로드할 수 없습니다!');";
    	str += "history.back();</script>";
    	out.print(str);
	}
	
	
%>
</body>
</html>