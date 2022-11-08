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
	
	// 코멘트
	request.setAttribute("ilist", ilist);
	request.setAttribute("mlist", mlist);
	request.setAttribute("slist", slist);
	// 별점
	request.setAttribute("ilist2", ilist2);
	request.setAttribute("mlist2", mlist2);
	request.setAttribute("slist2", slist2);
	// 보관함
	request.setAttribute("ilist3", ilist3);
	request.setAttribute("mlist3", mlist3);
	request.setAttribute("slist3", slist3);
	// 실시간
	request.setAttribute("ilist4", ilist4);
	request.setAttribute("mlist4", mlist4);
	request.setAttribute("slist4", slist4);
	
	request.setAttribute("num", number);


%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 플랫폼</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
	
	$(function() {
		
		
		
		$("#prv_btn1").click(function() {
			
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
	display: inline-block;
	margin: 1%;
	width: 100%;
	text-align: center;
}

.li_1 > a {
	text-decoration: none;
	text-align: left;
}

.selectbox {
	border: 1px solid #F4f4f4;
	padding: 3px;
}

.selectbox:focus {
	outline: none;
}
.selectbox option {
	font-size: 13px;
	padding-bottom: 5px;
	
}
.selectbox option:hover {
	font-weight: bold;
	background-color: #FBEFF2;
}

.logins {
	float: right;
	clear: both;
}

.click_login {
	width: 50%;
	display: none;	
}

img {
	padding: 3%;
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
	width: 5% !important;
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

select {
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
}


</style>
</head>
<body>

	<jsp:include page="./include/user_top.jsp" />

	<div id="wrapper">
	
	<form method="post" action="<%=request.getContextPath()%>/select_genre.do">
		<select class="selectbox" name="genre" onchange="this.form.submit()" >
			<option value="홈" selected disabled>장르</option>
			<option value="범죄">범죄</option>
			<option value="액션">액션</option>
			<option value="로맨스">로맨스</option>
			<option value="다큐멘터리">다큐멘터리</option>
			<option value="코미디">코미디</option>
		</select>
	</form>
	
	<br />	<br />
	
		
	<%-- 코멘트(한줄평) 많은 영화 기준 TOP10 (comment) --%>
	<p>인기순위 : 리뷰 TOP10</p>
	
	<div id="carouselExampleControls1" class="carousel slide">
	
		<div class="carousel-inner">
		
			<button id="prv_btn1" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span><img id="slide_p" src="https://cdn-icons-png.flaticon.com/512/2767/2767149.png" alt="previous" /></span>
			</button>
			
			<c:if test="${!empty ilist }">
				
				<div class="carousel-item active">
					
					
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${list.movie_num}">
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc}" alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist[status.index].movie_date} ㆍ ${mlist[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist[status.index].getMovie_star()}
								    </div>
							    </a>							   
							</c:forEach>
						</li>
					</ul>
					
				</div>
				
				<div class="carousel-item">
				
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${list.movie_num}">	

									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist[status.index].movie_date} ㆍ ${mlist[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist[status.index].getMovie_star()}
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
							
			<button id="nxt_btn1" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span><img id="slide_n" src="https://cdn-icons-png.flaticon.com/128/1250/1250699.png" alt="next" /></span>
			</button>
		
		</div>
		
	</div>
	
	<%-- 별점 높은 영화 기준 TOP10 (comment) --%>
	<p>인기순위 : 별점 TOP10</p>
	
	<div id="carouselExampleControls2" class="carousel slide">

		<div class="carousel-inner">
		
			<button id="prv_btn2" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span><img id="slide_p" src="https://cdn-icons-png.flaticon.com/512/2767/2767149.png" alt="previous" /></span>
			</button>
			
			<c:if test="${!empty ilist2 }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist2}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist2[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist2[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist2[status.index].movie_date} ㆍ ${mlist2[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist2[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist2}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist2[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist2[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist2[status.index].movie_date} ㆍ ${mlist2[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								 		평균★${slist2[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			<c:if test="${empty ilist2 }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button id="nxt_btn2" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span><img id="slide_n" src="https://cdn-icons-png.flaticon.com/128/1250/1250699.png" alt="next" /></span>
			</button>
		
		</div>
		
	</div>
			
	<%-- '찜하기' 높은 영화 기준 TOP10 (comment) --%>
	<p>인기순위: 보관함 TOP10</p>
	
	<div id="carouselExampleControls3" class="carousel slide">

		<div class="carousel-inner">
		
			<button id="prv_btn3" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span><img id="slide_p" src="https://cdn-icons-png.flaticon.com/512/2767/2767149.png" alt="previous" /></span>
			</button>
			
			<c:if test="${!empty ilist3 }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist3}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist3[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist3[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist3[status.index].movie_date} ㆍ ${mlist3[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist3[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist3}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist3[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist3[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist3[status.index].movie_date} ㆍ ${mlist3[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist3[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			<c:if test="${empty ilist3 }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button id="nxt_btn3" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span><img id="slide_n" src="https://cdn-icons-png.flaticon.com/128/1250/1250699.png" alt="next" /></span>
			</button>
		
		</div>
		
	</div>
	
	
	<%-- '보는 중' 높은 영화 기준 TOP10 (star) --%>
	<p>실시간 급상승 TOP10</p>
	
	<div id="carouselExampleControls4" class="carousel slide">

		<div class="carousel-inner">
		
			<button id="prv_btn4" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span><img id="slide_p" src="https://cdn-icons-png.flaticon.com/512/2767/2767149.png" alt="previous" /></span>
			</button>
			
			<c:if test="${!empty ilist4 }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist4}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist4[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist4[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist4[status.index].movie_date} ㆍ ${mlist4[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist4[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
				<div class="carousel-item">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${ilist4}" begin="5" end="9" varStatus="status">
								<a href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${mlist4[status.index].movie_num}">	
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${list.image_loc} " alt="영화 포스터 이미지" />
								    </div>
								    <div class="ex_box_1">
								    	${mlist4[status.index].movie_title}
								    </div>
								    <div class="ex_box3">
								    	${mlist4[status.index].movie_date} ㆍ ${mlist4[status.index].movie_country }
								    </div>
								    <div class="ex_box_2"> 
								    	평균★${slist4[status.index].getMovie_star()}
								    </div>
							    </a>
							</c:forEach>
						</li>
					</ul>
				</div>
				
			</c:if>
			
			
			<c:if test="${empty ilist4 }">
				<h3>조회된 영화가 없습니다.</h3>
			</c:if>
							
			<button id="nxt_btn4" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span><img id="slide_n" src="https://cdn-icons-png.flaticon.com/128/1250/1250699.png" alt="next" /></span>
			</button>
		
		</div>
		
	</div>
	
	<br />
		
	</div> <%-- #wrapper end --%>
	
	<jsp:include page="./include/user_bottom.jsp" />

</body>
</html>