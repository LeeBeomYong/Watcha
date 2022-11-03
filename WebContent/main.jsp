<%@page import="com.wacha.model.StarDTO"%>
<%@page import="com.wacha.model.StarDAO"%>
<%@page import="com.wacha.model.MovieDTO"%>
<%@page import="com.wacha.model.MovieDAO"%>
<%@page import="com.wacha.model.ImageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.wacha.model.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	ImageDAO dao1 = ImageDAO.getInstance();
	List<ImageDTO> ilist = dao1.getMainMovie_com();
	List<ImageDTO> ilist2 = dao1.getMainMovie_star();
	List<ImageDTO> ilist3 = dao1.getMainMovie_heart();
	List<ImageDTO> ilist4 = dao1.getMainMovie_hit();
			
	MovieDAO dao2 = MovieDAO.getInstance();
	List<MovieDTO> mlist = dao2.getMainMovie_com();
	List<MovieDTO> mlist2 = dao2.getMainMovie_star();
	List<MovieDTO> mlist3 = dao2.getMainMovie_heart();
	List<MovieDTO> mlist4 = dao2.getMainMovie_hit();
	
	StarDAO dao3 = StarDAO.getInstance();
	List<StarDTO> slist = dao3.getMainMovie_com();
	List<StarDTO> slist2 = dao3.getMainMovie_star();
	List<StarDTO> slist3 = dao3.getMainMovie_heart();
	List<StarDTO> slist4 = dao3.getMainMovie_hit();
	
	int[] number = {1,2,3,4,5,6,7,8,9,10};
	
	request.setAttribute("ilist", ilist);
	request.setAttribute("mlist", mlist);
	request.setAttribute("slist", slist);
	
	request.setAttribute("ilist2", ilist2);
	request.setAttribute("mlist2", mlist2);
	request.setAttribute("slist2", slist2);
	
	request.setAttribute("ilist3", ilist3);
	request.setAttribute("mlist3", mlist3);
	request.setAttribute("slist3", slist3);
	
	request.setAttribute("ilist4", ilist4);
	request.setAttribute("mlist4", mlist4);
	request.setAttribute("slist4", slist4);
	
	request.setAttribute("number", number);


