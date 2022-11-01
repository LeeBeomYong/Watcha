<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script type="text/javascript">

	
 		
		function logout() {
			window.close();
			window.opener.location.href="<%=request.getContextPath() %>/user_logout.do";
		}
		
		function profileupdate() {
			window.close();
			window.opener.location.href="<%=request.getContextPath() %>/user_update.do";
		}
		
	 		
	 	function delete2() {
			
	 		let result = confirm("정말 삭제하시겠습니까?");
	 		if(result==true) {
	 			location.href="delete.jsp";
	 		}
		}
 	
</script>

<style type="text/css">

	body {
		padding: 40px;
	}
	
	h1 {
		font-style: bold;
	}
	
	h6 {
		color: lightgray;
	}
	
	p {
		font-size: 20px;
		font-weight: bold;
	}
	
	p:hover {
		cursor: pointer;
		opacity: 50%;
	}
</style>

</head>
<body>
	<h1>설정</h1>
	<hr width="100%" color ="gray">
	<h6>고객센터</h6>
	<p onclick="logout()" >문의하기 / FAQ</p>
	<hr width="100%" color ="gray">
	<p onclick="logout()" >공지사항</p>
	<hr width="100%" color ="gray">
	<p onclick="profileupdate()" >프로필변경</p>
	<hr width="100%" color ="gray">
	<p onclick="logout()" >로그아웃</p>
	<hr width="100%" color ="gray">
	<p onclick="delete2()" >탈퇴하기</p>
	<hr width="100%" color ="gray">
</body>
</html>