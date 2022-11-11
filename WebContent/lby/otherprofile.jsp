<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.relative {
	    position: relative;
	    width: 800px;
	    height: 600px;
	    border: 1px solid lightgray;
	    top: 50px;
	}

	.top {
		width: 800px;
		height: 200px;
		background-image: url("${pageContext.request.contextPath }/image/profile/pink.png");
	}
	
	.top button {
		width: 50px;
		height: 50px;
	}

	.middle {
		width: 800px;
		height: 180px;
	}
	
	.review {
		width: 800px;
		height: 200px;
	}
	
	.test{
		position: relative;
		width: 800px;
		height: 500px;
		backgroud : gray;
	}
	
 	.picture {
 		position: absolute;
		left: 50px;
		top: 155px;
		width: 90px;
		height: 90px;
		border-radius: 50%;
	} 
	
	.name h4{
		position: absolute;
		left: 40px;
		top: 240px;
		width: 110px;
		height: 70px;
	}
	
	.name h6 {
		position: absolute;
		left: 40px;
		top: 280px;
		width: 110px;
		height: 70px;
	}
	
 	.taste button {
		position: absolute;
		left: 40px;
		top: 315px;
		width: 140px;
		height: 60px;
		border: 0;
		background-image: url("${pageContext.request.contextPath }/image/profile/취향분석.png");
	}
	
	.taste hr:nth-child(1){
		position: absolute;
		top: 290px;
		left: 8px;
		width: 780px;
		height: 70px;
		border-color: gray;
		
	}
	#a1 {
		width: 40px;
		height: 40px;
		background-image: url("${pageContext.request.contextPath }/image/profile/pink.png");
		border: 0;
		outline: 0;
		left: 10px;
	}
 	#btn3 {
		width: 200px;
		height: 190px;
		text-align: left;
		background-image: url("${pageContext.request.contextPath }/image/profile/movie.png");
		background-size: contain;
		color: white; 
		border: 0;
	}
	
	#span1 {
		font-size: 12px;
		color : gray;
	}
	
	.taste button:hover, #a1:hover, #btn3:hover {
		opacity: 40%
	}
</style>
</head>
<body>
	<jsp:include page = "../include/user_top.jsp" />
	<c:set var="dto" value="${userProfile }"/>
	<br><br><br><br>
	<div align="center">
		<div class="relative">
			<div class="top">
				<div align="right">
				</div>
			</div>
			
			<div class="picture">
				<c:if test="${!empty dto.getMember_image() }">
					<img alt="프로필" src="${pageContext.request.contextPath }/image/profileupload/${dto.getMember_image()}" width="70px" height="70px">
				</c:if>
				<c:if test="${empty dto.getMember_image() }">
					<img alt="프로필" src="${pageContext.request.contextPath }/image/profileupload/프로필_로고.png" width="70px" height="70px">
				</c:if>
			</div>
			<div class="middle">
				<div class="name">
					<h4><strong>${dto.getMember_name() }</strong></h4>
					<c:if test="${dto.getMember_image() == '프로필로고.png' }">
					<h6><span id="span1" style="color: red;">프로필이없음</span></h6>
					</c:if>
				</div>
				<div class="taste" align="center">
					<hr>
					<a href="<%=request.getContextPath() %>/othertaste.do?member_id=<%=request.getParameter("member_id")%>"><button class="btn2"></button></a>
					
				</div>
			</div>
			<div class="review">
				<div class="content">
					<div align="left" style="margin-left: 40px;">
						<a href ="<%=request.getContextPath() %>/otherreview.do?member_id=<%=request.getParameter("member_id")%>">
							<button id="btn3">
								<p>영화</p>
								<c:set var="review_count" value ="${review_count }"/>
								<p>★(${review_count })</p><br><br>
								<c:set var="heart_count" value ="${heart_count }"/>
								<p>보고싶어요(${heart_count })</p>
							</button>
						</a>	
					</div>	
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
 	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>