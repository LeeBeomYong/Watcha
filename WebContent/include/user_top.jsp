<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">

	*{marmin: 0; padding: 0;}
	
	a:hover{
		font-weight: bold;
	}
	
	
	nav{
		height: 55px;
		z-index: 3;
		
	}
	.container-fluid{
		position: fixed;
		background-color: #F0F0F0;
		margin-bottom: 5px;
	}
	
	
	.bg_keyword {
		border-radius: 5px;
		border: none;
		background: #fff url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTZweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMTYgMTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8dGl0bGU+SWNvbiAvIEljVGFiQmFyIC8gSWNTZWFyY2hBbmQ8L3RpdGxlPgogICAgPGcgaWQ9IlVJLS0t7ZmILS8t6rKA7IOJIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBmaWxsLW9wYWNpdHk9IjAuNzYiPgogICAgICAgIDxnIGlkPSJfR2xvYmFsLS8tTmF2aWdhdGlvbkJhci0vLUl0ZW1zLS8tU2VhcmNoLS8tRW1wdHkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMS4wMDAwMDAsIC0xMS4wMDAwMDApIiBmaWxsPSIjN0U3RTdFIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwLTEzIj4KICAgICAgICAgICAgICAgIDxnIGlkPSJJY29uLS8tSWNUYWJCYXItLy1JY1NlYXJjaEFuZCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAuMDAwMDAwLCAxMC4wMDAwMDApIj4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNOC4wMjk5ODQxNSwxMi44NzM5OTc5IEM1LjQwNjA4MTEyLDEyLjg3Mzk5NzkgMy4yNzA1NDg1OCwxMC43MjI4NDAzIDMuMjcwNTQ4NTgsOC4wNzg3NTkgQzMuMjcwNTQ4NTgsNS40MzM4ODAwNyA1LjQwNjA4MTEyLDMuMjgyNzIyNTEgOC4wMjk5ODQxNSwzLjI4MjcyMjUxIEMxMC42NTM4ODcyLDMuMjgyNzIyNTEgMTIuNzg5NDE5Nyw1LjQzMzg4MDA3IDEyLjc4OTQxOTcsOC4wNzg3NTkgQzEyLjc4OTQxOTcsMTAuNzIyODQwMyAxMC42NTM4ODcyLDEyLjg3Mzk5NzkgOC4wMjk5ODQxNSwxMi44NzM5OTc5IE0xNi4wODEzNjkzLDE0Ljk1MTc3NTIgTDEzLjA4NjI0MTMsMTEuOTIwODUyNCBDMTMuODg4ODQ3LDEwLjg0OTY2MDUgMTQuMzcyNDY4Myw5LjUyMTYzNzc2IDE0LjM3MjQ2ODMsOC4wNzg3NTkgQzE0LjM3MjQ2ODMsNC41NTQxMTQ4NiAxMS41MjY5Mzg1LDEuNjg3NSA4LjAyOTk4NDE1LDEuNjg3NSBDNC41MzMwMjk4MywxLjY4NzUgMS42ODc1LDQuNTU0MTE0ODYgMS42ODc1LDguMDc4NzU5IEMxLjY4NzUsMTEuNjAyNjA1NSA0LjUzMzAyOTgzLDE0LjQ2OTIyMDQgOC4wMjk5ODQxNSwxNC40NjkyMjA0IEM5LjUyNTk2NTA2LDE0LjQ2OTIyMDQgMTAuODk5MjU5NywxMy45NDE5OTkzIDExLjk4NDQzOTUsMTMuMDY2MjIyMiBMMTQuOTYwNTcwOSwxNi4wNzgwMDIzIEMxNS4xMDkzNzc0LDE2LjIyOTU0ODQgMTUuMzA4ODQxNSwxNi4zMTI1IDE1LjUyMDk3MDEsMTYuMzEyNSBDMTUuNzMxNTE1NSwxNi4zMTI1IDE1LjkyOTM5NjYsMTYuMjMwMzQ2IDE2LjA3OTc4NjIsMTYuMDgwMzk1MSBDMTYuMjI4NTkyOCwxNS45Mjk2NDY2IDE2LjMxMTcwMjgsMTUuNzI5NDQ2MiAxNi4zMTI1LDE1LjUxNjQ4NCBDMTYuMzEzMjg1OSwxNS4zMDM1MjE4IDE2LjIzMDk2NzMsMTUuMTAyNTIzNyAxNi4wODEzNjkzLDE0Ljk1MTc3NTIiIGlkPSJGaWxsLTEiIGZpbGw9IiNCQUJBQzMiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+) no-repeat 10px 10px;
		width: 330px;
		height: 38px;
	}
	
	.keyword {
		color: #424242;
		font-size: 14px;
		background: transparent;
		border: none;
		margin-left: 30px;
		width: 280px;
	}
	
	.keyword:focus {
		outline: none;
	}
	
	.session {
		list-style-type: none;
		padding-left: 0;
		padding-top: 15px;
		margin-left: 0;
		margin-bottom: 0;
	}
	
	.s_img {
		display: inline-block;
		border: none;
		border-radius: 70%;
		width: 35px;
		height: 35px;
	}
	
	.s_id {
		display: inline-block;
		font-size: 15px;
		line-height: 27px;
		margin-left: 0;
	}
	
	.signIn {
		border: none;
		cursor: pointer;
		border-radius: 5px;
		background-color: rgb(240, 240, 240);
		padding: 5px;
		width: 65px;
		font-size: 12px;
		height: 32px;
	}

	.signUp {
		border: 0.5px solid darkgray;
		background-color: #fff;
		cursor: pointer;
		border-radius: 5px;
		font-weight: bold;
		padding: 5px;
		width: 80px;
		font-size: 13px;
		height: 32px;
	}
	
	.modal_content1, .modal_content2 {
		border-radius: 10px;
		width: 400px;
		height: 85%;
		position: relative;
		text-align: center;
		background-color: #fff;
		margin-top: -2%;
		top:50%; 
		left:50%;
		transform: translate(-50%,-50%);
		padding: 5px;
		display: block;
	}
	
	.modal_content3 {
		border-radius: 10px;
		width: 400px;
		height: 500px;
		position: relative;
		background-color: #fff;
		text-align: center;
		top:50%; 
		left:50%;
		transform: translate(-50%,-50%);
		padding: 5px;
		display: block;
	}

	.modal, .modal1 {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		padding-top: 60px;
	}
	
	.close {
		font-size: 20px;
		font-weight: bold;
		margin-left: -350px;
		color: darkgray;
		border: 0;
		background-color: transparent;
	}
	
	.label {
	    background-color: #F2F2F2;
	    width: 300px;
	    height: 50px;
	    margin: 5px;
	    border-radius: 10px;
	}
	
	input {
	    font-family: inherit;
	    font-size: inherit;
	    line-height: inherit;
	    margin: 5px;	
	}
	
	.text {
		width: 250px;
		line-height: 40px;
		border: none;
		background: transparent;
		font-weight: 400;
		outline: none;
	}
	
	.m_btn {
		width: 300px;
		border: none;
		background-color: rgb(255, 53, 94);
		cursor: pointer;
		font-weight: bold;
		color: white;
		border-radius: 10px;
		height: 50px;
	}
	
	.m_btn1 {
		width: 300px;
		height: 50px;
		border: none;
		background-color: transparent;
		cursor: pointer;
		color: rgb(255, 53, 94);
	}
	
	.m_btn2 {
		border: none;
		background-color: transparent;
		cursor: pointer;
		color: rgb(255, 53, 94);
	}
	
	img {
		margin: 5%;
	}
	
	.m_title {
		font-weight: bold;
		margin: 1%;
		padding-bottom: 1%;
	}
	
	.hr-sect {
		display: flex;
		flex-basis: 100%;
		align-items: center;
		color: rgba(0, 0, 0, 0.35);
		font-size: 14px;
		font-weight: bold;
		margin: 8px 0px;
	}
	
	.hr-sect::before,
	.hr-sect::after {
		content: "";
		flex-grow: 1;
		background: rgba(0, 0, 0, 0.35);
		height: 1px;
		font-size: 0px;
		line-height: 0px;
		margin: 0px 16px;
	}
	
	.pwd_title {
		font-size: 25px;
		font-weight: 700;
		line-height: 22px;
		text-align: left;
		padding-top: 20px;
		margin-left: 10px;
		letter-spacing: -0.5px;
	}
	
	.findPwd1 {
		font-size: 16px;
		font-weight: bold;
		line-height: 20px;
		text-align: left;
		color: #000;
	}
	
	.findPwd2 {
		font-size: 14px;
		color: darkgray;
		margin: auto;
		width: 85%;
		line-height: 30px;
		text-align: left;
	}
	
	.findPwd {
		margin-top: 100px;
		background-color: #F2F2F2;
	    width: 350px;
	    height: 100px;
	    margin: 5px;
	    border-radius: 10px;
	}
	
	.hint {
		margin-top: 50px;
	}
	
	.pwd_modal {
		display: none;
	}
	
	.checked {
		display: inline-block;
		margin-left: -10%;
	}
	

