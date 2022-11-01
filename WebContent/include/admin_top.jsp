<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway);
body {
  margin: 0px;
}
nav {
  margin-top: 40px;
  padding: 24px;
  text-align: center;
  font-family: Raleway;
  box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);
}
#nav-1 {
  background: #3fa46a;
}



.link-1 {
  transition: 0.3s ease;
  background: #3fa46a;
  color: #ffffff;
  font-size: 20px;
  text-decoration: none;
  border-top: 4px solid #3fa46a;
  border-bottom: 4px solid #3fa46a;
  padding: 20px 0;
  margin: 0 20px;
}
.link-1:hover {
  border-top: 4px solid #ffffff;
  border-bottom: 4px solid #ffffff;
  padding: 6px 0; 
}

</style>
</head>
<body>
	<div align="center">
	<nav id="nav-1">
		  <a class="link-1" href="<%=request.getContextPath() %>/admin_main.do">홈</a>
		  <a class="link-1" href="<%=request.getContextPath() %>/admin_member_list.do">회원관리</a>
		  <a class="link-1" href="<%=request.getContextPath() %>/admin_review_list.do">게시판관리</a>
		  <a class="link-1" href="<%=request.getContextPath() %>/admin_movie_list.do">영화등록</a>
		  <a class="link-1" href="<%=request.getContextPath() %>/admin_service_answer.do">고객센터</a>
		  <a class="link-1" href="<%=request.getContextPath() %>/admin_service_notice.do">공지사항</a>
	</nav>
		
	
	
</body>
</html>