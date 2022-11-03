<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script type="text/javascript" defer="defer">
//비밀번호 찾기
$(function() {
	
	function pwd_hint() {
		
	   let id = $("#hint_id").val();
		
		$.ajax({
			type : "post",
			url : "/WatchaProject/check/find_pwd.jsp",
			data : {paramId : id},
			datatype : "text",
			success : function(data) {
				let data1 = $.trim(data);
				if(data1 != "") {  
					$("#pwd_hint").html("");
					$("#lbl_hint").show();
					$("#pwd_hint").html("비밀번호는 <font style='color:rgb(255, 53, 94)'>"+data1+"</font>입니다.");
				}else{
					$("#pwd_hint").html("");
					$("#lbl_hint").show();
					$("#pwd_hint").html("존재하지 않는 아이디입니다.");
					
				}
			},					
			error: function(e) {
				$("#lbl_hint").show();
				$("#pwd_hint").html("<br><font style='color:red; font-size:13px;'>오류 발생. 다시 입력하세요.</font>");
	        }
		});
	}
	$("#find_pwd").on("click",function(){
			pwd_hint();
		});
});
	


	



</script>
<style>
.modal, .modal1 {
		display: block; /* Hidden by default */
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
	
	.lbl_hint {
		background-color: #FBEFF2;
	    border-radius: 5px;
	    padding: 10px 30px;
	    margin-top: 5%;
	    color: #6E6E6E;
	}
	
</style>
</head>
<body>

	<div id="bg3" class="modal1">
								
				<div class="modal_content3" >	
				
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
							<input id="hint_id" class="text" placeholder="아이디"/>
						</label>
					</div>	
	
					<div class="modal_check">
						<button id="find_pwd" class="m_btn">비밀번호 찾기</button>
					</div>	
					
					<label id="lbl_hint" class="lbl_hint" for="pwd_hint">
						<span id="pwd_hint" class="pwd_hint" ></span>
					</label>
								
				</div>	
				
		</div>


</body>
</html>