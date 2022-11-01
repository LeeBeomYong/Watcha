<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "../include/user_top.jsp" />
	<c:set var="dto" value="${profileList }"/>
	<div align="center" style="height: 800px;">
	<br><br><br>
		<h2><strong>프로필 정보</strong></h2>
			<br>
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/profile_update.do">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="pr_id" value="${dto.getMember_id()}" readonly>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="pr_name" value="${dto.getMember_name()}">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pr_pwd" value="${dto.getMember_pwd()}">
					</td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td>
						<textarea rows="7" cols="25" name="pr_intro">${dto.getMember_profile()}</textarea>
					</td>
				</tr>
				<tr>
					<th>생년원일</th>
					<td>
						<input type="text" name="pr_birth"value="${dto.getMember_birth()}" readonly>
					</td>
				</tr>
				<tr>
					<th>프로필이미지</th>
					<td>
						<input type="file" name="pr_img" value="${dto.getMember_image()}">
					</td>
				</tr>
	<!-- 			<tr> -->
	<!-- 				<td colspan="2" align="center"> -->
	<!-- 					<input type="button" value="수정"> -->
	<!-- 				</td> -->
	<!-- 			</tr> -->
			</table>
				<br><br>
		<input type="submit" value="수정">
		</form>
		
	</div>
	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>