<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 플랫폼</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>


	$(function() {
		
		$("#prv_btn1").css({
			'display' : 'none'
		});
		$("#prv_btn2").css({
			'display' : 'none'
		});
		$("#prv_btn3").css({
			'display' : 'none'
		});
		$("#prv_btn4").css({
			'display' : 'none'
		});
		
		// next 클릭 > prev show, next hide
		$("#nxt_btn1").on("click",function() {
			$("#prv_btn1").show();
			$("#nxt_btn1").hide();
		});
		$("#nxt_btn2").on("click",function() {
			$("#prv_btn2").show();
			$("#nxt_btn2").hide();
		});
		$("#nxt_btn3").on("click",function() {
			$("#prv_btn3").show();
			$("#nxt_btn3").hide();
		});
		$("#nxt_btn4").on("click",function() {
			$("#prv_btn4").show();
			$("#nxt_btn4").hide();
		});
		// prev 클릭 > next hide, prev show
		$("#prv_btn1").on("click",function() {
			$("#nxt_btn1").show();
			$("#prv_btn1").hide();
		});
		$("#prv_btn2").on("click",function() {
			$("#nxt_btn2").show();
			$("#prv_btn2").hide();
		});
		$("#prv_btn3").on("click",function() {
			$("#nxt_btn3").show();
			$("#prv_btn3").hide();
		});
		$("#prv_btn4").on("click",function() {
			$("#nxt_btn4").show();
			$("#prv_btn4").hide();
		});
				
	});

</script>
<style>

#wrapper {
	margin: auto;
	width: 90%;
	padding-top: 45px;
}


.ul_1 {
	list-style-type: none;
	padding: 0;
	text-align: center;
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
	display: inline;
	margin: 1%;
	width: 100%;
	text-align: center;
}

.li_1 > a {
	text-decoration: none;
	text-align: left;
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

p {
	font-weight: bold;
	font-size: 27px;
}

#carouselExampleControls1, #carouselExampleControls2, #carouselExampleControls3 {
	margin-bottom: 3%;
}

.poster {
	border-radius: 5%;
	width: 230px;
	height: 330px;
}


.ex_box_1 {
	margin-left: 10px;
	font-size: 16px;
	font-weight: 500;
}

.ex_box_2 {
	margin-left: 10px;
	font-size: 13px;
	color: rgb(255, 53, 94);
}

.ex_box3 {
	margin-left: 10px;
	font-size: 13.5px;
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
	margin-left: 25px;
}

.carousel-control-prev, .carousel-control-next {
	width:  !important;
	height: 50px !important;
	top: 180px !important;
	color: #000 !important;
	z-index: 0 !important;
}

#prv, #nxt {
	visibility: hidden;
}

#slide_p {
	width: 30px;
	height: 30px;
}

#slide_n {
	width: 30px;
	height: 30px;
}

.genre {
	font-size: 15px;
	color: #d2d2d2;
}

.selected {
	font-size: 20px;
	color: #000;
	text-shadow: gray;
}

.nothing {
	width: 100%;
	height: 350px;
	text-align: center;
	vertical-align: middle;
}

.non {
	width: 80px;
	height: 100px;
	border: none;
	margin-bottom: 5%;
}

.n_message {
	font-size: 16px;
	font-weight: 400;
	color: #A4A4A4;
}

.arrow_p {
	background: url("./image/arrowl.png") 0px center / 32px no-repeat rgb(255, 255, 255);
	border-radius: 50%;
	border: 1px solid rgb(249,249,249);
	box-sizing: border-box;
	width: 34px;
	height: 34px;
	cursor: pointer;
}

.arrow_n {
	background: url("./image/arrowr.png") 0px center / 32px no-repeat rgb(255, 255, 255);
	border-radius: 50%;
	border: 1px solid rgb(249,249,249);
	box-sizing: border-box;
	width: 34px;
	height: 34px;
	cursor: pointer;
}

