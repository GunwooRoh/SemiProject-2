<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.notice.model.Utility"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="com.notice.model.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>downCount.jsp</title>
</head>
<body>
<%
	//[1] 다운로드 수 증가
	int annNo = Integer.parseInt(request.getParameter("annNo"));
	String fileName = request.getParameter("fileName");
	
	NoticeService noticeSer = new NoticeService();
	int n = noticeSer.updateDownCount(annNo);
	
	//[2] 강제 다운로드 창 띄우기
	BufferedInputStream bis = null;
	BufferedOutputStream bos = null;
	try{
		String dirPath = application.getRealPath("/upload");
		dirPath="C:\\Users\\Desktop\\eclipse-workspace\\semiJY\\src\\main\\webapp\\upload";
		
		File myfile = new File(dirPath, fileName);
		
		response.reset();
		
		response.setContentType("application/octet-stream");
		
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(fileName.getBytes("euc-kr"),"ISO-8859-1")+"");
		
		out.clear();
		out=pageContext.pushBody();
		//이를 생략하면 프로그램 상엔 이상이 없으나 이미 존재하고 있는 out객체로 바이트 기반의 스트림 작업을 명시하면서 오류가 발생함

		byte[] data = new byte[1024 * 1024];
		bis = new BufferedInputStream(new FileInputStream(myfile));
		bos = new BufferedOutputStream(response.getOutputStream());
		
		int count = 0;
		while((count = bis.read(data))!= -1){
		 	bos.write(data);
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(bis!=null) bis.close();
		if(bos!=null) bos.close();
	}
	
%>
</body>
</html>