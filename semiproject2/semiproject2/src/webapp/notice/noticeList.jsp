<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.notice.model.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.notice.model.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../form/top.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
	* {
    margin: 0;
    padding: 0;
}
	
	.btn-primary{
		background:#4e266d
	}
	
	#ann_box{
		 width: 1000px;
    	margin: 60px auto;
	}
	
	div#ann_box>strong {
    font-size: 2em;
}

table{
	margin-top : 1rem;
}

#btn>a{
	text-decoration:none;
	text-align: right;
	color : white;
	font-weight: bold;
	
}

#btn {
    width: 91px;
    height: 35px;
    border: 2px solid #4857A5;
    border-radius: 6px;
    padding-left: 19px;
    padding-top: 5px;
    background: #4857A5;
    float : right;
    margin-bottom:10px;
}

#foot{
	clear:both;
}

.input-group.mb-3 {
    width: 300px;
    float: right;
}

#paging {
    margin: 0 50%;
}

td a {
    text-decoration: none;
    color: black;
}
</style>
</body>
<%
	//noticeWrite.jsp에서 글 등록 완료 시 GET방식으로 이동
	//1
	
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("searchKeyword");
	if(keyword == null) keyword="";
	/* String selectedOption = request.getParameter("selectOption");
	String selOption = "";
	
	if(selectedOption!= null){
		int option = Integer.parseInt(selectedOption);	
		
		if(option==1){
			selOption = "호텔관련";
		}else if(option == 2){
			selOption = "예약관련";
		}else if(option == 3){
			selOption ="기타";
		}else{
		throw new IllegalArgumentException("잘못된 URL입니다.");
		}
	}else{
		throw new IllegalArgumentException("선택된 옵션이 없습니다.");
	}//바깥 if
	 */
	//2.DB작업
	NoticeService noticeSer = new NoticeService();
	List<NoticeVO> list = null;
	try{
		list = noticeSer.selectAll(keyword);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3. 결과 처리
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//페이징 처리
	int currentPage =1;	//현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//[1] 현재 페이지랑 무관한 변수
	int totalRecord = list.size();
	int pageSize = 5;	//화면에 보일 공지사항 갯수
	int blockSize = 5;	//화면에 보일 페이지 갯수
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize);	//총 페이지 수

	//[2] 현재 페이지 이용해서 계산해야 하는 변수
	int firstPage = currentPage - ((currentPage-1)%blockSize);	//1, 6, 11..블럭 시작 페이지
	int lastPage = firstPage + (blockSize-1); //5, 10, 15...
	
	//페이지당 ArrayList에서의 시작 index => 0, 4,...
	int curPos = (currentPage-1)*pageSize;
	
	//페이지당 글 리스트 시작 번호
	int num = totalRecord - curPos;

%>

<body>
<div>
	<%if(keyword!=null && !keyword.isEmpty()){  %>
	<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
	<%} %>
</div>
<div id = "ann_box">
	<strong>공지사항</strong> 
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	 <form name = "search" method="post" action = "noticeList.jsp">
		 <div class="input-group mb-3">
	 		 <input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" value= "<%=keyword %>">
	  		<input type="submit" class="btn btn-outline-secondary" type="button" id="button-addon2" value = "찾기">
		</div>
</form>
	<table class="table table-striped table-hover" >
  		<thead>
  			<tr>
  				<th>번호</th>
  				<th>제목</th>
  				<th>작성자</th>
  				<th>작성일</th>
  				<th>조회수</th>
  			</tr>
  		</thead>
  		<tbody>
  		<!--  반복 시작! -->
  		<%if(list==null || list.isEmpty()){ %>
  			<tr>
  				<td rowspan = "3" colspan = "6">
  					공지사항이 없습니다.
  				</td>
  			</tr>
  		<%}else{ 
  			for(int i=0; i<pageSize; i++){
  				if(num<1) break;
  				
  				NoticeVO vo = list.get(curPos++);
  				num--;
  			%>
  			<tr>
	  			<td><%= vo.getAnnNo() %></td>
	  			<td><a href = "countUpdate.jsp?annNo=<%=vo.getAnnNo()%>"><%=vo.getAnnTitle() %></a></td>
	  			<td>관리자</td>
	  			<td><%= sdf.format(vo.getRegdate()) %></td>
	  			<td><%=vo.getReadCount() %></td>
  			</tr>
  			<%}//for
  			}//if %>
  		</tbody>
	</table>
	<!-- 페이징 [1][2][3][4][5]-->
	<div id = "paging">
	<nav aria-label="Page navigation example">
  <ul class="pagination">
	<!-- 페이지 번호 추가 -->
	<!--  이전 블럭으로 이동 -->
	<%if(firstPage>1){ %>
    <li class="page-item">
      <a class="page-link" href="noticeList.jsp?currentPage=<%=firstPage-1%>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	<%} %>
    <%for(int i=firstPage;i<=lastPage;i++){
    	if(i>totalPage) break;%>
	    <li class="page-item">
	    	<a class="page-link" href="noticeList.jsp?currentPage=<%=i%>&searchkeyword=<%=keyword%>"><%=i %></a>
	    </li>
    <%}//for %>
    <!-- 다음 블럭으로 이동 -->
    <% if(lastPage<totalPage){ %>
    <li class="page-item">
      <a class="page-link" href="noticeList.jsp?currentPage=<%=lastPage+1 %>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
      <%} %>
  </ul>
</nav>
</div>


<div id = "btn">
<a href = "noticeWrite.jsp">글쓰기</a>
</div>
</div>
</body>
<%@ include file = "../form/bottom.jsp" %>