</style>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />

	<div id="wrapper">
	
	<p class="genre">홈 > <span class="selected">${param.genre }</span></p>
	
	<br />

	
	<%-- 코멘트(한줄평) 많은 영화 기준 TOP10 (comment) --%>
	<p>인기순위 : 리뷰 TOP10</p>
	
	<c:if test="${!empty ilist }">
	
		<div id="carouselExampleControls1" class="carousel slide">
		
			<div class="carousel-inner">
			
				
				<div class="carousel-item active">
					
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist}" begin="0" end="4" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${list.movie_num}">
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc}" alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist[status.index].movie_date} ㆍ ${mlist[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist[status.index].movie_star }
								    </div>
							    </a>
							 </li>
						</c:forEach>
					</ul>
					
				</div>
				
				<div class="carousel-item">
				
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist}" begin="5" end="9" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${list.movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist[status.index].movie_date} ㆍ ${mlist[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist[status.index].movie_star}
								    </div>
							    </a>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<button id="prv_btn1" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
				    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="arrow_p"></span>
				</button>
					
				<button id="nxt_btn1" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
				    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="arrow_n"></span>
				</button>
		
			</div>
			
		</div>
		
	</c:if>
	
	<c:if test="${empty ilist }">
		<div class="nothing">
			<img class="non" src="./image/null.png" alt="nothing" /> <br />
			<p class="n_message">코멘트가 달린 해당 장르 영화가 없습니다.</p>
		</div>
	</c:if>
	
		
	<%-- 별점 높은 영화 기준 TOP10 (comment) --%>
	<p>인기순위 : 별점 TOP10</p>
	
	<c:if test="${!empty ilist2 }">
	
		<div id="carouselExampleControls2" class="carousel slide">
		
			<div class="carousel-inner">
			
				<div class="carousel-item active">
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist2}" begin="0" end="4" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist2[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist2[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist2[status.index].movie_date} ㆍ ${mlist2[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist2[status.index].movie_star}
								    </div>
							    </a>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist2}" begin="5" end="9" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist2[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist2[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist2[status.index].movie_date} ㆍ ${mlist2[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								 		평균★${slist2[status.index].movie_star}
								    </div>
							    </a>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<button id="prv_btn2" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
				    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="arrow_p"></span>
				</button>
			
				<button id="nxt_btn2" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
				    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="arrow_n"></span>
				</button>
			
			</div>
			
		</div>
	
	</c:if>
	
	<c:if test="${empty ilist2 }">
		<div class="nothing">
			<img class="non" src="./image/null.png" alt="nothing" /> <br />
			<p class="n_message">평가된 해당 장르 영화가 없습니다.</p>
		</div>
	</c:if>
			
	<%-- '찜하기' 높은 영화 기준 TOP10 (comment) --%>
	<p>인기순위: 보관함 TOP10</p>
	
	<c:if test="${!empty ilist3 }">
	
		<div id="carouselExampleControls3" class="carousel slide">
	
			<div class="carousel-inner">
			
				<div class="carousel-item active">
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist3}" begin="0" end="4" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist3[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist3[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist3[status.index].movie_date} ㆍ ${mlist3[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist3[status.index].movie_star}
								    </div>
							    </a>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist3}" begin="5" end="9" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist3[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist3[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist3[status.index].movie_date} ㆍ ${mlist3[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist3[status.index].movie_star}
								    </div>
							    </a>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<button id="prv_btn3" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
				    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="arrow_p"></span>
				</button>
			
				<button id="nxt_btn3" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
				    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="arrow_n"></span>
				</button>
			
			</div>
			
		</div>
	
	</c:if>
	
	<c:if test="${empty ilist3 }">
		<div class="nothing">
			<img class="non" src="./image/null.png" alt="nothing" /> <br />
			<p class="n_message">'찜하기'가 된 해당 장르 영화가 없습니다.</p>
		</div>
	</c:if>
	
	<%-- '보는 중' 높은 영화 기준 TOP10 (star) --%>
	<p>실시간 급상승 TOP10</p>
	
	<c:if test="${!empty mlist4 }">
	
		<div id="carouselExampleControls4" class="carousel slide">
	
			<div class="carousel-inner">
			
				<div class="carousel-item active">
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist4}" begin="0" end="4" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist4[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist4[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist4[status.index].movie_date} ㆍ ${mlist4[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist4[status.index].movie_star}
								    </div>
							    </a>
							</li>    
						</c:forEach>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<c:forEach var="list" items="${ilist4}" begin="5" end="9" varStatus="status">
							<li class="li_1">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist4[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="<%=request.getContextPath()%>/image/${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist4[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist4[status.index].movie_date} ㆍ ${mlist4[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist4[status.index].movie_star}
								    </div>
							    </a>
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<button id="prv_btn4" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
				    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="arrow_p"></span>
				</button>
			
				<button id="nxt_btn4" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
				    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="arrow_n"></span>
				</button>
			
			</div>
		
		</div>
	
	</c:if>
	
	<c:if test="${empty mlist4 }">
		<div class="nothing">
			<img class="non" src="./image/null.png" alt="nothing" /> <br />
			<p class="n_message">실시간 급상승 중인 해당 장르 영화가 없습니다.</p>
		</div>
	</c:if>
	
	<br />
		
	</div> <%-- #wrapper end --%>
	
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>