<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택 장르 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<script>
	$(function () {
		
		$(".signIn").click(function() {
			$(".modal").css({
				'display': 'block'
			});
			$(".modal_content1").css({
				'display': 'block'
			});
			$(".modal_content2").css({
				'display': 'none'
			});
		});
		
		$(".signUp").click(function() {
			$(".modal").css({
				'display': 'block'
			});
			$(".modal_content2").css({
				'display': 'block'
			});
			$(".modal_content1").css({
				'display': 'none'
			});
		});
		
		$(".modal").click(function() {
			$(".modal").hide();
			$(".modal_content").hide();
		});
	
	});
	
	function signUp() {
		$(".modal_content2").css({
			'display': 'block'
		});
		$(".modal_content1").css({
			'display': 'none'
		});
	}

function logIn() {
	$(".modal_content1").css({
		'display': 'block'
	});
	$(".modal_content2").css({
		'display': 'none'
	});
}
</script>
<style>

#wrapper {
	margin: auto;
	width: 85%;
	padding-top: 45px;
}

li > a {
	text-decoration: none;
}

li {
	display: inline-block;
	margin: 20px;
}

.logins {
	float: right;
	clear: both;
}

.click_login {
	width: 50%;
	display: none;	
}

.modal_content {
	border-radius: 10px;
	width: 400px;
	height: 600px;
	position: relative;
	text-align: center;
	background-color: #fff;
	top:50%; 
	left:50%;
	transform: translate(-50%,-50%);
	padding: 5px;
	display: block;
}

.modal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: #000;
	top:0; left:0;
	cursor: pointer;
	display: none;
}

.modal_form {
	text-align: center;	
}

.label {
    background-color: lightgray;
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
}

.m_btn {
	width: 300px;
	border: none;
	background-color: rgb(255, 53, 94);
	cursor: pointer;
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

img {
	margin: 5%;
}

p {
	font-weight: bold;
	font-size: 27px;
}

.carousel-control-prev, .carousel-control-next {
	opacity: 0;
}

</style>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />

	<div id="wrapper">
	
	<c:set var="mlist" value="${movieList }" />
	<c:set var="ilist" value="${imageList }" />
	<c:set var="slist" value="${starList }" />
	
		<br />	<br />
		
		<%-- 코멘트(한줄평) 많은 영화 기준 TOP10 (comment) --%>
		<p>인기순위 : 리뷰 TOP10</p>
		
		<div id="carouselExampleControls"1 class="carousel slide">
		
			<div class="carousel-inner">
			
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				</button>
				
				<div class="carousel-item active">
				
					<c:if test="${!empty mlist }">
						<ul>
							<c:forEach begin="1" end="5">
								<li>
									<a href="<%=request.getContextPath()%>">
										<div class="poster">
											<img alt="포스터 이미지" src="${ilist.image_loc }" width="210" height="300">
										</div>
										<div class="bref">
											${mlist.movie_title }
										</div>
										<div class="star">
											${slist.movie_star }
										</div>
									</a>
								</li>
							</c:forEach>	
						</ul>
						
				</div>
					
				<div class="carousel-item">	
						<ul>
							<c:forEach begin="6" end="10">
								<li>
									<a href="<%=request.getContextPath()%>">
										<div class="poster">
											<img alt="포스터 이미지" src="${ilist.image_loc }" width="210" height="300">
										</div>
										<div class="bref">
											${mlist.movie_title }
										</div>
										<div class="star">
											${slist.movie_star }
										</div>
									</a>
								</li>
							</c:forEach>	
						</ul>
					</c:if>
				</div>
					
					<c:if test="${empty mlist }">
						<p>조회된 영화가 없습니다.</p>
					</c:if>
								
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				</button>
			
			</div>
			
		</div>
		
		<%-- 별점 높은 영화 기준 TOP10 (comment) --%>
		<p>인기순위 : 별점 TOP10</p>
		
		<div id="carouselExampleControls2" class="carousel slide">
		
			<div class="carousel-inner">
			
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				</button>
				
				<div class="carousel-item active">
				
					<c:if test="${!empty mlist }">
						<ul>
							<c:forEach begin="1" end="5">
								<li>
									<a href="<%=request.getContextPath()%>">
										<div class="poster">
											<img alt="포스터 이미지" src="${ilist.image_loc }" width="210" height="300">
										</div>
										<div class="bref">
											${mlist.movie_title }
										</div>
										<div class="star">
											${slist.movie_star }
										</div>
									</a>
								</li>
							</c:forEach>	
						</ul>
						
				</div>
					
				<div class="carousel-item">	
						<ul>
							<c:forEach begin="6" end="10">
								<li>
									<a href="<%=request.getContextPath()%>">
										<div class="poster">
											<img alt="포스터 이미지" src="${ilist.image_loc }" width="210" height="300">
										</div>
										<div class="bref">
											${mlist.movie_title }
										</div>
										<div class="star">
											${slist.movie_star }
										</div>
									</a>
								</li>
							</c:forEach>	
						</ul>
					</c:if>
				</div>
					
					<c:if test="${empty mlist }">
						<ul>
							<li>
								<a href="<%=request.getContextPath()%>/content.do?num=${list.movie_num }">
									<div class="poster">
										영화 포스터
									</div>
									<div class="bref">
										영화 제목
									</div>
									<div class="star">
										영화 평균 별점
									</div>
								</a>
							</li>
						</ul>
					</c:if>
									
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				</button>
			
			</div>
			
		</div>
		
		<%-- '찜하기' 높은 영화 기준 TOP10 (comment) --%>
		<p>인기순위: 보관함 TOP10</p>
		
		<div id="carouselExampleControls3" class="carousel slide">
		
			<div class="carousel-inner">
			
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				</button>
				
				<div class="carousel-item active">
				
					<c:if test="${!empty mlist }">
						<ul>
							<c:forEach begin="1" end="5">
								<li>
									<a href="<%=request.getContextPath()%>">
										<div class="poster">
											<img alt="포스터 이미지" src="${ilist.image_loc }" width="210" height="300">
										</div>
										<div class="bref">
											${mlist.movie_title }
										</div>
										<div class="star">
											${slist.movie_star }
										</div>
									</a>
								</li>
							</c:forEach>	
						</ul>
						
				</div>
					
				<div class="carousel-item">	
						<ul>
							<c:forEach begin="6" end="10">
								<li>
									<a href="<%=request.getContextPath()%>">
										<div class="poster">
											<img alt="포스터 이미지" src="${ilist.image_loc }" width="210" height="300">
										</div>
										<div class="bref">
											${mlist.movie_title }
										</div>
										<div class="star">
											${slist.movie_star }
										</div>
									</a>
								</li>
							</c:forEach>	
						</ul>
					</c:if>
				</div>
					
					<c:if test="${empty mlist }">
						<ul>
							<li>
								<a href="<%=request.getContextPath()%>/content.do?num=${list.movie_num }">
									<div class="poster">
										영화 포스터
									</div>
									<div class="bref">
										영화 제목
									</div>
									<div class="star">
										영화 평균 별점
									</div>
								</a>
							</li>
						</ul>
					</c:if>
									
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				</button>
			
			</div>
			
		</div>
		
	</div>
	
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>