%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 플랫폼</title>
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
				$("#sii_wrong").html("<img src='https://www.pikpng.com/pngl/m/29-297126_exclamation-in-a-circle-is-red-exclamation-point.png' width='25px' height='25px'>");
				$("#span_signinId").html("<br><font style='color:red; font-size:13px;'>아이디를 입력하세요.</font>");
			}else {
				$.ajax({
					type : "post",
					url : "check/idCheck.jsp",
					data : {paramId : id},
					datatype : "jsp",
					success : function(res) {
						if(res == 1) {  // DB에 아이디가 존재하는 경우
							$("#sii_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='25px' height='25px'>");
							$("#span_signinId").hide();
							$("#sii_wrong").hide();
						}else {
							$("#sii_wrong").html("<img src='https://www.pikpng.com/pngl/m/29-297126_exclamation-in-a-circle-is-red-exclamation-point.png' width='25px' height='25px'>");
							$("#span_signinId").html("<br><font style='color:red; font-size:13px;'>없는 아이디입니다. 다시 입력하세요.</font>");
							$("#sii_checked").hide();
						}
					},					
					error: function(e) {
						$("#sii_wrong").html("<img src='https://www.pikpng.com/pngl/m/29-297126_exclamation-in-a-circle-is-red-exclamation-point.png' width='25px' height='25px'>");
						$("#span_signinId").html("<br><font style='color:blue; font-size:13px;'>오류 발생. 다시 입력하세요.</font>");
						$("#sui_checked").hide();
		            }
				});
				
			}
		});
		
		// 로그인 - 비밀번호
		$("#memPwd").keyup(function() {
			const pwd = $(this).val();
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
				$("#sun_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='25px' height='25px'>");
				$("#span_signupName").hide();
				$("#sun_wrong").hide();
			}else {
				$("#sun_wrong").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Cross-mark-icon-in-red-color-on-transparent-background-PNG.png' width='25px' height='25px'>");
				$("#span_signupName").html("<br/><font style='color:red; font-size:13px;'>이름은 한글/영문 2~10자까지 가능합니다.</font>");
				$("#sun_checked").hide();
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
				$("#sui_wrong").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Cross-mark-icon-in-red-color-on-transparent-background-PNG.png' width='25px' height='25px'>");
			}else {
				if(pattern_id.test(id)) {
					$.ajax({
						type : "post",
						url : "check/idCheck.jsp",
						data : {paramId : id},
						datatype : "jsp",
						success : function(res) {
							if(res == 1) {  // DB에 아이디가 존재하는 경우
								$("sui_#wrong").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Cross-mark-icon-in-red-color-on-transparent-background-PNG.png' width='25px' height='25px'>");
								$("#span_signupId").html("<br/><font style='color:red; font-size:13px;'>중복된 아이디입니다.</font>");
								return false;
							}else {
								$("#sui_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='25px' height='25px'>");
								$("#span_signupId").hide();
								$("#sui_wrong").hide();
							}
						},					
						error: function(e) {
							$("#sui_wrong").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Cross-mark-icon-in-red-color-on-transparent-background-PNG.png' width='25px' height='25px'>");
							$("#span_signupId").html("<br><font style='color:blue; font-size:13px;'>오류 발생. 다시 입력하세요.</font>");
							$("#sui_checked").hide();
			            }
					});
				}else {
					$("#sui_wrong").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Cross-mark-icon-in-red-color-on-transparent-background-PNG.png' width='25px' height='25px'>");
					$("#span_signupId").html("<br><font style='color:red; font-size:13px;'>아이디 : 영문/숫자 5~10자</font>");
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
				$("#sup_checked").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Green-check-mark-icon-on-transparent-background-PNG.png' width='24px' height='24px'>");
				$("#span_signupPwd").hide(); $("#sup_wrong").hide();
			}else {
				$("#sup_wrong").html("<img src='https://image.similarpng.com/very-thumbnail/2021/06/Cross-mark-icon-in-red-color-on-transparent-background-PNG.png' width='24px' height='24px'>");
				$("#span_signupPwd").html("<br><font style='color:red; font-size:13px;'>비밀번호 : 영문/숫자/특수문자 5~10자</font>");
				$("#sup_checked").hide();
			}
			
		});
		
		
	});
	// 모달 레이어 클릭할 경우 모달 닫기 (값 초기화)
	$(document).mouseup(function (e){
		if($(".modal").has(e.target).length === 0) {
			$("#memId").val('');	$("#memPwd").val('');	$("#memName").val('');
			$("#signup_id").val('');	$("#signup_pwd").val('');
			$("#pwd_memId").val('');
			$(".modal").hide();
			$("#sun_checked").hide();	$("#sui_checked").hide();	$("#sup_checked").hide();
			$("#sii_checked").hide();	$("#sip_checked").hide();
			$("#span_signupName").hide();	$("#span_signupId").hide();		$("span_signupPwd").hide();
			$("#span_signinId").hide();		$("span_signinPwd").hide();
			$("#sun_wrong").hide();		$("#sui_wrong").hide();		$("#sup_wrong").hide();
			$("#sii_wrong").hide();	$("#sip_wrong").hide();
			
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
		$("#bg1").css({
			'display': 'block'
		});
		$(".modal_content1").css({
			'display': 'block'
		});
		
	}
	
	// 회원가입 - 아이디 
	
		
	// 비밀번호 찾기
	$("#find_pwd").click(function() {
		
		if($("#pwd_memId").val() == '') {
			alert("아이디를 입력해주세요.");
			modalPwdForm.memId.focus();
			return;
		}
				
	}); 
	
	
</script>
<style>

#wrapper {
	margin: auto;
	width: 85%;
	padding-top: 45px;
}

.li_1 > a {
	text-decoration: none;
}

.li_1 {
	display: inline-block;
	margin: 30px;
}

.selectbox {
	border: none;
}

.selectbox option {
	font-size: 13px;
	padding-bottom: 5px;
}

.logins {
	float: right;
	clear: both;
}

.click_login {
	width: 50%;
	display: none;	
}

.ul_1 {
	list-style-type: none;
	margin-left: 50px;
}

.li_1 > a {
	text-decoration: none;
	color: #000;
	display: inline-block;
}

a:linked, a:visited {
	color: #000;
}

.li_1 {
	margin: 10px;
}

img {
	margin: 5%;
}

p {
	font-weight: bold;
	font-size: 27px;
}

.carousel-control-prev, .carousel-control-next {
	opacity: 1;
	width: 3%;
	z-index: 0;
}

.carousel-control-prev:hover, .carousel-control-next:hover {
	pointer-events:none;
}

#carouselExampleControls1, #carouselExampleControls2, #carouselExampleControls3 {
	margin-bottom: 30px;
}

.poster {
	border-radius: 5px;
	width: 210px;
	height: 300px;
}

.ex_box_1 {
	margin-left: 10px;
	font-size: 16px;
	font-weight: bold;
}

.ex_box_2 {
	margin-left: 10px;
	font-size: 13px;
	color: rgb(255, 53, 94);
}

p {
	font-weight: 600;
	font-size: 27px;
}

