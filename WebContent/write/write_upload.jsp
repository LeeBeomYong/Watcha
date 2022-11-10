<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 문의등록 페이지</title>
<style type="text/css">

	header{
		margin-left: 330px;
	}

	#container{
		width: 70%;
		margin-left: 15%;
	}
	
	#con1{
		margin-left: 25%;
	}
	
	#img1{
		
		height: 30px;
		width: 30px;
	}
	
	#img_a{
		border: none;
		font-size: 18px;
		color: #000;
		background-color: #ECECEC;
		width: 55px;
		height: 30px;
		margin-left: 43%;
		border-radius: 5px;
	}
	
	#img_a:hover{
		background-color: #c3c3c3;
	}

	#pwd{
		width: 250px; 
		margin-top: 15px;
	}



</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	// 글 공개 / 비공개 둘 중 하나 선택하여 비밀번호 창 잠구는 함수.
	$(function(){
		
		$("input:radio[name=show]").click(function(){
			
			if($("input[name=show]:checked").val() == "0"){
				$("#pwd").attr("disabled",true);
				// radio 버튼의 value 값이 0이라면 안보이게
	
			}else if($("input[name=show]:checked").val() == "1"){
	              $("#pwd").attr("disabled",false);
	              // radio 버튼의 value 값이 1이라면 비번 입력할 수 있게.
		};
	});
});
	
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
	  
	  <form method="post" class="was-validated" action="<%=request.getContextPath() %>/write_upload_ok.do">
	  	<header>
			<h2>Q&A문의등록<input type="submit" value="등록" id="img_a"></h2>
			<hr width="70%">
	 		<br>
	 		
		    <p>문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.
			<br>* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00<br>
			* 파일 업로드 이용할 시 1:1문의를 이용해주세요.</p>
			
		</header>
	  <br>
	  <div id="con1">
	  
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">아이디</label>
		  <input style="width: 250px;"class="form-control"  value="${session_id }" placeholder="아이디 입력" name="member_id" readonly>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">문의제목</label>
		  <input style="width: 700px; box-shadow:none !important;" class="form-control is-invalid" id="validationTextarea" placeholder="제목 입력" name="write_title" required>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
		  <textarea style="box-shadow:none !important; width: 700px; resize: none;" class="form-control" id="validationTextarea1" rows="9" name="write_cont" required></textarea>
		  <span id="cnt">(0 / 1000)자 이내로 입력</span>
		</div>
		
		<div class="row g-3" style="width:50%;">
		  <div class="col">
		  	<label align="center">공개여부설정</label><br><br>

		    <input type="radio" name="show" value="0" checked> 공개
		    &nbsp;
		    <input type="radio" name="show" value="1"> 비공개
		  </div>
		  
		  <div class="col">
		  	<label>글 비밀번호</label>
		    <input style="box-shadow:none !important;" id="pwd" type="password" class="form-control" id="validationTextarea" name="write_pwd" disabled required>
		  </div>
		</div>
		</div>
		</form>
		<br>
		<br>
	  </div>
	 
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>
