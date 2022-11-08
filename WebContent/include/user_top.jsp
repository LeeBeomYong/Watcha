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
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
	$(function () {
		// 로그인 팝업
		$(".signIn").click(function() {
			$("#bg1").css({
				'display': 'block'
			});
			$(".modal_content1").css({
				'display': 'block'
			});
			$(".modal_content2").css({
				'display': 'none'
			});
			
		});
		// 회원가입 팝업
		$(".signUp").click(function() {
			$("#bg2").css({
				'display': 'block'
			});
			$(".modal_content2").css({
				'display': 'block'
			});
			$(".modal_content1").css({
				'display': 'none'
			});
		});
		
		// enter키로 submit(빈칸 : submit 불가)
		$("#k_search").keypress(function (e) {
			if(e.which == 13) {
				if($("#k_search").val()=='') {
					return false;
				}else {
					search.submit();
				}
			}
		});
		
		
		// 로그인 - 아이디 확인
		$("#memId").keyup(function() {
			
			const id = $(this).val();
			$("#span_signinId").show();
			$("#sii_checked").show();
			$("#sii_wrong").show();
			
			if($(this).val() == '') {
				$("#sii_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
				$("#sii_checked").hide();
				$("#span_signinId").html("<br><font style='color:red; font-size:13px;'>아이디를 입력하세요.</font>");
			}else {
				$.ajax({
					type : "post",
					url : "check/idCheck.jsp",
					data : {paramId : id},
					datatype : "jsp",
					success : function(res) {
						if(res == 1) {  // DB에 아이디가 존재하는 경우
							$("#sii_wrong").hide();
							$("#sii_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='29px' height='29px'>");
							$("#span_signinId").hide();
							$("#login_btn").attr("disabled", false);
							$("#login_btn").css({
								'cursor' : 'pointer',
								'background-color' : '#FF355E'
							});
						}else {
							$("#sii_checked").hide();
							$("#sii_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
							$("#span_signinId").html("<br><font style='color:red; font-size:13px;'>존재하지 않는 아이디입니다.</font>");
							$("#login_btn").attr("disabled", true);
							$("#login_btn").css({
								'cursor' : 'default',
								'background-color' : '#FCDFEB'
							});
						}
					},					
					error: function(e) {
						$("#sii_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
						$("#span_signinId").html("<br><font style='color:blue; font-size:13px;'>오류 발생. 다시 입력하세요.</font>");
						$("#sui_checked").hide();
						$("#login_btn").attr("disabled", true);
		            }
				});
				
			}
		});
		
		
		// 비밀번호 찾기창 '닫기'
		$(".close").click(function() {
			$("#bg3").css({
				'display':'none'
			});
			$(".modal_content3").css({
				'display': 'none'
			});
			$("#bg1").css({
				'display': 'block'
			});
			$(".modal_content1").css({
				'display': 'block'
			});
			$("#hint_id").val('');	
			$("#pwd_hint").hide();
			$("#lbl_hint").hide();
		});
		
		// 아이디 : 영문/숫자 5~10자
		const pattern_id = /^[a-zA-Z][0-9a-zA-Z]{4,9}$/;
		// 이름 : 영문/한글 2~15자
		const pattern_name = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]{1,14}$/;
		// 비밀번호 : 영문/숫자/특수문자 8~10자
		const pattern_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,9}$/;
		
		// 회원가입 - 이름 체크
		$("#memName").keyup(function() {
			
			const name = $(this).val();
			$("#span_signupName").show();
			$("#sun_checked").show();	$("#sun_wrong").show();
			
			if(pattern_name.test(name)) {
				$("#sun_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='29px' height='29px'>");
				$("#span_signupName").hide();
				$("#sun_wrong").hide();
				$("#signup_btn").attr("disabled", false);
				$("#signup_btn").css({
					'cursor' : 'pointer',
					'background-color' : '#FF355E'
				});
			}else {
				$("#sun_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
				$("#span_signupName").html("<br/><font style='color:red; font-size:13px;'>이름은 한글/영문 2~10자까지 가능합니다.</font>");
				$("#sun_checked").hide();
				$("#signup_btn").attr("disabled", true);
				$("#signup_btn").css({
					'cursor' : 'default',
					'background-color' : '#FCDFEB'
				});
			}
		})
		
		// 회원가입 - 아이디 중복 체크
		$("#signup_id").keyup(function() {
			
			const id = $(this).val();
			$("#span_signupId").show();
			$("#sui_checked").show();
			$("#sui_wrong").show();
			
			if($(this).val() == '') {
				$("#span_signupId").html("<br><font style='color:red; font-size:13px;'>아이디는 영문/숫자 5~10자까지 가능합니다.</font>");
				$("#sui_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
			}else {
				if(pattern_id.test(id)) {
					$.ajax({
						type : "post",
						url : "check/idCheck.jsp",
						data : {paramId : id},
						datatype : "jsp",
						success : function(res) {
							if(res == 1) {  // DB에 아이디가 존재하는 경우
								$("sui_#wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
								$("#span_signupId").html("<br/><font style='color:red; font-size:13px;'>중복된 아이디입니다.</font>");
								$("#signup_btn").attr("disabled", true);
								$("#sui_checked").hide();
								$("#signup_btn").css({
									'cursor' : 'default',
									'background-color' : '#FCDFEB'
								});							
								return false;
							}else {
								$("#sui_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='29px' height='29px'>");
								$("#span_signupId").hide();
								$("#sui_wrong").hide();
								$("#signup_btn").attr("disabled", false);
								$("#signup_btn").css({
									'cursor' : 'pointer',
									'background-color' : '#FF355E'
								});
							}
						},					
						error: function(e) {
							$("#sui_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
							$("#span_signupId").html("<br><font style='color:blue; font-size:13px;'>오류 발생. 다시 입력하세요.</font>");
							$("#sui_checked").hide();
							$("#signup_btn").attr("disabled", true);
							$("#signup_btn").css({
								'cursor' : 'default',
								'background-color' : '#FCDFEB'
							});
			            }
					});
				}else {
					$("#sui_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
					$("#span_signupId").html("<br><font style='color:red; font-size:13px;'>아이디 : 영문/숫자 5~10자</font>");
					$("#sui_checked").hide();
					$("#signup_btn").attr("disabled", true);
					$("#signup_btn").css({
						'cursor' : 'default',
						'background-color' : '#FCDFEB'
					});
					return false;
				}
			}
		});
		
		// 회원가입 - 비밀번호 체크
		$("#signup_pwd").keyup(function() {
			const pwd = $(this).val();
			
			$("#span_signupPwd").show();
			$("#sup_checked").show();	$("#sup_wrong").show();
			
			if(pattern_pwd.test(pwd)) {
				$("#sup_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='29px' height='29px'>");
				$("#span_signupPwd").hide(); $("#sup_wrong").hide();
				$("#signup_btn").attr("disabled", false);
				$("#signup_btn").css({
					'cursor' : 'pointer',
					'background-color' : '#FF355E'
				});
			}else {
				$("#sup_wrong").html("<img src='https://cdn-icons-png.flaticon.com/512/179/179386.png' width='25px' height='25px'>");
				$("#span_signupPwd").html("<br><font style='color:red; font-size:13px;'>비밀번호 : 영문/숫자/특수문자 5~10자</font>");
				$("#sup_checked").hide();
				$("#signup_btn").attr("disabled", true);
				$("#signup_btn").css({
					'cursor' : 'default',
					'background-color' : '#FCDFEB'
				});
			}
			
		});
		
		// 비밀번호 찾기
		function pwd_hint() {
			
		   let id = $("#hint_id").val();
		   
		   $("#lbl_hint").hide();
			
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
						$("#pwd_hint").html("비밀번호는 <font style='color:rgb(255, 53, 94)'><b>"+data1+"</b></font>입니다.");
						$("#pwd_hint").show();
					}else{
						$("#pwd_hint").html("");
						$("#lbl_hint").show();	$("#pwd_hint").show();
						$("#pwd_hint").html("존재하지 않는 아이디입니다.");
						$("#pwd_hint").show();
					}
				},					
				error: function(e) {
					$("#lbl_hint").show();	
					$("#pwd_hint").html("<br><font style='color:red; font-size:13px;'>오류 발생. 다시 입력하세요.</font>");
					$("#pwd_hint").show();
		        }
			});
		}
		
		$("#find_pwd").on("click",function(){
				pwd_hint();
			});
		
		
	});
	// 모달 레이어 클릭할 경우 모달 닫기 (값 초기화)
	$(document).mouseup(function (e){
		if($(".modal").has(e.target).length === 0) {
			// 모달 닫기
			$(".modal").hide();
			// 회원가입 input 초기화
			$("#memId").val('');	$("#memPwd").val('');	$("#memName").val('');
			$("#signup_id").val('');	$("#signup_pwd").val('');
			$("#span_signupName").hide();	$("#span_signupId").hide();		$("span_signupPwd").hide();
			$("#span_signinId").hide();		$("span_signinPwd").hide();
			$("#span_signupPwd").hide();
			// 이미지 hide
			$("#sii_checked").hide();	$("#sii_wrong").hide();
			$("#sun_checked").hide();		$("#sui_checked").hide();		$("#sup_checked").hide();
			$("#sun_wrong").hide();		$("#sui_wrong").hide();		$("#sup_wrong").hide();
			// 버튼 활성화
			$("#login_btn").attr("disabled", false);
			$("#login_btn").css({
				'cursor' : 'pointer',
				'background-color' : '#FF355E'
			});
			$("#signup_btn").attr("disabled", false);
			$("#signup_btn").css({
				'cursor' : 'pointer',
				'background-color' : '#FF355E'
			});
		}
	});
	
	// 로그인 팝업에서 회원가입 링크 클릭
	function signUp() {
		$("#bg1").css({
			'display': 'none'
		});
		$("#bg2").css({
			'display': 'block'
		});
		$(".modal_content2").css({
			'display': 'block'
		});
		$(".modal_content1").css({
			'display': 'none'
		});
	}
	// 회원가입 팝업에서 로그인 링크 클릭
	function logIn() {
		$("#bg2").css({
			'display': 'none'
		});
		$("#bg1").css({
			'display': 'block'
		});
		$(".modal_content1").css({
			'display': 'block'
		});
		$(".modal_content2").css({
			'display': 'none'
		});
	}	
	// 로그인 팝업에서 비밀번호 찾기 링크 클릭
	function findPwd() {
		$("#bg3").css({
			'display' : 'block'
		});
		$(".modal_content3").css({
			'display': 'block'
		});
		
		$(".modal_content1").css({
			'display': 'block'
		});
		$("#bg1").css({
			'display' : 'none'
		});
	}
	
</script>
<style type="text/css">

	*{marmin: 0; padding: 0;}
	
	#menu:hover{
		font-weight: bold;
	}
	
	nav{
		height: 55px;
		z-index: 1;
	}
	
	.navbar-collapse {
		padding-top: 5px;
	}
	
	.container-fluid{
		position: fixed;
		background-color: #FFF;
		padding-bottom: 5px;
		border-bottom: 1px solid #d2d2d2;
	}
	
	
	.bg_keyword {
		border-radius: 5px;
		border: none;
		background: #f7f7f7 url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTZweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMTYgMTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8dGl0bGU+SWNvbiAvIEljVGFiQmFyIC8gSWNTZWFyY2hBbmQ8L3RpdGxlPgogICAgPGcgaWQ9IlVJLS0t7ZmILS8t6rKA7IOJIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBmaWxsLW9wYWNpdHk9IjAuNzYiPgogICAgICAgIDxnIGlkPSJfR2xvYmFsLS8tTmF2aWdhdGlvbkJhci0vLUl0ZW1zLS8tU2VhcmNoLS8tRW1wdHkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMS4wMDAwMDAsIC0xMS4wMDAwMDApIiBmaWxsPSIjN0U3RTdFIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwLTEzIj4KICAgICAgICAgICAgICAgIDxnIGlkPSJJY29uLS8tSWNUYWJCYXItLy1JY1NlYXJjaEFuZCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAuMDAwMDAwLCAxMC4wMDAwMDApIj4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNOC4wMjk5ODQxNSwxMi44NzM5OTc5IEM1LjQwNjA4MTEyLDEyLjg3Mzk5NzkgMy4yNzA1NDg1OCwxMC43MjI4NDAzIDMuMjcwNTQ4NTgsOC4wNzg3NTkgQzMuMjcwNTQ4NTgsNS40MzM4ODAwNyA1LjQwNjA4MTEyLDMuMjgyNzIyNTEgOC4wMjk5ODQxNSwzLjI4MjcyMjUxIEMxMC42NTM4ODcyLDMuMjgyNzIyNTEgMTIuNzg5NDE5Nyw1LjQzMzg4MDA3IDEyLjc4OTQxOTcsOC4wNzg3NTkgQzEyLjc4OTQxOTcsMTAuNzIyODQwMyAxMC42NTM4ODcyLDEyLjg3Mzk5NzkgOC4wMjk5ODQxNSwxMi44NzM5OTc5IE0xNi4wODEzNjkzLDE0Ljk1MTc3NTIgTDEzLjA4NjI0MTMsMTEuOTIwODUyNCBDMTMuODg4ODQ3LDEwLjg0OTY2MDUgMTQuMzcyNDY4Myw5LjUyMTYzNzc2IDE0LjM3MjQ2ODMsOC4wNzg3NTkgQzE0LjM3MjQ2ODMsNC41NTQxMTQ4NiAxMS41MjY5Mzg1LDEuNjg3NSA4LjAyOTk4NDE1LDEuNjg3NSBDNC41MzMwMjk4MywxLjY4NzUgMS42ODc1LDQuNTU0MTE0ODYgMS42ODc1LDguMDc4NzU5IEMxLjY4NzUsMTEuNjAyNjA1NSA0LjUzMzAyOTgzLDE0LjQ2OTIyMDQgOC4wMjk5ODQxNSwxNC40NjkyMjA0IEM5LjUyNTk2NTA2LDE0LjQ2OTIyMDQgMTAuODk5MjU5NywxMy45NDE5OTkzIDExLjk4NDQzOTUsMTMuMDY2MjIyMiBMMTQuOTYwNTcwOSwxNi4wNzgwMDIzIEMxNS4xMDkzNzc0LDE2LjIyOTU0ODQgMTUuMzA4ODQxNSwxNi4zMTI1IDE1LjUyMDk3MDEsMTYuMzEyNSBDMTUuNzMxNTE1NSwxNi4zMTI1IDE1LjkyOTM5NjYsMTYuMjMwMzQ2IDE2LjA3OTc4NjIsMTYuMDgwMzk1MSBDMTYuMjI4NTkyOCwxNS45Mjk2NDY2IDE2LjMxMTcwMjgsMTUuNzI5NDQ2MiAxNi4zMTI1LDE1LjUxNjQ4NCBDMTYuMzEzMjg1OSwxNS4zMDM1MjE4IDE2LjIzMDk2NzMsMTUuMTAyNTIzNyAxNi4wODEzNjkzLDE0Ljk1MTc3NTIiIGlkPSJGaWxsLTEiIGZpbGw9IiNCQUJBQzMiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+) no-repeat 10px 10px;
		width: 300px;
		height: 38px;
	}
	
	.keyword {
		color: #424242;
		font-size: 14px;
		letter-spacing: -0.5px;
		background: transparent;
		border: none;
		margin-left: 30px;
		width: 280px;
		padding-top: 3px;
	}
	
	.keyword:focus {
		outline: none;
	}
	
	.session {
		list-style-type: none;
		padding: 0;
		margin: 0;
	}
	
	.s_img {
		display: inline-block;
		border: none;
		border-radius: 70%;
		width: 35px;
		height: 35px;
		padding-right:5px;
	}
	
	.s_id {
		display: inline-block;
		font-size: 15px;
		line-height: 27px;
		margin-left: 0;
		padding-right: 5px;
	}
	
	.signIn {
		border: none;
		cursor: pointer;
		border-radius: 5px;
		background-color: #fbfbfb;
		padding: 5px;
		width: 65px;
		font-size: 12px;
		height: 32px;
		margin: 0;
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
		margin: 0;
	}
	
	.modal_content1, .modal_content2 {
		border-radius: 10px;
		width: 400px;
		height: 550px;
		z-index: 2;
		position: relative;
		text-align: center;
		background-color: #fff;
		margin-top: -2%;
		top:50%; 
		left:50%;
		transform: translate(-50%,-50%);
		padding: 5px;
		display: none;
	}
	
	.modal_content3 {
		border-radius: 10px;
		width: 25%;
		height: 70%;
		position: relative;
		background-color: #fff;
		text-align: center;
		top:50%; 
		left:50%;
		transform: translate(-50%,-50%);
		padding: 1%;
		display: block;
	}

	.modal, .modal1 {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		 /* Sit on top */
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
		margin-left: -95%;
		color: darkgray;
		border: 0;
		background-color: transparent;
	}
	
	.label {
	    background-color: #F2F2F2;
	    width: 80%;
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
		display: inline-block;
		width: 250px;
		line-height: 40px;
		border: none;
		background: transparent;
		font-weight: 400;
		outline: none;
	}
	
	.m_btn {
		width: 80%;
		margin-top: 1%;
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
	
	.logo_short {
		padding: 5px;
	}
	
	.logo_long {
		margin: 2%;
		width: 70%;
		height: 12%;
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
		padding-top: 5%;
		margin-left: 5%;
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
		position: fixed;
		margin-left: -10%;
		margin-top: 10px;
	}
	
	.lbl_hint {
		display: none;
		background-color: #FBEFF2;
	    border-radius: 5px;
	    padding: 5% 15%;
	    margin-top: 5%;
	    color: #6E6E6E;
	    font-size: 13px;
	}
	
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a id="menu" class="navbar-brand" href="<%=request.getContextPath() %>/main.do">
	   		 <img class="logo_short" src="./image/watchapedia2.png" alt="logo" width="150px" height="40">
	    </a>
	    &nbsp;&nbsp;&nbsp;
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a id="menu" class="nav-link" href="<%=request.getContextPath() %>/moive_main.do">영화</a>
	        </li>
	         &nbsp; &nbsp;&nbsp; 
	        <li class="nav-item dropdown">
	          <a id="menu" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="<%=request.getContextPath() %>/wacha_info.do">소개</a>
	          <ul class="dropdown-menu">
	          	<li><a id="menu" class="dropdown-item" href="<%=request.getContextPath() %>/wacha_info.do">안녕?왓챠피디아</a></li>
	          	<li><hr class="dropdown-divider"></li>
	          	<li><a id="menu" class="dropdown-item" href="<%=request.getContextPath() %>/answer_main.do">자주 묻는 질문</a></li>
	          </ul>
	        </li>
	       
	         &nbsp; &nbsp;&nbsp;
	        <li class="nav-item dropdown">
              <a id="menu" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                게시판
              </a>
              <ul class="dropdown-menu">
                <li><a id="menu" class="dropdown-item" href="<%=request.getContextPath() %>/#">자유게시판</a></li>
                    <li><hr class="dropdown-divider"></li>

               <%-- 로그인 됨.--%>
               <c:if test="${!empty session_id }">
                    <li><a id="menu" class="dropdown-item" href="<%=request.getContextPath() %>/inquiry_main.do">Q&A / 1:1문의</a></li>
                    <li><a id="menu" class="dropdown-item" href="<%=request.getContextPath() %>/write_result.do?id=${session_id}">문의내역</a></li>
               </c:if>

                <%-- 로그인 안됨. --%>
                <c:if test="${empty session_id }">
                    <li><a id="menu" class="dropdown-item" href="<%=request.getContextPath() %>/inquiry_main.do">Q&A문의</a></li>
                </c:if>  
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
	    		<li class="s_id"><img class="s_img" src="./image/profileupload/${session_img }" alt="프로필 사진" /></li>
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
				
				<div class="modal_content1">
				
					<br />
					
					<img class="logo_long" src="./image/watchapedia2.png" alt="왓챠피디아 로고" title="왓챠피디아" />
							
					<form method="post" action="<%=request.getContextPath()%>/login.do">	
						<br />
					
						<h3 class="m_title">로그인</h3>
					
						
							<div class="modal_id">
								<label class="label" for="memId">
									<input id="memId" class="text" name="memId" placeholder="아이디" required/>
									<span id="sii_checked" class="checked"></span>
									<span id="sii_wrong" class="checked"></span>
								</label>
								<span id="span_signinId"></span>
							</div>	
			
							<div class="modal_pwd">
								<label class="label" for="memPwd"> 
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
							
						<%-- <div class="hr-sect">OR</div> --%>
					
					</form>	
				
				</div>
				
			</div>

			<%-- 회원가입 모달 --%>
			<div id="bg2" class="modal">
			
				<div class="modal_content2">
					
					<br />	
				
					<img class="logo_long" src="./image/watchapedia2.png" alt="왓챠피디아 로고" title="왓챠피디아" />
					
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
					
					<%-- <div class="hr-sect">OR</div> --%>
					
				</div>
			
			</div>
			
			<%-- 비밀번호 찾기 모달 --%>
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
						입력하신 아이디의 비밀번호를 알려드립니다.
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
				
			</div> <%-- 비밀번호 찾기 end --%>
				     
	    &nbsp;
	  </div>
	</nav>
     
     
     
     
	
</body>
</html>