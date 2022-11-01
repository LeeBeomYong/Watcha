<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<script>    
	// html dom 이 다 로딩된 후 실행된다.    
// 	$(document).ready(function(){        
// 		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때        
// 		$(".menu>a").click(function(){            
// 			var submenu = $(this).next("ul");             
// 			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기            
// 			if( submenu.is(":visible") ){                
// 				submenu.slideUp();            
// 			}else{                
// 				submenu.slideDown();            
// 			}        
// 		});   
// 	});
</script>
<style type="text/css">

/* 	#root{ */
/* 		height: 1000px; */
/* 	} */
	
	#sub{
		margin-left: 20px;
		margin-right: 20px;
		
	}
	
	#sp1 {
		color: gray;
		font-size: 20px;
	}

	.review:not(hr,.add) {
		position: relative;
	}
	
 	.add {
		position: relative;
		right: 100px;
		font-size: 15px;
		color: red;
		float: right;
		font-weight: bold;

	}
	.add:hover {
		cursor: pointer;
		opacity: 50%
	}
	
	#star {
		color: orange;
		font-size: 12px;
	}
	
	#test1 {
		display: inline;
	}
	
	#hh {
		display: inline-block;
		
	}
	
	li {
		list-style-type : none;
	}
	
	.img1:hover, .hw:hover{
		opacity: 50%;
	}
	

	
</style>
</head>
<body>

	<jsp:include page = "../include/user_top.jsp" />

	<div id="root">
		<div id ="sub">
			<div class="review">
				<br>
				<h1><strong>영화</strong></h1>
			</div>	
			
			<div class="review">
			<hr>
				<br>
				<div class="add">
					<a href="<%=request.getContextPath() %>/review_add.do" style="text-decoration: none; color: red;"><span>더보기</span></a>
				</div>
				<div>
				<c:set var="review_count" value ="${review_count }"/>
				<h3><strong>평가&nbsp;</strong><span id="sp1">${review_count }</span></h3><br>
				</div>
					<c:set var="list" value="${img_List }"/>
 					<c:if test="${!empty img_List }">
					<ul>
					<c:forEach items="${list }" var="dto" begin="0" end="4">
					<c:set var="count" value="${count + 1 }" />
						<li id="hh">
							<a href="<%=request.getContextPath() %>/wacha_content.do?movie_num=${dto.getMovie_num()}"><img class="img1" src="${pageContext.request.contextPath }/image/profile/${dto.getImage_loc()}" width="175px" height="260px"></a><br>
							<h5 >${dto.getMovie_title() }</h5>
							<p id="star">평가함&nbsp;★${dto.getMovie_star() }</p>
						</li>
					</c:forEach>
					</ul>
					</c:if>
					<c:if test="${empty img_List }">
						<h1>평가한 영화가 없습니다.</h1>
					</c:if>
			</div>
			
			<div class="review">
			<hr>
				<div>
					<div>
						<a class="hw" href="<%=request.getContextPath() %>/heart_add.do" style="text-decoration: none; color: black;"><h3><strong>보고싶어요</strong></h3></a>
					</div>
					<div style="text-align: right; margin-top: -30px; margin-right: 40px;">
						<c:set var="heart_count" value ="${heart_count }"/>
						<p><span style="color: lightgray; font-size: 25px;">&nbsp;&nbsp;&nbsp;${heart_count }</span></p>
					</div>
				</div>
			</div>
			
			<div class="review">
			<hr>
				<div>
					<div>
						<a class="hw" href="<%=request.getContextPath() %>/watch_add.do" style="text-decoration: none; color: black;"><h3><strong>보는중</strong></h3></a>
					</div>
					<div style="text-align: right; margin-top: -30px; margin-right: 40px;">
						<c:set var="watch_count" value ="${watch_count }"/>
						<p><span style="color: lightgray; font-size: 25px;">&nbsp;&nbsp;&nbsp;${watch_count }</span></p>
					</div>
				</div>
			<hr>

			</div>
		</div>
	</div>

	<br><br><br><br><br>
	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>