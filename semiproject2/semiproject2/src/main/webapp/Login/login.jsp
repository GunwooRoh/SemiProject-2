<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>	 

  <%
		//쿠키 읽어오기
		String ck_value="";
		Cookie[] ckArr= request.getCookies();
		if(ckArr!=null){
			for(int i=0;i<ckArr.length;i++){
				String ck_name=ckArr[i].getName();
				if(ck_name.equals("ck_userid")){
					ck_value=ckArr[i].getValue();
					break;
				}
						
			}//for
		}
		
	
	%>
	
  
  
  <style>

	*{
	  margin: 0 auto;
	  padding: 0;
	  align-content: center;
	} 

  #leftText{                        /*아이디, 비밀번호 글씨 부분*/
    width: 150px;
    height: 40px;
    display: flex;                  /*div를 float를 사용했기 때문에 정렬을 위해서 flex로 설정*/
    justify-content: left;          /*horizontal left */
    align-items: center;            /*상하 정렬*/
    font-size: 15px;                /*글씨 사이즈*/
    font-weight: bold;
    /*border: 1px solid black;*/    
    /*margin-top: 10px;*/
  }
  #inputText{                       /*텍스트 입력 부분*/
    width: 180px;
    height: 40px;
    /*border: 1px solid black;*/
    display: flex;
    font-size: 20px;
    justify-content: left;
    vertical-align: middle;
  }
  
  #securityText{                    /*보안접속 부분*/
    align-items: center;
    font-size: 12px;
    margin-top: 15px;
  }

  #main{                            /*기본 바탕 부분 div*/
      width: 700px;
      height: 100px;
      /*border: 1px solid red;*/
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 80px;
  }
  
  #mainLogo{                        /*로그인 타이틀*/
      height: 200px;
      /*border: 1px solid red;*/
      display: flex;
      align-items: center;
      justify-content: center;
  }
  
  #main2Left{                       /*로그인 div를 넣을 div*/
      width: 500px;
      /*border: 1px solid red;*/
      vertical-align:middle;
	  align-content: center;
  }
  #main2Right{                      /*로그인 버튼을 넣을 div*/
      /*border: 1px solid red;*/
      display: flex;
  }
  
  #loginTitle{
 	 margin-top: 30px;
 	 text-shadow: 3px 1px 2px #666eb8;
 	 color: #4E266D; /* login 색깔*/
 	 font-size: 50px;
 	 font-weight: bold;
 	}
  
  
  #button{       /*로그인 버튼*/
    width: 80px;
    height: 80px;
    text-align: center;
    background-color: #4E266D;
    color: white;
    border: 1px solid #4e266d;
    margin-left: 60px;
    font-size: small;
    font-weight: bold;
  }
    input#bottomBtn {
    border-radius: 1rem;
    font-weight: 700;
    box-shadow: inset 0 0 0 1px #5D6DBE;
    margin-bottom: 40px;
}
  #button:hover{                        /*로그인 버튼 오버*/
    background-color: white;
    color: #4E266D;
    cursor: pointer;
  }
  #bottomBtn{                           /*하단 버튼 3개*/
    margin-right: 10px;
    width: 140px;
    height: 30px;
    background-color: white;
    color: #4E266D;
    border: 1px solid #4e266d;
  }
  #bottomBtn:hover{                     /*하단 버튼 오버*/
    width: 140px;
    height: 30px;
    background-color: #4E266D;
    color: white;
    border: 1px solid #4e266d;
    cursor: pointer;
  }
  #mainLine{
    width: 700px;
    height: 40px;
    border-bottom: 1px solid #4e266d;
  }
	</style>
<article class="simpleForm_login">
   <form name="frmLogin" method="post"   action="login_ok.jsp">
<selection id="login">
	 <div id="wrap_login"> 
	     <div id="mainLogo"> <span id="loginTitle">Login</span> </div>
	     <div id="main2Left" >
	            <!-- 로그인 입력 부분-->
	            <div style="float:left" id="leftText">
	                <span>아이디</span>
	            </div>
	            <div style="float: left;" id="inputText">
	                <input type:text>
	            </div>
	            <div style="clear: both; float: left; height: 5px;"></div>
	            <div style="clear: both;float: left;" id="leftText">
	                <span>비밀번호</span>
	            </div>
	            <div style="float: left;" id="inputText">
	                <input type:password>
	            </div>
	            <div style="clear: both;float: left;" id="leftText">
	            
	            </div>
	            <div style="float: left;" id="securityText">
	                <input type=checkbox > 아이디 저장
	            </div>
	     <div id="main2Right" > <input id="button" value="회원 로그인"/> </div>
	    </div>
	     <div id="mainLine" style="clear: both;"></div>
	     <div id="main" > 
	        <input id="bottomBtn" type="button" value="아이디 찾기"/>
	        <input id="bottomBtn" type="button" value="비밀번호 찾기"/>
	        <input id="bottomBtn" type="button" value="회원가입"/>
	    </div>
	 </div>
</selection>
</form>
 </article>
 <%@ include file="../bottom.jsp"%> 