</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="<%=request.getContextPath() %>/main.do">
	   		 <img src="./image/왓챠_로고.png" alt="logo" width="80" height="40">
	    </a>
	    &nbsp;&nbsp;&nbsp;
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" href="<%=request.getContextPath() %>/moive_main.do">영화</a>
	        </li>
	         &nbsp; &nbsp;&nbsp; 
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="<%=request.getContextPath() %>/wacha_info.do">소개</a>
	          <ul class="dropdown-menu">
	          	<li><a class="dropdown-item" href="<%=request.getContextPath() %>/wacha_info.do">안녕?왓챠피디아</a></li>
	          	<li><hr class="dropdown-divider"></li>
	          	<li><a class="dropdown-item" href="<%=request.getContextPath() %>/answer_main.do">자주 묻는 질문</a></li>
	          </ul>
	        </li>
	         &nbsp; &nbsp;&nbsp;
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            게시판
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="<%=request.getContextPath() %>/#">자유게시판</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="<%=request.getContextPath() %>/inquiry_main.do">Q&A / 1:1문의</a></li>
	            <li><a class="dropdown-item" href="<%=request.getContextPath() %>/write_result.do">문의내역</a></li>      
	          </ul>
	        </li>
	      </ul>
	     
	     <form method="post" action="<%=request.getContextPath() %>/keyword_search.do" name="search">
				<label class="bg_keyword" for="keyword">
					<input id="k_search" class="keyword" name="keyword" placeholder="콘텐츠, 감독 이름, 유저를 검색해보세요." >
		    	</label>
		 </form>
		    &nbsp;&nbsp;&nbsp;
		      
		    
	    <c:if test="${!empty session_id }">
	    	
	    	<ul class="session">
	    		<li class="s_id"><img class="s_img" src="${session_img }" alt="프로필 사진" /></li>
	    		<li class="s_id"><a href="<%=request.getContextPath()%>/member_page.do?member_id=${session_id }">${session_id }</a></li>
	    	</ul>
	    		
	    </c:if>
	    
	    <c:if test="${empty session_id}">
	    
	    	<%-- 로그인 / 회원가입 버튼 --%>
			<div class="logins">
			
				<input class="signIn" type="button" value="로그인" />
				
				<input class="signUp" type="button" value="회원가입" />
			
			</div>
	    
	    </c:if>  
		
			<%-- 로그인 모달 --%>
			<div id="bg1" class="modal">
			
				<br />
							
				<form class="modal_content1" method="post" action="<%=request.getContextPath()%>/login.do">	
				
					<img src="./image/watchapedia2.png" alt="왓챠피디아 로고" title="왓챠피디아" width="250" height="50" />			
				
					<br />
				
					<h3 class="m_title">로그인</h3>
				
					
						<div class="modal_id">
							<label class="label">
								<input id="memId" class="text" name="memId" placeholder="아이디" required/>
								<span id="sii_checked" class="checked"></span>
								<span id="sii_wrong" class="checked"></span>
							</label>
							<span id="span_signinId"></span>
						</div>	
		
						<div class="modal_pwd">
							<label class="label"> 
								<input id="memPwd" class="text" type="password" name="memPwd" placeholder="비밀번호" required/>
								<span id="sip_checked" class="checked"></span>
								<span id="sip_wrong" class="checked"></span>
							</label>
							<span id="span_signinPwd"></span>							
						</div>	
		
						<div class="modal_login">
							<input id="login_btn" class="m_btn" type="submit" value="로그인"/>
						</div>	
					
	
					<div class="modal_hint">
						<input class="m_btn1" type="button" value="비밀번호를 잊어버리셨나요?" onclick="findPwd()" />
					</div>
	
					<div class="modal_signup">
						<span>계정이 없으신가요?</span>
						<input class="m_btn2" type="button" value="회원가입" onclick="signUp()" />
					</div>
						
					<div class="hr-sect">OR</div>
				
				</form>	
				
			</div>

			<%-- 회원가입 모달 --%>
			<div id="bg2" class="modal">
			
				<div class="modal_content2">
					
					<br />	
				
					<img src="./image/watchapedia2.png" alt="왓챠피디아 로고" title="왓챠피디아" width="250" height="50" />
					
					<h3 class="m_title">회원가입</h3>
					
					<form class="modal_form" method="post" action="<%=request.getContextPath()%>/member_signup.do">
						<div class="modal_name">
							<label class="label">
								<input id="memName" class="text" name="memName" placeholder="이름" required/>
								<span id="sun_checked" class="checked"></span>
								<span id="sun_wrong" class="checked"></span>
							</label>
							<span id="span_signupName"></span>
						</div>	
					
						<div class="modal_id">
							<label class="label">
								<input id="signup_id" class="text" name="memId" placeholder="아이디" required/>
								<span id="sui_checked" class="checked"></span>
								<span id="sui_wrong" class="checked"></span>
							</label>
							<span id="span_signupId"></span>
						</div>	
					
						<div class="modal_pwd">
							<label class="label">
								<input id="signup_pwd" class="text" type="password" name="memPwd" placeholder="비밀번호" required/>
								<span id="sup_checked" class="checked"></span>
								<span id="sup_wrong" class="checked"></span>
							</label>
							<span id="span_signupPwd"></span>
						</div>	
					
						<div class="modal_signup">
							<input id="signup_btn" class="m_btn" type="submit" value="회원가입" onclick="complete()"/>
						</div>	
					</form>
				
					<div class="modal_login">
						<span>이미 가입하셨나요?</span>
						<input class="m_btn2" type="button" value="로그인" onclick="logIn()" />
					</div>
					
					<div class="hr-sect">OR</div>
					
				</div>
			
			</div>
			
			<%-- 비밀번호 찾기 모달 --%>
			<div id="bg3" class="modal1">
								
				<form id="modal_pwd" class="modal_content3" method="post" name="modalPwdForm" action="">	
				
					<button id="x" class="close" onclick="close()" type="button">&times;</button>
				
					<br />	
					
					<p class="pwd_title">비밀번호 재설정</p>			
				
					<hr />
					
					<br />
					
					<div class="findPwd2">
						<b class="findPwd1">비밀번호를 잊으셨나요?</b>	<br />
						아이디를 입력해주세요. <br />
						입력하신 아이디의 비밀번호 일부를 알려드립니다.
					</div>
					
					<br />
									
					<div class="modal_id">
						<label class="label">
							<input id="pwd_memId" class="text" name="memId" placeholder="아이디"/>
						</label>
					</div>	
	
					<div class="modal_check">
						<input id="find_pwd" class="m_btn" type="submit" value="비밀번호 찾기"/>
					</div>	
					
					<div id="findPwd" class="findPwd">
						
					</div>
								
				</form>	
				
			</div>	<!-- 비밀번호 modal end -->
				     
	    &nbsp;
	  </div>
	</nav>
     
     
	
</body>
</html>