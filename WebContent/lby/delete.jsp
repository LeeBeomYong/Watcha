<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<style type="text/css">

	* {
	  box-sizing: border-box;
	}
	body {
	  font-family: "Montserrat", sans-serif;
	  margin: 0;
	  padding: 0;
	}
	.wrapper2 {
	  width: 100%;
	  height: 80vh;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  overflow: hidden;
	}
	.container2 {
	  border-radius: 10px;
	  box-shadow: -5px -5px 10px #fff, 5px 5px 10px #babebc;
	  position: absolute;
	  width: 500px;
	  min-height: 500px;
	  overflow: hidden;
	}
	#asd {
 	  background: #ebecf0;
	  display: flex;
	  flex-direction: column;
	  padding: 0 50px;
	  height: 500px;
	  justify-content: center;
	  align-items: center;
	}
	#asd input {
	  background: #eee;
	  padding: 16px;
	  margin: 8px 0;
	  width: 85%;
	  border: 0;
	  outline: none;
	  border-radius: 20px;
	  box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
	}
	textarea {
	  background: #eee;
	  padding: 16px;
	  margin: 8px 0;
	  width: 85%;
	  border: 0;
	  outline: none;
	  border-radius: 20px;
	  box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;		
	}
	button {
	  border-radius: 20px;
	  border: none;
	  outline: none;
	  font-size: 12px;
	  font-weight: bold;
	  padding: 15px 45px;
	  margin: 14px;
	  letter-spacing: 1px;
	  text-transform: uppercase;
	  cursor: pointer;
	  transition: transform 80ms ease-in;
	}
	.form_btn {
	  box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
	}
	.form_btn:active {
	  box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
	}
	.form_btn:hover {
		opacity: 50%;
	}
	
	.sign-in-container2 {
	  position: absolute;
	  left: 0;
	  width: 100%;
	  height: 700px;
	  transition: all 0.5s;
	}
	
	#asd h1 {
	  font-weight: bold;
	  margin: 0;
	  color: #000;
	}
	
</style>
</head>
<body>

	<jsp:include page = "../include/user_top.jsp" />
	
	
	<div class="wrapper2">
  		<div class="container2">
   		 	<div class="sign-in-container2">
				<form id="asd" method="post" action="<%=request.getContextPath()%>/delete_ok.do">
					<h1>비밀번호 확인</h1>
			        <br><br>
			        <input type="password" name="pwd">
			        <input class="form_btn" type="submit" value="확인">
				</form>
	   		 </div>
	  	</div>
	</div>
	<br><br>
	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>