.carousel-control-prev-icon {
	background-image: url("");
}

.main_poster {
	padding: relative;
}

.caption {
	display: inline-block;
	position: absolute;
	width: 28px;
	height: 28px;
	text-align: center;
	font-size: 14px;
	font-weight: 700;
	color: #fff;
	background-color: #000;
	border-radius: 5px;
	margin-top: 25px;
	margin-left: 20px;
}

.carousel-control-prev-icon {
	width: 30px;
	height: 30px;
	background-image: url('./image/left_arrow.png');
	color: red;
}

.carousel-control-next-icon {
	width: 30px;
	height: 30px;
	background-image: url('./image/right_arrow.png'); 
}


</style>
</head>
<body>

	<jsp:include page="./include/user_top.jsp" />

	<div id="wrapper">
	
	<form method="post" action="<%=request.getContextPath()%>/select_genre.do">
		<select class="selectbox" name="genre" onchange="this.form.submit()" >
			<option value="home" selected>홈</option>
			<option value="action">액션</option>
			<option value="sf">SF</option>
			<option value="comedie">코미디</option>
			<option value="melo">멜로</option>
			<option value="animation">애니메이션</option>
			<option value="thriller">공포/스릴러</option>
			<option value="sports">스포츠</option>
			<option value="rom_co">로맨스코미디</option>
			<option value="noir">누와르/범죄</option>
			<option value="musical">음악/뮤지컬</option>
		</select>
	</form>
	
	<br />	<br />
	
	<c:set var="comIlist" value="${ilist }" />
	<c:set var="comMlist" value="${mlist }" />
	<c:set var="comSlist" value="${slist }" />
	
	<c:set var="num" value="${number }" />
	
	<%-- 코멘트(한줄평) 많은 영화 기준 TOP10 (comment) --%>
	<p>인기순위 : 리뷰 TOP10</p>
	
	<div id="carouselExampleControls1" class="carousel slide">
	
		<div class="carousel-inner">
		
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" ></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty ilist }">
				
				<div class="carousel-item active">
					
					
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${comIlist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${ilist.movie_num}">
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${comMlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${comSlist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
							
						</li>
					</ul>
					
				</div>
				
				<div class="carousel-item">
				
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${comIlist}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${ilist.movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${comMlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${comSlist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			<c:if test="${empty ilist }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
			    <span class="carousel-control-next-icon" ></span>
			    <span class="visually-hidden">Next</span>
			</button>
		
		</div>
		
	</div>
	
	<c:set var="sIlist" value="${ilist2 }" />
	<c:set var="sMlist" value="${mlist2 }" />
	<c:set var="sSlist" value="${slist2 }" />
		
	<%-- 별점 높은 영화 기준 TOP10 (comment) --%>
	<p>인기순위 : 별점 TOP10</p>
	
	<div id="carouselExampleControls2" class="carousel slide">

		<div class="carousel-inner">
		
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty sIlist }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${sIlist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${sMlist[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${sMlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${sSlist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${sIlist}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${sMlist[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${sMlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								 		평균 ★${sSlist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			<c:if test="${empty sIlist }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		
		</div>
		
	</div>
	
	<c:set var="hIlist" value="${ilist3 }" />
	<c:set var="hMlist" value="${mlist3 }" />
	<c:set var="hSlist" value="${slist3 }" />
			
	<%-- '찜하기' 높은 영화 기준 TOP10 (comment) --%>
	<p>인기순위: 보관함 TOP10</p>
	
	<div id="carouselExampleControls3" class="carousel slide">

		<div class="carousel-inner">
		
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty ilist }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${hIlist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${hMlist[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${hMlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${hSlist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${hIlist}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${hMlist[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${hMlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${hSlist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			<c:if test="${empty ilist }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		
		</div>
		
	</div>
	
	<c:set var="hilist" value="${ilist4 }" />
	<c:set var="hmlist" value="${mlist4 }" />
	<c:set var="hslist" value="${slist4 }" />
	
	<%-- '보는 중' 높은 영화 기준 TOP10 (star) --%>
	<p>실시간 급상승 TOP10</p>
	
	<div id="carouselExampleControls4" class="carousel slide">

		<div class="carousel-inner">
		
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty hilist }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${hilist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${hmlist[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${hmlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${hslist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${hilist}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${hmlist[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${hmlist[status.index].movie_title}
								    </div>
								    <div class="ex_box_2"> 
								    	평균 ★${hslist[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			<c:if test="${empty hilist }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		
		</div>
		
	</div>
		
	</div> <%-- #wrapper end --%>
	
	<jsp:include page="./include/user_bottom.jsp" />

</body>
</html>