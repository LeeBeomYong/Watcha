<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#maindiv{
		margin: 0px 10% 0px 10%;
	}
	
	#contentDiv{
		display: flex;
		flex-direction: row;
	
	}
	
	#firstDiv{
		width: 80%;
	}
	
	#secondDiv{
		display : flex;
		justify-content : center;
		width: 20%;
		background-color: gray;
	}
	
	#catediv{
		display: flex;
		flex-direction: column;
	}
	
	#catediv div{
		display: flex;
		justify-content: space-around;
		align-content: center;
	}
	#catediv:nth-child(1){
		
	
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/user_top.jsp"/>
	
	<div align="left" >
		<button type="button" class="btn btn-danger" onclick="location.href='wacha_content.do?movie_num=${movie_num}'"><img src="${pageContext.request.contextPath}/image/contImg/back.png" width="10px" height="15px"></button>
	</div>
	<hr>
	<div id="maindiv">
	<div>
		<div>
			<img alt="없음" src="" width="50px" height="50px">
			<span>감독 이름 공간</span>
			<span>감독</span>
		</div>
		<hr>
		<span>영화</span>
		<hr>
	</div>
	<!-- 영화 리스트 구간 // 네비게이션 구간  -->
	<div id="contentDiv">
		<div id="firstDiv">
			<div>
				
				
				<!-- 속성   -->
				<div id="catediv">
					<div>
						<div>제작연도</div>
						<div>제목</div>
						<div>역할</div>
						<div>평가</div>
					</div>
					<hr>
					<div>
						<div><img alt="영화사진" src=""></div>
						<div>제목</div>
						<div>감독</div>
						<div>별점★</div>
				
					</div>
				</div>
			</div>
		</div>
		
		<div id="secondDiv">
			<div>
				<p>네비게이션 구간</p>
			</div>
		</div>
	</div>
	
	</div>
	
	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>