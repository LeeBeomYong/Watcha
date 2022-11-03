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
<title>Insert title here</title>
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

ul {
	list-style-type: none;
	margin-left: 50px;
}

li > a {
	text-decoration: none;
	color: #000;
	display: inline-block;
}

a:linked, a:visited {
	color: #000;
}

li {
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

#prv_btn, #nxt_btn {
	width: -15%;
	opacity: 1;
}

#prv {
	background-image: url('image/left_arrow.png');
	background-color: #fff;
	border-radius: 70%;
	width: 30px;
	height: 30px;
}

#nxt {
	background-image: url('image/right_arrow.png');
	background-color: #fff;
	border-radius: 70%;
	width: 30px;
	height: 30px;
}

#wrapper > .slide {
	overflow: hidden;
}

#wrapper > .slide .slide_cont .li_1 {
	float: left;
}

#wrapper > .arrow > a.prev {
	position: absolute;
	left: -50px;
	top: 100px;
}

#wrapper > .arrow > a.next {
	position: absolute;
	rightt: -50px;
	top: 100px;
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

		<div class="slide">
		
			<div class="slide_cont">
			
				<c:if test="${empty ilist }">
					<h3>조회된 영화가 없습니다.</h3>
				</c:if>
				
				<c:if test="${!empty ilist }">
				
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
				
				</c:if>
				
			</div> <%-- slide_cont end --%>
		
			<div class="arrow">
				<a href="" class="prev">이전</a>
			    <a href="" class="next">다음</a>
			</div>
		
		</div> <%-- slide end --%>


	</div> <%-- #wrapper end --%>
	
	<jsp:include page="./include/user_bottom.jsp" />

</body>
</html>