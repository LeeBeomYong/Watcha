<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#ListComentDiv{
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin: 5% 35%;
	}
	.comentdiv{
		margin : 5% 5%;
		background-color: #F5F5F5;
		border-radius: 2%;
		height: 260px;
	}
	.comentdiv div{
		margin: 2% 2%;
	}
	.comentTopDiv{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-content: center;
	}
	a,span{
		color : black;
		text-decoration: none !important;
		
	}
	img{
		border-radius: 50%;
		margin: 0 !important;
	}
	.codiv{
		height: 100px;
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/user_top.jsp"/>
	<div align="left" class="">
		<button type="button" class="btn btn-danger" onclick="location.href='wacha_content.do?movie_num=${list[0].getMovie_num()}'"><img src="${pageContext.request.contextPath}/image/contImg/back.png" width="10px" height="15px"></button>
	</div>
	<hr>
	<div>
		코멘트
	<hr>
	</div>
		<div id="ListComentDiv">
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list }" var="dto">
						
						<div class="comentdiv">
							<a href="#">
							<div class="comentTopDiv">
								<div>
									<img alt="없" src="${pageContext.request.contextPath}/image/contImg/defualtImg.png" width="30px" height="30px" >
									<span>${dto.getMember_id() }</span>
								</div>
								<div>
									<img alt="없" src="${pageContext.request.contextPath}/image/contImg/star.png" width="20px" height="20px">
									<span>${dto.getMember_star()}점</span>
								</div>
							</div>
							</a>
							<hr>
							<%--게시글 중단 --%>
							<div class="codiv">
								<a class="aTag" href="wacha_coment.do?coment_num=${dto.getComent_num() }&movie_num=${dto.getMovie_num() }&member_Id=${dto.getMember_id()}">
								<span>
									${dto.getMovie_coment()}
								</span>
								</a>
							</div>
							<hr>
							<%--게시글 하단 --%>
							<div>
								<a class="aTag" href="wacha_coment.do?coment_num=${dto.getComent_num() }&movie_num=${dto.getMovie_num() }&member_Id=${dto.getMember_id()}">
								<img alt="" src="${pageContext.request.contextPath }/image/contImg/likeIt.png" width="15px" height="15px">&nbsp;<span>${dto.getComent_hit()}</span>
								<img alt="" src="${pageContext.request.contextPath }/image/contImg/talk.png" width="15px" height="15px">&nbsp;<span>${dto.getCocoment_count() }</span>
								</a>
							</div>
							
						</div>
						
					
					</c:forEach>
				</c:when>
			
			</c:choose>
		</div>
	

	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>