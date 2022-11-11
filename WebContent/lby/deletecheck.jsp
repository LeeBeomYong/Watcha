<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkCode(){
		  var v1 = form2.code_check.value;
		  var v2 = form2.code.value;
		  if(v1!=v2){
			   document.getElementById('checkCode').style.color = "red";
			   document.getElementById('checkCode').innerHTML = "잘못된인증번호";
               makeNull();
		  }else{
			   document.getElementById('checkCode').style.color = "blue";
			   document.getElementById('checkCode').innerHTML = "인증되었습니다."; 
			   makeReal();
		  }
		 }
	function makeReal(){
		var hiddenbutton = document.getElementById("hiddenbutton");
		hiddenbutton.type="submit";
	}
    function makeNull(){
		var hiddenbutton = document.getElementById("hiddenbutton");
		hiddenbutton.type="hidden";
	}
</script>
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

	<div class="row g-3 align-items-center" style=" margin-top: 210px; margin-left: 800px; margin-right: 800px;">
		<form id="form2" method="post" action="<%=request.getContextPath()%>/delete_ok.do">
			<div class="mb-3">
	   		<label for="receiver" class="col-form-label">인증번호 확인</label>
	 		</div>
	 		
	 		<div class="mb-3">
		    <input type="text" id="code" name="code" class="form-control" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/>
		    <div id="checkCode"></div>
		    <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>" />
		    <input class="btn btn-primary" id="hiddenbutton" type="hidden" value='인증하기'/>
		 </div>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page = "../include/user_bottom.jsp" />
	
</body>
</html>