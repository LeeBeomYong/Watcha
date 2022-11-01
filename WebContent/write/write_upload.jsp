<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 문의등록 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/write/write_css/write_upload_css.css" type="text/css">
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
	    $('#exampleFormControlTextarea1').on('keyup', function() {
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
	  
	  <form method="post" action="<%=request.getContextPath() %>/write_upload_ok.do">
	  	<header>
			<h2>Q&A문의등록 <input type="submit" value="등록" id="img_a"><img id="img1" src="https://cdn-icons-png.flaticon.com/512/46/46076.png"></h2>
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
		  <input style="width: 250px;" class="form-control" id="exampleFormControlInput1" value="${member_id }" placeholder="아이디 입력" name="member_id" readonly>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">문의제목</label>
		  <input style="width: 700px;" class="form-control" id="exampleFormControlInput1" placeholder="제목 입력" name="write_title">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="9" name="write_cont"></textarea>
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
		    <input id="pwd" type="password" class="form-control" name="write_pwd" disabled>
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
