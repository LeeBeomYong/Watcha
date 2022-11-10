<%@page import="com.wacha.model.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	StarDAO dao = StarDAO.getInstance();

	int stars = dao.countStars();	
	
	request.setAttribute("stars", stars);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
	.rates{
		background-color: #000;
		height: 50px;
		text-align: center;
		color: #BDBDBD;
	}
	
	
	.stars {
		font-size: 20px;
		font-weight: bold;
		padding-top: 10px;
	}
	
	.bottom {
		text-align: center;	
		padding: 28.5px;
		color: #BDBDBD;
		background-color: #1C1C1C;
	}
	
	.bot2{
		height: 200px;
		background-color: #1D1D1D;
		color: white;
	}
	
	.bot_wrap {
		width: 70%;
		margin: auto;
		display: flex;
	}
	
	.part1 {
		flex: 1;
		
	}
	
	.info_u {
		list-style-type: none;
		padding: 0;
	}
	
	.info_u > .info_l {
		text-decoration: none;
	}
	
	.info_u .info_l::after {
		padding-left: 5px;
		content: "|";
	}
	
	.info_u .info_l:last-child::after {
		padding-left: 5px;
		content: "";
	}
	
	.info_l {
		text-decoration: none;
		display: inline-block;
	}
	
	.info_l a {
		color: #BDBDBD;
		text-decoration: none;
	}
	
	.part2 {
		display: block;
	}
	
	.info1 {
		font-weight: bold;
		word-spacing: -1px;
		text-align: left;
		font-size: 13.5px;
		line-height: 25px;
	}
	
	.info2 {
		word-spacing: -1px;
		text-align: left;
		font-size: 13.5px;
		line-height: 25px;
	}
	
	.info3 {
		word-spacing: -1px;
		text-align: left;
		font-size: 13px;
		line-height: 25px;
		color: #6E6E6E;
		
	}
	
	.star {
		color: rgb(255, 53, 94);
	}
	
	.goto, .goto:linked, .goto:visited {
		color: #d2d2d2;
	}
	
	.sites {
		margin: 171.5px 0 0;
	}
	
	.blank {
		display: flex;
	}


</style>
</head>
<body>
	
	<div class="wrapper2">
	
			<section class="rates">
				<p class="stars">
					지금까지 <span class="star">★<fmt:formatNumber>${stars }</fmt:formatNumber>개의 평가</span>가 쌓였어요.
				</p>
			</section>
			
			<section class="bottom">
				
				<div class="bot_wrap">
				
					<div class="part1">
					
						<div class="info1">
							<ul class="info_u">
								<li class="info_l"><a class="goto" href="https://pedia.watcha.com/ko-KR" target="blank">참고 페이지</a></li>
								<li class="info_l"><a class="goto" href="https://github.com/DuBori/Watcha" target="blank">5조 프로젝트</a></li>
								<li class="info_l"><a class="goto" href="https://www.iei.or.kr/main/main.kh" target="blank">학원 안내</a></li>
							</ul>						
						</div>
						
						<div class="info2">
						
							<ul class="info_u">
								<li class="info_l">고객센터</li>
								<li class="info_l">cs@kh.com, 02-123-4567</li>
							</ul>
							
							<ul class="info_u">
								<li class="info_l">광고 문의</li>
								<li class="info_l">ad@kh.com</li>
							</ul>
							
							<ul class="info_u">
								<li class="info_l">제휴 및 대외 협력</li>
								<li class="info_l">https://www.iei.or.kr/main/main.kh</li>
							</ul>
							
						</div>
						
						<div class="info3">
							
							<ul class="info_u">
								<li class="info_l">5조 프로젝트</li>
								<li class="info_l">영화 리뷰 플랫폼</li>
								<li class="info_l">조장 이범용</li>
								<li class="info_l">팀원 박정현 김홍기 배환희 박유진</li>
							</ul>
							
							<ul class="info_u">
								<li class="info_l">kh정보교육원</li>
								<li class="info_l">서울특별시 중구 남대문로 120, 대일빌딩 2-3층</li>
							</ul>
							
							<div>
								<img src="./image/왓챠_로고_bw.png" alt="WATCHA" width="60px" height="30px" />&nbsp;&nbsp; &copy; 2022 by 5조&WATCHAPEDIA. All rights reserved.
							</div>
							
						</div>
					
					</div>
				
					
					<div class="part2">
						<div class="blank">
							<p></p>
						</div>
					
						<div class="sites">
							<a href="https://www.iei.or.kr/main/main.kh" target="blank"><img src="./image/kh_bw.png" alt="kh정보교육원" width="35px" height="35px"/></a>
							&nbsp;
							<a href="https://www.watcha.com/" target="blank"><img src="./image/watcha_bw.png" alt="왓챠" width="38px" height="38px" /></a>
						</div>
					</div>
					
				
				</div>
				
			</section>
			
	</div>
	
</body>
</html>