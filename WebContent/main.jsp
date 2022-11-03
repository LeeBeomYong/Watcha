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
<style>

#wrapper {
	margin: auto;
	width: 90%;
	padding-top: 45px;
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
	margin-left: 20px;
}

.li_1 > a {
	text-decoration: none;
	color: #000;
	display: inline-block;
}

a:linked, a:visited {
	color: #000;
}

img {
	margin: 5%;
}

p {
	font-weight: bold;
	font-size: 27px;
}

#carouselExampleControls1, #carouselExampleControls2, #carouselExampleControls3 {
	margin-bottom: 30px;
}

.poster {
	border-radius: 5px;
	width: 230px;
	height: 330px;
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

.carousel-control {
	top: 20%;
	bottom: 20%;
}

#prv_btn, #nxt_btn {
	width: 12%;
	z-index: 3;
	opacity: 0.7;
	margin-left: 5px;
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
		
			<button id="prv_btn" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty ilist }">
				
				<div class="carousel-item active">
					
					
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${comIlist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${ilist.movie_num}">
									<div class="main_poster">
										<div class="caption">${num[status.index] }</div>
								    	<img class="poster" src="${ilist.image_loc}" alt="영화 포스터 이미지" />
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
								<a href="<%=request.getContextPath()%>/movie_contente.do?movie_num=${ilist.movie_num}">	
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
							
			<button id="nxt_btn" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
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
		
			<button id="prv_btn" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty sIlist }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="list" items="${sIlist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${sMlist[status.index].movie_num}">	
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
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${sMlist[status.index].movie_num}">	
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
							
			<button id="nxt_btn" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
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
		
			<button id="prv_btn" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty ilist }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${hIlist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${hMlist[status.index].movie_num}">	
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
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${hMlist[status.index].movie_num}">	
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
							
			<button id="nxt_btn" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
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
		
			<button id="prv_btn" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
			    <span id="prv" class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			
			<c:if test="${!empty hilist }">
				
				<div class="carousel-item active">
					<ul class="ul_1">
						<li class="li_1">
							<c:forEach var="ilist" items="${hilist}" begin="0" end="4" varStatus="status">
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${hmlist[status.index].movie_num}">	
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
								<a href="<%=request.getContextPath()%>/movie_content.do?movie_num=${hmlist[status.index].movie_num}">	
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
							
			<button id="nxt_btn" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls4" data-bs-slide="next">
			    <span id="nxt" class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		
		</div>
		
	</div>
	
	<br />
		
	</div> <%-- #wrapper end --%>
	
	<jsp:include page="./include/user_bottom.jsp" />

</body>
</html>