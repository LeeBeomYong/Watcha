<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
	} 
%>
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
</style>
</head>
<body>

	<jsp:include page = "../include/user_top.jsp" />
	
	<c:set var="dto" value="${profileList }"/>
	<div class="row g-3 align-items-center" style=" margin-top: 210px; margin-left: 800px; margin-right: 800px;">
		<form method="post" action="<%=request.getContextPath()%>/send.do">
	     <div class="mb-3">
	   		<label for="receiver" class="col-form-label">이메일 인증</label>
	 	 </div>
	 	 
		 <div class="mb-3">
		    <input type="text" id="receiver" name="receiver" value="${dto.getMember_email()}" class="form-control" aria-describedby="passwordHelpInline" readonly="readonly" />
		    <input class="btn btn-primary" id="submit" type="submit"  value="인증번호발송">
		 </div>
		 
		 <div class="mb-3">
		 	<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>" />
		 </div>
		 </form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>