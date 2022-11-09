<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 등록 페이지</title>
<style type="text/css">


	header{
		margin-left: 15%;
	}

	#container{
		width: 70%;
		margin-left: 10%;
	}
	
	#con1{
		margin-left: 15%;
	}

	#img_a{
		border: none;
		font-size: 18px;
		color: #000;
		background-color: #ECECEC;
		margin-left: 85%;
		width: 55px;
		height: 30px;
		border-radius: 5px;
	}
	
	#img_a:hover{
		background-color: #c3c3c3;
	}
	

	#pwd{
		width: 250px; 
		margin-top: 15px;
	}
	
	#validationTextarea{
		display: block;
		resize: none;
		width: 75%; 
		border-radius: 3px;
		border: 1px solid #c6c6c6;
		padding: 10px;
		margin-left: 5px;
	}
	#validationTextarea1{
		display: block;
		resize: none;
		width: 75%; 
		border-radius: 3px;
		border: 1px solid #c6c6c6;
		padding: 10px;
		margin-left: 5px;
	}
	
	#text2{
		display: block;
		border: 1px solid #c6c6c6;
		padding: 10px;
		border-radius: 3px;
		width: 75%; 
		outline: none;
	}
	
	#radio1{
		display: block;
		float: right;
		background-color: #F1F1F1;
		padding: 20px;
		font-size: 15px;
		border-radius: 5px;
	}
	
	#file1{
		display: block;
		float: right;
		background-color: #000;
	}
	
	.menu2{
		display: flex;
		list-style-type: none;
		padding: 0;
	}
	
	.menu2 li{
		margin: 8px;
		margin-left: 10px;
	}

	#con4{
		border: 1px solid #c6c6c6;
		width: 75%;
		margin-left: 5px;
		margin: 5px;
		border-radius: 3px;
	}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	// textarea에서 입력한 글자 만큼 세주는 함수.	
	$(document).ready(function() {
	    $('#validationTextarea1').on('keyup', function() {
	        $('#cnt').html("("+$(this).val().length+" / 1000)");
	 
	        if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0, 1000));
	            $('#cnt').html("(1000 / 1000)");
	        }
	    });

	});
	
</script>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />
	
	<br>
	
	<div id="container">
	
	  <br>
	  
	  <form method="post" class="was-validated" enctype="multipart/form-data" action="<%=request.getContextPath() %>/free_upload_ok.do">
	  	<input type="hidden" name="member_id" value="${session_id }">
	  	<header>
			<h3 style="font-weight: bold;">글쓰기<input type="submit" value="등록" id="img_a"></h3>
			<hr width="100%">
	 		<br>
	 		
		    <p>* 이 게시판은 자유게시판입니다. <br>
		    * 욕설이나 비난글은 자제해주세요.</p>
		</header>
	 
	  <div id="con1">
		
		<div id="radio1">
		  <b>공개 설정</b><br><br>
		   <input type="radio" name="show" value="0" checked> 전체공개
		   &nbsp;
		   <input type="radio" name="show" value="1"> 회원공개
		</div>		  
		  
<!-- 		<div>
		  <input id="text2" placeholder="제목을 입력해주세요." name="free_title">
		</div> -->

		  <div>
		    <input style="box-shadow:none !important;" class="form-control is-invalid" name="free_title" id="validationTextarea" placeholder="제목을 입력하세요." required>
		  </div>	
		
		<div id="con4">
		  <input style="width: 100%; border-color:#c6c6c6; box-shadow-color:#000; box-shadow:none !important;" type="file" name="free_file">
		</div>
	
<!-- 		<div>
		 <textarea placeholder="내용을 입력하세요." rows="14" id="text1" class="text_1" name="free_cont"></textarea>
		</div> -->
		
		  <div class="mb-3">
		    <textarea style="box-shadow:none !important;" class="form-control is-invalid" rows="14" name="free_cont" id="validationTextarea1" placeholder="내용을 입력하세요." required></textarea>
		  </div>	
		  
		  	
		<div>
			<span id="cnt">(0 / 1000)자 이내로 입력</span>
		</div>
	
	  

		</div> <%-- con1 end --%>
		</form>
		<br>
		<br>
	  </div>
	 
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>
