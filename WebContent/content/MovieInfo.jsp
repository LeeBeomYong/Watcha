<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="contcss/MovieInfocss.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/user_top.jsp"/>
	<div align="left" class="">
		<button type="button" class="btn btn-danger" onclick="history.back()"><img src="${pageContext.request.contextPath}/image/contImg/back.png" width="10px" height="15px"></button>
	</div>
	<hr>
	<div>
		기본정보
	<hr>
	</div>
	<div id="Contdiv">
		
		<table>
			<tr>
				<th>원제</th>
				<td>${dto.getMovie_title() }</td>
			</tr>
			<tr>
				<th>제작 연도</th>
				<td>${dto.getMovie_date() }</td>
			</tr>
			<tr>
				<th>${dto.getMovie_country() }</th>
				<td>미국</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>액션</td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td>2시간</td>
			</tr>
			<tr>
				<th>연령등급</th>
				<td>15세</td>
			</tr>
			<tr>
				<th>내용</th>
			</tr>
		</table>
	<div id="MovieCont">
			<p>
				누구도 막을 수 없다!
				기원전 가장 번성하고 위대한 고대 국가였지만 현재는 국제 군사 조직 인터갱의 독재 국가로 전락한 칸다크. 인터갱의 눈을 피해 고대 유물을 찾던 '아드리아나'는 우연히 5000년 동안 잠들어 있던 '블랙 아담'을 깨우게 된다.
				엄청난 괴력과 스피드, 방탄 능력과 자유자재의 고공비행, 번개를 쏘는 능력까지. 온몸이 무기인 '블랙 아담'은 자신의 앞을 막아서는 인터갱들을 모조리 쓸어버리고 칸다크 국민들은 이에 열광한다. 한편, 그의 폭주를 막기 위해 호크맨, 닥터 페이트, 아톰 스매셔, 사이클론으로 구성된 히어로 군단 '저스티스 소사이어티'가 칸다크에 나타나는데...
				세상을 구할 것인가, 파괴할 것인가
				사람들이 열광할 문제적 히어로가 온다!
			</p>
		</div>
	</div>
	
	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>