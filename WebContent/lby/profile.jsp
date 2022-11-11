<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">

	
 		
		function logout() {
			
			window.location.href="<%=request.getContextPath() %>/user_logout.do";
			
		}
		
		function profileupdate() {
			
			window.location.href="<%=request.getContextPath() %>/user_update.do";
		}
		
		
	 	function delete2() {
			
	 		let result = confirm("정말 삭제하시겠습니까?");
	 		if(result==true) {
	 			location.href="<%=request.getContextPath() %>/delete.do";
	 		}
		}
		function board() {
			

 			window.location.href="<%=request.getContextPath() %>/inquiry_main.do";
		}
</script>
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
/* 		background-image: url("${pageContext.request.contextPath }/image/profile/pink.png"); */
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
	
	.modal-p {
		font-size: 20px;
		font-weight: bold;
	}
	
	.modal-p:hover {
		cursor: pointer;
		opacity: 50%;
	}
	
	.modal-h6 {
		color: lightgray;
	}
	
	#modal-close {
		background-color: transparent;
		border: none;
		
	}
	#modal-close:hover {
		opacity: 50%;
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
					<a id="a1" href="#" data-toggle="modal" data-target="#myModal"><img style="margin-right: 20px; margin-top: 20px;" alt="★" src="${pageContext.request.contextPath }/image/profile/pngwing.com.png" width="30px" height="30px"></a>				
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
					<a href="<%=request.getContextPath() %>/taste.do"><button class="btn2"></button></a>
					
				</div>
			</div>
			<div class="review">
				<div class="content">
					<div align="left" style="margin-left: 40px;">
						<a href ="<%=request.getContextPath() %>/review.do?member_id=<%=request.getParameter("member_id")%>">
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
	<div class="modal fade" id="myModal">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h1 class="modal-title" style="font-weight: bold;">설정</h1>
	          <button type="button" id="modal-close" data-dismiss="modal">&times</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	            <h6 class="modal-h6">고객센터</h6>
				<p class="modal-p" onclick="board()" >문의하기 / FAQ</p>
				<hr color ="gray">
				<p class="modal-p" onclick="profileupdate()" >프로필수정</p>
				<hr color ="gray">
				<p class="modal-p" onclick="logout()" >로그아웃</p>
				<hr color ="gray">
				<p class="modal-p" onclick="delete2()" >탈퇴하기</p>
				<hr color ="gray">
	        </div>

	      </div>
	    </div>
	</div>
	

	
	<br><br><br><br><br>
 	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>