<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/content/contcss/MovieInfocss.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="../include/user_top.jsp"/>
	<div id="movieInfodiv">
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
					<th width="100px">제목</th>
					<td>${dto.getMovie_title() }</td>
				</tr>
				<tr>
					<th width="100px">제작 연도</th>
					<td>${dto.getMovie_date() }</td>
				</tr>
				<tr>
					<th width="100px">국가</th>
					<td>미국</td>
				</tr>
				<tr>
					<th width="100px" >장르</th>
					<td>액션</td>
				</tr>
				<tr>
					<th width="100px">상영시간</th>
					<td>2시간</td>
				</tr>
				<tr>
					<th width="100px">연령등급</th>
					<td>${dto.getMovie_age()}</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
			</table>
		<div id="MovieCont">
				<p>
					${dto.getMovie_cont() }
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>