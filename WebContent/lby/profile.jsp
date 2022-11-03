<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
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
	
	.bottom {
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
	
	span {
		font-size: 12px;
		color : gray;
	}
	
	.taste button:hover, #a1:hover, #btn3:hover {
		opacity: 40%
	}
</style>
<script type="text/javascript">
function showPopUp() {
	
	//창 크기 지정
	var width = 500;
	var height = 500;
	
	//pc화면기준 가운데 정렬
	var left = (window.screen.width / 2) - (width/2);
	var top = (window.screen.height / 4);
	
   	//윈도우 속성 지정
	var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	
   	//연결하고싶은url
   	const url = "<%=request.getContextPath() %>/lby/setting.jsp";

	//등록된 url 및 window 속성 기준으로 팝업창을 연다.
	window.open(url, "hello popup", windowStatus);
	
}
</script>
</head>
<body>
	<jsp:include page = "../include/user_top.jsp" />
	<c:set var="dto" value="${userProfile }"/>
	<br><br><br><br>
	<div align="center">
		<div class="relative">
			<div class="top">
				<div align="right">
<%-- 					<a id ="a1" href="javascript:showPopUp()"><img alt="★" src="${pageContext.request.contextPath }/image/profile/pngwing.com.png" width="30px" height="30px"></a> --%>
					<button id="a1" onclick="javascript:showPopUp()"><img alt="★" src="${pageContext.request.contextPath }/image/profile/pngwing.com.png" width="30px" height="30px"></button>
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
					<c:if test="${empty dto.getMember_image() }">
					<h6><span style="color: red;">프로필이없음</span></h6>
					</c:if>
				</div>
				<div class="taste" align="center">
					<hr>
					<a href="<%=request.getContextPath() %>/taste.do"><button class="btn2"></button></a>
					
				</div>
			</div>
			<div class="bottom">
				<div class="content">
					<div align="center">
						<a href ="<%=request.getContextPath() %>/review.do">
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